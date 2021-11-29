# frozen_string_literal: true

module Banzai
  module Filter
    # NOTE: 此过滤器必须放在最后，否则必须重新解析一遍文本才行
    class SuggestedChangeFilter < HTML::Pipeline::Filter
      include Gitee::Utils::StrongMemoize

      def call
        initialize_instance_variables
        return doc unless suggested_change

        doc.search('pre[lang="suggestion"]').each do |node|
          old_lines = original_lines
          next if old_lines.empty?

          new_lines = new_lines(node.content)
          diff_lines = Gitee::Diff::Highlight.new(old_lines + new_lines).highlight

          suggestion = render(
            diff_lines: diff_lines,
            suggestion_raw_content: node.child.children.empty? ? nil : node.content,
            changed: diff_hunk_old_lines.join != node.content.chomp
          )
          node.replace(suggestion)
        end

        # 必须明确指定 save_with 的类型，否则可能会有多余换行符，原因我也不知道，具体是使用 libxml2 这个库输出内容的
        doc.to_html(save_with: Nokogiri::XML::Node::SaveOptions::AS_HTML)
      end

    private

      attr_reader :suggested_change, :file_path, :diff_hunk, :start_index

      def initialize_instance_variables
        if context[:note].is_a?(Note) && context[:note].for_pull_request? && context[:note].diff_position.is_a?(DiffPosition)
          @suggested_change = true
          @file_path = context[:note].diff_position.file_path
          @diff_hunk = context[:note].diff_position.diff_hunk
          line_code = context[:note].diff_position.start_line_code || context[:note].diff_position.line_code
        elsif context[:suggested_change]
          @suggested_change = true
          @file_path = context[:file_path].to_s
          @diff_hunk = context[:diff_hunk].to_s
          line_code = context[:line_code]
        end

        @start_index = line_code.to_s.split('_').last.to_i if line_code
      end

      def renderer
        @renderer ||= ApplicationController.new
      end

      def render(locals)
        renderer.render_to_string(partial: 'pull_requests/suggested_change', locals: locals, formats: [:html])
      end

      # 是否来自预览
      def preview?
        context[:suggested_change] && !context[:note].is_a?(Note)
      end

      def new_lines(content)
        index = start_index

        lines = content.lines.map do |text|
          Gitee::Diff::Line.new(text, 'new', nil, start_index, index).tap { index += 1 }
        end

        highlight_lines(lines)
        lines.each do |line|
          line.text = '+' + line.text
          line.rich_text = ('+' + line.rich_text).html_safe
        end
      end

      def diff_hunk_old_lines
        @old_diff_hunk_lines ||= begin
          if preview? # 来自预览渲染时，原内容是没有前缀字符的
            diff_hunk.to_s.lines
          else # diff 会产生行前缀字符（'+', '-', ' '）
            diff_hunk.to_s.lines.each_with_object([]) do |text, arr|
              next if text[0] == '-' # 代码建议功能应该忽视删除行

              text[0] = '' # 移除前缀字符
              arr << text
            end
          end
        end
      end

      def original_lines
        index = start_index

        lines = diff_hunk_old_lines.map do |text|
          Gitee::Diff::Line.new(text, 'old', nil, index, start_index).tap { index += 1 }
        end

        highlight_lines(lines)
        lines.each do |line|
          line.text = '-' + line.text
          line.rich_text = ('-' + line.rich_text).html_safe
        end
      end

      def highlight_lines(lines)
        content = lines.map(&:text).join
        highlight_lines = Gitee::Highlight.highlight(file_path, content, line_numbers: false, language: language).lines
        highlight_lines.each_with_index do |text, index|
          lines[index]&.rich_text = text.html_safe
        end
      end

      def language
        strong_memoize(:language) do
          ext_name = file_path.split('.').last
          language = Linguist::Language[ext_name] || Linguist::Language.find_by_extension(file_path)&.first
          language&.name
        end
      end
    end
  end
end
