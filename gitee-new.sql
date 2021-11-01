-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.60    Database: gitlabhq_production
-- ------------------------------------------------------
-- Server version	5.6.48-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_logs`
--

DROP TABLE IF EXISTS `access_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip',
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `day` int(11) NOT NULL COMMENT '日',
  `user_id` int(11) DEFAULT '0' COMMENT '用户 id',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `stat_type` int(11) DEFAULT '0' COMMENT '统计类型',
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业id',
  PRIMARY KEY (`id`),
  KEY `index_access_logs_on_user_id_and_stat_type` (`user_id`,`stat_type`),
  KEY `index_access_logs_on_p_id_and_stat_type` (`project_id`,`stat_type`,`year`,`month`,`day`),
  KEY `index_p_s_c_u` (`project_id`,`stat_type`,`created_at`,`user_id`),
  KEY `index_p_s_y_m_d_u_ip` (`project_id`,`stat_type`,`year`,`month`,`day`,`user_id`,`ip`),
  KEY `index_access_logs_on_eid` (`enterprise_id`,`created_at`,`stat_type`)
) ENGINE=InnoDB AUTO_INCREMENT=156426 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库访问统计日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_secret_keys`
--

DROP TABLE IF EXISTS `access_secret_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_secret_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'APP KEY',
  `private_key` text COLLATE utf8mb4_unicode_ci COMMENT '秘钥',
  `public_key` text COLLATE utf8mb4_unicode_ci COMMENT '私钥',
  `succeed_count` int(11) DEFAULT '0' COMMENT '成功次数',
  `failed_count` int(11) DEFAULT '0' COMMENT '失败次数',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_access_secret_keys_on_app_key` (`app_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鉴权秘钥匙表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `day` int(11) DEFAULT NULL COMMENT '日',
  `date_type` int(11) NOT NULL COMMENT '时间类型',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `new_user_count` int(11) DEFAULT NULL COMMENT '新增用户数量',
  `new_project_count` int(11) DEFAULT NULL COMMENT '新增仓库数量',
  `new_private_project_count` int(11) DEFAULT NULL COMMENT '新增私有仓库数量',
  `new_enterprise_count` int(11) DEFAULT NULL COMMENT '新增企业数量',
  `new_enterprise_user_count` int(11) DEFAULT NULL COMMENT '新增企业用户数量',
  `new_group_count` int(11) DEFAULT NULL COMMENT '新增组织数量',
  `new_pr_count` int(11) DEFAULT NULL COMMENT '新增 PR 数量',
  `new_issue_count` int(11) DEFAULT NULL COMMENT '新增 Issue 数量',
  `new_push_count` int(11) DEFAULT NULL COMMENT '新增 Push 数量',
  `active_user_count` int(11) DEFAULT NULL COMMENT '活跃用户数量',
  `active_project_count` int(11) DEFAULT NULL COMMENT '活跃仓库数量',
  `active_private_project_count` int(11) DEFAULT NULL COMMENT '活跃私有仓库数量',
  `active_enterprise_count` int(11) DEFAULT NULL COMMENT '活跃企业数量',
  `active_enterprise_user_count` int(11) DEFAULT NULL COMMENT '活跃企业用户数量',
  `active_group_count` int(11) DEFAULT NULL COMMENT '活跃组织数量',
  `active_pr_count` int(11) DEFAULT NULL COMMENT '活跃 PR 数量',
  `active_issue_count` int(11) DEFAULT NULL COMMENT '活跃 Issue 数量',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `new_star_count` int(11) DEFAULT NULL COMMENT '新增 Star 数量',
  `new_watch_count` int(11) DEFAULT NULL COMMENT '新增 Watch 数量',
  `new_follow_count` int(11) DEFAULT NULL COMMENT '新增 Follow 数量',
  `new_fork_count` int(11) DEFAULT NULL COMMENT '新增 Fork 数量',
  `new_code_count` int(11) DEFAULT NULL COMMENT '新增 Code 数量',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '续费数量',
  `users_count` int(11) DEFAULT NULL COMMENT '个人用户总数',
  `enterprises_count` int(11) DEFAULT NULL COMMENT '企业用户总数',
  `created_by_direct_count` int(11) DEFAULT NULL COMMENT '企业用户（通过直接新建）数量',
  `created_by_person_count` int(11) DEFAULT NULL COMMENT '企业用户（通过个人创建）数量',
  `created_by_gitosc_upgrade_count` int(11) DEFAULT NULL COMMENT '企业用户（通过个人升级）数量',
  `created_by_group_upgrade_count` int(11) DEFAULT NULL COMMENT '企业用户（通过组织升级）数量',
  `paid_enterprise_count` int(11) DEFAULT NULL COMMENT '付费企业用户总数',
  `paid_enterprise_new_count` int(11) DEFAULT NULL COMMENT '付费企业用户净新增',
  `paid_enterprise_base_count` int(11) DEFAULT NULL COMMENT '付费企业（标准版）用户数量',
  `paid_enterprise_high_count` int(11) DEFAULT NULL COMMENT '付费企业（高级版）用户数量',
  `paid_enterprise_unlimited_count` int(11) DEFAULT NULL COMMENT '付费企业（尊享版）用户数量',
  `active_active_user_count` int(11) DEFAULT NULL COMMENT '个人用户（活跃）数量',
  `active_common_user_count` int(11) DEFAULT NULL COMMENT '个人用户（一般）数量',
  `active_out_user_count` int(11) DEFAULT NULL COMMENT '个人用户（流失）数量',
  `active_back_user_count` int(11) DEFAULT NULL COMMENT '个人用户（回流）数量',
  `active_active_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（活跃）数量',
  `active_common_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（一般）数量',
  `active_out_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（流失）数量',
  `active_back_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（回流）数量',
  `enterprise_charge_title_count` int(11) DEFAULT NULL COMMENT '付费企业用户（变更套餐）数量',
  `enterprise_on_title_count` int(11) DEFAULT NULL COMMENT '付费企业用户（续费）数量',
  `new_education_count` int(11) DEFAULT NULL COMMENT '新增高校版数量',
  `enterprise_new_order_count` int(11) DEFAULT NULL COMMENT '新购企业版数量',
  `enterprise_upgrade_order_count` int(11) DEFAULT NULL COMMENT '企业升级订单数量',
  `enterprise_upgrade_quota_order_count` int(11) DEFAULT NULL COMMENT '增加订单配额数量',
  `enterprise_order_renew_count` int(11) DEFAULT NULL COMMENT '续费(含升级/降级续费)数量',
  `order_total_count` int(11) DEFAULT NULL COMMENT '订单总数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_accounts_on_y_m_d_dt` (`year`,`month`,`day`,`date_type`),
  KEY `index_accounts_on_date_and_date_type` (`date`,`date_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1663 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_wallets`
--

DROP TABLE IF EXISTS `activity_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '金额',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（可提现/申请中/已提现/已兑换/已失效）',
  `mark` int(11) NOT NULL DEFAULT '0' COMMENT '标识位',
  `remark` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `applied_at` datetime DEFAULT NULL COMMENT '申请提现时间',
  `completed_at` datetime DEFAULT NULL COMMENT '提现|兑换|失效 时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activity_wallets_on_user_id` (`user_id`),
  KEY `index_activity_wallets_on_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='活动红包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` text COLLATE utf8_unicode_ci COMMENT '广告位名称',
  `path` text COLLATE utf8_unicode_ci COMMENT '广告位唯一标识符',
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '尺寸',
  `activity` tinyint(1) DEFAULT NULL COMMENT '状态',
  `ad_type` text COLLATE utf8_unicode_ci COMMENT '类型',
  `link` text COLLATE utf8_unicode_ci COMMENT '链接地址',
  `address` text COLLATE utf8_unicode_ci COMMENT '加载地址',
  `end_time` datetime DEFAULT NULL COMMENT '到期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `traceid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告追踪标识符',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apk_build`
--

DROP TABLE IF EXISTS `apk_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apk_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `commit_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'commit id',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者 id',
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'git 引用',
  `build_tool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建工具',
  `build_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建类型',
  `keystore_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '别名',
  `keystore_keypass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'keypass',
  `keystore_storepass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'storepass',
  `keystore_keystore` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'keystore',
  `repo_keystore` int(11) DEFAULT '0' COMMENT 'keystore相对路径或者仓库地址',
  `state` int(11) DEFAULT '0' COMMENT '构建状态',
  `log` mediumtext COLLATE utf8_unicode_ci COMMENT '日志',
  `apks_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'apk下载链接',
  `progress` int(11) DEFAULT '0' COMMENT '构建进度',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_apk_build_on_commit_id` (`commit_id`),
  KEY `index_apk_build_on_project_id_and_created_at` (`project_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='安卓构建表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_mb_loggers`
--

DROP TABLE IF EXISTS `app_mb_loggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_mb_loggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_type` int(11) DEFAULT NULL COMMENT 'APP类型',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `error` int(11) DEFAULT NULL COMMENT '错误',
  `post_content` text COLLATE utf8_unicode_ci COMMENT '详情',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='APP日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_shakes`
--

DROP TABLE IF EXISTS `app_shakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_shakes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `result` tinyint(1) DEFAULT '0' COMMENT '结果',
  `prize_id` int(11) DEFAULT NULL COMMENT '奖品 id',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖品名称',
  `delivered` tinyint(1) DEFAULT '0' COMMENT '标记是否发货',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_app_shakes_on_user_id` (`user_id`),
  KEY `index_app_shakes_on_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='APP摇一摇抽奖表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_versions`
--

DROP TABLE IF EXISTS `app_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本号',
  `num_version` int(11) DEFAULT NULL COMMENT '数字版本号',
  `download_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载地址',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `version_type` int(11) DEFAULT NULL COMMENT '类型',
  `relevance_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关 URL',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='APP版本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeal_type_reasons`
--

DROP TABLE IF EXISTS `appeal_type_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeal_type_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '理由',
  `position` int(11) DEFAULT '0' COMMENT '排序',
  `appeal_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_appeal_type_reasons_on_appeal_type_id` (`appeal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='举报用户理由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeal_types`
--

DROP TABLE IF EXISTS `appeal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `complaint_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属举报类型(Project、 Comment)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeals`
--

DROP TABLE IF EXISTS `appeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appealable_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `appeal_type_id` int(11) DEFAULT NULL COMMENT '举报类型 id',
  `status` int(11) DEFAULT '0' COMMENT '举报状态（未处理/已处理/无效举报/驳回举报）',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '举报内容',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `appealable_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属类型（Project, Note）',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `addition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附言',
  PRIMARY KEY (`id`),
  KEY `index_appeals_on_a_appeal_type_s_u` (`appealable_type`,`appealable_id`,`appeal_type_id`,`status`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_actions`
--

DROP TABLE IF EXISTS `article_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `article_id` int(11) NOT NULL COMMENT '文章 id',
  `useful` tinyint(1) DEFAULT NULL COMMENT '文章是否有用',
  `collection` tinyint(1) DEFAULT NULL COMMENT '是否收藏',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_article_actions_on_user_id_and_article_id` (`user_id`,`article_id`),
  KEY `index_article_actions_on_article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_categories`
--

DROP TABLE IF EXISTS `article_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int(11) DEFAULT NULL COMMENT '文章 id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_article_categories_on_category_id_and_article_id` (`category_id`,`article_id`),
  KEY `index_article_categories_on_article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_labels`
--

DROP TABLE IF EXISTS `article_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签名字',
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色',
  `popular` tinyint(1) DEFAULT '0' COMMENT '是否是热门标签',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_article_labels_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `author_id` int(11) NOT NULL DEFAULT '0' COMMENT '作者 id',
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者名字',
  `catalog_type` int(11) NOT NULL DEFAULT '0' COMMENT '种类',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `section_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属',
  `section_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `public` tinyint(1) DEFAULT '1' COMMENT '是否公开',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `blocked` tinyint(1) DEFAULT '0' COMMENT '是否屏蔽',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章链接',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT '图片地址',
  `top` int(11) DEFAULT '0' COMMENT '排序',
  `view_count` int(11) DEFAULT '0' COMMENT '浏览数',
  `noteable_count` int(11) DEFAULT '0' COMMENT '评论数',
  `recommend_at` datetime DEFAULT NULL COMMENT '推荐时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '概述',
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据库标识（社区那边返回）',
  PRIMARY KEY (`id`),
  KEY `index_articles_on_author_id` (`author_id`),
  KEY `index_articles_on_public_and_blocked_and_catalog_type` (`public`,`blocked`,`catalog_type`),
  KEY `index_articles_on_section_id_and_section_type_and_catalog_type` (`section_id`,`section_type`,`catalog_type`),
  KEY `index_articles_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attach_files`
--

DROP TABLE IF EXISTS `attach_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attach_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '格式',
  `download_count` int(11) DEFAULT NULL COMMENT '下载次数',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `remote_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'storage 的存储路径',
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '组名',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `attachable_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `attachable_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `program_id` int(11) DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0' COMMENT '文档节点ID',
  PRIMARY KEY (`id`),
  KEY `index_attach_files_on_project_id` (`project_id`),
  KEY `index_attach_on_attachable` (`attachable_id`,`attachable_type`),
  KEY `index_attach_files_on_enterprise_id` (`enterprise_id`),
  KEY `index_attach_files_on_program_id` (`program_id`),
  KEY `index_attach_files_on_node_id` (`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL COMMENT '被操作对象',
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被操作对象类型',
  `associated_id` int(11) DEFAULT NULL COMMENT '相关对象 id',
  `associated_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关对象类型',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户类型',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作',
  `audited_changes` text COLLATE utf8_unicode_ci COMMENT '变更内容',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `remote_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip 地址',
  `operate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户具体操作',
  `created_at` datetime DEFAULT NULL,
  `useragent_id` int(11) DEFAULT NULL COMMENT 'user agent id',
  `request_uuid` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'request uuid',
  PRIMARY KEY (`id`),
  KEY `index_audits_on_associated` (`associated_id`,`associated_type`),
  KEY `index_audits_on_user` (`user_id`,`user_type`),
  KEY `index_audits_on_user_id_and_operate` (`user_id`,`operate`),
  KEY `index_audits_on_created_at` (`created_at`),
  KEY `index_audits_on_request_uuid` (`request_uuid`),
  KEY `index_audits_on_auditable_version` (`auditable_id`,`auditable_type`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=209851 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='审计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `backtime` int(11) NOT NULL COMMENT '备份时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_backups_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='备份表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blob_int_records`
--

DROP TABLE IF EXISTS `blob_int_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blob_int_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '仓库 namespace',
  `blob_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '拦截的 blob',
  `log_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志 id',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '敏感词',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_blobs`
--

DROP TABLE IF EXISTS `block_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_blobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '所属仓库 id',
  `blob_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽文件 id',
  `blob_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽文件名称',
  `commit_sha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件 commit',
  `action` int(11) DEFAULT NULL COMMENT '屏蔽文件名称',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽触发关键字',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_block_blobs_on_project_id` (`project_id`),
  KEY `index_block_blobs_on_blob_path_pid` (`blob_id`(40),`blob_path`(25),`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=893 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_commits`
--

DROP TABLE IF EXISTS `block_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_commits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '所属仓库 id',
  `commit_sha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件 commit',
  `action` int(11) DEFAULT NULL COMMENT '是否屏蔽',
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数美/百度请求 id',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽触发关键字',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_block_commits_on_commit_id_pid` (`commit_sha`(40),`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_logs`
--

DROP TABLE IF EXISTS `block_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作用户',
  `action` int(11) DEFAULT NULL COMMENT '动作',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '屏蔽原因',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `source` int(11) DEFAULT '0' COMMENT '区分屏蔽操作者是管理员还是系统自动屏蔽（0: 管理员, 1: 系统）',
  PRIMARY KEY (`id`),
  KEY `index_block_logs_on_target_id_and_created_at` (`target_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='屏蔽日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_pr_diffs`
--

DROP TABLE IF EXISTS `block_pr_diffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_pr_diffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '所属仓库 id',
  `pr_id` int(11) DEFAULT NULL COMMENT 'pr id',
  `commit_sha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件 commit',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名',
  `action` int(11) DEFAULT NULL COMMENT '是否屏蔽',
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数美/百度请求 id',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽触发关键字',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_block_pr_diffs_on_cid_prid` (`commit_sha`(40),`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `blocked_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被封的IP地址／段',
  `admin_id` int(11) DEFAULT NULL COMMENT '操作者 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `forbidden_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'all' COMMENT '禁止的模块',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='屏蔽ip表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `board_templates`
--

DROP TABLE IF EXISTS `board_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `ident` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板唯一标示',
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属区块',
  `public` int(11) DEFAULT '0' COMMENT '公开/私有属性',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  `system` tinyint(1) DEFAULT NULL COMMENT '是否由系统提供的模板',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Logo 的 url',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_board_templates_on_area_and_ident` (`area`,`ident`),
  KEY `index_board_templates_on_enterprise_id_and_area_and_ident` (`enterprise_id`,`area`,`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司',
  `call_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮箱',
  `contacts_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'privatization' COMMENT '咨询类型',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '咨询内容',
  PRIMARY KEY (`id`),
  KEY `index_businesses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='私有化/企业版 购买咨询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级 id',
  `top` int(11) DEFAULT '0' COMMENT '分类排序',
  `kind` int(11) DEFAULT '0' COMMENT '类型（是否显示在首页）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `portrait` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '层级',
  `position` int(11) DEFAULT '0' COMMENT '首页排序',
  PRIMARY KEY (`id`),
  KEY `index_categories_on_ancestry` (`ancestry`),
  KEY `index_categories_on_parent_id_and_top` (`parent_id`,`top`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_build_logs`
--

DROP TABLE IF EXISTS `ci_build_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_build_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `total_time` int(11) DEFAULT NULL COMMENT '总时间',
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编译结果',
  `log` longtext COLLATE utf8_unicode_ci COMMENT '编译日志',
  `ci_job_id` int(11) DEFAULT NULL COMMENT '构建工作 id',
  `jenkins_log_id` int(11) DEFAULT NULL COMMENT 'jenkins 日志 id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `download_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编译详情',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_ci_build_logs_on_ci_job_id` (`ci_job_id`),
  KEY `index_ci_build_logs_on_user_id` (`user_id`),
  KEY `index_ci_build_logs_on_enterprise_id` (`enterprise_id`),
  KEY `index_ci_build_logs_on_jenkins_log_id` (`jenkins_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='持续集成日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_jobs`
--

DROP TABLE IF EXISTS `ci_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名',
  `build_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '构建工具',
  `branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分支',
  `build_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'week' COMMENT '频率',
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JDK版本',
  `notify_by_email` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邮件接收',
  `notify_by_letter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '私信接收',
  `notified_users` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '通知给哪些人',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `jenkins_job_id` int(11) DEFAULT NULL COMMENT 'jenkins job 的 id',
  `web_hook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建成功回调',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_ci_jobs_on_project_id` (`project_id`),
  KEY `index_ci_jobs_on_user_id` (`user_id`),
  KEY `index_ci_jobs_on_enterprise_id` (`enterprise_id`),
  KEY `index_ci_jobs_on_jenkins_job_id` (`jenkins_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='持续集成表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_pieces`
--

DROP TABLE IF EXISTS `code_pieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `piece_type` int(11) DEFAULT '0',
  `code_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_code_pieces_on_code_id_and_title` (`code_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=27259 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `root_id` int(11) NOT NULL DEFAULT '0',
  `stars_count` int(11) DEFAULT '0',
  `noteable_count` int(11) DEFAULT '0',
  `forks_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enterprise_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `in_square` tinyint(1) NOT NULL DEFAULT '1',
  `pieces_count` int(11) DEFAULT '0',
  `storages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk_path` varchar(540) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_codes_on_key` (`key`),
  KEY `index_codes_on_user_id` (`user_id`),
  KEY `t` (`root_id`,`public`,`in_square`,`created_at`,`lang_id`,`category_id`),
  KEY `index_codes_on_created_at` (`created_at`),
  KEY `index_codes_lang_category_square_created_at` (`lang_id`,`category_id`,`in_square`,`created_at`),
  KEY `index_codes_on_lang_id_and_in_square_and_created_at` (`lang_id`,`in_square`,`created_at`),
  KEY `index_codes_on_category_id_and_in_square_and_created_at` (`category_id`,`in_square`,`created_at`),
  KEY `index_codes_on_in_square_and_created_at` (`in_square`,`created_at`),
  KEY `index_codes_on_root_id_and_created_at` (`root_id`,`created_at`),
  KEY `index_codes_on_in_square_and_root_id` (`in_square`,`root_id`),
  KEY `index_codes_on_disk_path` (`disk_path`(78))
) ENGINE=InnoDB AUTO_INCREMENT=31712 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coin_logs`
--

DROP TABLE IF EXISTS `coin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `reason_type` int(11) NOT NULL COMMENT '获得途径',
  `coin_count` int(11) NOT NULL COMMENT '数量',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_coin_logs_on_user` (`user_id`,`reason_type`,`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='G币流水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orders`
--

DROP TABLE IF EXISTS `commerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `commerce_id` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  `paid_by_id` int(11) DEFAULT '0',
  `order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `period` int(11) DEFAULT '1',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `renew_period` int(11) DEFAULT '0',
  `paid_at` datetime DEFAULT NULL,
  `payment_channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `order_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NEW',
  `shift_price` int(11) DEFAULT '0',
  `commerce_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'EnterpriseCommerce',
  `user_id` int(11) DEFAULT '0',
  `sys_promotion_id` int(11) DEFAULT '0',
  `original_price` int(11) DEFAULT '0',
  `expire_at` datetime DEFAULT NULL COMMENT '订单过期时间',
  `account_at` datetime DEFAULT NULL COMMENT '到账时间',
  PRIMARY KEY (`id`),
  KEY `index_commerce_order_on_target` (`target_id`,`target_type`,`state`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerces`
--

DROP TABLE IF EXISTS `commerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `member_quota` int(11) DEFAULT '50',
  `space_quota` int(11) DEFAULT '10',
  `level` int(11) DEFAULT '1',
  `single_project_quota` int(11) DEFAULT '1',
  `single_file_quota` int(11) DEFAULT '100',
  `state` int(11) DEFAULT '1',
  `attach_quota` int(11) DEFAULT '0',
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewer_quota` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'EnterpriseCommerce',
  `ob_key` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '12',
  `concurrence_quota` int(11) DEFAULT '5',
  `lfs_space_quota` int(11) DEFAULT '1' COMMENT 'LFS 配额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_commerces_on_level` (`level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_reviews`
--

DROP TABLE IF EXISTS `commit_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `commit_sha` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'commit sha',
  `commit_message` text COLLATE utf8mb4_unicode_ci COMMENT 'commit message',
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求数美的唯一标识',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽触发关键字',
  `result` tinyint(4) DEFAULT '0' COMMENT '结果(0：没问题，1：有问题)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_commit_reviews_on_project_id_and_commit_sha` (`project_id`,`commit_sha`),
  KEY `index_commit_reviews_on_commit_sha` (`commit_sha`),
  KEY `index_commit_reviews_on_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competition_applications`
--

DROP TABLE IF EXISTS `competition_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_id` int(11) DEFAULT NULL COMMENT '活动 id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_competition_applications_on_competition_id` (`competition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_check_whole_issues`
--

DROP TABLE IF EXISTS `content_check_whole_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_check_whole_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT 'issue_id',
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求数美的唯一标识',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态(1:已处理，0:未处理)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理人时间',
  `handler_id` int(11) DEFAULT NULL COMMENT '处理人的id',
  `risk_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险结论(pass/review/reject)',
  `risk_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险描述',
  `judgment` tinyint(4) DEFAULT '0' COMMENT '1:误判',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_content_check_whole_issues_on_issue_id` (`issue_id`) USING BTREE,
  KEY `index_content_check_whole_issues_on_state` (`state`) USING BTREE,
  KEY `index_content_check_whole_issues_on_risk_level` (`risk_level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_checks`
--

DROP TABLE IF EXISTS `content_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属的表',
  `target_id` int(11) DEFAULT NULL COMMENT '归属id',
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求数美的唯一标识',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态(1:已处理，0:未处理)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理人时间',
  `handler_id` int(11) DEFAULT NULL COMMENT '处理人的id',
  `risk_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险结论(pass/review/reject)',
  `risk_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险描述',
  `judgment` tinyint(4) DEFAULT '0' COMMENT '1:误判',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_content_checks_on_target_type_and_target_id` (`target_type`,`target_id`) USING BTREE,
  KEY `index_content_checks_on_state` (`state`) USING BTREE,
  KEY `index_content_checks_on_risk_level` (`risk_level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=798 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_int_records`
--

DROP TABLE IF EXISTS `content_int_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_int_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型名称',
  `owner_id` int(11) NOT NULL,
  `log_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志 id',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '敏感词',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `record_id` int(11) DEFAULT '0' COMMENT '记录对象id',
  PRIMARY KEY (`id`),
  KEY `index_content_int_records_on_owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_reviews`
--

DROP TABLE IF EXISTS `content_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属的表',
  `reviewable_id` int(11) DEFAULT NULL COMMENT '归属id',
  `sensitive_word` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '敏感词',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '敏感词的上下文',
  `state` smallint(6) DEFAULT NULL COMMENT '状态(已处理，未处理)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理人时间',
  `handler_id` int(11) DEFAULT NULL COMMENT '处理人的id',
  `handler` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理人',
  `scan_type` int(11) DEFAULT NULL COMMENT '扫描类型(百度/gitee)',
  `conclusion_type` int(11) DEFAULT NULL COMMENT '结论类型(违规/疑似/审核失败)',
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容类型(低质灌水/暴恐违禁/文本色情/政治敏感/恶意推广/低俗辱骂)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `log_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志 id',
  `result` tinyint(4) DEFAULT '0' COMMENT '结果(0：没问题，1：有问题)',
  PRIMARY KEY (`id`),
  KEY `index_content_reviews_on_reviewable_id_and_reviewable_type` (`reviewable_id`,`reviewable_type`),
  KEY `index_content_reviews_on_result` (`result`),
  KEY `index_content_reviews_on_state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=8379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contests` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` text COLLATE utf8_unicode_ci COMMENT '简介',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '短地址',
  `identity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '短标识',
  `project_public` tinyint(1) DEFAULT NULL COMMENT '仓库是否公开',
  `before_at` datetime DEFAULT NULL COMMENT '截止时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `home_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '大赛官网',
  `judges` text COLLATE utf8_unicode_ci COMMENT '活动评委',
  `contest_id` int(11) DEFAULT NULL COMMENT '父活动 id',
  `manager_id` int(11) DEFAULT NULL COMMENT '负责人 id',
  PRIMARY KEY (`id`),
  KEY `index_contests_on_path_and_identity` (`path`,`identity`),
  KEY `index_contests_on_identity` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='活动管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contributions`
--

DROP TABLE IF EXISTS `contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日期（类型: 字符串）',
  `contribution` text COLLATE utf8_unicode_ci COMMENT '贡献',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `date_time` date DEFAULT NULL COMMENT '日期（类型: 时间）',
  `count` int(11) DEFAULT '0' COMMENT '一天的贡献度',
  PRIMARY KEY (`id`),
  KEY `index_contributions_on_user_id_and_created_at` (`user_id`,`created_at`),
  KEY `index_contributions_on_user_id_and_date_time_and_count` (`user_id`,`date_time`,`count`)
) ENGINE=InnoDB AUTO_INCREMENT=3827 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='贡献度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csdn_emails`
--

DROP TABLE IF EXISTS `csdn_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csdn_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_csdn_emails_on_user_id` (`user_id`),
  KEY `index_csdn_emails_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='CSDN 邮箱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_keys_projects`
--

DROP TABLE IF EXISTS `deploy_keys_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_keys_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deploy_key_id` int(11) NOT NULL COMMENT '公钥 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用公钥',
  PRIMARY KEY (`id`),
  KEY `index_deploy_key` (`project_id`,`deploy_key_id`),
  KEY `index_deploy_keys_projects_on_key` (`deploy_key_id`,`enabled`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1440 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部署公钥表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diff_positions`
--

DROP TABLE IF EXISTS `diff_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diff_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PR diff 评论的位置信息表',
  `author_id` int(11) NOT NULL,
  `pull_request_id` int(11) NOT NULL,
  `head_sha` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_sha` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_sha` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '新文件路径',
  `old_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老文件路径',
  `start_new_line` int(11) DEFAULT NULL COMMENT '起始新行',
  `start_old_line` int(11) DEFAULT NULL COMMENT '起始老行',
  `start_line_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始行标识码',
  `new_line` int(11) DEFAULT NULL COMMENT '新行',
  `old_line` int(11) DEFAULT NULL COMMENT '老行',
  `line_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行标识码',
  `original_backup` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始位置的数据备份',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `resolved_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '解决状态',
  `resolved_user_id` int(11) DEFAULT NULL COMMENT '解决人',
  `resolved_at` datetime DEFAULT NULL COMMENT '解决时间',
  `diff_hunk` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_diff_positions_on_author_id` (`author_id`),
  KEY `index_diff_positions_on_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='PR diff 评论的位置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_authorities`
--

DROP TABLE IF EXISTS `doc_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL COMMENT '文件节点 id',
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_level` int(11) DEFAULT '0' COMMENT '权限值',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doc_authorities_on_enterprise_id_and_node_id` (`enterprise_id`,`node_id`),
  KEY `index_doc_authorities_on_node_id_and_target_type_and_target_id` (`node_id`,`target_type`,`target_id`),
  KEY `index_doc_authorities_on_target_type_and_target_id` (`target_type`,`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文件权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_directories`
--

DROP TABLE IF EXISTS `doc_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_directories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT '0' COMMENT '项目 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doc_directories_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文档的文件夹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_nodes`
--

DROP TABLE IF EXISTS `doc_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件标题',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级id',
  `file_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件多态表',
  `file_id` int(11) DEFAULT '0' COMMENT '文件关联表 id',
  `public` int(11) DEFAULT '0' COMMENT '文件的公开属性',
  `program_id` int(11) DEFAULT '0',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业id',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建者id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '访问密码',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `project_id` int(11) DEFAULT '0' COMMENT '所属仓库 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_doc_nodes_on_enterprise_and_file_type_and_parent_id_and_name` (`parent_id`,`enterprise_id`,`file_type`,`program_id`,`name`),
  KEY `index_doc_nodes_on_file_type_and_file_id` (`file_type`,`file_id`),
  KEY `index_doc_nodes_on_enterprise_id_and_file_type_and_file_id` (`enterprise_id`,`file_type`,`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1770 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文件(包含文件夹、文档、附件)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_versions`
--

DROP TABLE IF EXISTS `doc_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_sort_id` int(11) DEFAULT NULL COMMENT 'wiki_sort 的关联 id',
  `sha` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'commit_id',
  `description` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'commit 描述',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者 id',
  `commit_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doc_versions_on_wiki_sort_id_and_commit_at` (`wiki_sort_id`,`commit_at`),
  KEY `index_doc_versions_on_wiki_sort_id_and_sha` (`wiki_sort_id`,`sha`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'host',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属类型',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密钥',
  `verified` tinyint(1) DEFAULT '0' COMMENT '是否验证',
  `token_generated_at` datetime DEFAULT NULL COMMENT '密钥生成时间',
  PRIMARY KEY (`id`),
  KEY `index_domains_on_target_type_and_target_id_and_host_and_verified` (`target_type`,`target_id`,`host`,`verified`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='域名表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donates`
--

DROP TABLE IF EXISTS `donates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donates` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '留言',
  `donator_id` int(11) DEFAULT NULL COMMENT '捐赠者 id',
  `receiver_id` int(11) NOT NULL COMMENT '接收者 id',
  `money_in_cent` int(11) NOT NULL COMMENT '金额',
  `status` int(11) NOT NULL COMMENT '状态',
  `donator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '捐赠人名字',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易编号',
  PRIMARY KEY (`id`),
  KEY `index_donates_on_project_id_and_status` (`project_id`,`status`),
  KEY `index_donates_on_receiver_id_and_status` (`receiver_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='捐赠表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edu_applications`
--

DROP TABLE IF EXISTS `edu_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `school_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学校名称',
  `teacher_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师名称',
  `teacher_certification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师证',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'pending' COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `refuse_reason` text COLLATE utf8_unicode_ci COMMENT '拒绝原因',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_edu_applications_on_user_id` (`user_id`),
  KEY `index_edu_applications_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='高校版申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '邮箱状态（0: 未确认 / 1: 已确认 / 2: 占用中）',
  `scope` int(11) NOT NULL DEFAULT '0' COMMENT '邮箱作用域（主邮箱、提交邮箱、安全邮箱、通知邮箱、公开邮箱）',
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认令牌',
  `confirmed_at` datetime DEFAULT NULL COMMENT '邮箱确认时间',
  `confirmation_sent_at` datetime DEFAULT NULL COMMENT '邮箱确认发送时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_emails_on_confirmation_token` (`confirmation_token`),
  KEY `index_emails_on_user_id` (`user_id`),
  KEY `index_emails_on_email_and_state` (`email`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=2955 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emergencies`
--

DROP TABLE IF EXISTS `emergencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip 地址（英文逗号分割的多个 IP 地址）',
  `level` int(11) DEFAULT '1' COMMENT '告警级别',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警描述',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `state` int(11) DEFAULT '0' COMMENT '状态（0: 未读，1: 已读）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `security_id` int(11) DEFAULT NULL COMMENT '安全策略 id',
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '地区（英文逗号分割的 国家，省，市）',
  `target_path` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警的仓库地址',
  `member_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作者的备注名',
  PRIMARY KEY (`id`),
  KEY `index_emergencies_on_enterprise_id_and_state` (`enterprise_id`,`state`),
  KEY `index_emergencies_on_user_id` (`user_id`),
  KEY `index_emergencies_on_enterprise_id_and_updated_at` (`enterprise_id`,`updated_at`),
  KEY `index_emergencies_on_security_user_update` (`security_id`,`user_id`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11336 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='告警表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_boards`
--

DROP TABLE IF EXISTS `enterprise_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联用户',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `board_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '数据表 board_template 的 id',
  `position_x` float NOT NULL DEFAULT '0' COMMENT 'x轴位置',
  `position_y` float NOT NULL DEFAULT '0' COMMENT 'y轴位置',
  `width` float NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` float NOT NULL DEFAULT '0' COMMENT '高度',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件边框颜色',
  `custom_config` text COLLATE utf8mb4_unicode_ci COMMENT '组件个性化配置',
  PRIMARY KEY (`id`),
  KEY `idx_enterprise_id_and_user_id` (`enterprise_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_infos`
--

DROP TABLE IF EXISTS `enterprise_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `default_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '初始密码',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `recipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警信息接收者',
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `notice` text COLLATE utf8_unicode_ci COMMENT '企业公告',
  `scale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发团队规模',
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业',
  `inviter_id` int(11) DEFAULT '0' COMMENT '邀请者 id',
  `open_application` tinyint(1) DEFAULT '0' COMMENT '是否开启申请加入',
  `space_quota_percent` int(11) DEFAULT '0' COMMENT '容量使用百分比',
  `hidden_commerce` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '隐藏套餐的 id 串(,分割)',
  `forbid_force_push` tinyint(1) DEFAULT '0',
  `expected_ips` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IP 限制',
  `message_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新成员加入时，欢迎私信内容',
  `oauth_scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业第三方应用授权权限',
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_role_id` int(11) DEFAULT '0' COMMENT '默认的角色权限，对应角色表的id',
  `lastest_ident` int(11) DEFAULT '1000' COMMENT '记录 ident 的最新值',
  `pr_scan` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'GiteeScan PR自动扫描开关',
  `manual_scan` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'GiteeScan 手动扫描开关',
  `last_event_date` datetime DEFAULT NULL COMMENT '企业最近event日期',
  `force_verify_apply` int(11) DEFAULT '0',
  `version` tinyint(1) DEFAULT '0',
  `webhooks_count` int(11) DEFAULT '50' COMMENT 'Webhook 数量上限',
  `kooder_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `watermark` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_infos_on_enterprise_id` (`enterprise_id`),
  KEY `index_enterprise_infos_on_inviter_id` (`inviter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_interviews`
--

DROP TABLE IF EXISTS `enterprise_interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_interviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '要回访的企业',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `assignee_id` int(11) DEFAULT NULL COMMENT '指派人',
  `update_by_id` int(11) DEFAULT NULL COMMENT '更新人',
  `times` int(11) DEFAULT '1' COMMENT '回访次数',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回访要求',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `message_type` int(11) NOT NULL DEFAULT '0' COMMENT '回访类型',
  `last_event_date` datetime DEFAULT NULL COMMENT '企业最近event日期',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_interviews_on_state_and_created_at` (`state`,`created_at`),
  KEY `index_enterprise_interviews_on_enter_id_state_created` (`enterprise_id`,`state`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=15107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_logs`
--

DROP TABLE IF EXISTS `enterprise_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip',
  `user_id` int(11) DEFAULT '0' COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `stat_type` int(11) DEFAULT '0' COMMENT '操作类型',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联对象ID',
  `related_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联对象类型',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_logs_on_user_id_and_stat_type` (`user_id`,`stat_type`),
  KEY `index_enterprise_logs_on_p_id_and_stat_type` (`stat_type`),
  KEY `index_enterprise_logs_on_enterprise_id_and_stat_type` (`enterprise_id`,`stat_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14231 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_navigates`
--

DROP TABLE IF EXISTS `enterprise_navigates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_navigates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `program_id` int(11) DEFAULT '0' COMMENT '项目 id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '导航栏选项名称',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '导航栏选项图标',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `active` tinyint(1) DEFAULT '1' COMMENT '激活状态',
  `fixed` tinyint(1) DEFAULT '0' COMMENT '禁止隐藏',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enterprise_navigates_on_enterprise_id` (`enterprise_id`),
  KEY `index_enterprise_navigates_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_recipients`
--

DROP TABLE IF EXISTS `enterprise_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `recipient_type` int(11) NOT NULL COMMENT '通知方式',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '通知目标',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_enterprise_recipients_on_enterprise_id_and_content` (`enterprise_id`,`content`),
  KEY `enterprise_recipients_index` (`enterprise_id`,`recipient_type`,`content`(20))
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_roles`
--

DROP TABLE IF EXISTS `enterprise_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `description` text COLLATE utf8_unicode_ci COMMENT '角色描述',
  `issue_rule` int(11) DEFAULT '0' COMMENT '任务权限规则',
  `message_rule` int(11) DEFAULT '0' COMMENT '群发私信权限规则',
  `notice_rule` int(11) DEFAULT '0' COMMENT '企业公告权限规则',
  `emergency_rule` int(11) DEFAULT '0' COMMENT '企业告警权限规则',
  `label_manage_rule` int(11) DEFAULT '0' COMMENT '任务标签权限规则',
  `issue_type_status_rule` int(11) DEFAULT '0' COMMENT '任务类型和状态权限规则',
  `git_lfs_rule` int(11) DEFAULT '0' COMMENT 'gitlfs权限规则',
  `emergency_log_rule` int(11) DEFAULT '0' COMMENT '企业告警权限规则',
  `pull_request_rule` int(11) DEFAULT '0' COMMENT 'PR权限规则',
  `week_report_rule` int(11) DEFAULT '0' COMMENT '周报权限规则',
  `event_rule` int(11) DEFAULT '0' COMMENT '动态权限规则',
  `program_rule` int(11) DEFAULT '0' COMMENT '项目权限规则',
  `project_rule` int(11) DEFAULT '0' COMMENT '仓库权限规则',
  `group_rule` int(11) DEFAULT '0' COMMENT '团队权限规则',
  `doc_rule` int(11) DEFAULT '0' COMMENT '文档权限规则',
  `member_rule` int(11) DEFAULT '0' COMMENT '成员管理权限规则',
  `info_rule` int(11) DEFAULT '0' COMMENT '企业信息权限规则',
  `role_rule` int(11) DEFAULT '0' COMMENT '角色设置权限规则',
  `security_rule` int(11) DEFAULT '0' COMMENT '安全设置权限规则',
  `log_rule` int(11) DEFAULT '0' COMMENT '操作日志权限规则',
  `order_rule` int(11) DEFAULT '0' COMMENT '订单管理权限规则',
  `key_rule` int(11) DEFAULT '0' COMMENT '部署公钥权限规则',
  `hook_rule` int(11) DEFAULT '0' COMMENT 'webhook权限规则',
  `statistic_rule` int(11) DEFAULT '0' COMMENT '企业统计权限规则',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `system_default` tinyint(1) DEFAULT '0' COMMENT '系统默认类型',
  `enterprise_rule` int(11) DEFAULT '0' COMMENT '企业管理权限规则',
  `access_rule` int(11) DEFAULT '1' COMMENT '企业访问权限',
  `ident` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'custom_role' COMMENT '企业内置角色的标识符',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_roles_on_id_name` (`enterprise_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3956 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_data`
--

DROP TABLE IF EXISTS `event_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `event_id` int(11) DEFAULT NULL COMMENT '动态 id',
  `data` text COLLATE utf8_unicode_ci COMMENT '数据',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_event_data_on_event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149993 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '动态标题',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `action` int(11) DEFAULT NULL COMMENT '动态行为',
  `author_id` int(11) DEFAULT NULL COMMENT '动态创建者 id',
  `public` tinyint(1) DEFAULT '1' COMMENT '标示动态是否公开',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  PRIMARY KEY (`id`),
  KEY `index_events_on_created_at` (`created_at`),
  KEY `index_events_on_project_id_and_public` (`project_id`,`public`),
  KEY `index_projects_on_pid_c_action` (`project_id`,`created_at`,`action`),
  KEY `index_events_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_events_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`),
  KEY `index_events_on_author_id_and_created_at_and_public` (`author_id`,`created_at`,`public`),
  KEY `index_events_on_author_id_and_public_and_created_at` (`author_id`,`public`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=364723 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explore_projects`
--

DROP TABLE IF EXISTS `explore_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explore_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `license` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `stars_count` int(11) DEFAULT NULL COMMENT 'star数量',
  `recomm_at` datetime DEFAULT NULL COMMENT '推荐时间',
  `last_push_at` datetime DEFAULT NULL COMMENT '最近推送时间',
  `recomm` tinyint(1) DEFAULT NULL COMMENT '推荐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_explore_projects_on_project_id_and_category_id` (`project_id`,`category_id`),
  KEY `index_explore_projects_on_category_id` (`category_id`),
  KEY `index_explore_projects_on_language_id` (`language_id`),
  KEY `index_explore_projects_on_license` (`license`),
  KEY `index_explore_projects_on_stars_count` (`stars_count`),
  KEY `index_explore_projects_on_recomm_at` (`recomm_at`),
  KEY `index_explore_projects_on_last_push_at` (`last_push_at`),
  KEY `index_explore_projects_on_recomm` (`recomm`)
) ENGINE=InnoDB AUTO_INCREMENT=12543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feature_update_logs`
--

DROP TABLE IF EXISTS `feature_update_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_update_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noti_level` int(11) NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '功能更新描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `self_id` int(11) DEFAULT NULL COMMENT 'follow 用户 id',
  `follow_id` int(11) DEFAULT NULL COMMENT '被 follow 用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `follow_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'User',
  PRIMARY KEY (`id`),
  KEY `index_follows_on_self_id` (`self_id`),
  KEY `index_follows_on_follow_id` (`follow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2846 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Follows 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forced_synchronizations`
--

DROP TABLE IF EXISTS `forced_synchronizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forced_synchronizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `sync_type` int(11) DEFAULT '0',
  `sync_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_data`
--

DROP TABLE IF EXISTS `fosseye_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fosseye_task_id` int(11) NOT NULL COMMENT '检测任务id',
  `lib_license_conflicts` longtext COLLATE utf8mb4_unicode_ci COMMENT '组件间许可证冲突列表',
  `project_license_conflicts` longtext COLLATE utf8mb4_unicode_ci COMMENT '项目与组件许可证冲突列表',
  `license` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扫描时的仓库license',
  `scan_start_at` datetime DEFAULT NULL COMMENT '检测开始的时间',
  `scan_end_at` datetime DEFAULT NULL COMMENT '检测开始的时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_fosseye_data_on_fosseye_task_id` (`fosseye_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_tasks`
--

DROP TABLE IF EXISTS `fosseye_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `user_id` int(11) NOT NULL COMMENT '任务创建者id',
  `status` int(11) DEFAULT '0' COMMENT '检测任务状态',
  `uuid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识符',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扫描分支',
  `commit_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '本次commit id',
  `res_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求返回的message',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_fosseye_tasks_on_uuid` (`uuid`),
  KEY `index_fosseye_tasks_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendly_links`
--

DROP TABLE IF EXISTS `friendly_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `img_url` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `link_to` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'links' COMMENT '分类',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `location` int(11) DEFAULT '0' COMMENT '摆放位置（值越小越靠前）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `page_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'links' COMMENT '所属页面',
  `change_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交换链接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='友链管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gift_infos`
--

DROP TABLE IF EXISTS `gift_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品名称',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '礼品数量',
  `price` float DEFAULT NULL COMMENT '礼品价格',
  `img_type` int(11) DEFAULT '1' COMMENT '图片类型',
  `coin` int(11) NOT NULL COMMENT 'G 币',
  `status` int(11) DEFAULT '1' COMMENT '礼品状态',
  `img_url` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品图片',
  `link_to` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `link_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接标签',
  `location` int(11) DEFAULT '0' COMMENT '摆放顺序（数值越小越靠前）',
  `show_info` int(11) DEFAULT '1' COMMENT '是否显示礼品信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='礼品管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gift_orders`
--

DROP TABLE IF EXISTS `gift_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `addressee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品状态',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `present_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `present_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `gift_express_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品邮寄单号',
  `prize_express_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖杯邮寄单号',
  PRIMARY KEY (`id`),
  KEY `index_gift_orders_on_user_id_and_created_at` (`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='礼品订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `gift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品',
  `status` int(11) DEFAULT NULL COMMENT '状态（已邮件/待审核）',
  `price` int(11) DEFAULT NULL COMMENT '礼品所需 GB',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_gifts_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='礼品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_enterprise_statistics`
--

DROP TABLE IF EXISTS `gitee_enterprise_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_enterprise_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `enterprise_all_count` int(11) DEFAULT NULL COMMENT '企业总量',
  `enterprise_free_count` int(11) DEFAULT NULL COMMENT '免费企业总量',
  `enterprise_paid_count` int(11) DEFAULT NULL COMMENT '付费企业总量',
  `enterprise_paid_valid_count` int(11) DEFAULT NULL COMMENT '有效付费企业总量',
  `order_paid_count` int(11) DEFAULT NULL COMMENT '付款订单总量',
  `order_paid_price_count` int(11) DEFAULT NULL COMMENT '订单金额总量',
  `project_count` int(11) DEFAULT NULL COMMENT '项目总量',
  `issue_count` int(11) DEFAULT NULL COMMENT '任务总量',
  `pull_request_count` int(11) DEFAULT NULL COMMENT 'PR总量',
  `push_count` int(11) DEFAULT NULL COMMENT 'push 总量',
  `enterprise_all_new_count` int(11) DEFAULT NULL COMMENT '企业增量',
  `enterprise_free_new_count` int(11) DEFAULT NULL COMMENT '免费企业增量',
  `enterprise_paid_new_count` int(11) DEFAULT NULL COMMENT '付费企业增量',
  `order_paid_new_count` int(11) DEFAULT NULL COMMENT '付款订单增量',
  `order_paid_price_new_count` int(11) DEFAULT NULL COMMENT '订单金额增量',
  `project_new_count` int(11) DEFAULT NULL COMMENT '项目增量',
  `issue_new_count` int(11) DEFAULT NULL COMMENT '任务增量',
  `pull_request_new_count` int(11) DEFAULT NULL COMMENT 'PR增量',
  `push_new_count` int(11) DEFAULT NULL COMMENT 'push 增量',
  `downgrade_to_free_new_count` int(11) DEFAULT NULL COMMENT '当天付费降级为免费增量',
  `enterprise_delete_new_count` int(11) DEFAULT NULL COMMENT '当天删除企业增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enterprise_overdue_new_count` int(11) DEFAULT NULL COMMENT '过期企业增量',
  `enterprise_renew_new_count` int(11) DEFAULT NULL COMMENT '过期企业增量',
  `enterprise_overdue_count` int(11) DEFAULT NULL COMMENT '续费企业总量',
  `enterprise_renew_count` int(11) DEFAULT NULL COMMENT '续费企业总量',
  PRIMARY KEY (`id`),
  KEY `index_gitee_enterprise_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_enterprise_statistics_on_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_artifact_repositories`
--

DROP TABLE IF EXISTS `gitee_go_artifact_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_artifact_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '制品库唯一标识',
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '制品库名称',
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类别',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `ipipe_repo_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipipe 制品库id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '最后一次更新者id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_projct_id_name` (`project_id`,`name`),
  KEY `index_gitee_go_artifact_repositories_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=828 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_batch_jobs`
--

DROP TABLE IF EXISTS `gitee_go_batch_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_batch_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sum` int(11) NOT NULL DEFAULT '1',
  `success_num` int(11) NOT NULL DEFAULT '0' COMMENT '成功数量',
  `failure_num` int(11) NOT NULL DEFAULT '0' COMMENT '失败数量',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT '下发数量',
  `report_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '上报状态',
  `report_result` text COLLATE utf8mb4_unicode_ci COMMENT '上报结果',
  `report_time` datetime DEFAULT NULL,
  `gitee_go_host_group_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_go_batch_jobs_on_gitee_go_host_group_id` (`gitee_go_host_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33707 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_builds`
--

DROP TABLE IF EXISTS `gitee_go_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_builds` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Gitee Go 构建记录表',
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `ipipe_pipeline_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipipe流水线ID',
  `ipipe_build_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipipe构建ID',
  `ipipe_build_number` int(11) NOT NULL COMMENT '构建序号',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建状态',
  `branch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发分支',
  `trigger_user_id` int(11) NOT NULL COMMENT '触发人ID',
  `ci_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '触发类型(push/...)',
  `commit` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '触发的commit',
  `start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建开始时间(时间戳)',
  `end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建结束时间(时间戳)',
  `spend_time` int(11) NOT NULL DEFAULT '0' COMMENT '构建花费时间(seconds)',
  `source` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '记录来源api/list',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `block_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阻塞状态，UNBLOCK/BLOCK',
  `gitee_go_pipeline_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Gitee Go 流水线ID',
  `ipipe_trigger_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '触发时间',
  `ipipe_trigger_id` int(11) DEFAULT NULL COMMENT 'ipipe 触发实体ID',
  `charge_time` int(11) NOT NULL DEFAULT '0' COMMENT '收费时长',
  `job_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Job数量',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  `commit_message` text COLLATE utf8mb4_unicode_ci COMMENT '提交消息',
  `config_id` int(11) DEFAULT NULL COMMENT '配置 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_builds_on_is_new_and_ipipe_build_id` (`is_new`,`ipipe_build_id`),
  KEY `index_gitee_go_builds_on_project_id_and_ipipe_build_id` (`project_id`,`ipipe_build_id`),
  KEY `index_gitee_go_builds_on_gitee_go_pipeline_id` (`gitee_go_pipeline_id`),
  KEY `index_gitee_go_builds_on_commit` (`commit`),
  KEY `index_gitee_go_builds_on_ipipe_build_id` (`ipipe_build_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27833 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gitee Go 构建记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_configs`
--

DROP TABLE IF EXISTS `gitee_go_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Gitee GO 构建配置',
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `blob_id` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'blob id',
  `blob_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_configs_on_project_id_and_blob_id` (`project_id`,`blob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1422 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gitee GO 构建配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_environment_variables`
--

DROP TABLE IF EXISTS `gitee_go_environment_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_environment_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '环境变量名称',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '环境变量值',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '编辑者ID',
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `read_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读',
  `admin_level` int(11) NOT NULL DEFAULT '0' COMMENT '管理级别（仅管理员可见、仓库成员可见）',
  `is_secret` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是密钥',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_go_env_variables_on_pro_id_and_name` (`project_id`,`name`),
  KEY `index_go_env_variables_on_pro_id_and_r_o` (`project_id`,`read_only`),
  KEY `index_go_env_variables_on_pro_id_and_i_s` (`project_id`,`is_secret`),
  KEY `index_go_env_variables_on_pro_id_and_a_l` (`project_id`,`admin_level`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_host_groups`
--

DROP TABLE IF EXISTS `gitee_go_host_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_host_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '对应效率云的name',
  `display_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示给用户的id',
  `display_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示给用户的name',
  `host_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'self' COMMENT '自有主机或者第三方服务商提供的主机',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true/false',
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Enterprise',
  `resource_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `xly_label_id` int(11) DEFAULT NULL,
  `hosts_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_host_groups_on_name` (`name`),
  UNIQUE KEY `index_gitee_go_host_groups_on_resource_and_dp_id` (`resource_type`,`resource_id`,`display_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_host_groups_projects`
--

DROP TABLE IF EXISTS `gitee_go_host_groups_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_host_groups_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitee_go_host_group_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gitee_go_hg_projects_on_hg_id_and_project_id` (`gitee_go_host_group_id`,`project_id`),
  KEY `index_gitee_go_host_groups_projects_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_hosts`
--

DROP TABLE IF EXISTS `gitee_go_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online' COMMENT 'online/offline',
  `occupied` tinyint(1) NOT NULL DEFAULT '0',
  `gitee_go_host_group_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gitee_go_hosts_on_gitee_go_host_group_id_and_active` (`gitee_go_host_group_id`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_job_logs`
--

DROP TABLE IF EXISTS `gitee_go_job_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_job_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `log_uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `token` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CREATED',
  `info` text COLLATE utf8mb4_unicode_ci,
  `gitee_go_host_group_id` int(11) NOT NULL,
  `gitee_go_batch_job_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gitee_go_job_id` int(11) DEFAULT NULL,
  `gitee_go_host_id` int(11) DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_job_logs_on_token` (`token`),
  KEY `index_gitee_go_job_logs_on_job_uuid` (`job_uuid`),
  KEY `index_gitee_go_job_logs_on_log_uuid` (`log_uuid`),
  KEY `index_gitee_go_job_logs_on_gitee_go_host_group_id` (`gitee_go_host_group_id`),
  KEY `index_gitee_go_job_logs_on_gitee_go_batch_job_id` (`gitee_go_batch_job_id`),
  KEY `index_gitee_go_job_logs_on_gitee_go_job_id` (`gitee_go_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33884 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_jobs`
--

DROP TABLE IF EXISTS `gitee_go_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipipe_job_id` int(11) NOT NULL COMMENT 'Ipipe Job ID',
  `gitee_go_stage_id` int(11) NOT NULL COMMENT '阶段ID',
  `ipipe_stage_id` int(11) NOT NULL COMMENT 'Ipipe 阶段ID',
  `ipipe_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上游Job ID,第一个Job则为0(来自ipipe)',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Job 名称',
  `job_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束时间',
  `spend_time` int(11) NOT NULL DEFAULT '0' COMMENT '花费时间(start_time - end_time)(seconds)',
  `duration` bigint(20) DEFAULT NULL COMMENT 'Job执行时间(来自ipipe)',
  `error_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误类型（DEFAULT/SYSTEM,当状态为CANCEL和FAIL时才需要关注）',
  `error_message` text COLLATE utf8mb4_unicode_ci COMMENT 'Job执行错误信息',
  `log_url` varchar(764) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '实时日志参数',
  `full_log_url` varchar(764) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全量日志url',
  `artifact_url` varchar(764) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '制品url',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `real_start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'realJob开始时间',
  `real_end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'realJob结束时间',
  `real_spend_time` int(11) NOT NULL DEFAULT '0' COMMENT 'readJob花费时间',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_jobs_on_is_new_and_ipipe_job_id` (`is_new`,`ipipe_job_id`),
  KEY `index_gitee_go_jobs_on_gitee_go_stage_id` (`gitee_go_stage_id`),
  KEY `index_gitee_go_jobs_on_status` (`status`),
  KEY `index_gitee_go_jobs_on_ipipe_parent_id` (`ipipe_parent_id`),
  KEY `index_gitee_go_jobs_on_job_type` (`job_type`),
  KEY `index_gitee_go_jobs_on_ipipe_job_id` (`ipipe_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_operation_logs`
--

DROP TABLE IF EXISTS `gitee_go_operation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_operation_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作者ID',
  `action` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动作',
  `before_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更之前的值',
  `after_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更之后的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_order_items`
--

DROP TABLE IF EXISTS `gitee_go_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitee_go_order_id` int(11) NOT NULL,
  `unit_price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '单价, 单位: 元',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_orders`
--

DROP TABLE IF EXISTS `gitee_go_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '交易流水号',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid' COMMENT '订单状态',
  `order_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'buy' COMMENT 'buy/free',
  `payment_channel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付渠道',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '总价, 单位: 元',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '时长, 单位: 分钟',
  `paid_at` datetime DEFAULT NULL COMMENT '支付成功时间',
  `paid_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `namespace_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_orders_on_order_id` (`order_id`),
  KEY `index_gitee_go_orders_on_namespace_id_and_state_and_created_at` (`namespace_id`,`state`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_pipelines`
--

DROP TABLE IF EXISTS `gitee_go_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_pipelines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipipe_pipeline_id` int(11) NOT NULL COMMENT 'ipipe流水线id',
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水线名称,对应yaml中displayName',
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对应yaml中name',
  `project_id` int(11) NOT NULL COMMENT '仓库ID',
  `yaml_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml 文件名',
  `yaml_branch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml 所在分支',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水线状态【正常、已归档、已删除】',
  `last_build_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最新构建状态',
  `last_trigger_user_id` int(11) DEFAULT NULL COMMENT '最新触发人ID',
  `last_trigger_branch` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最新触发分支',
  `last_modified_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流水线最新更新时间(时间戳)',
  `last_modified_user_id` int(11) DEFAULT NULL COMMENT '最后一次更新的人',
  `created_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `created_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `archive_at` datetime DEFAULT NULL COMMENT '归档时间',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  `block_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阻塞状态，UNBLOCK/BLOCK',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_pipelines_on_is_new_and_ipipe_pipeline_id` (`is_new`,`ipipe_pipeline_id`),
  KEY `index_gitee_go_pipelines_on_project_id_and_yaml_branch` (`project_id`,`yaml_branch`),
  KEY `index_gitee_go_pipelines_on_ipipe_pipeline_id` (`ipipe_pipeline_id`),
  KEY `index_gitee_go_pipelines_on_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_resource_change_refs`
--

DROP TABLE IF EXISTS `gitee_go_resource_change_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_resource_change_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_change_log_id` int(11) NOT NULL,
  `gitee_go_rescue_id` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_rescue_id_log_id` (`gitee_go_rescue_id`,`quota_change_log_id`),
  KEY `index_refs_quota_change_log_id` (`quota_change_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3840 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_resources`
--

DROP TABLE IF EXISTS `gitee_go_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL COMMENT '拥有者ID',
  `owner_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '拥有者类型',
  `target_id` int(11) NOT NULL COMMENT '来源ID',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源源类型',
  `quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源总量',
  `resource_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类型',
  `surplus` int(11) NOT NULL DEFAULT '0' COMMENT '资源剩余量',
  `expiry_time` datetime DEFAULT NULL COMMENT '资源过期时间',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_resources_on_target_type_and_target_id` (`target_type`,`target_id`),
  KEY `index_gitee_go_resources_on_owner_type_and_owner_id` (`owner_type`,`owner_id`),
  KEY `index_gitee_go_resources_on_is_expired` (`is_expired`),
  KEY `index_gitee_go_resources_on_resource_type` (`resource_type`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_settings`
--

DROP TABLE IF EXISTS `gitee_go_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL COMMENT '命名空间ID',
  `surplus_time` int(11) NOT NULL DEFAULT '0' COMMENT 'Gitee Go剩余构建时常，可为负数',
  `is_award_received` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否领取过红包',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_settings_on_namespace_id` (`namespace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_stages`
--

DROP TABLE IF EXISTS `gitee_go_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitee_go_build_id` int(11) NOT NULL COMMENT 'GiteeGo构建ID',
  `ipipe_build_id` int(11) NOT NULL COMMENT 'Ipipe 构建ID',
  `ipipe_stage_id` int(11) NOT NULL COMMENT 'Ipipe Stage ID',
  `ipipe_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上游Stage ID,头Stage则为0(来自ipipe)',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Stage 名称',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Stage状态',
  `start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阶段执行开始时间',
  `end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阶段执行结束时间',
  `spend_time` int(11) NOT NULL DEFAULT '0' COMMENT '花费时间(start_time - end_time)(seconds)',
  `duration` bigint(20) DEFAULT NULL COMMENT '阶段执行所需时间段(来自ipipe)',
  `block_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阻塞状态',
  `fail_fast` tinyint(1) DEFAULT NULL COMMENT '是否为快速失败',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trigger_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Stage 触发人ID',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_stages_on_is_new_and_ipipe_stage_id` (`is_new`,`ipipe_stage_id`),
  KEY `index_gitee_go_stages_on_gitee_go_build_id_and_status` (`gitee_go_build_id`,`status`),
  KEY `index_gitee_go_stages_on_ipipe_parent_id` (`ipipe_parent_id`),
  KEY `index_gitee_go_stages_on_ipipe_stage_id` (`ipipe_stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34876 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_yaml_errors`
--

DROP TABLE IF EXISTS `gitee_go_yaml_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_yaml_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'yaml所在仓库ID',
  `branch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml所在分支',
  `commit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'commit',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml文件名',
  `message` text COLLATE utf8mb4_unicode_ci COMMENT '错误信息',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发人ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_go_yaml_errors_on_project_id_and_branch` (`project_id`,`branch`)
) ENGINE=InnoDB AUTO_INCREMENT=3099 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_order_statistics`
--

DROP TABLE IF EXISTS `gitee_order_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_order_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `commerce_id` int(11) DEFAULT NULL COMMENT '套餐id',
  `commerce_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '套餐类型',
  `all_count` int(11) DEFAULT NULL COMMENT '订单总量',
  `paid_count` int(11) DEFAULT NULL COMMENT '付款订单总量',
  `paid_price_count` int(11) DEFAULT NULL COMMENT '付费金额总量',
  `space_count` int(11) DEFAULT NULL COMMENT '扩容订单总量',
  `space_paid_count` int(11) DEFAULT NULL COMMENT '扩容付款订单总量',
  `new_count` int(11) DEFAULT NULL COMMENT '新购订单总量',
  `new_paid_count` int(11) DEFAULT NULL COMMENT '新购付款订单总量',
  `renewal_count` int(11) DEFAULT NULL COMMENT '仅续费订单总量',
  `renewal_paid_count` int(11) DEFAULT NULL COMMENT '仅续费付款订单总量',
  `upgrade_count` int(11) DEFAULT NULL COMMENT '仅升级订单总量',
  `upgrade_paid_count` int(11) DEFAULT NULL COMMENT '仅升级付款订单总量',
  `upgrade_renewal_count` int(11) DEFAULT NULL COMMENT '升级续费订单总量',
  `upgrade_renewal_paid_count` int(11) DEFAULT NULL COMMENT '升级续费付款订单总量',
  `downgrade_renewal_count` int(11) DEFAULT NULL COMMENT '降级续费订单总量',
  `downgrade_renewal_paid_count` int(11) DEFAULT NULL COMMENT '降级续费付款订单总量',
  `all_new_count` int(11) DEFAULT NULL COMMENT '订单增量',
  `paid_new_count` int(11) DEFAULT NULL COMMENT '付款订单增量',
  `paid_price_new_count` int(11) DEFAULT NULL COMMENT '付费金额增量',
  `space_new_count` int(11) DEFAULT NULL COMMENT '扩容订单增量',
  `space_paid_new_count` int(11) DEFAULT NULL COMMENT '扩容付款订单增量',
  `new_new_count` int(11) DEFAULT NULL COMMENT '新购订单增量',
  `new_paid_new_count` int(11) DEFAULT NULL COMMENT '新购付款订单增量',
  `renewal_new_count` int(11) DEFAULT NULL COMMENT '仅续费订单增量',
  `renewal_paid_new_count` int(11) DEFAULT NULL COMMENT '仅续费付款订单增量',
  `upgrade_new_count` int(11) DEFAULT NULL COMMENT '仅升级订单增量',
  `upgrade_paid_new_count` int(11) DEFAULT NULL COMMENT '仅升级付款订单增量',
  `upgrade_renewal_new_count` int(11) DEFAULT NULL COMMENT '升级续费订单增量',
  `upgrade_renewal_paid_new_count` int(11) DEFAULT NULL COMMENT '升级续费付款订单增量',
  `downgrade_renewal_new_count` int(11) DEFAULT NULL COMMENT '降级续费订单增量',
  `downgrade_renewal_paid_new_count` int(11) DEFAULT NULL COMMENT '降级续费付款订单增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `member_new_count` int(11) DEFAULT '0' COMMENT '扩员订单增量',
  `member_paid_new_count` int(11) DEFAULT '0' COMMENT '扩员订单付款增量',
  `member_count` int(11) DEFAULT '0' COMMENT '扩员订单总量',
  `member_paid_count` int(11) DEFAULT '0' COMMENT '扩员订单付款总量',
  `new_paid_price_new_count` int(11) DEFAULT NULL COMMENT '新购付款金额增量',
  `new_paid_price_count` int(11) DEFAULT NULL COMMENT '新购付款金额总量',
  PRIMARY KEY (`id`),
  KEY `index_gitee_order_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_order_statistics_on_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=3869 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_project_statistics`
--

DROP TABLE IF EXISTS `gitee_project_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_project_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `project_public_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目类型(公开，私有，内部公开)',
  `project_outsorce_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外包类型(外包，内部)',
  `project_count` int(11) DEFAULT NULL COMMENT '项目总量',
  `project_new_count` int(11) DEFAULT NULL COMMENT '项目增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_project_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_project_statistics_on_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_recomms`
--

DROP TABLE IF EXISTS `gitee_recomms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_recomms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `repo_list` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐项目的 id 列表',
  `author_list` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐用户的 id 列表',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_recomms_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_reward_developers`
--

DROP TABLE IF EXISTS `gitee_reward_developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_reward_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `osc_id` int(11) NOT NULL COMMENT 'Oschina账号 id',
  `issue_id` int(11) NOT NULL COMMENT '任务 id',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `pull_request_id` int(11) DEFAULT '0' COMMENT '交付PR id',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '信息(验收未通过的原因)',
  `can_check` tinyint(1) DEFAULT '0' COMMENT '能否验收',
  `upload_time` datetime DEFAULT NULL COMMENT '交付时间',
  `check_start_time` datetime DEFAULT NULL COMMENT '验收开始时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_reward_developers_on_uid_iid` (`user_id`,`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_reward_water_bills`
--

DROP TABLE IF EXISTS `gitee_reward_water_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_reward_water_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `osc_id` int(11) NOT NULL COMMENT 'Oschina账号 id',
  `peer_user_id` int(11) DEFAULT '0' COMMENT '对端user id，对端不是用户时为0',
  `peer_osc_id` int(11) DEFAULT '0' COMMENT '对端Oschina id，对端不是用户时为0',
  `gitee_reward_id` int(11) NOT NULL COMMENT 'GiteeReward id',
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '众包流水号',
  `transaction_id` int(11) NOT NULL COMMENT '众包流水记录id',
  `money_in_cent` int(11) DEFAULT '0' COMMENT '金额',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `trade_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '流水描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_reward_water_bills_on_state_and_capital_name` (`state`,`capital_name`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_rewards`
--

DROP TABLE IF EXISTS `gitee_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '悬赏发起人 id',
  `osc_id` int(11) NOT NULL COMMENT '发起人发布悬赏时的osc账号id',
  `issue_id` int(11) NOT NULL COMMENT 'issue id',
  `project_id` int(11) DEFAULT '0' COMMENT 'project id',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `main` tinyint(1) DEFAULT '0' COMMENT '是否是主要悬赏',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `money_in_cent` int(11) DEFAULT '0' COMMENT '金额',
  `paid` tinyint(1) DEFAULT '0' COMMENT '是否付款',
  `dongjie` tinyint(1) DEFAULT '0' COMMENT '是否冻结',
  `donate_percent` int(11) DEFAULT '0' COMMENT '开源仓库捐赠百分比',
  `reward_percent` int(11) DEFAULT '0' COMMENT '报酬百分比',
  `service_charge_percent` int(11) DEFAULT '0' COMMENT '平台手续费百分比',
  `pay_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付类型:微信、支付宝、银联',
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '众包流水号',
  `donate_id` int(11) DEFAULT '0' COMMENT '捐赠 id',
  `protection_time` int(11) DEFAULT '0' COMMENT '作者优先保护时间',
  `expired_at` datetime DEFAULT NULL COMMENT '悬赏过期时间',
  `activated_at` datetime DEFAULT NULL COMMENT '激活(付款成功)时间',
  `closed_at` datetime DEFAULT NULL COMMENT '悬赏完成/关闭时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_rewards_on_user_id_and_issue_id` (`user_id`,`issue_id`),
  KEY `index_gitee_rewards_on_project_id_and_paid_and_state` (`project_id`,`paid`,`state`),
  KEY `index_gitee_rewards_on_issue_id_and_user_id_and_paid` (`issue_id`,`user_id`,`paid`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_scan_feedbacks`
--

DROP TABLE IF EXISTS `gitee_scan_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_scan_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT 'Gitee Scan任务id',
  `project_id` int(11) NOT NULL COMMENT '关联仓库 id',
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `state` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '处理状态',
  `active` tinyint(1) DEFAULT '0' COMMENT '误报标记状态',
  `types` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型，bug、style、cve',
  `attitude` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表态，useful、useless',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户反馈意见',
  `bug_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '缺陷扫描es id',
  `bug_rule_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '缺陷扫描规则id',
  `bug_rule_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缺陷扫描规则名称',
  `style_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '规范扫描es id',
  `style_rule_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规范扫描规则名称',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_scan_feedbacks_on_task_id_and_user_id_and_types` (`task_id`,`user_id`,`types`),
  KEY `index_gitee_scan_feedbacks_on_task_id_and_user_id_and_bug_id` (`task_id`,`user_id`,`bug_id`),
  KEY `index_gitee_scan_feedbacks_on_task_id_and_user_id_and_style_id` (`task_id`,`user_id`,`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_scan_tasks`
--

DROP TABLE IF EXISTS `gitee_scan_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_scan_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_status` int(11) DEFAULT '0' COMMENT '缺陷扫描任务状态',
  `bug_status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缺陷扫描任务状态名',
  `style_status` int(11) DEFAULT '0' COMMENT '规范扫描任务状态',
  `style_status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规范扫描任务状态名',
  `cve_status` int(11) DEFAULT '0' COMMENT 'CVE扫描任务状态',
  `cve_status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'CVE扫描任务状态名',
  `active_type` int(11) DEFAULT '0' COMMENT '扫描类型,手动、PR自动等',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扫描分支',
  `pull_request_id` int(11) DEFAULT '0' COMMENT 'PR id',
  `commit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '本次commit id',
  `commit_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'commit title',
  `scan_path` text COLLATE utf8mb4_unicode_ci COMMENT '扫描路径',
  `filter_path` text COLLATE utf8mb4_unicode_ci COMMENT '过滤路径',
  `languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '语言类型',
  `iscan_bug_id` int(11) DEFAULT '0' COMMENT 'iScan缺陷扫描任务id',
  `iscan_style_id` int(11) DEFAULT '0' COMMENT 'iScan规则扫描任务id',
  `bug_count` int(11) DEFAULT '0' COMMENT '缺陷总数',
  `bug_fix` int(11) DEFAULT '0' COMMENT '缺陷修复数',
  `bug_inc` int(11) DEFAULT '0' COMMENT '缺陷新增数',
  `style_count` int(11) DEFAULT '0' COMMENT '规则总数',
  `style_fix` int(11) DEFAULT '0' COMMENT '规则修复数',
  `style_inc` int(11) DEFAULT '0' COMMENT '规则新增数',
  `cve_count` int(11) DEFAULT '0' COMMENT 'CVE总数',
  `bug_result` text COLLATE utf8mb4_unicode_ci COMMENT '缺陷扫描结果',
  `style_result` text COLLATE utf8mb4_unicode_ci COMMENT '规范扫描结果',
  `read_count` int(11) DEFAULT '0' COMMENT '任务报告阅读次数',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `bug_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `style_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cve_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'CVE描述',
  `bug_score` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retry_count` int(11) DEFAULT '0' COMMENT 'retry times',
  `retry_time` datetime DEFAULT NULL COMMENT 'last retry time',
  `bug_read_count` int(11) DEFAULT '0' COMMENT 'bug read count',
  `style_read_count` int(11) DEFAULT '0' COMMENT 'style read count',
  `cve_read_count` int(11) DEFAULT '0' COMMENT 'CVE read count',
  `bug_rollback_time` datetime DEFAULT NULL COMMENT 'iscan rollback time',
  `style_rollback_time` datetime DEFAULT NULL COMMENT 'iscan rollback time',
  `cve_rollback_time` datetime DEFAULT NULL COMMENT 'CVE回调时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_gitee_scan_tasks_on_commit_id_and_branch_and_active_type` (`commit_id`,`branch`,`active_type`) USING BTREE,
  KEY `index_gitee_scan_tasks_on_project_id_and_created_at` (`project_id`,`created_at`) USING BTREE,
  KEY `index_gitee_scan_tasks_on_pull_request_id_and_created_at` (`pull_request_id`,`created_at`) USING BTREE,
  KEY `index_gitee_scan_tasks_on_project_id_and_bug_status_name` (`project_id`,`bug_status_name`) USING BTREE,
  KEY `index_gitee_scan_tasks_on_project_id_and_style_status_name` (`project_id`,`style_status_name`) USING BTREE,
  KEY `index_gitee_scan_tasks_on_project_id_and_cve_status_name` (`project_id`,`cve_status_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13707 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_stars`
--

DROP TABLE IF EXISTS `gitee_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '刊号',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '期刊 URL 标识',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '期刊标题',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '期刊摘要',
  `content` text COLLATE utf8_unicode_ci COMMENT '期刊正文',
  `boost` int(11) DEFAULT '0' COMMENT '期刊权重',
  `note_count` int(11) DEFAULT '0' COMMENT '评论数量',
  `author_id` int(11) DEFAULT NULL COMMENT '期刊作者',
  `interviewee_id` int(11) DEFAULT NULL COMMENT '期刊受访者',
  `published` tinyint(1) DEFAULT '0' COMMENT '发布状态',
  `published_at` datetime DEFAULT NULL COMMENT '发布时间',
  `options` text COLLATE utf8_unicode_ci COMMENT '额外设置',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_stars_on_path` (`path`),
  KEY `index_gitee_stars_on_published_and_path` (`published`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='封面人物';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_statistics`
--

DROP TABLE IF EXISTS `gitee_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `user_count` int(11) DEFAULT NULL COMMENT '用户总量',
  `project_count` int(11) DEFAULT NULL COMMENT '项目总量',
  `group_count` int(11) DEFAULT NULL COMMENT '组织总量',
  `issue_count` int(11) DEFAULT NULL COMMENT '任务总量',
  `pull_request_count` int(11) DEFAULT NULL COMMENT 'PR总量',
  `code_count` int(11) DEFAULT NULL COMMENT '代码片段总量',
  `education_count` int(11) DEFAULT NULL COMMENT '高校通过总量',
  `enterprise_all_count` int(11) DEFAULT NULL COMMENT '企业总量',
  `push_count` int(11) DEFAULT NULL COMMENT 'push 总量',
  `star_count` int(11) DEFAULT NULL COMMENT 'star 总量',
  `watch_count` int(11) DEFAULT NULL COMMENT 'watch 总量',
  `attach_file_count` int(11) DEFAULT NULL COMMENT '附件总量',
  `page_count` int(11) DEFAULT NULL COMMENT 'pages 总量',
  `user_new_count` int(11) DEFAULT NULL COMMENT '用户增量',
  `project_new_count` int(11) DEFAULT NULL COMMENT '项目增量',
  `group_new_count` int(11) DEFAULT NULL COMMENT '组织增量',
  `issue_new_count` int(11) DEFAULT NULL COMMENT '任务增量',
  `pull_request_new_count` int(11) DEFAULT NULL COMMENT 'PR 增量',
  `code_new_count` int(11) DEFAULT NULL COMMENT '代码片段增量',
  `education_new_count` int(11) DEFAULT NULL COMMENT '高校通过增量',
  `enterprise_all_new_count` int(11) DEFAULT NULL COMMENT '企业增量',
  `push_new_count` int(11) DEFAULT NULL COMMENT 'push 增量',
  `star_new_count` int(11) DEFAULT NULL COMMENT 'star 增量',
  `watch_new_count` int(11) DEFAULT NULL COMMENT 'watch 增量',
  `attach_file_new_count` int(11) DEFAULT NULL COMMENT '附件增量',
  `page_new_count` int(11) DEFAULT NULL COMMENT 'pages 增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `program_count` int(11) DEFAULT '0',
  `program_new_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gitee_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_statistics_on_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `google_captchas`
--

DROP TABLE IF EXISTS `google_captchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_captchas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `score` float DEFAULT NULL COMMENT '分数',
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作名称',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_google_captchas_on_user_id` (`user_id`),
  KEY `index_google_captchas_on_action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gp_enterprises`
--

DROP TABLE IF EXISTS `gp_enterprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_enterprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业邮箱',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业行业',
  `company_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业规模',
  `applicant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请人姓名',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `position` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位',
  `warehouse_size` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '使用仓库大小',
  `reject_message` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '拒绝理由',
  `user_id` int(11) DEFAULT NULL COMMENT '拥有者id',
  PRIMARY KEY (`id`),
  KEY `index_gp_enterprises_on_enterprise_name_and_phone_and_email` (`enterprise_name`,`phone`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='码云私有云版企业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gp_licenses`
--

DROP TABLE IF EXISTS `gp_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '许可证 id',
  `encrypted_license` text COLLATE utf8_unicode_ci COMMENT '许可证',
  `activated_at` datetime DEFAULT NULL COMMENT '被激活时间',
  `expired_at` datetime DEFAULT NULL COMMENT '过期时间',
  `gp_enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT 'GP 企业 ID',
  `version` int(11) DEFAULT NULL COMMENT '许可证版本号',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `max_member` int(11) DEFAULT NULL COMMENT '成员人数配额',
  `max_enterprise` int(11) DEFAULT NULL COMMENT '企业个数配额',
  `base_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '解密密钥',
  `base_public_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '解密公钥',
  `box_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'box密钥',
  `verify_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '签名密钥',
  `additional_services` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '额外服务',
  `device_ids` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mac地址',
  `machine_configuration` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机器配置',
  `sign_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '签名密钥',
  `poc` int(11) DEFAULT NULL COMMENT '是否 POC 阶段的 License',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gp_licenses_on_license_id` (`license_id`),
  KEY `index_gp_licenses_on_activated_at` (`activated_at`),
  KEY `index_gp_licenses_on_expired_at` (`expired_at`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='码云私有云版许可证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_key_subkeys`
--

DROP TABLE IF EXISTS `gpg_key_subkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_key_subkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gpg_key_id` int(11) DEFAULT NULL,
  `keyid` text COLLATE utf8_unicode_ci COMMENT '子密钥 key id',
  `fingerprint` text COLLATE utf8_unicode_ci COMMENT '子密钥指纹',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gpg_key_subkeys_on_keyid` (`keyid`(16)),
  UNIQUE KEY `index_gpg_key_subkeys_on_fingerprint` (`fingerprint`(40)),
  KEY `index_gpg_key_subkeys_on_gpg_key_id` (`gpg_key_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_keys`
--

DROP TABLE IF EXISTS `gpg_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `primary_keyid` text COLLATE utf8_unicode_ci COMMENT '主密钥 key id',
  `fingerprint` text COLLATE utf8_unicode_ci COMMENT '主密钥指纹',
  `key` mediumtext COLLATE utf8_unicode_ci COMMENT 'key 文本',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gpg_keys_on_primary_keyid` (`primary_keyid`(16)),
  UNIQUE KEY `index_gpg_keys_on_fingerprint` (`fingerprint`(40)),
  KEY `index_gpg_keys_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_signatures`
--

DROP TABLE IF EXISTS `gpg_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 ID',
  `gpg_key_id` int(11) DEFAULT NULL COMMENT '签名关联的 GPG key',
  `commit_sha` text COLLATE utf8_unicode_ci COMMENT '被签名的 commit id',
  `gpg_key_primary_keyid` text COLLATE utf8_unicode_ci COMMENT '签名使用的 key id',
  `gpg_key_user_name` text COLLATE utf8_unicode_ci COMMENT '签名的 name',
  `gpg_key_user_email` text COLLATE utf8_unicode_ci COMMENT '签名的 email',
  `verification_status` int(11) NOT NULL DEFAULT '0' COMMENT '签名状态',
  `gpg_key_subkey_id` int(11) DEFAULT NULL COMMENT '子密钥',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gpg_signatures_on_commit_sha` (`commit_sha`(40)),
  KEY `index_gpg_signatures_on_project_id` (`project_id`),
  KEY `index_gpg_signatures_on_gpg_key_id` (`gpg_key_id`),
  KEY `index_gpg_signatures_on_gpg_key_primary_keyid` (`gpg_key_primary_keyid`(16)),
  KEY `index_gpg_signatures_on_gpg_key_subkey_id` (`gpg_key_subkey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_infos`
--

DROP TABLE IF EXISTS `group_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_id` int(11) DEFAULT NULL COMMENT '组织 id',
  `open_application` tinyint(1) DEFAULT '0' COMMENT '是否开启申请加入',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `notice` text COLLATE utf8_unicode_ci COMMENT '组织公告',
  `force_verify_apply` int(11) DEFAULT '0' COMMENT '是否开启强制审核',
  `can_overview` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用概览',
  `overview_source` int(11) NOT NULL DEFAULT '1' COMMENT '概览来源',
  `can_sync` tinyint(1) DEFAULT '0',
  `mirror_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_infos_on_group_id` (`group_id`),
  KEY `index_group_infos_on_updated_user_id` (`updated_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='组织信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_team_projects`
--

DROP TABLE IF EXISTS `group_team_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_team_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_team_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `access_level` int(11) NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_team_projects_on_group_team_id_and_project_id` (`group_team_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_team_users`
--

DROP TABLE IF EXISTS `group_team_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_team_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_team_users_on_group_team_id` (`group_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_teams`
--

DROP TABLE IF EXISTS `group_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_teams_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `high_stars`
--

DROP TABLE IF EXISTS `high_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `high_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `fetch_time` datetime DEFAULT NULL COMMENT '达到 1k star 时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_high_stars_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='1K Star 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `introductions`
--

DROP TABLE IF EXISTS `introductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `introductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL DEFAULT '0' COMMENT '组织 id',
  `language` int(11) NOT NULL DEFAULT '0' COMMENT '语言版本',
  `project` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目路径',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目分支',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '介绍文本内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_introductions_on_namespace_id` (`namespace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='介绍表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `inviter_id` int(11) DEFAULT NULL COMMENT '邀请者 id',
  `invitee_id` int(11) DEFAULT NULL COMMENT '受邀者 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '种类',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_of_invitation` (`invitee_id`,`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业邀请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_infos`
--

DROP TABLE IF EXISTS `invoice_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型（个人/企业）',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `invoice_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '纳税人识别号',
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户银行',
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行帐号',
  `enterprise_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照上的登记地址',
  `enterprise_tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司有效电话',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `tax_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照扫描件',
  `taxpayer_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一般纳税人证明扫描件',
  `invoice_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接收电子发票的邮箱地址',
  PRIMARY KEY (`id`),
  KEY `index_invoice_infos_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发票管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_operate_logs`
--

DROP TABLE IF EXISTS `invoice_operate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_order_id` int(11) DEFAULT NULL COMMENT '发票订单的 id',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作者 id',
  `action` int(11) DEFAULT NULL COMMENT '操作类型',
  `before_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作前的值',
  `after_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作后的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invoice_operate_logs_on_invoice_order_id` (`invoice_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_orders`
--

DROP TABLE IF EXISTS `invoice_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `invoice_price` int(11) DEFAULT NULL COMMENT '开票金额',
  `commerce_order_id` int(11) DEFAULT NULL COMMENT '商业订单表 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票状态',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '纳税人识别号',
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户银行',
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行帐号',
  `enterprise_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照上的登记地址',
  `enterprise_tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司有效电话',
  `express_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递公司',
  `express_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '市',
  `detailed_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人姓名',
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `tax_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照扫描件',
  `taxpayer_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一般纳税人证明扫描件',
  `remark` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `open_at` datetime DEFAULT NULL COMMENT '开票时间',
  `invoice_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接收电子发票的邮箱地址',
  `admin_remark` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invoice_orders_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发票详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_change_records`
--

DROP TABLE IF EXISTS `issue_change_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_change_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_change_records_on_issue_id` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35451 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_collaborators`
--

DROP TABLE IF EXISTS `issue_collaborators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_collaborators` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `issue_id` int(11) NOT NULL COMMENT '任务 id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_collaborators_on_issue_id_and_user_id` (`issue_id`,`user_id`),
  KEY `index_issue_collaborators_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4810 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务协作者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_collections`
--

DROP TABLE IF EXISTS `issue_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT '0' COMMENT 'issue id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户 id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_collections_on_issue_id_and_user_id` (`issue_id`,`user_id`),
  KEY `index_issue_collections_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_dependences`
--

DROP TABLE IF EXISTS `issue_dependences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_dependences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT '主体ID',
  `author_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `pre_issue_id` int(11) DEFAULT NULL COMMENT '前一个任务ID',
  `latter_issue_id` int(11) DEFAULT NULL COMMENT '后一个任务ID',
  `ref_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '依赖关系类型',
  `level` int(11) DEFAULT NULL COMMENT '依赖级别',
  `offset` int(11) DEFAULT NULL COMMENT '延迟时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `target_id` int(11) DEFAULT NULL COMMENT '关联任务ID',
  PRIMARY KEY (`id`),
  KEY `index_issue_dependences_on_issue_id` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务紧前紧后依赖';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_extra`
--

DROP TABLE IF EXISTS `issue_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT '任务 id',
  `issue_field_id` int(11) DEFAULT NULL COMMENT '任务字段 id',
  `value_int` int(11) DEFAULT NULL COMMENT '数值类型所对应的值（包括单选、多选框）',
  `value_string` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文本框类型所对应的值',
  `value_text` text COLLATE utf8mb4_unicode_ci COMMENT '多行文本所对应的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_extra_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_fields`
--

DROP TABLE IF EXISTS `issue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段名称',
  `field_type` int(11) DEFAULT NULL COMMENT '字段类型',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段描述',
  `options` text COLLATE utf8mb4_unicode_ci COMMENT '字段配置项',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '是否为系统字段',
  `length` int(11) DEFAULT NULL COMMENT '字段长度',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_fields_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_fields_types_refs`
--

DROP TABLE IF EXISTS `issue_fields_types_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_fields_types_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_field_id` int(11) DEFAULT NULL COMMENT '任务字段id',
  `issue_type_id` int(11) DEFAULT NULL COMMENT '任务类型id',
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业id',
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认值',
  `is_null` tinyint(1) DEFAULT '0' COMMENT '是否为空字段',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否为隐藏字段',
  `is_required` tinyint(1) DEFAULT '0' COMMENT '是否为必填字段',
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提示文字',
  `group_index` int(11) DEFAULT '0' COMMENT '分组id',
  `sort` int(11) DEFAULT '0' COMMENT '排序值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_fields_types_refs_on_issue_type_id` (`issue_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_infos`
--

DROP TABLE IF EXISTS `issue_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT '任务 id',
  `issue_extra` text COLLATE utf8mb4_unicode_ci COMMENT '任务自定义字段值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_states`
--

DROP TABLE IF EXISTS `issue_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业 id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标',
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '颜色',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `command` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '指令',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_states_on_title_and_enterprise_id` (`title`,`enterprise_id`),
  KEY `index_issue_states_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6688 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_statistics`
--

DROP TABLE IF EXISTS `issue_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `milestone_id` int(11) NOT NULL DEFAULT '0' COMMENT '里程碑ID',
  `date` date NOT NULL COMMENT '日期',
  `created_count` int(11) NOT NULL DEFAULT '0' COMMENT '新建任务数',
  `closed_count` int(11) NOT NULL DEFAULT '0' COMMENT '完成的任务数量',
  `rejected_count` int(11) NOT NULL DEFAULT '0' COMMENT '拒绝的任务数量',
  `type_category` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务类型属性【bug缺陷, feature需求, task任务】',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_e_id_pg_id_m_id__u_id_type_pri_d` (`enterprise_id`,`program_id`,`milestone_id`,`user_id`,`type_category`,`priority`,`date`),
  KEY `index_p_id_u_id_type_d` (`program_id`,`user_id`,`type_category`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_type_settings`
--

DROP TABLE IF EXISTS `issue_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type_id` int(11) NOT NULL COMMENT '任务类型ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_type_settings_on_e_u_p` (`enterprise_id`,`program_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_type_state_refs`
--

DROP TABLE IF EXISTS `issue_type_state_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type_state_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `issue_type_id` int(11) DEFAULT NULL COMMENT '任务类型 id',
  `issue_state_id` int(11) DEFAULT NULL COMMENT '任务状态 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'open' COMMENT '属性',
  `state_to_any` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_type_state_refs_on_issue_type_id_and_issue_state_id` (`issue_type_id`,`issue_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11228 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务类型状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_types`
--

DROP TABLE IF EXISTS `issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名字',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `template` text COLLATE utf8_unicode_ci COMMENT '模版',
  `ident` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标识符（系统内置 task、bug、requirement）',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统默认',
  `color` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#00BE2D' COMMENT '颜色(eg: #00BE2D)',
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'task' COMMENT '任务类型属性[task, bug, feature]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_types_on_title_and_enterprise_id` (`title`,`enterprise_id`),
  KEY `index_issue_types_on_enterprise_id` (`enterprise_id`),
  KEY `index_issue_types_on_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2070 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignee_id` int(11) DEFAULT '0' COMMENT '指派者 id',
  `author_id` int(11) DEFAULT NULL COMMENT '创建者 id',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `position` int(11) DEFAULT '0' COMMENT '排序',
  `description` text COLLATE utf8mb4_unicode_ci,
  `milestone_id` int(11) DEFAULT '0' COMMENT '里程碑 id',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iid` int(11) DEFAULT NULL COMMENT '仓库任务流水号',
  `source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_level` int(11) DEFAULT '0' COMMENT '置顶选项',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '更新者 id',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weights` int(11) DEFAULT '0' COMMENT '权重',
  `deadline` datetime DEFAULT NULL COMMENT '结束时间',
  `started_at` datetime DEFAULT NULL COMMENT '开始时间',
  `finished_at` datetime DEFAULT NULL COMMENT '完成时间',
  `plan_started_at` datetime DEFAULT NULL COMMENT '计划开始时间',
  `noteable_count` int(11) DEFAULT '0' COMMENT '评论数',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `priority` int(11) DEFAULT '0' COMMENT '优先级',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级任务 id',
  `ident` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_type_id` int(11) DEFAULT '1' COMMENT '任务类型 id',
  `issue_state_id` int(11) DEFAULT '1' COMMENT '任务状态 id',
  `duration` int(11) DEFAULT '0' COMMENT '预计工期',
  `program_id` int(11) DEFAULT '0',
  `level` int(11) DEFAULT NULL COMMENT '节点深度',
  `root_id` int(11) NOT NULL DEFAULT '0' COMMENT '根节点ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '相同项目相同根节点下的排序值',
  `depth` int(11) NOT NULL DEFAULT '0' COMMENT '节点深度',
  `security_hole` tinyint(1) DEFAULT '0',
  `reopened` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否重开',
  `reopened_at` datetime DEFAULT NULL COMMENT '重开时间',
  PRIMARY KEY (`id`),
  KEY `index_issues_on_assignee_id` (`assignee_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_at` (`created_at`),
  KEY `index_issues_on_title` (`title`),
  KEY `index_issues_on_ident` (`ident`),
  KEY `index_issues_on_project_id_and_iid` (`project_id`,`iid`),
  KEY `index_issues_on_parent_id` (`parent_id`),
  KEY `index_issues_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`),
  KEY `index_issue_on_e_p_state` (`enterprise_id`,`project_id`,`issue_type_id`,`issue_state_id`),
  KEY `index_issues_on_e_state_p_c` (`enterprise_id`,`issue_state_id`,`project_id`,`created_at`),
  KEY `index_issues_on_e_p_c` (`enterprise_id`,`project_id`,`created_at`),
  KEY `index_issues_on_milestone_id_and_issue_state_id` (`milestone_id`,`issue_state_id`),
  KEY `index_issues_on_pid_aid_type_id` (`project_id`,`author_id`,`issue_type_id`),
  KEY `index_issues_on_project_id_and_state_and_created_at` (`project_id`,`state`,`created_at`),
  KEY `index_issues_on_project_id_and_milestone_id` (`project_id`,`milestone_id`),
  KEY `index_issues_on_root_id_and_sort` (`root_id`,`sort`),
  KEY `index_issues_on_program_id_and_parent_id` (`program_id`,`parent_id`),
  KEY `index_issues_on_enterprise_id_and_program_id_and_state` (`enterprise_id`,`program_id`,`state`),
  KEY `index_issues_on_state_type` (`issue_state_id`,`issue_type_id`),
  KEY `index_issues_on_issue_type_id` (`issue_type_id`),
  KEY `index_issues_on_en_id_and_id_and_c_at` (`enterprise_id`,`id`,`created_at`),
  KEY `index_issues_on_source` (`source`(15)),
  KEY `index_issues_on_enterprise_id_and_deadline` (`enterprise_id`,`deadline`),
  KEY `index_issues_on_enterprise_id_and_project_id_and_state` (`enterprise_id`,`project_id`,`state`),
  KEY `index_issues_on_enterprise_id_and_issue_type_id` (`enterprise_id`,`issue_type_id`),
  KEY `index_issues_on_enterprise_id_and_issue_type_id_and_parent_id` (`enterprise_id`,`issue_type_id`,`parent_id`),
  KEY `index_issues_on_enterprise_id_and_reopened` (`enterprise_id`,`reopened`)
) ENGINE=InnoDB AUTO_INCREMENT=31631 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keys`
--

DROP TABLE IF EXISTS `keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `key` text COLLATE utf8mb4_unicode_ci COMMENT '公钥内容（包含: key_type, key_content, key_salt）',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公钥标题',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '指纹',
  `key_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公钥类型',
  `key_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '公钥内容',
  `key_salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密钥',
  `key_owner` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '标示用于 ci 部署的',
  `sha256_fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sha256 指纹',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_keys_on_sha256_fingerprint` (`sha256_fingerprint`),
  KEY `index_keys_on_user_id` (`user_id`),
  KEY `index_keys_on_fingerprint` (`fingerprint`),
  KEY `index_keys_on_key_content` (`key_content`(255)),
  KEY `index_keys_on_key` (`key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公钥表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_article_refs`
--

DROP TABLE IF EXISTS `label_article_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_article_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_label_article_refs_on_article_id_and_label_id` (`article_id`,`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_issue_refs`
--

DROP TABLE IF EXISTS `label_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34093 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_pull_request_refs`
--

DROP TABLE IF EXISTS `label_pull_request_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_pull_request_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `pull_request_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_label_pull_request_refs_on_pull_request_id_and_label_id` (`pull_request_id`,`label_id`),
  KEY `index_label_pull_request_refs_on_label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1603 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `serial` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_labels_on_enterprise_id_and_name` (`enterprise_id`,`name`),
  KEY `index_labels_on_project_id_and_name` (`project_id`,`name`),
  KEY `index_labels_on_enterprise_id_and_description` (`enterprise_id`,`description`),
  KEY `index_labels_on_project_id_and_description` (`project_id`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=902158 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_binds`
--

DROP TABLE IF EXISTS `login_binds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_binds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `way` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_login_binds_on_user_id` (`user_id`),
  KEY `index_login_binds_on_account` (`account`),
  KEY `index_login_binds_on_parent_id_and_provider` (`parent_id`,`provider`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录帐号',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录来源',
  `useragent_id` int(11) DEFAULT NULL COMMENT 'user agent id',
  `state` int(11) DEFAULT '0',
  `error_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_login_logs_on_user_id_and_updated_at` (`user_id`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9688 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `luck_draws`
--

DROP TABLE IF EXISTS `luck_draws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luck_draws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `roll` int(11) DEFAULT NULL,
  `draw_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_luck_draws_on_user_id` (`user_id`),
  KEY `index_luck_draws_on_reason` (`reason`),
  KEY `index_luck_draws_on_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_search_blocks`
--

DROP TABLE IF EXISTS `map_search_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_search_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `block_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `begin_at` datetime DEFAULT NULL COMMENT '开始日期',
  `end_at` datetime DEFAULT NULL COMMENT '结束日期',
  `block_word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '敏感词',
  `published` tinyint(1) DEFAULT '0' COMMENT '发布状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_map_search_blocks_on_published` (`published`),
  KEY `index_map_search_blocks_on_begin_at_and_end_at` (`begin_at`,`end_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_applications`
--

DROP TABLE IF EXISTS `member_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) DEFAULT NULL,
  `destination_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicant_id` int(11) DEFAULT '0',
  `inviter_id` int(11) DEFAULT '0',
  `access` int(11) DEFAULT '0',
  `applicant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `need_check` tinyint(1) DEFAULT '1',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operated_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `outsourced` int(11) DEFAULT '0',
  `program_id` int(11) DEFAULT '0' COMMENT '企业的某项目id',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_applications_on_destination` (`destination_id`,`destination_type`,`applicant_id`),
  KEY `index_member_applications_on_inviter_id` (`inviter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1884 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_level` int(11) DEFAULT NULL,
  `invite_user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outsourced` tinyint(1) DEFAULT '0',
  `block_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `block_status` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT '0',
  `intro` text COLLATE utf8_unicode_ci,
  `occupation` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark_pinyin` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注的拼音',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_g_u_t1` (`group_id`,`user_id`,`type`),
  KEY `index_members_on_user_id_and_type` (`user_id`,`type`),
  KEY `index_members_on_group_id_and_role_id` (`group_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4568 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_sessions`
--

DROP TABLE IF EXISTS `message_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `noticed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_message_sessions_on_user_id_and_contact_id` (`user_id`,`contact_id`),
  KEY `index_message_sessions_on_user_id_and_message_id` (`user_id`,`message_id`),
  KEY `index_message_sessions_on_user_id_and_read_and_noticed_at` (`user_id`,`read`,`noticed_at`),
  KEY `index_message_sessions_on_message_id` (`message_id`),
  KEY `index_message_sessions_on_contact_id` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3845 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iid` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `assignee_id` int(11) DEFAULT '0',
  `author_id` int(11) DEFAULT '0',
  `program_id` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0' COMMENT '置顶排序',
  PRIMARY KEY (`id`),
  KEY `index_milestones_on_due_date` (`due_date`),
  KEY `index_milestones_on_project_id` (`project_id`),
  KEY `index_milestones_on_enterprise_id` (`enterprise_id`),
  KEY `index_milestones_on_program_id` (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1706 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_infos`
--

DROP TABLE IF EXISTS `namespace_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL COMMENT '命名空间ID',
  `giteego_surplus_time` int(11) NOT NULL DEFAULT '0' COMMENT 'Gitee Go剩余构建时常，可为负数',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_gitee_go_received` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否领取过Gitee Go 免费时长',
  `trial_enterprise` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有过企业体验套餐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_namespace_infos_on_namespace_id` (`namespace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_quota`
--

DROP TABLE IF EXISTS `namespace_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `commerce_order_id` int(11) DEFAULT '0',
  `member_quota` int(11) DEFAULT '0',
  `space_quota` int(11) DEFAULT '0',
  `single_project_quota` int(11) DEFAULT '0',
  `single_file_quota` int(11) DEFAULT '0',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attach_quota` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `viewer_quota` int(11) DEFAULT '0',
  `commerce_id` int(11) DEFAULT '0',
  `lfs_space_quota` int(11) NOT NULL DEFAULT '1',
  `used_space_quota` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '记录 Namespace 状态(超额,企业过期等).使用二进制值来记录',
  `project_count_quota` int(11) NOT NULL DEFAULT '1000',
  `concurrence_quota` int(11) DEFAULT '5',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_enterprise_quota_on_owner_type_and_created_at` (`type`,`created_at`) USING BTREE,
  KEY `index_enterprise_quota_on_owner_type_and_stop_at` (`type`,`stop_at`) USING BTREE,
  KEY `index_enterprise_quota_on_level_and_start_at` (`level`,`start_at`) USING BTREE,
  KEY `index_namespace_quota_on_owner_id_and_type_and_level` (`owner_id`,`type`,`level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3790 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_quota_logs`
--

DROP TABLE IF EXISTS `namespace_quota_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_quota_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `commerce_order_id` int(11) DEFAULT '0',
  `member_quota` int(11) DEFAULT '0',
  `space_quota` int(11) DEFAULT '0',
  `single_project_quota` int(11) DEFAULT '0',
  `single_file_quota` int(11) DEFAULT '0',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `alter_mode` int(11) DEFAULT NULL,
  `attach_quota` int(11) DEFAULT '0',
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `viewer_quota` int(11) DEFAULT '0',
  `lfs_space_quota` int(11) DEFAULT '1',
  `remark` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '改动备注',
  `concurrence_quota` int(11) DEFAULT '5',
  PRIMARY KEY (`id`),
  KEY `index_namespace_quota_logs_on_owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespaces`
--

DROP TABLE IF EXISTS `namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outsourced` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_namespaces_on_path` (`path`) USING BTREE,
  KEY `index_namespaces_on_owner_id` (`owner_id`) USING BTREE,
  KEY `index_namespaces_on_name` (`name`) USING BTREE,
  KEY `index_namespaces_on_enterprise_id` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2097845 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note_declares`
--

DROP TABLE IF EXISTS `note_declares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_declares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表态内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_note_declares_on_note_id` (`note_id`),
  KEY `index_note_declares_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` text COLLATE utf8mb4_unicode_ci,
  `noteable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `line_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noteable_id` int(11) DEFAULT NULL,
  `system` tinyint(1) DEFAULT '0',
  `updated_by_id` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ancestry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v_order` int(11) DEFAULT '0',
  `comment_path` varchar(540) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diff_position_id` int(11) DEFAULT NULL,
  `is_pull_request_review` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是PR评审评论',
  PRIMARY KEY (`id`),
  KEY `index_notes_on_noteable_type` (`noteable_type`),
  KEY `index_notes_on_created_at` (`created_at`),
  KEY `index_notes_on_commit_id` (`commit_id`),
  KEY `index_notes_on_ancestry` (`ancestry`),
  KEY `index_notes_on_a_t_i_c` (`author_id`,`noteable_type`,`noteable_id`,`comment_path`(191)),
  KEY `index_notes_on_p_t_v` (`project_id`,`noteable_type`,`v_order`),
  KEY `index_notes_on_diff_position_id` (`diff_position_id`),
  KEY `index_notes_on_noteable_id_and_noteable_type_and_updated_at` (`noteable_id`,`noteable_type`,`updated_at`),
  KEY `index_notes_on_p_t_p_c` (`project_id`,`noteable_type`,`comment_path`(25),`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7930 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notify_messages`
--

DROP TABLE IF EXISTS `notify_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `type_id` int(11) DEFAULT NULL COMMENT '类型 id（同意/拒绝GVP等）',
  `redirect_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '重定向链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='GVP，推荐，捐赠通知信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_grants`
--

DROP TABLE IF EXISTS `oauth_access_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_grants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_owner_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(11) NOT NULL,
  `redirect_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_grants_on_token` (`token`),
  KEY `index_oauth_access_grants_on_app_and_owner` (`application_id`,`resource_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1133 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resource_owner_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `application_id` int(11) DEFAULT NULL COMMENT '应用 id',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '令牌',
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '重新刷新令牌',
  `expires_in` int(11) DEFAULT NULL COMMENT '过期时间',
  `revoked_at` datetime DEFAULT NULL COMMENT '撤销时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `scopes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权权限范围',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `provider_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `available_access` int(11) DEFAULT NULL COMMENT '剩余可用次数，为空表示不限次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_tokens_on_token` (`token`),
  UNIQUE KEY `index_oauth_access_tokens_on_refresh_token` (`refresh_token`),
  KEY `index_oauth_access_tokens_on_application_id` (`application_id`),
  KEY `index_oauth_access_tokens_on_provider_account` (`provider_account`),
  KEY `index_oauth_access_tokens_on_user_app` (`resource_owner_id`,`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15724 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2.0 授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_applications`
--

DROP TABLE IF EXISTS `oauth_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `site_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `access_limit` int(11) DEFAULT '10000',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'User' COMMENT 'OAuth 的类型（默认 User）',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '与企业关联的 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_applications_on_uid` (`uid`),
  KEY `index_oauth_applications_on_enterprise_id_and_uid` (`enterprise_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_config_applications`
--

DROP TABLE IF EXISTS `oauth_config_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_config_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redirect_uri` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回调地址',
  `oauth_application_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oauth_config_applications_on_oauth_application_id` (`oauth_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_refs`
--

DROP TABLE IF EXISTS `oauth_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_application_id` int(11) NOT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oauth_refs_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `oauth_application_id_target_id_target_type` (`oauth_application_id`,`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_source_vips`
--

DROP TABLE IF EXISTS `open_source_vips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_source_vips` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库地址',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `apply_description` text COLLATE utf8_unicode_ci COMMENT '申请说明',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `last_accepted_at` datetime DEFAULT NULL COMMENT '最近更新时间',
  `wechat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_open_source_vips_on_project_id` (`project_id`),
  KEY `index_open_source_vips_on_state` (`state`),
  KEY `index_open_source_vips_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='GVP (Gitee Most Valuable Projects) - 码云最有价值开源项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operate_logs`
--

DROP TABLE IF EXISTS `operate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operated_by_id` int(11) DEFAULT NULL,
  `operated_by_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state_type` int(11) DEFAULT NULL,
  `change_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_change_id` int(11) DEFAULT NULL,
  `before_change_value` text COLLATE utf8mb4_unicode_ci,
  `after_change_id` int(11) DEFAULT NULL,
  `after_change_value` text COLLATE utf8mb4_unicode_ci,
  `through_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `through_id` int(11) DEFAULT NULL,
  `through_value` text COLLATE utf8mb4_unicode_ci,
  `issue_field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_operate_logs_on_target_id_and_target_type_and_id` (`target_id`,`target_type`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_allocations`
--

DROP TABLE IF EXISTS `order_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分摊计收',
  `commerce_order_id` int(11) NOT NULL COMMENT '订单',
  `income_today` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '当日收入',
  `date` date NOT NULL COMMENT '日期',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_order_allocations_on_commerce_order_id_and_date` (`commerce_order_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=164847 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分摊计收';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paas`
--

DROP TABLE IF EXISTS `paas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deploy_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deploy_commit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_deploy_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paas_frame` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paas_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `build_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `app_guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_applications`
--

DROP TABLE IF EXISTS `page_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `id_portrait` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证照片（人像面）',
  `id_national_emblem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证照片（国徽面）',
  `id_holding` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手持身份证照片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `refuse_reason` text COLLATE utf8mb4_unicode_ci COMMENT '拒绝原因',
  `status` int(11) DEFAULT '0' COMMENT '申请状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支',
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '域名',
  `last_clone_at` datetime DEFAULT NULL COMMENT '最近克隆时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `build_result` text COLLATE utf8_unicode_ci COMMENT '部署结果',
  `page_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'project' COMMENT '类型',
  `wiki_info_id` int(11) DEFAULT NULL COMMENT 'Wiki 信息表 id',
  `build_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部署目录',
  `ssl_certificate_crt` text COLLATE utf8_unicode_ci COMMENT '证书文件',
  `ssl_certificate_key` text COLLATE utf8_unicode_ci COMMENT '私钥文件',
  `ssl_status` int(11) NOT NULL DEFAULT '0' COMMENT 'SSL 状态',
  `force_https` tinyint(1) DEFAULT '0' COMMENT '是否强制使用 HTTPS',
  `auto_update` tinyint(1) DEFAULT '0' COMMENT '是否自动更新Page',
  `page_function` tinyint(1) DEFAULT '0' COMMENT 'pages 白名单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pages_on_domain` (`domain`),
  KEY `index_pages_on_project_id_and_page_type` (`project_id`,`page_type`),
  KEY `index_pages_on_wiki_info_id_and_page_type` (`wiki_info_id`,`page_type`),
  KEY `index_pages_on_page_function` (`page_function`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Pages 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_orders`
--

DROP TABLE IF EXISTS `payment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '交易流水号',
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `payment_channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付渠道',
  `payment_details` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON交易详情',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paid' COMMENT '交易状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payment_orders_on_order_id` (`order_id`),
  KEY `index_payment_orders_on_payment_id` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '号码',
  `state` int(11) DEFAULT '0',
  `captcha` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号来源',
  PRIMARY KEY (`id`),
  KEY `index_phones_on_user_id` (`user_id`),
  KEY `index_phones_on_phone_and_state` (`phone`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=1740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinned_group_projects`
--

DROP TABLE IF EXISTS `pinned_group_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinned_group_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pinned_group_projects_on_group_id_and_project_id` (`group_id`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinned_users_projects`
--

DROP TABLE IF EXISTS `pinned_users_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinned_users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `order` int(11) NOT NULL COMMENT '排序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pinned_users_projects_on_project_id_and_user_id` (`project_id`,`user_id`),
  KEY `index_pinned_users_projects_on_user_id_and_order` (`user_id`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='个人精选仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `private_assets`
--

DROP TABLE IF EXISTS `private_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `access_level` int(11) DEFAULT '10' COMMENT '权限',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '标识符',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `access_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `remote_file_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'fastdfs路径',
  `group_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'fastdfs组名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_private_assets_on_uuid` (`uuid`),
  KEY `index_private_assets_on_user_id` (`user_id`),
  KEY `index_private_assets_on_target` (`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='私有资源存储表，如企业发票';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_collections`
--

DROP TABLE IF EXISTS `program_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_collections_on_p_id_and_u_id` (`program_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_group_refs`
--

DROP TABLE IF EXISTS `program_group_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_group_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL COMMENT '项目 id',
  `group_id` int(11) DEFAULT NULL COMMENT '团队 id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_group_refs_on_program_id_and_group_id` (`program_id`,`group_id`),
  KEY `index_program_group_refs_on_program_id` (`program_id`),
  KEY `index_program_group_refs_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_project_refs`
--

DROP TABLE IF EXISTS `program_project_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_project_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_project_refs_on_program_id_and_project_id` (`program_id`,`project_id`),
  KEY `index_program_project_refs_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_statistics`
--

DROP TABLE IF EXISTS `program_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `create_issue_count` int(11) DEFAULT '0' COMMENT '创建任务数',
  `create_pr_count` int(11) DEFAULT '0' COMMENT '创建 PR 数',
  `merge_pr_count` int(11) DEFAULT '0' COMMENT 'PR 合并数',
  `close_issue_count` int(11) DEFAULT '0' COMMENT '实际完成任务数',
  `finish_issue_count` int(11) DEFAULT '0' COMMENT '按期完成任务数',
  `delay_issue_count` int(11) DEFAULT '0' COMMENT '延期任务数',
  `commit_count` int(11) DEFAULT '0',
  `add_code_line` int(11) DEFAULT '0' COMMENT '新增代码行',
  `date` date DEFAULT NULL COMMENT '日期',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_program_statistics_on_enterprise_id_and_program_id` (`enterprise_id`,`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_user_refs`
--

DROP TABLE IF EXISTS `program_user_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_user_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_user_refs_on_program_id_and_user_id` (`program_id`,`user_id`),
  KEY `index_program_user_refs_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=925 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目名',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '项目描述',
  `assignee_id` int(11) DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `enterprise_id` int(11) NOT NULL,
  `outsourced` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '项目状态',
  `ident` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业项目内唯一标示',
  `color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色(eg: #00BE2D)',
  PRIMARY KEY (`id`),
  KEY `index_programs_on_enterprise_id_and_assignee_id` (`enterprise_id`,`assignee_id`),
  KEY `index_programs_on_enterprise_id_and_author_id` (`enterprise_id`,`author_id`),
  KEY `index_programs_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`),
  KEY `index_programs_on_enterprise_id_and_updated_at` (`enterprise_id`,`updated_at`),
  KEY `index_programs_on_enterprise_id_and_ident` (`enterprise_id`,`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_api_docs`
--

DROP TABLE IF EXISTS `project_api_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_api_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `service_status` tinyint(1) DEFAULT '0',
  `branch_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `pom_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'java',
  PRIMARY KEY (`id`),
  KEY `index_project_api_docs_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_baidu_statistic_keys`
--

DROP TABLE IF EXISTS `project_baidu_statistic_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_baidu_statistic_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '百度统计 key',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_baidu_statistic_keys_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_category_refs`
--

DROP TABLE IF EXISTS `project_category_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_category_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `project_tag_id` int(11) DEFAULT NULL COMMENT '分类 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_project_category_refs_on_project_id` (`project_id`),
  KEY `index_project_category_refs_on_project_tag_id` (`project_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5027 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_change_records`
--

DROP TABLE IF EXISTS `project_change_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_change_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `action` int(11) DEFAULT NULL COMMENT '动作（1: 更新, 2: 删除）',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `shard` int(11) DEFAULT '0' COMMENT '爬虫用到（当前时间的时间戳%3的值）',
  `fields` text COLLATE utf8_unicode_ci,
  `baidu_opt` int(11) DEFAULT NULL COMMENT '仓库操作类型',
  `es_delete` tinyint(1) DEFAULT '0' COMMENT '标记es删除',
  `baidu_delete` tinyint(1) DEFAULT '0' COMMENT '标记baidu删除',
  PRIMARY KEY (`id`),
  KEY `index_project_change_records_on_project_id` (`project_id`),
  KEY `index_project_change_records_on_shard_and_id` (`shard`,`id`),
  KEY `index_project_change_records_on_baidu_opt` (`baidu_opt`),
  KEY `index_project_change_records_on_baidu_delete_and_id` (`baidu_delete`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=503812 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库变更记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_group_authorizations`
--

DROP TABLE IF EXISTS `project_group_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_group_authorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库组织授权表',
  `project_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `access_level` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_group_authorizations_on_project_id_and_group_id` (`project_id`,`group_id`),
  KEY `index_project_group_authorizations_on_project_id` (`project_id`),
  KEY `index_project_group_authorizations_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库组织授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_infos`
--

DROP TABLE IF EXISTS `project_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `contributors_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `repo_size` int(11) DEFAULT '0',
  `open_application` tinyint(1) DEFAULT '0',
  `pr_test_num` int(11) DEFAULT '0',
  `pr_assign_num` int(11) DEFAULT '0',
  `pr_master_only` int(11) DEFAULT '0',
  `online_edit_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `force_verify_apply` int(11) DEFAULT '0',
  `can_readonly` tinyint(1) DEFAULT '0',
  `drc_status` int(11) DEFAULT '0' COMMENT 'DRC导入状态',
  `readme_oid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'readme的oid',
  `readme_content` text COLLATE utf8mb4_unicode_ci COMMENT 'readme的内容',
  `commits_count` int(11) DEFAULT '0',
  `files_count` int(11) DEFAULT '0',
  `lightweight_pr_enabled` tinyint(1) DEFAULT '1',
  `security_hole_enabled` tinyint(1) DEFAULT '0',
  `gitee_scan_manual` tinyint(1) DEFAULT '0' COMMENT '仓库Gitee Scan 手动扫描开关',
  `forbid_md_catalog` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁止加载 README 的侧边目录',
  `gitee_reward_enabled` tinyint(1) DEFAULT '1' COMMENT '是否开启Gitee Reward',
  `pr_make_issue_complete` tinyint(1) DEFAULT '1' COMMENT '是否开启合并 pr 改变 issue 状态',
  `pr_api_review_num` int(11) DEFAULT '0' COMMENT '合并 PR 前API审核者需通过的票数(0：无设置，1：至少一人通过，-1：需全部API审核人员通过)',
  `webhooks_count` int(11) DEFAULT '50' COMMENT 'Webhook 数量上限',
  `latest_scan_id` int(11) DEFAULT '0' COMMENT '最近一次执行GiteeScan扫描的记录id',
  `gitee_reward_author_protection` tinyint(1) DEFAULT '1' COMMENT '开启Gitee Reward作者保护',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_infos_on_uniq_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127659 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_label_refs`
--

DROP TABLE IF EXISTS `project_label_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_label_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库标签中间表',
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `project_label_id` int(11) NOT NULL COMMENT '仓库话题标签id',
  `user_id` int(11) NOT NULL COMMENT '用户的id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_label_refs_on_project_id` (`project_id`),
  KEY `index_project_label_refs_on_project_label_id_and_created_at` (`project_label_id`,`created_at`),
  KEY `index_project_label_refs_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库标签中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_labels`
--

DROP TABLE IF EXISTS `project_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库标签表',
  `name` varchar(191) NOT NULL COMMENT '标签名',
  `related_name` varchar(191) NOT NULL COMMENT '联想展示的标签名（只有类型为同义词的标签related_name和name不同）',
  `author_id` int(11) NOT NULL COMMENT '创建者id',
  `ident` varchar(191) NOT NULL COMMENT 'url标识',
  `label_type` tinyint(4) DEFAULT '0' COMMENT '标签的类型（0:用户自定义、1:精选库、2:同义词）',
  `synonym_id` int(11) DEFAULT '0',
  `description` text COMMENT '描述',
  `display_description` tinyint(4) DEFAULT '0' COMMENT '是否展示标签描述（0:不展示、1：展示）',
  `block` tinyint(4) DEFAULT '0' COMMENT '屏蔽状态(0:不屏蔽， 1:屏蔽)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_labels_on_name` (`name`),
  KEY `index_project_labels_on_synonym_id` (`synonym_id`),
  KEY `index_project_labels_on_block` (`block`),
  KEY `index_project_labels_on_label_type` (`label_type`),
  KEY `index_project_labels_on_ident` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8 COMMENT='仓库标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_milestone_refs`
--

DROP TABLE IF EXISTS `project_milestone_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_milestone_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_milestone_refs_on_project_id_and_milestone_id` (`project_id`,`milestone_id`),
  KEY `index_project_milestone_refs_on_milestone_id` (`milestone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1595 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_mirror_sync_tasks`
--

DROP TABLE IF EXISTS `project_mirror_sync_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_mirror_sync_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库镜像任务表',
  `project_mirror_id` int(11) DEFAULT NULL,
  `sync_state` int(11) DEFAULT '0' COMMENT '同步状态',
  `error_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误信息',
  `requested_at` datetime DEFAULT NULL COMMENT '请求时间',
  `started_at` datetime DEFAULT NULL COMMENT '执行开始时间',
  `finished_at` datetime DEFAULT NULL COMMENT '执行结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `jid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sidekiq jid',
  `error_detail` text COLLATE utf8mb4_unicode_ci COMMENT '错误详情',
  PRIMARY KEY (`id`),
  KEY `index_project_mirror_sync_tasks_on_project_mirror_id` (`project_mirror_id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库镜像任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_mirrors`
--

DROP TABLE IF EXISTS `project_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库镜像表',
  `project_id` int(11) DEFAULT NULL,
  `repo_import_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库的import_url',
  `repo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库的path',
  `repo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库的name',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '私人密钥PAT',
  `mirror_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `webhook_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Webhook密钥',
  `auto_sync` tinyint(1) DEFAULT '0' COMMENT '自动同步, 默认：否',
  `first_webhook_trigger` tinyint(1) DEFAULT '0' COMMENT '首次webhook调用',
  PRIMARY KEY (`id`),
  KEY `index_project_mirrors_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库镜像表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_pr_assigns`
--

DROP TABLE IF EXISTS `project_pr_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_pr_assigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assign_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_pr_assigns_on_user_id` (`user_id`),
  KEY `index_project_pr_assigns_on_project_id_and_assign_type` (`project_id`,`assign_type`)
) ENGINE=InnoDB AUTO_INCREMENT=236011 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_radars`
--

DROP TABLE IF EXISTS `project_radars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_radars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `all_percent` float DEFAULT NULL,
  `influence` float DEFAULT NULL,
  `influence_percent` float DEFAULT NULL,
  `health` float DEFAULT NULL,
  `health_percent` float DEFAULT NULL,
  `vitality` float DEFAULT NULL,
  `vitality_percent` float DEFAULT NULL,
  `community` float DEFAULT NULL,
  `community_percent` float DEFAULT NULL,
  `trend` float DEFAULT NULL,
  `trend_percent` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `real_score` float DEFAULT '0' COMMENT '指数综合得分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_radars_on_project_id_and_version` (`project_id`,`version`),
  KEY `index_project_radars_on_all_percent` (`all_percent`),
  KEY `index_project_radars_on_version` (`version`),
  KEY `index_project_radars_on_real_score_and_version` (`real_score`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_statistics`
--

DROP TABLE IF EXISTS `project_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `create_issue_count` int(11) DEFAULT '0',
  `create_pr_count` int(11) DEFAULT '0',
  `create_milestone_count` int(11) DEFAULT '0',
  `close_issue_count` int(11) DEFAULT '0',
  `merge_pr_count` int(11) DEFAULT '0',
  `close_milestone_count` int(11) DEFAULT '0',
  `commit_count` int(11) DEFAULT '0',
  `code_line_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date` date NOT NULL,
  `close_pr_count` int(11) DEFAULT '0',
  `push_count` int(11) DEFAULT '0',
  `pull_count` int(11) DEFAULT '0',
  `fork_count` int(11) DEFAULT '0' COMMENT 'fork 统计',
  PRIMARY KEY (`id`),
  KEY `index_project_statistics_on_enterprise_id_and_project_id` (`enterprise_id`,`project_id`),
  KEY `index_project_statistics_on_project_id` (`project_id`),
  KEY `index_project_statistics_on_enterprise_id_and_date` (`enterprise_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=15127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_tag_refs`
--

DROP TABLE IF EXISTS `project_tag_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tag_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_tag_refs_on_p_t` (`project_id`,`project_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5942 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_tags`
--

DROP TABLE IF EXISTS `project_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ident` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `projects_count` int(11) DEFAULT '0',
  `codes_order` int(11) DEFAULT '1',
  `root_id` int(11) DEFAULT '0',
  `name_zh_tw` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '繁体中文名',
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '英文名',
  PRIMARY KEY (`id`),
  KEY `index_project_tags_on_parent_id` (`parent_id`),
  KEY `index_project_tags_on_ident` (`ident`),
  KEY `index_project_tags_on_name` (`name`),
  KEY `index_project_tags_on_parent_id_and_order` (`parent_id`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `homepage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `default_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issues_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `wiki_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `namespace_id` int(11) DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT '1',
  `issues_tracker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gitlab',
  `issues_tracker_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `root_id` int(11) DEFAULT NULL,
  `snippets_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `pull_requests_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_activity_at` datetime DEFAULT NULL,
  `stars_count` int(11) DEFAULT '0',
  `forks_count` int(11) DEFAULT '0',
  `recomm` int(11) DEFAULT '0',
  `recomm_at` datetime DEFAULT NULL,
  `lang_stats` text COLLATE utf8mb4_unicode_ci,
  `watches_count` int(11) DEFAULT '0',
  `domain_id` int(11) DEFAULT '0',
  `origin_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_push_at` datetime DEFAULT NULL,
  `can_send_email` tinyint(1) DEFAULT '1',
  `can_hook` tinyint(1) DEFAULT '0',
  `hook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hook_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `come_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bind_team` tinyint(1) DEFAULT '0',
  `paas_id` int(11) NOT NULL DEFAULT '0',
  `fork_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `import_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recomm_self` tinyint(1) DEFAULT '0',
  `svn_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `hook_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_comment` tinyint(1) DEFAULT '1',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `donate_status` int(11) DEFAULT NULL,
  `outsourced` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `vip` tinyint(1) DEFAULT '0',
  `license` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `redmine_project_id` int(11) DEFAULT NULL,
  `forbid_force_push` tinyint(1) DEFAULT '0',
  `forbid_force_sync` tinyint(1) DEFAULT '0',
  `storages` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sonar_service` int(11) DEFAULT '0' COMMENT 'sonar服务开关',
  `sonar_service_at` datetime DEFAULT NULL COMMENT 'sonar服务开启时间',
  `issue_comment` tinyint(1) DEFAULT '0',
  `giteego_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'giteego开通状态',
  `giteego_info` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'giteego 开通信息',
  `lightweight_pr_enabled` tinyint(1) DEFAULT '1',
  `template_id` int(11) DEFAULT NULL,
  `template_enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '仓库模板',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_projects_on_path_and_namespace_id` (`path`,`namespace_id`),
  KEY `index_projects_on_namespace_id` (`namespace_id`),
  KEY `index_projects_on_owner_id` (`creator_id`),
  KEY `index_projects_on_root_id` (`root_id`),
  KEY `index_projects_on_recomm_at` (`recomm_at`),
  KEY `index_projects_on_enterprise_id` (`enterprise_id`),
  KEY `index_projects_on_license_stars_count` (`parent_id`,`public`,`license`,`stars_count`),
  KEY `index_projects_on_license_last_push_at` (`parent_id`,`public`,`license`,`last_push_at`),
  KEY `index_projects_on_parent_id_and_public_and_recomm_and_recomm_at` (`parent_id`,`public`,`recomm`,`recomm_at`),
  KEY `index_projects_on_parent_id_and_public_and_stars_count` (`parent_id`,`public`,`stars_count`),
  KEY `index_projects_on_parent_public_lang_license_stars` (`parent_id`,`public`,`lang_id`,`license`,`stars_count`),
  KEY `index_projects_on_parent_id_and_public_and_last_push_at` (`parent_id`,`public`,`last_push_at`),
  KEY `index_projects_on_parent_public_lang_license_push` (`parent_id`,`public`,`lang_id`,`license`,`last_push_at`),
  KEY `index_projects_on_parent_public_lang_stars` (`parent_id`,`public`,`lang_id`,`stars_count`),
  KEY `index_projects_on_parent_public_lang_push` (`parent_id`,`public`,`lang_id`,`last_push_at`),
  KEY `index_projects_on_recomm_self_and_updated_at` (`recomm_self`,`updated_at`),
  KEY `index_projects_on_donate_status_and_updated_at` (`donate_status`,`updated_at`),
  KEY `index_projects_on_created_at_and_parent_id` (`created_at`,`parent_id`),
  KEY `index_projects_on_redmine_project_id` (`redmine_project_id`),
  KEY `index_projects_on_come_from` (`come_from`),
  KEY `index_projects_on_import_url` (`import_url`(191)),
  KEY `index_projects_on_sonar_service` (`sonar_service`),
  KEY `index_projects_on_updated_at` (`updated_at`),
  KEY `index_projects_on_public_and_status` (`public`,`status`),
  KEY `index_projects_on_enterprise_id_and_status` (`enterprise_id`,`status`),
  KEY `t` (`namespace_id`,`created_at`),
  KEY `index_projects_on_namespace_id_and_created_at` (`namespace_id`,`created_at`),
  KEY `index_projects_on_disk_path` (`disk_path`(78))
) ENGINE=InnoDB AUTO_INCREMENT=10456037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `way` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_count` int(11) DEFAULT '1',
  `give_amount` int(11) DEFAULT '0',
  `give_enterprise_id` int(11) DEFAULT '0',
  `order_type` int(11) DEFAULT '65535',
  `creator_id` int(11) DEFAULT NULL,
  `sys` int(11) DEFAULT '0',
  `commerce_level_int` int(11) DEFAULT '65535',
  `activity_wallet_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动红包外键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_promotions_on_code_and_order_id_and_state` (`code`,`order_id`,`state`),
  KEY `index_promotions_on_user_id` (`user_id`),
  KEY `index_promotions_on_give_state_stop` (`give_enterprise_id`,`state`,`stop_at`),
  KEY `index_promotions_on_state_and_stop_at` (`state`,`stop_at`)
) ENGINE=InnoDB AUTO_INCREMENT=91814 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protected_branches`
--

DROP TABLE IF EXISTS `protected_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `branch_type` int(11) NOT NULL DEFAULT '0',
  `mode` int(11) DEFAULT '0' COMMENT '分支模式（0：标准模式，1：评审模式）',
  PRIMARY KEY (`id`),
  KEY `index_protected_branches_on_pid_name` (`project_id`,`name`),
  KEY `index_protected_branches_on_pid_type_name` (`project_id`,`branch_type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=104746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protection_rules`
--

DROP TABLE IF EXISTS `protection_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protection_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `wildcard` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pusher` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '可推送代码人员',
  `merger` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '可合并代码人员',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mode` int(11) DEFAULT '0' COMMENT '模式（0：标准模式，1：评审模式）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_assigns`
--

DROP TABLE IF EXISTS `pull_request_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_assigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pull_request_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assign_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pull_request_assigns_on_pr_id_user_id_assign_type` (`pull_request_id`,`user_id`,`assign_type`),
  KEY `index_pull_request_assigns_on_user_id_and_assign_type` (`user_id`,`assign_type`),
  KEY `index_pull_request_assigns_on_user_id_and_pull_request_id` (`user_id`,`pull_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7998 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_infos`
--

DROP TABLE IF EXISTS `pull_request_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pull_request_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `st_commits` longtext COLLATE utf8_unicode_ci,
  `st_diffs` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'diffs 状态: [:empty, :collected, :overflow]',
  `base_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'merge base commit sha',
  `start_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'start commit sha',
  `head_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'head commit sha',
  `commits_count` int(11) DEFAULT NULL COMMENT 'commits 数',
  `real_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'diff files 数量',
  `viewed_diff_files` text COLLATE utf8_unicode_ci COMMENT 'PR 的改动文件标阅状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_infos_on_uniq_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3348 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_reviews`
--

DROP TABLE IF EXISTS `pull_request_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PR 评审',
  `note_root_id` int(11) NOT NULL COMMENT '评论root id',
  `author_id` int(11) NOT NULL COMMENT '评审者 id',
  `pull_request_id` int(11) NOT NULL COMMENT 'PR id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态(0:待提交,1:发布评论,2:发布评论并通过,3:发布评审,4:历史评审)',
  `pass_option` tinyint(4) DEFAULT NULL COMMENT '通过选项(1:全部通过，2:审查通过，3:测试通过)',
  `commit_date` datetime DEFAULT NULL COMMENT '提交时间',
  `recheck` tinyint(1) DEFAULT '0' COMMENT '请求重新检查',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='PR 评审';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_requests`
--

DROP TABLE IF EXISTS `pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `target_branch` varchar(191) NOT NULL COMMENT '目标分支',
  `source_repo` int(11) NOT NULL COMMENT '源仓库',
  `source_branch` varchar(191) NOT NULL COMMENT '源分支名',
  `author_id` int(11) DEFAULT NULL COMMENT 'PR 创建者 id',
  `assignee_id` int(11) DEFAULT '0' COMMENT '冗余',
  `title` varchar(255) DEFAULT NULL COMMENT 'PR 标题',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `milestone_id` int(11) DEFAULT '0' COMMENT '里程碑 id',
  `state` varchar(191) DEFAULT NULL COMMENT 'PR 状态（打开/重新打开/合并/关闭）',
  `merge_status` varchar(255) DEFAULT NULL COMMENT 'PR 能否被合并（unchecked/can_be_merged/cannot_be_merged）',
  `iid` int(11) DEFAULT NULL COMMENT '仓库 PR 编号',
  `prune_branch` tinyint(1) DEFAULT '0' COMMENT '合并后是否删除提交分支',
  `merge_commit_sha` varchar(255) DEFAULT NULL COMMENT '合并产生的 commit id',
  `updated_by_id` int(11) DEFAULT NULL COMMENT 'PR 更新者 id',
  `tester_id` int(11) DEFAULT '0' COMMENT '冗余',
  `closed_at` datetime DEFAULT NULL COMMENT '关闭时间',
  `noteable_count` int(11) DEFAULT '0' COMMENT '评论数',
  `check_state` int(11) DEFAULT NULL COMMENT '审查状态',
  `test_state` int(11) DEFAULT NULL COMMENT '测试状态',
  `close_related_issue` int(11) DEFAULT '1' COMMENT '合并后是否关闭关联任务',
  `priority` int(11) DEFAULT '0' COMMENT '优先级',
  `lightweight` tinyint(1) DEFAULT '0',
  `pr_assign_num` int(11) DEFAULT '0' COMMENT '最少审查人数',
  `pr_test_num` int(11) DEFAULT '0' COMMENT '最少测试人数',
  `multiple` int(11) DEFAULT '0',
  `api_review_state` int(11) DEFAULT NULL COMMENT 'API变更审核状态',
  `api_reviewer_id` int(11) DEFAULT NULL COMMENT '冗余',
  `pr_api_review_num` int(11) DEFAULT '0' COMMENT '最少API变更审核人数',
  `latest_scan_id` int(11) DEFAULT '0' COMMENT '最近一次执行GiteeScan扫描的记录id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pull_requests_on_project_id_and_iid` (`project_id`,`iid`),
  KEY `index_pull_requests_on_source_repo_and_source_branch` (`source_repo`,`source_branch`),
  KEY `index_pr_on_milestone_and_state` (`milestone_id`,`state`),
  KEY `index_projects_on_pid_state_tb` (`project_id`,`state`,`target_branch`),
  KEY `index_pull_requests_on_source_repo_and_state_and_source_branch` (`source_repo`,`state`,`source_branch`),
  KEY `index_pull_requests_on_tester_id` (`tester_id`),
  KEY `index_pull_requests_on_project_id_and_created_at` (`project_id`,`created_at`),
  KEY `index_pull_requests_on_created_at` (`created_at`),
  KEY `index_pull_requests_on_project_id_and_milestone_id` (`project_id`,`milestone_id`),
  KEY `index_pull_requests_on_project_id_and_author_id` (`project_id`,`author_id`),
  KEY `index_pull_requests_on_enterprise_id_and_project_id` (`enterprise_id`,`project_id`),
  KEY `index_pull_requests_on_enterprise_id_and_state_and_project_id` (`enterprise_id`,`state`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2933 DEFAULT CHARSET=utf8mb4 COMMENT='PR 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaire_items`
--

DROP TABLE IF EXISTS `questionnaire_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL COMMENT '问卷id',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题描述',
  `required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必填',
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题类型',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '问题备注',
  `answer_options` text COLLATE utf8mb4_unicode_ci COMMENT '问题选项JSON字符串',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questionnaire_items_on_questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaire_results`
--

DROP TABLE IF EXISTS `questionnaire_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL COMMENT '问卷ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '填问卷用户',
  `item_id` int(11) NOT NULL COMMENT '问题条目ID',
  `item_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题描述',
  `answer_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案描述',
  `answer_idents` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案标识集合',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questionnaire_results_on_questionnaire_id` (`questionnaire_id`),
  KEY `index_questionnaire_results_on_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaires`
--

DROP TABLE IF EXISTS `questionnaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问卷标题',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态(发布、下架)',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questionnaires_on_user_id` (`user_id`),
  KEY `index_questionnaires_on_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_change_logs`
--

DROP TABLE IF EXISTS `quota_change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_change_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `namespace_id` int(11) NOT NULL DEFAULT '0' COMMENT '命名空间ID',
  `target_id` int(11) NOT NULL COMMENT '触发对象ID',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发对象类型',
  `quantity` bigint(20) NOT NULL COMMENT '数量[由于可能有不同类型不同精度所以选择string]',
  `quota_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '额度类型',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水编号',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_minus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否欠费',
  `minus_quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '欠费数量',
  PRIMARY KEY (`id`),
  KEY `index_quota_change_logs_on_enterprise_id` (`enterprise_id`),
  KEY `index_quota_change_logs_on_namespace_id` (`namespace_id`),
  KEY `index_quota_change_logs_on_number` (`number`),
  KEY `index_quota_change_logs_on_is_minus` (`is_minus`),
  KEY `index_quota_change_logs_on_target` (`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=25008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_commerces`
--

DROP TABLE IF EXISTS `quota_commerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_commerces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'active',
  `quota_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quota_quantity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_quota_commerces_on_name_quan_stat_type` (`quota_name`(50),`quota_quantity`,`state`(20),`type`(20))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表态内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Note' COMMENT '所属类型(Note/PullRequest/Issue)',
  `target_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reactions_on_user_id` (`user_id`),
  KEY `index_reactions_on_target_id_and_target_type` (`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `readonly_items`
--

DROP TABLE IF EXISTS `readonly_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readonly_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_readonly_items_on_project_id_and_branch_and_path` (`project_id`,`branch`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `author_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `tag_version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签',
  `release_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '是否预览版',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标（分支/commit）',
  PRIMARY KEY (`id`),
  KEY `index_releases_on_project_id` (`project_id`),
  KEY `index_releases_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_event_refs`
--

DROP TABLE IF EXISTS `report_event_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_report_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_issue_refs`
--

DROP TABLE IF EXISTS `report_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_report_id` int(11) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_report_issue_refs_on_week_report_id_and_issue_id` (`week_report_id`,`issue_id`),
  KEY `index_report_issue_refs_on_issue_id` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_pr_refs`
--

DROP TABLE IF EXISTS `report_pr_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_pr_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_report_id` int(11) DEFAULT NULL,
  `pull_request_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_report_pr_refs_on_week_report_id_and_pull_request_id` (`week_report_id`,`pull_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_statistics`
--

DROP TABLE IF EXISTS `resource_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL,
  `create_user_count` int(11) DEFAULT '0',
  `create_project_count` int(11) DEFAULT '0',
  `create_group_count` int(11) DEFAULT '0',
  `date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resource_statistics_on_enterprise_id_and_date` (`enterprise_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_templates`
--

DROP TABLE IF EXISTS `search_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模版名称',
  `info` text COLLATE utf8_unicode_ci COMMENT '搜索条件json串',
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '搜索主体',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `program_id` int(11) DEFAULT '0' COMMENT '项目ID',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_search_templates_on_program_id` (`program_id`),
  KEY `user_en_program_updated_index` (`user_id`,`enterprise_id`,`program_id`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `securities`
--

DROP TABLE IF EXISTS `securities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL,
  `level` int(11) DEFAULT '1',
  `security_type` int(11) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  `recipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_securities_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortened_urls`
--

DROP TABLE IF EXISTS `shortened_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortened_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `unique_key` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_count` int(11) NOT NULL DEFAULT '0',
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_shortened_urls_on_unique_key` (`unique_key`),
  KEY `index_shortened_urls_on_owner_id_and_owner_type` (`owner_id`,`owner_type`),
  KEY `index_shortened_urls_on_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snippets`
--

DROP TABLE IF EXISTS `snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `author_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_snippets_on_project_id` (`project_id`),
  KEY `index_snippets_on_created_at` (`created_at`),
  KEY `index_snippets_on_expires_at` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sonar_summaries`
--

DROP TABLE IF EXISTS `sonar_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sonar_summaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `code_line` int(11) DEFAULT NULL,
  `total_line` int(11) DEFAULT NULL,
  `statement` int(11) DEFAULT NULL,
  `file` int(11) DEFAULT NULL,
  `directory` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `web_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sonar_status` int(11) DEFAULT NULL,
  `error` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `done_commit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `done_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'master',
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'sonar',
  `task_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'sonar',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pull_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sonar_summaries_on_project_id_and_type` (`project_id`,`type`),
  KEY `index_sonar_summaries_on_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star_collection_endorses`
--

DROP TABLE IF EXISTS `star_collection_endorses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_collection_endorses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '星选集 Star 表',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `star_collection_id` int(11) NOT NULL COMMENT '星选集id',
  `is_increase` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否新增Star',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 -1 删除 0 私有 1 公开 ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_star_collection_endorses_on_user_id_and_star_collection_id` (`user_id`,`star_collection_id`),
  KEY `index_star_collection_endorses_on_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='星选集 Star 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star_collection_refs`
--

DROP TABLE IF EXISTS `star_collection_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_collection_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'star 与 星选集关联表',
  `star_id` int(11) NOT NULL COMMENT 'star id',
  `star_collection_id` int(11) NOT NULL COMMENT '星选集id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_star_collection_refs_on_star_id_and_star_collection_id` (`star_id`,`star_collection_id`),
  KEY `index_star_collection_refs_on_project_id` (`project_id`),
  KEY `star_collection_refs_star_collection_id_index` (`star_collection_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='star 与 星选集关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star_collections`
--

DROP TABLE IF EXISTS `star_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '星选集 表',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 -1 删除 0 私有 1 公开 ',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `stars_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Star 数量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_star_collections_on_user_id_and_name` (`user_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='星选集 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_stars_on_creator_id_and_project_id_and_code_id` (`creator_id`,`project_id`,`code_id`),
  KEY `index_stars_on_created_at` (`created_at`),
  KEY `index_stars_on_project_id` (`project_id`),
  KEY `index_stars_on_code_id` (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3790 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subgroups`
--

DROP TABLE IF EXISTS `subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `creator_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_subgroups_on_enterprise_id_and_type` (`enterprise_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_award_logs`
--

DROP TABLE IF EXISTS `system_award_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_award_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作者id（谁赠送的）',
  `target_id` int(11) NOT NULL COMMENT '接受者id(送给谁)',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接受者类型',
  `award_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '赠送数量',
  `award_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '赠送类型',
  `award_unit` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '赠送单位',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注、原因',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `award_index` int(11) NOT NULL DEFAULT '1' COMMENT '赠送序号',
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理人员备注',
  `category` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user_apply' COMMENT '类别',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_target_award_index_uniqe` (`target_type`,`target_id`,`award_index`),
  KEY `index_system_award_logs_on_user_id` (`user_id`),
  KEY `index_system_award_logs_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_system_award_logs_on_is_expired` (`is_expired`),
  KEY `index_system_award_logs_on_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签 id',
  `taggable_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `tagger_id` int(11) DEFAULT NULL COMMENT '标记者 id',
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记类型',
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型（tags/gvp）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`),
  KEY `index_taggings_on_tager` (`tagger_type`,`tagger_id`,`taggable_type`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `taggings_count` int(11) DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_assignments`
--

DROP TABLE IF EXISTS `task_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetable_id` int(11) DEFAULT NULL,
  `targetable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignmentable_id` int(11) DEFAULT NULL,
  `assignmentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `operated_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_of_task_assignment` (`assignmentable_id`,`assignmentable_type`,`targetable_id`,`targetable_type`,`task_type`),
  KEY `index_task_assignments_on_target` (`targetable_id`,`targetable_type`,`task_type`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `texts`
--

DROP TABLE IF EXISTS `texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT '0',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `text` text COLLATE utf8_unicode_ci,
  `scoped` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_texts_on_target_id_and_target_type` (`target_id`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `hot_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_lang_category` (`language_id`,`category_id`,`hot`,`target_type`)
) ENGINE=InnoDB AUTO_INCREMENT=26954 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tour_histories`
--

DROP TABLE IF EXISTS `tour_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `touch_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tour_histories_on_user_id_and_tour_id_and_touch_count` (`user_id`,`tour_id`,`touch_count`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tour_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `simple_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tours_on_name` (`name`),
  KEY `index_tours_on_controller_path_and_action_name_and_published` (`controller_path`,`action_name`,`published`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_confirms`
--

DROP TABLE IF EXISTS `transfer_confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_confirms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver_user_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transfer_confirms_on_user_id` (`user_id`),
  KEY `index_transfer_confirms_on_receiver_user_id` (`receiver_user_id`),
  KEY `index_transfer_confirms_on_target_type` (`target_type`),
  KEY `index_transfer_confirms_on_target_id` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_infos`
--

DROP TABLE IF EXISTS `u_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `wechat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信',
  `weibo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微博',
  `blog` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '博客地址',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload_assets`
--

DROP TABLE IF EXISTS `upload_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传资源记录',
  `user_id` int(11) DEFAULT NULL COMMENT '上传人',
  `asset_type` tinyint(4) DEFAULT NULL COMMENT '资源类型（图片，视频等）',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url路径',
  `storage_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '磁盘路径',
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上传来源',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_upload_assets_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='上传资源记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `default_address` tinyint(1) DEFAULT '0',
  `drc_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'DRC唯一id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_addresses_on_drc_id` (`drc_id`),
  KEY `index_user_addresses_on_user_id` (`user_id`),
  KEY `index_user_addresses_on_enterprise_id` (`enterprise_id`),
  KEY `index_user_addresses_on_tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_change_records`
--

DROP TABLE IF EXISTS `user_change_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_change_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `action` int(11) DEFAULT '1' COMMENT '动作',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fields` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_user_change_records_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114704 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户变更记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_feature_records`
--

DROP TABLE IF EXISTS `user_feature_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feature_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `feature_log_id` int(11) DEFAULT NULL,
  `slide_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_feature_records_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_file_collections`
--

DROP TABLE IF EXISTS `user_file_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_file_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL COMMENT '文件 id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_file_collections_on_enterprise_id_and_user_id` (`enterprise_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户收藏文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户 ID',
  `oauth_scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户第三方应用授权权限',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `drc_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'DRC唯一id',
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司',
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '职业',
  `specialty` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '特长',
  `wechat` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信',
  `qq` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'QQ',
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '领英',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `role_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否海外用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_infos_on_user_id` (`user_id`),
  UNIQUE KEY `index_user_infos_on_drc_id` (`drc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `content` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `message_type` int(11) DEFAULT '0',
  `read` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_msg_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会话key',
  `user_id` int(11) DEFAULT NULL COMMENT '私信所属用户',
  `parent_id` int(11) DEFAULT '0' COMMENT '父消息id',
  `read_at` datetime DEFAULT NULL COMMENT '消息被读取的时间',
  `state` tinyint(4) DEFAULT '0' COMMENT '为以后撤回或软删除预留',
  PRIMARY KEY (`id`),
  KEY `index_user_messages_on_from_user_id` (`from_user_id`),
  KEY `index_user_messages_on_to_user_id` (`to_user_id`),
  KEY `index_user_messages_on_read` (`read`),
  KEY `index_user_messages_on_message_type` (`message_type`),
  KEY `index_user_messages_on_user_msg_name` (`user_msg_name`),
  KEY `index_user_messages_on_user_id_and_user_msg_name` (`user_id`,`user_msg_name`),
  KEY `index_user_messages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notification_settings`
--

DROP TABLE IF EXISTS `user_notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `way_of_notice` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_notification_settings_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属（UserMessage/Project/NotifyMessage等）',
  `target_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属 id',
  `project_id` int(11) NOT NULL,
  `participating` tinyint(1) DEFAULT '0',
  `read` tinyint(1) DEFAULT '0',
  `mute` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `noti_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '冗余',
  PRIMARY KEY (`id`),
  KEY `index_user_notifications_on_project_id` (`project_id`),
  KEY `index_user_notifications_on_target_type` (`target_type`),
  KEY `index_user_notifications_on_target_id` (`target_id`),
  KEY `index_user_notifications_on_user_id_and_read` (`user_id`,`read`),
  KEY `index_user_notifications_on_actor_id` (`actor_id`),
  KEY `index_user_notifications_on_target_and_user` (`target_type`,`target_id`,`user_id`),
  KEY `index_user_notifications_on_created_at` (`created_at`),
  KEY `index_user_notifications_on_read_and_updated_at` (`read`,`updated_at`),
  KEY `index_user_notifications_on_user_id_and_read_and_updated_at` (`user_id`,`read`,`updated_at`),
  KEY `index_user_notifications_on_user_type_read_updated` (`user_id`,`noti_type`,`read`,`updated_at`),
  KEY `index_user_noti_on_user_id_noti_type_read_updated_at_project_id` (`user_id`,`noti_type`,`read`,`updated_at`,`project_id`),
  KEY `index_user_notifications_on_user_id_and_updated_at` (`user_id`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=688073 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_powers`
--

DROP TABLE IF EXISTS `user_powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_powers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_push_at` datetime DEFAULT NULL,
  `holiday_count` int(11) DEFAULT NULL,
  `start_count` int(11) DEFAULT NULL,
  `watch_count` int(11) DEFAULT NULL,
  `fork_count` int(11) DEFAULT NULL,
  `longest_streak` int(11) DEFAULT NULL,
  `create_issue_count` int(11) DEFAULT NULL,
  `close_issue_count` int(11) DEFAULT NULL,
  `recommend_count` int(11) DEFAULT NULL,
  `donates_count` int(11) DEFAULT NULL,
  `contributions_count` int(11) DEFAULT NULL,
  `horse_power` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `year` int(11) DEFAULT '2016',
  `k_star_count` int(11) DEFAULT NULL,
  `gvp_count` int(11) DEFAULT NULL,
  `get_start_count` int(11) DEFAULT NULL,
  `get_fork_count` int(11) DEFAULT NULL,
  `get_watch_count` int(11) DEFAULT NULL,
  `top_2_p_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_count` int(11) DEFAULT NULL,
  `push_count` int(11) DEFAULT NULL,
  `push_public_count` int(11) DEFAULT NULL,
  `public_issue_count` int(11) DEFAULT NULL,
  `public_note_count` int(11) DEFAULT NULL,
  `favorite_language_id` int(11) DEFAULT NULL,
  `ot_count` int(11) DEFAULT NULL,
  `contributions_project_count` int(11) DEFAULT NULL,
  `contributions_issue_count` int(11) DEFAULT NULL,
  `contributions_pull_request_count` int(11) DEFAULT NULL,
  `max_season` int(11) DEFAULT NULL,
  `max_season_percent` int(11) DEFAULT NULL,
  `push_count_percent` int(11) DEFAULT NULL,
  `push_type` int(11) DEFAULT NULL,
  `user_watches_count` int(11) DEFAULT NULL,
  `user_follows_count` int(11) DEFAULT NULL,
  `first_star_project_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_follow_openharmony` int(11) DEFAULT NULL,
  `is_star_openharmony` int(11) DEFAULT NULL,
  `is_watch_openharmony` int(11) DEFAULT NULL,
  `is_star_open_guide` int(11) DEFAULT NULL,
  `is_watch_open_guide` int(11) DEFAULT NULL,
  `public_not_fork_push_gvp_count` int(11) DEFAULT NULL,
  `public_not_fork_issue_gvp_count` int(11) DEFAULT NULL,
  `public_not_fork_pr_gvp_count` int(11) DEFAULT NULL,
  `public_not_fork_push_count` int(11) DEFAULT NULL,
  `public_not_fork_issue_count` int(11) DEFAULT NULL,
  `public_not_fork_pr_count` int(11) DEFAULT NULL,
  `contribute_type` int(11) DEFAULT NULL,
  `in_gvp_ids_string` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_not_fork_project_count` int(11) DEFAULT NULL,
  `maintain_gvp_contributor_count` int(11) DEFAULT NULL,
  `maintain_star_user_count` int(11) DEFAULT NULL,
  `maintain_star_count` int(11) DEFAULT NULL,
  `maintain_recomm_count` int(11) DEFAULT NULL,
  `maintain_gvp_count` int(11) DEFAULT NULL,
  `maintain_contribute_event_count` int(11) DEFAULT NULL,
  `final_openharmony_time` datetime DEFAULT NULL,
  `final_open_guide_time` datetime DEFAULT NULL,
  `maintain_gvp_ids_string` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_powers_on_user_id_and_year` (`user_id`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_remarks`
--

DROP TABLE IF EXISTS `user_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '创建者',
  `target_id` int(11) DEFAULT NULL COMMENT '目标用户',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_remarks_on_user_id_and_target_id` (`user_id`,`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_statistics`
--

DROP TABLE IF EXISTS `user_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `close_issue_count` int(11) DEFAULT '0',
  `commit_count` int(11) DEFAULT '0',
  `review_pr_count` int(11) DEFAULT '0',
  `date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `test_pr_count` int(11) DEFAULT '0',
  `create_issue_count` int(11) DEFAULT '0',
  `create_pr_count` int(11) DEFAULT '0',
  `merge_pr_count` int(11) DEFAULT '0',
  `add_code_line` int(11) DEFAULT '0',
  `remove_code_line` int(11) DEFAULT '0',
  `fork_count` int(11) DEFAULT '0' COMMENT 'fork 统计',
  `star_count` int(11) DEFAULT '0' COMMENT 'Star 统计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_statistics_on_p_d_u_e` (`project_id`,`date`,`user_id`,`enterprise_id`),
  KEY `en_user_project_date_index` (`enterprise_id`,`user_id`,`project_id`,`date`),
  KEY `index_user_statistics_on_project_id_and_user_id` (`project_id`,`user_id`),
  KEY `index_user_statistics_on_e_date` (`enterprise_id`,`date`),
  KEY `index_user_statistics_on_p_e_date` (`project_id`,`enterprise_id`,`date`),
  KEY `index_user_statistics_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7968 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_team_project_relationships`
--

DROP TABLE IF EXISTS `user_team_project_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team_project_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_team_id` int(11) DEFAULT NULL,
  `greatest_access` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_team_project_relationships_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_team_user_relationships`
--

DROP TABLE IF EXISTS `user_team_user_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team_user_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_team_id` int(11) DEFAULT NULL,
  `group_admin` tinyint(1) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_teams`
--

DROP TABLE IF EXISTS `user_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_user_teams_on_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` text COLLATE utf8_unicode_ci,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_expires_in` datetime DEFAULT NULL,
  `refresh_token_expires_in` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_tokens_on_user_id_and_platform` (`user_id`,`platform`),
  KEY `index_user_tokens_on_token` (`token`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useragents`
--

DROP TABLE IF EXISTS `useragents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useragents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(6553) COLLATE utf8_unicode_ci NOT NULL COMMENT 'value of user agent',
  `sha` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sha of value',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_useragents_on_sha` (`sha`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user agents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `projects_limit` int(11) DEFAULT '1000',
  `authentication_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int(11) NOT NULL DEFAULT '1',
  `bio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `locked_at` datetime DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_create_group` tinyint(1) NOT NULL DEFAULT '1',
  `can_create_team` tinyint(1) NOT NULL DEFAULT '1',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_scheme_id` int(11) NOT NULL DEFAULT '1',
  `weibo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portrait` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_level` int(11) NOT NULL DEFAULT '3',
  `is_changed_username` tinyint(1) DEFAULT NULL,
  `confirmation_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `private_count` int(11) DEFAULT '1000',
  `from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain_id` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '0',
  `inviter_id` int(11) DEFAULT '0',
  `invite_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bae_services` mediumtext COLLATE utf8mb4_unicode_ci,
  `unconfirmed_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forced_out` tinyint(1) DEFAULT '0',
  `oscid` int(11) DEFAULT NULL,
  `osc_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coin` int(11) DEFAULT '0',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `donate_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT '0',
  `redmine_user_id` int(11) DEFAULT NULL,
  `public_info` int(11) NOT NULL DEFAULT '6',
  `activate_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extern_uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth2_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  KEY `index_users_on_admin` (`admin`),
  KEY `index_users_on_name` (`name`),
  KEY `index_users_on_username` (`username`),
  KEY `index_users_on_invite_token` (`invite_token`),
  KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `index_users_on_unconfirmed_email` (`unconfirmed_email`),
  KEY `index_users_on_oscid` (`oscid`),
  KEY `index_users_on_enterprise_id` (`enterprise_id`),
  KEY `index_users_on_redmine_user_id` (`redmine_user_id`),
  KEY `index_users_on_state` (`state`),
  KEY `index_users_on_last_sign_in_ip` (`last_sign_in_ip`),
  KEY `index_users_on_current_sign_in_ip` (`current_sign_in_ip`),
  KEY `index_users_on_current_sign_in_at` (`current_sign_in_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_projects`
--

DROP TABLE IF EXISTS `users_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project_access` int(11) NOT NULL DEFAULT '0',
  `redmine_member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_projects_on_project_id_and_project_access` (`project_id`,`project_access`),
  KEY `index_users_projects_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_users_projects_on_redmine_member_id` (`redmine_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132013 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor_logs`
--

DROP TABLE IF EXISTS `visitor_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '被访问的用户',
  `visitor_id` int(11) DEFAULT NULL COMMENT '访问者',
  `visit_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `visit_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '访问页面url',
  `visit_at` datetime DEFAULT NULL COMMENT '访问时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_visitor_logs_on_user_id` (`user_id`),
  KEY `index_visitor_logs_on_visitor_id` (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_withdraws`
--

DROP TABLE IF EXISTS `wallet_withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `commerce_order_id` int(11) DEFAULT NULL,
  `commerce_id` int(11) DEFAULT NULL,
  `income_amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applied_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_wallet_withdraws_on_commerce_order_id` (`commerce_order_id`),
  KEY `index_wallet_withdraws_on_user_id_and_commerce_order_id` (`user_id`,`commerce_order_id`),
  KEY `index_wallet_withdraws_on_promotion_id` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `self_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `watch_type` int(11) DEFAULT '0' COMMENT '关注策略类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_watches_on_self_id_and_project_id` (`self_id`,`project_id`),
  KEY `index_watches_on_project_id` (`project_id`),
  KEY `index_watches_on_created_at_and_project_id` (`created_at`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140671 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_hook_logs`
--

DROP TABLE IF EXISTS `web_hook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_hook_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_hook_id` int(11) NOT NULL COMMENT 'Webhook ID (外键)',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_headers` text COLLATE utf8mb4_unicode_ci,
  `request_payload` mediumtext COLLATE utf8mb4_unicode_ci,
  `response_headers` text COLLATE utf8mb4_unicode_ci,
  `response_body` text COLLATE utf8mb4_unicode_ci,
  `response_status` int(11) DEFAULT NULL COMMENT '响应状态码',
  `duration` float DEFAULT NULL COMMENT '请求完成时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `encryption_type` int(11) DEFAULT NULL COMMENT '加密方式',
  `send_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_web_hook_logs_on_web_hook_id_and_created_at` (`web_hook_id`,`created_at`),
  KEY `index_web_hook_logs_on_web_hook_id_and_updated_at` (`web_hook_id`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=26769 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Webhook 日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_hooks`
--

DROP TABLE IF EXISTS `web_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_hooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` text COLLATE utf8mb4_unicode_ci,
  `result_code` int(11) DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci,
  `push_events` tinyint(1) DEFAULT '1',
  `tag_push_events` tinyint(1) DEFAULT '0',
  `issues_events` tinyint(1) DEFAULT '0',
  `note_events` tinyint(1) DEFAULT '0',
  `merge_requests_events` tinyint(1) DEFAULT '0',
  `data_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `service` tinyint(1) DEFAULT '0',
  `properties` text COLLATE utf8mb4_unicode_ci,
  `encryption_type` int(11) DEFAULT '0' COMMENT '加密方式',
  `program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_web_hooks_on_project_id` (`project_id`),
  KEY `index_web_hooks_on_enterprise_id` (`enterprise_id`),
  KEY `index_web_hooks_on_program_id` (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16912 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `week_report_templates`
--

DROP TABLE IF EXISTS `week_report_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_report_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '所属企业',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否是默认模板',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模板名',
  `content` text COLLATE utf8_unicode_ci COMMENT '模板内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_week_report_templates_on_enterprise_id_and_is_default` (`enterprise_id`,`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=534 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `week_reports`
--

DROP TABLE IF EXISTS `week_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week_index` int(11) DEFAULT NULL,
  `week_begin` date DEFAULT NULL,
  `week_end` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_on_user_id_enterprise_id_year_week_index` (`enterprise_id`,`user_id`,`year`,`week_index`),
  KEY `index_week_reports_on_enterprise_id_and_year_and_week_index` (`enterprise_id`,`year`,`week_index`),
  KEY `index_week_reports_on_user_id_and_week` (`user_id`,`year`,`week_index`),
  KEY `index_week_reports_on_enterprise_id_and_week_index` (`enterprise_id`,`week_index`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weeklies`
--

DROP TABLE IF EXISTS `weeklies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weeklies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `html_content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_data`
--

DROP TABLE IF EXISTS `wiki_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_sort_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wiki_data_on_wiki_sort_id` (`wiki_sort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_infos`
--

DROP TABLE IF EXISTS `wiki_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专属地址',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `creator_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `group_id` int(11) DEFAULT '0',
  `subgroup_id` int(11) DEFAULT '0',
  `project_id` int(11) DEFAULT '0',
  `last_updated_at` datetime DEFAULT NULL,
  `public` int(11) DEFAULT '0',
  `storages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机器 ip',
  `disk_path` varchar(540) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '仓库路径',
  `program_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_wiki_infos_on_enterprise_id_and_path_and_project_id` (`enterprise_id`,`path`,`project_id`),
  KEY `index_wiki_infos_on_enterprise_id_path_name` (`enterprise_id`,`path`,`name`),
  KEY `index_wiki_infos_on_project_id_group_id` (`enterprise_id`,`project_id`,`group_id`),
  KEY `index_wiki_infos_on_project_id_and_enterprise_id` (`project_id`,`enterprise_id`),
  KEY `index_wiki_infos_on_group_id_and_enterprise_id` (`group_id`,`enterprise_id`),
  KEY `index_wiki_infos_on_program_id` (`program_id`),
  KEY `index_wiki_infos_on_disk_path` (`disk_path`(78))
) ENGINE=InnoDB AUTO_INCREMENT=3059 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_logs`
--

DROP TABLE IF EXISTS `wiki_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `wiki_message` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_level` int(11) DEFAULT '10',
  `parent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wiki_logs_on_p_id_and_title_and_parent` (`project_id`,`title`,`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_sorts`
--

DROP TABLE IF EXISTS `wiki_sorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_sorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名称',
  `wiki_id` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `editing_user_id` int(11) DEFAULT '0',
  `last_edit_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `editor_id` int(11) DEFAULT '0',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_level` int(11) DEFAULT '0',
  `info_id` int(11) DEFAULT NULL COMMENT 'wiki_info id',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建者ID',
  `file_type` int(11) DEFAULT '0' COMMENT '文件类型 0未知 1文件 2目录',
  PRIMARY KEY (`id`),
  KEY `index_wiki_sorts_on_wiki_id_and_type` (`wiki_id`,`type`),
  KEY `index_wiki_sorts_on_parent_id_and_wiki_id_and_type` (`parent_id`,`wiki_id`,`type`),
  KEY `index_wiki_sorts_on_enterprise_id` (`enterprise_id`),
  KEY `index_wiki_sorts_on_info_id_and_parent_id` (`info_id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdraw_user_infos`
--

DROP TABLE IF EXISTS `withdraw_user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraw_user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ali_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_withdraw_user_infos_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attach_id` int(11) DEFAULT NULL,
  `attach_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `contack_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_orders_on_target_attach` (`target_id`,`target_type`,`attach_id`,`attach_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务状态的工作流',
  `issue_type_id` int(11) DEFAULT NULL COMMENT '任务类型 id',
  `state_id` int(11) DEFAULT NULL COMMENT '当前状态的 id(issue_state.id)',
  `next_state_id` int(11) DEFAULT NULL COMMENT '下一个状态的 id(issue_state.id)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflows_on_issue_type_id_and_state_id` (`issue_type_id`,`state_id`),
  KEY `idx_type_id_state_id_next_state_id` (`issue_type_id`,`state_id`,`next_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务状态的工作流';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30 10:26:29
INSERT INTO schema_migrations (version) VALUES ('20110913200833');

INSERT INTO schema_migrations (version) VALUES ('20110913204141');

INSERT INTO schema_migrations (version) VALUES ('20110914221600');

INSERT INTO schema_migrations (version) VALUES ('20110915205627');

INSERT INTO schema_migrations (version) VALUES ('20110915213352');

INSERT INTO schema_migrations (version) VALUES ('20110916123731');

INSERT INTO schema_migrations (version) VALUES ('20110916162511');

INSERT INTO schema_migrations (version) VALUES ('20110917212932');

INSERT INTO schema_migrations (version) VALUES ('20110921192501');

INSERT INTO schema_migrations (version) VALUES ('20110922110156');

INSERT INTO schema_migrations (version) VALUES ('20110923211333');

INSERT INTO schema_migrations (version) VALUES ('20110924214549');

INSERT INTO schema_migrations (version) VALUES ('20110924215658');

INSERT INTO schema_migrations (version) VALUES ('20110926082616');

INSERT INTO schema_migrations (version) VALUES ('20110927130352');

INSERT INTO schema_migrations (version) VALUES ('20110928140106');

INSERT INTO schema_migrations (version) VALUES ('20110928142747');

INSERT INTO schema_migrations (version) VALUES ('20110928161328');

INSERT INTO schema_migrations (version) VALUES ('20111005193700');

INSERT INTO schema_migrations (version) VALUES ('20111009101738');

INSERT INTO schema_migrations (version) VALUES ('20111009110913');

INSERT INTO schema_migrations (version) VALUES ('20111009111204');

INSERT INTO schema_migrations (version) VALUES ('20111015154310');

INSERT INTO schema_migrations (version) VALUES ('20111016183422');

INSERT INTO schema_migrations (version) VALUES ('20111016193417');

INSERT INTO schema_migrations (version) VALUES ('20111016195506');

INSERT INTO schema_migrations (version) VALUES ('20111019212429');

INSERT INTO schema_migrations (version) VALUES ('20111021101550');

INSERT INTO schema_migrations (version) VALUES ('20111025134235');

INSERT INTO schema_migrations (version) VALUES ('20111027051828');

INSERT INTO schema_migrations (version) VALUES ('20111027142641');

INSERT INTO schema_migrations (version) VALUES ('20111027152724');

INSERT INTO schema_migrations (version) VALUES ('20111101222453');

INSERT INTO schema_migrations (version) VALUES ('20111111093150');

INSERT INTO schema_migrations (version) VALUES ('20111115063954');

INSERT INTO schema_migrations (version) VALUES ('20111124115339');

INSERT INTO schema_migrations (version) VALUES ('20111127155345');

INSERT INTO schema_migrations (version) VALUES ('20111206213842');

INSERT INTO schema_migrations (version) VALUES ('20111206222316');

INSERT INTO schema_migrations (version) VALUES ('20111207211728');

INSERT INTO schema_migrations (version) VALUES ('20111214091851');

INSERT INTO schema_migrations (version) VALUES ('20111220190817');

INSERT INTO schema_migrations (version) VALUES ('20111231111825');

INSERT INTO schema_migrations (version) VALUES ('20120110180749');

INSERT INTO schema_migrations (version) VALUES ('20120119202326');

INSERT INTO schema_migrations (version) VALUES ('20120121122616');

INSERT INTO schema_migrations (version) VALUES ('20120206170141');

INSERT INTO schema_migrations (version) VALUES ('20120215182305');

INSERT INTO schema_migrations (version) VALUES ('20120216085842');

INSERT INTO schema_migrations (version) VALUES ('20120216215008');

INSERT INTO schema_migrations (version) VALUES ('20120219130957');

INSERT INTO schema_migrations (version) VALUES ('20120219140810');

INSERT INTO schema_migrations (version) VALUES ('20120219193300');

INSERT INTO schema_migrations (version) VALUES ('20120228130210');

INSERT INTO schema_migrations (version) VALUES ('20120228134252');

INSERT INTO schema_migrations (version) VALUES ('20120301185805');

INSERT INTO schema_migrations (version) VALUES ('20120307095918');

INSERT INTO schema_migrations (version) VALUES ('20120315111711');

INSERT INTO schema_migrations (version) VALUES ('20120315132931');

INSERT INTO schema_migrations (version) VALUES ('20120317095543');

INSERT INTO schema_migrations (version) VALUES ('20120323221339');

INSERT INTO schema_migrations (version) VALUES ('20120329170745');

INSERT INTO schema_migrations (version) VALUES ('20120405211750');

INSERT INTO schema_migrations (version) VALUES ('20120408180246');

INSERT INTO schema_migrations (version) VALUES ('20120408181910');

INSERT INTO schema_migrations (version) VALUES ('20120413135904');

INSERT INTO schema_migrations (version) VALUES ('20120627145613');

INSERT INTO schema_migrations (version) VALUES ('20120706065612');

INSERT INTO schema_migrations (version) VALUES ('20120712080407');

INSERT INTO schema_migrations (version) VALUES ('20120729131232');

INSERT INTO schema_migrations (version) VALUES ('20120905043334');

INSERT INTO schema_migrations (version) VALUES ('20121002150926');

INSERT INTO schema_migrations (version) VALUES ('20121002151033');

INSERT INTO schema_migrations (version) VALUES ('20121009205010');

INSERT INTO schema_migrations (version) VALUES ('20121026114600');

INSERT INTO schema_migrations (version) VALUES ('20121119170638');

INSERT INTO schema_migrations (version) VALUES ('20121120051432');

INSERT INTO schema_migrations (version) VALUES ('20121120103700');

INSERT INTO schema_migrations (version) VALUES ('20121120113838');

INSERT INTO schema_migrations (version) VALUES ('20121122145155');

INSERT INTO schema_migrations (version) VALUES ('20121122150932');

INSERT INTO schema_migrations (version) VALUES ('20121123104937');

INSERT INTO schema_migrations (version) VALUES ('20121123164910');

INSERT INTO schema_migrations (version) VALUES ('20121203154450');

INSERT INTO schema_migrations (version) VALUES ('20121203160507');

INSERT INTO schema_migrations (version) VALUES ('20121205201726');

INSERT INTO schema_migrations (version) VALUES ('20121218164840');

INSERT INTO schema_migrations (version) VALUES ('20121219095402');

INSERT INTO schema_migrations (version) VALUES ('20121219183753');

INSERT INTO schema_migrations (version) VALUES ('20121220064104');

INSERT INTO schema_migrations (version) VALUES ('20121220064453');

INSERT INTO schema_migrations (version) VALUES ('20130102143055');

INSERT INTO schema_migrations (version) VALUES ('20130110172407');

INSERT INTO schema_migrations (version) VALUES ('20130123114545');

INSERT INTO schema_migrations (version) VALUES ('20130125090214');

INSERT INTO schema_migrations (version) VALUES ('20130131070232');

INSERT INTO schema_migrations (version) VALUES ('20130206084024');

INSERT INTO schema_migrations (version) VALUES ('20130207104426');

INSERT INTO schema_migrations (version) VALUES ('20130211085435');

INSERT INTO schema_migrations (version) VALUES ('20130214154045');

INSERT INTO schema_migrations (version) VALUES ('20130218140952');

INSERT INTO schema_migrations (version) VALUES ('20130218141038');

INSERT INTO schema_migrations (version) VALUES ('20130218141117');

INSERT INTO schema_migrations (version) VALUES ('20130218141258');

INSERT INTO schema_migrations (version) VALUES ('20130218141327');

INSERT INTO schema_migrations (version) VALUES ('20130218141344');

INSERT INTO schema_migrations (version) VALUES ('20130218141444');

INSERT INTO schema_migrations (version) VALUES ('20130218141507');

INSERT INTO schema_migrations (version) VALUES ('20130218141536');

INSERT INTO schema_migrations (version) VALUES ('20130218141554');

INSERT INTO schema_migrations (version) VALUES ('20130220124204');

INSERT INTO schema_migrations (version) VALUES ('20130220125544');

INSERT INTO schema_migrations (version) VALUES ('20130220125545');

INSERT INTO schema_migrations (version) VALUES ('20130220133245');

INSERT INTO schema_migrations (version) VALUES ('20130221121150');

INSERT INTO schema_migrations (version) VALUES ('20130221121912');

INSERT INTO schema_migrations (version) VALUES ('20130223045043');

INSERT INTO schema_migrations (version) VALUES ('20130302062558');

INSERT INTO schema_migrations (version) VALUES ('20130304104623');

INSERT INTO schema_migrations (version) VALUES ('20130304104740');

INSERT INTO schema_migrations (version) VALUES ('20130304105317');

INSERT INTO schema_migrations (version) VALUES ('20130309023749');

INSERT INTO schema_migrations (version) VALUES ('20130315124931');

INSERT INTO schema_migrations (version) VALUES ('20130318035723');

INSERT INTO schema_migrations (version) VALUES ('20130318212250');

INSERT INTO schema_migrations (version) VALUES ('20130319063553');

INSERT INTO schema_migrations (version) VALUES ('20130320032007');

INSERT INTO schema_migrations (version) VALUES ('20130320032459');

INSERT INTO schema_migrations (version) VALUES ('20130321070340');

INSERT INTO schema_migrations (version) VALUES ('20130322071107');

INSERT INTO schema_migrations (version) VALUES ('20130325173941');

INSERT INTO schema_migrations (version) VALUES ('20130327033459');

INSERT INTO schema_migrations (version) VALUES ('20130401071732');

INSERT INTO schema_migrations (version) VALUES ('20130403003950');

INSERT INTO schema_migrations (version) VALUES ('20130404164628');

INSERT INTO schema_migrations (version) VALUES ('20130410175022');

INSERT INTO schema_migrations (version) VALUES ('20130418095743');

INSERT INTO schema_migrations (version) VALUES ('20130418110137');

INSERT INTO schema_migrations (version) VALUES ('20130422081957');

INSERT INTO schema_migrations (version) VALUES ('20130425063302');

INSERT INTO schema_migrations (version) VALUES ('20130516083944');

INSERT INTO schema_migrations (version) VALUES ('20130517021841');

INSERT INTO schema_migrations (version) VALUES ('20130523031650');

INSERT INTO schema_migrations (version) VALUES ('20130529071647');

INSERT INTO schema_migrations (version) VALUES ('20130530085618');

INSERT INTO schema_migrations (version) VALUES ('20130608025714');

INSERT INTO schema_migrations (version) VALUES ('20130626080347');

INSERT INTO schema_migrations (version) VALUES ('20130627082025');

INSERT INTO schema_migrations (version) VALUES ('20130701021840');

INSERT INTO schema_migrations (version) VALUES ('20130701043543');

INSERT INTO schema_migrations (version) VALUES ('20130801051728');

INSERT INTO schema_migrations (version) VALUES ('20130802085733');

INSERT INTO schema_migrations (version) VALUES ('20130806073202');

INSERT INTO schema_migrations (version) VALUES ('20130808105337');

INSERT INTO schema_migrations (version) VALUES ('20130809064257');

INSERT INTO schema_migrations (version) VALUES ('20130828081802');

INSERT INTO schema_migrations (version) VALUES ('20130829031426');

INSERT INTO schema_migrations (version) VALUES ('20130902025817');

INSERT INTO schema_migrations (version) VALUES ('20130902031026');

INSERT INTO schema_migrations (version) VALUES ('20130904015940');

INSERT INTO schema_migrations (version) VALUES ('20130904022223');

INSERT INTO schema_migrations (version) VALUES ('20130905092939');

INSERT INTO schema_migrations (version) VALUES ('20131012073553');

INSERT INTO schema_migrations (version) VALUES ('20131016040332');

INSERT INTO schema_migrations (version) VALUES ('20131016041020');

INSERT INTO schema_migrations (version) VALUES ('20131016041148');

INSERT INTO schema_migrations (version) VALUES ('20131017033403');

INSERT INTO schema_migrations (version) VALUES ('20131017042031');

INSERT INTO schema_migrations (version) VALUES ('20131019080246');

INSERT INTO schema_migrations (version) VALUES ('20131024071407');

INSERT INTO schema_migrations (version) VALUES ('20131024072134');

INSERT INTO schema_migrations (version) VALUES ('20131105025502');

INSERT INTO schema_migrations (version) VALUES ('20131111040903');

INSERT INTO schema_migrations (version) VALUES ('20131129021048');

INSERT INTO schema_migrations (version) VALUES ('20131223023116');

INSERT INTO schema_migrations (version) VALUES ('20131223084720');

INSERT INTO schema_migrations (version) VALUES ('20131224090637');

INSERT INTO schema_migrations (version) VALUES ('20131225041121');

INSERT INTO schema_migrations (version) VALUES ('20131226035340');

INSERT INTO schema_migrations (version) VALUES ('20131226081221');

INSERT INTO schema_migrations (version) VALUES ('20131227032833');

INSERT INTO schema_migrations (version) VALUES ('20140104091956');

INSERT INTO schema_migrations (version) VALUES ('20140107052615');

INSERT INTO schema_migrations (version) VALUES ('20140116080308');

INSERT INTO schema_migrations (version) VALUES ('20140116083314');

INSERT INTO schema_migrations (version) VALUES ('20140122094559');

INSERT INTO schema_migrations (version) VALUES ('20140214030412');

INSERT INTO schema_migrations (version) VALUES ('20140331033115');

INSERT INTO schema_migrations (version) VALUES ('20140411052218');

INSERT INTO schema_migrations (version) VALUES ('20140417025105');

INSERT INTO schema_migrations (version) VALUES ('20140423033036');

INSERT INTO schema_migrations (version) VALUES ('20140428054245');

INSERT INTO schema_migrations (version) VALUES ('20140512031252');

INSERT INTO schema_migrations (version) VALUES ('20140616070943');

INSERT INTO schema_migrations (version) VALUES ('20140619051407');

INSERT INTO schema_migrations (version) VALUES ('20140627074720');

INSERT INTO schema_migrations (version) VALUES ('20140701042045');

INSERT INTO schema_migrations (version) VALUES ('20140707022746');

INSERT INTO schema_migrations (version) VALUES ('20140715040309');

INSERT INTO schema_migrations (version) VALUES ('20140730023656');

INSERT INTO schema_migrations (version) VALUES ('20140807111136');

INSERT INTO schema_migrations (version) VALUES ('20140813074542');

INSERT INTO schema_migrations (version) VALUES ('20140821035845');

INSERT INTO schema_migrations (version) VALUES ('20140821040742');

INSERT INTO schema_migrations (version) VALUES ('20140821053425');

INSERT INTO schema_migrations (version) VALUES ('20140821055501');

INSERT INTO schema_migrations (version) VALUES ('20140821131414');

INSERT INTO schema_migrations (version) VALUES ('20140822144826');

INSERT INTO schema_migrations (version) VALUES ('20140826031100');

INSERT INTO schema_migrations (version) VALUES ('20140901023331');

INSERT INTO schema_migrations (version) VALUES ('20140911033017');

INSERT INTO schema_migrations (version) VALUES ('20141010104628');

INSERT INTO schema_migrations (version) VALUES ('20141112062538');

INSERT INTO schema_migrations (version) VALUES ('20150105105516');

INSERT INTO schema_migrations (version) VALUES ('20150125065423');

INSERT INTO schema_migrations (version) VALUES ('20150129111030');

INSERT INTO schema_migrations (version) VALUES ('20150202023118');

INSERT INTO schema_migrations (version) VALUES ('20150203085730');

INSERT INTO schema_migrations (version) VALUES ('20150316061510');

INSERT INTO schema_migrations (version) VALUES ('20150316063543');

INSERT INTO schema_migrations (version) VALUES ('20150323020256');

INSERT INTO schema_migrations (version) VALUES ('20150323085623');

INSERT INTO schema_migrations (version) VALUES ('20150324064217');

INSERT INTO schema_migrations (version) VALUES ('20150324070723');

INSERT INTO schema_migrations (version) VALUES ('20150330072231');

INSERT INTO schema_migrations (version) VALUES ('20150406070723');

INSERT INTO schema_migrations (version) VALUES ('20150407090723');

INSERT INTO schema_migrations (version) VALUES ('20150410085422');

INSERT INTO schema_migrations (version) VALUES ('20150413105155');

INSERT INTO schema_migrations (version) VALUES ('20150416065759');

INSERT INTO schema_migrations (version) VALUES ('20150511094942');

INSERT INTO schema_migrations (version) VALUES ('20150513071509');

INSERT INTO schema_migrations (version) VALUES ('20150515122559');

INSERT INTO schema_migrations (version) VALUES ('20150604101102');

INSERT INTO schema_migrations (version) VALUES ('20150617045947');

INSERT INTO schema_migrations (version) VALUES ('20150619071010');

INSERT INTO schema_migrations (version) VALUES ('20150619072739');

INSERT INTO schema_migrations (version) VALUES ('20150619073738');

INSERT INTO schema_migrations (version) VALUES ('20150619074420');

INSERT INTO schema_migrations (version) VALUES ('20150619075557');

INSERT INTO schema_migrations (version) VALUES ('20150619083033');

INSERT INTO schema_migrations (version) VALUES ('20150623024946');

INSERT INTO schema_migrations (version) VALUES ('20150623035538');

INSERT INTO schema_migrations (version) VALUES ('20150623043847');

INSERT INTO schema_migrations (version) VALUES ('20150624105047');

INSERT INTO schema_migrations (version) VALUES ('20150624105345');

INSERT INTO schema_migrations (version) VALUES ('20150624111932');

INSERT INTO schema_migrations (version) VALUES ('20150624120003');

INSERT INTO schema_migrations (version) VALUES ('20150625105757');

INSERT INTO schema_migrations (version) VALUES ('20150626040248');

INSERT INTO schema_migrations (version) VALUES ('20150630110907');

INSERT INTO schema_migrations (version) VALUES ('20150701032312');

INSERT INTO schema_migrations (version) VALUES ('20150703071326');

INSERT INTO schema_migrations (version) VALUES ('20150703092052');

INSERT INTO schema_migrations (version) VALUES ('20150709033751');

INSERT INTO schema_migrations (version) VALUES ('20150731182632');

INSERT INTO schema_migrations (version) VALUES ('20150813084946');

INSERT INTO schema_migrations (version) VALUES ('20150902075211');

INSERT INTO schema_migrations (version) VALUES ('20150903071618');

INSERT INTO schema_migrations (version) VALUES ('20150903075535');

INSERT INTO schema_migrations (version) VALUES ('20150910033441');

INSERT INTO schema_migrations (version) VALUES ('20150915105814');

INSERT INTO schema_migrations (version) VALUES ('20150921100737');

INSERT INTO schema_migrations (version) VALUES ('20151102105306');

INSERT INTO schema_migrations (version) VALUES ('20151109092309');

INSERT INTO schema_migrations (version) VALUES ('20151111033231');

INSERT INTO schema_migrations (version) VALUES ('20151111102814');

INSERT INTO schema_migrations (version) VALUES ('20151112031458');

INSERT INTO schema_migrations (version) VALUES ('20151113170905');

INSERT INTO schema_migrations (version) VALUES ('20151123114147');

INSERT INTO schema_migrations (version) VALUES ('20151127092044');

INSERT INTO schema_migrations (version) VALUES ('20151207034943');

INSERT INTO schema_migrations (version) VALUES ('20151214083245');

INSERT INTO schema_migrations (version) VALUES ('20151217061006');

INSERT INTO schema_migrations (version) VALUES ('20151222105801');

INSERT INTO schema_migrations (version) VALUES ('20151225065405');

INSERT INTO schema_migrations (version) VALUES ('20160106085014');

INSERT INTO schema_migrations (version) VALUES ('20160108063041');

INSERT INTO schema_migrations (version) VALUES ('20160112063959');

INSERT INTO schema_migrations (version) VALUES ('20160122145712');

INSERT INTO schema_migrations (version) VALUES ('20160226061216');

INSERT INTO schema_migrations (version) VALUES ('20160303121000');

INSERT INTO schema_migrations (version) VALUES ('20160315103929');

INSERT INTO schema_migrations (version) VALUES ('20160505032854');

INSERT INTO schema_migrations (version) VALUES ('20160506063337');

INSERT INTO schema_migrations (version) VALUES ('20160509080137');

INSERT INTO schema_migrations (version) VALUES ('20160510100249');

INSERT INTO schema_migrations (version) VALUES ('20160510101158');

INSERT INTO schema_migrations (version) VALUES ('20160510105646');

INSERT INTO schema_migrations (version) VALUES ('20160510130931');

INSERT INTO schema_migrations (version) VALUES ('20160511101105');

INSERT INTO schema_migrations (version) VALUES ('20160520061357');

INSERT INTO schema_migrations (version) VALUES ('20160530073523');

INSERT INTO schema_migrations (version) VALUES ('20160530084432');

INSERT INTO schema_migrations (version) VALUES ('20160606073306');

INSERT INTO schema_migrations (version) VALUES ('20160606103113');

INSERT INTO schema_migrations (version) VALUES ('20160606105334');

INSERT INTO schema_migrations (version) VALUES ('20160606105633');

INSERT INTO schema_migrations (version) VALUES ('20160606111135');

INSERT INTO schema_migrations (version) VALUES ('20160607061738');

INSERT INTO schema_migrations (version) VALUES ('20160607070638');

INSERT INTO schema_migrations (version) VALUES ('20160615065315');

INSERT INTO schema_migrations (version) VALUES ('20160616063541');

INSERT INTO schema_migrations (version) VALUES ('20160617034844');

INSERT INTO schema_migrations (version) VALUES ('20160620082602');

INSERT INTO schema_migrations (version) VALUES ('20160622070835');

INSERT INTO schema_migrations (version) VALUES ('20160623024717');

INSERT INTO schema_migrations (version) VALUES ('20160623025227');

INSERT INTO schema_migrations (version) VALUES ('20160627080215');

INSERT INTO schema_migrations (version) VALUES ('20160627082049');

INSERT INTO schema_migrations (version) VALUES ('20160627092847');

INSERT INTO schema_migrations (version) VALUES ('20160627095607');

INSERT INTO schema_migrations (version) VALUES ('20160628110436');

INSERT INTO schema_migrations (version) VALUES ('20160701082150');

INSERT INTO schema_migrations (version) VALUES ('20160701105625');

INSERT INTO schema_migrations (version) VALUES ('20160704104451');

INSERT INTO schema_migrations (version) VALUES ('20160712063859');

INSERT INTO schema_migrations (version) VALUES ('20160712064104');

INSERT INTO schema_migrations (version) VALUES ('20160712071855');

INSERT INTO schema_migrations (version) VALUES ('20160712082126');

INSERT INTO schema_migrations (version) VALUES ('20160713094541');

INSERT INTO schema_migrations (version) VALUES ('20160714044254');

INSERT INTO schema_migrations (version) VALUES ('20160715042525');

INSERT INTO schema_migrations (version) VALUES ('20160718063145');

INSERT INTO schema_migrations (version) VALUES ('20160719073859');

INSERT INTO schema_migrations (version) VALUES ('20160721073425');

INSERT INTO schema_migrations (version) VALUES ('20160722085258');

INSERT INTO schema_migrations (version) VALUES ('20160725053601');

INSERT INTO schema_migrations (version) VALUES ('20160725074840');

INSERT INTO schema_migrations (version) VALUES ('20160726025319');

INSERT INTO schema_migrations (version) VALUES ('20160726101213');

INSERT INTO schema_migrations (version) VALUES ('20160726101421');

INSERT INTO schema_migrations (version) VALUES ('20160727055739');

INSERT INTO schema_migrations (version) VALUES ('20160728030950');

INSERT INTO schema_migrations (version) VALUES ('20160729063633');

INSERT INTO schema_migrations (version) VALUES ('20160730065105');

INSERT INTO schema_migrations (version) VALUES ('20160730082900');

INSERT INTO schema_migrations (version) VALUES ('20160803063422');

INSERT INTO schema_migrations (version) VALUES ('20160804073940');

INSERT INTO schema_migrations (version) VALUES ('20160804080910');

INSERT INTO schema_migrations (version) VALUES ('20160808030557');

INSERT INTO schema_migrations (version) VALUES ('20160808051543');

INSERT INTO schema_migrations (version) VALUES ('20160808063334');

INSERT INTO schema_migrations (version) VALUES ('20160808065246');

INSERT INTO schema_migrations (version) VALUES ('20160808100933');

INSERT INTO schema_migrations (version) VALUES ('20160808102028');

INSERT INTO schema_migrations (version) VALUES ('20160809094821');

INSERT INTO schema_migrations (version) VALUES ('20160815032746');

INSERT INTO schema_migrations (version) VALUES ('20160815071521');

INSERT INTO schema_migrations (version) VALUES ('20160815111636');

INSERT INTO schema_migrations (version) VALUES ('20160816023521');

INSERT INTO schema_migrations (version) VALUES ('20160816094501');

INSERT INTO schema_migrations (version) VALUES ('20160816103004');

INSERT INTO schema_migrations (version) VALUES ('20160818065619');

INSERT INTO schema_migrations (version) VALUES ('20160818103555');

INSERT INTO schema_migrations (version) VALUES ('20160819085043');

INSERT INTO schema_migrations (version) VALUES ('20160823062617');

INSERT INTO schema_migrations (version) VALUES ('20160825050241');

INSERT INTO schema_migrations (version) VALUES ('20160825050602');

INSERT INTO schema_migrations (version) VALUES ('20160825051637');

INSERT INTO schema_migrations (version) VALUES ('20160825054446');

INSERT INTO schema_migrations (version) VALUES ('20160825074548');

INSERT INTO schema_migrations (version) VALUES ('20160825080227');

INSERT INTO schema_migrations (version) VALUES ('20160825101353');

INSERT INTO schema_migrations (version) VALUES ('20160825101412');

INSERT INTO schema_migrations (version) VALUES ('20160825102423');

INSERT INTO schema_migrations (version) VALUES ('20160825104422');

INSERT INTO schema_migrations (version) VALUES ('20160830063954');

INSERT INTO schema_migrations (version) VALUES ('20160831034708');

INSERT INTO schema_migrations (version) VALUES ('20160907023143');

INSERT INTO schema_migrations (version) VALUES ('20160929070901');

INSERT INTO schema_migrations (version) VALUES ('20160930030843');

INSERT INTO schema_migrations (version) VALUES ('20161008022821');

INSERT INTO schema_migrations (version) VALUES ('20161009015621');

INSERT INTO schema_migrations (version) VALUES ('20161009020249');

INSERT INTO schema_migrations (version) VALUES ('20161009022115');

INSERT INTO schema_migrations (version) VALUES ('20161010095110');

INSERT INTO schema_migrations (version) VALUES ('20161013093958');

INSERT INTO schema_migrations (version) VALUES ('20161014030437');

INSERT INTO schema_migrations (version) VALUES ('20161014090949');

INSERT INTO schema_migrations (version) VALUES ('20161017064018');

INSERT INTO schema_migrations (version) VALUES ('20161018024013');

INSERT INTO schema_migrations (version) VALUES ('20161018082957');

INSERT INTO schema_migrations (version) VALUES ('20161025061535');

INSERT INTO schema_migrations (version) VALUES ('20161025065437');

INSERT INTO schema_migrations (version) VALUES ('20161025065920');

INSERT INTO schema_migrations (version) VALUES ('20161025080551');

INSERT INTO schema_migrations (version) VALUES ('20161026061544');

INSERT INTO schema_migrations (version) VALUES ('20161026062453');

INSERT INTO schema_migrations (version) VALUES ('20161026062845');

INSERT INTO schema_migrations (version) VALUES ('20161026070151');

INSERT INTO schema_migrations (version) VALUES ('20161026123734');

INSERT INTO schema_migrations (version) VALUES ('20161027022133');

INSERT INTO schema_migrations (version) VALUES ('20161027022723');

INSERT INTO schema_migrations (version) VALUES ('20161027035051');

INSERT INTO schema_migrations (version) VALUES ('20161027064558');

INSERT INTO schema_migrations (version) VALUES ('20161028132720');

INSERT INTO schema_migrations (version) VALUES ('20161031034112');

INSERT INTO schema_migrations (version) VALUES ('20161103023954');

INSERT INTO schema_migrations (version) VALUES ('20161103024226');

INSERT INTO schema_migrations (version) VALUES ('20161107094237');

INSERT INTO schema_migrations (version) VALUES ('20161108030833');

INSERT INTO schema_migrations (version) VALUES ('20161110025318');

INSERT INTO schema_migrations (version) VALUES ('20161115081948');

INSERT INTO schema_migrations (version) VALUES ('20161115083023');

INSERT INTO schema_migrations (version) VALUES ('20161116090207');

INSERT INTO schema_migrations (version) VALUES ('20161116095215');

INSERT INTO schema_migrations (version) VALUES ('20161116100601');

INSERT INTO schema_migrations (version) VALUES ('20161118035128');

INSERT INTO schema_migrations (version) VALUES ('20161118073130');

INSERT INTO schema_migrations (version) VALUES ('20161122075600');

INSERT INTO schema_migrations (version) VALUES ('20161124110102');

INSERT INTO schema_migrations (version) VALUES ('20161125090041');

INSERT INTO schema_migrations (version) VALUES ('20161128084231');

INSERT INTO schema_migrations (version) VALUES ('20161129075902');

INSERT INTO schema_migrations (version) VALUES ('20161130071658');

INSERT INTO schema_migrations (version) VALUES ('20161201022727');

INSERT INTO schema_migrations (version) VALUES ('20161206060554');

INSERT INTO schema_migrations (version) VALUES ('20161206074146');

INSERT INTO schema_migrations (version) VALUES ('20161207025901');

INSERT INTO schema_migrations (version) VALUES ('20161209065127');

INSERT INTO schema_migrations (version) VALUES ('20161213095948');

INSERT INTO schema_migrations (version) VALUES ('20161219071307');

INSERT INTO schema_migrations (version) VALUES ('20161222031515');

INSERT INTO schema_migrations (version) VALUES ('20161223071638');

INSERT INTO schema_migrations (version) VALUES ('20170109093246');

INSERT INTO schema_migrations (version) VALUES ('20170110065036');

INSERT INTO schema_migrations (version) VALUES ('20170116045450');

INSERT INTO schema_migrations (version) VALUES ('20170116051112');

INSERT INTO schema_migrations (version) VALUES ('20170116054317');

INSERT INTO schema_migrations (version) VALUES ('20170116062932');

INSERT INTO schema_migrations (version) VALUES ('20170122030143');

INSERT INTO schema_migrations (version) VALUES ('20170124100123');

INSERT INTO schema_migrations (version) VALUES ('20170207032504');

INSERT INTO schema_migrations (version) VALUES ('20170208094658');

INSERT INTO schema_migrations (version) VALUES ('20170218085621');

INSERT INTO schema_migrations (version) VALUES ('20170218092713');

INSERT INTO schema_migrations (version) VALUES ('20170220062940');

INSERT INTO schema_migrations (version) VALUES ('20170222063846');

INSERT INTO schema_migrations (version) VALUES ('20170222085015');

INSERT INTO schema_migrations (version) VALUES ('20170225030557');

INSERT INTO schema_migrations (version) VALUES ('20170225073122');

INSERT INTO schema_migrations (version) VALUES ('20170302082700');

INSERT INTO schema_migrations (version) VALUES ('20170302123548');

INSERT INTO schema_migrations (version) VALUES ('20170303030724');

INSERT INTO schema_migrations (version) VALUES ('20170303065855');

INSERT INTO schema_migrations (version) VALUES ('20170304022751');

INSERT INTO schema_migrations (version) VALUES ('20170307124652');

INSERT INTO schema_migrations (version) VALUES ('20170307124851');

INSERT INTO schema_migrations (version) VALUES ('20170307130220');

INSERT INTO schema_migrations (version) VALUES ('20170308130220');

INSERT INTO schema_migrations (version) VALUES ('20170309124851');

INSERT INTO schema_migrations (version) VALUES ('20170309124852');

INSERT INTO schema_migrations (version) VALUES ('20170310085234');

INSERT INTO schema_migrations (version) VALUES ('20170311025023');

INSERT INTO schema_migrations (version) VALUES ('20170311030908');

INSERT INTO schema_migrations (version) VALUES ('20170313022742');

INSERT INTO schema_migrations (version) VALUES ('20170313060839');

INSERT INTO schema_migrations (version) VALUES ('20170313085532');

INSERT INTO schema_migrations (version) VALUES ('20170318130220');

INSERT INTO schema_migrations (version) VALUES ('20170318132512');

INSERT INTO schema_migrations (version) VALUES ('20170320063537');

INSERT INTO schema_migrations (version) VALUES ('20170323094359');

INSERT INTO schema_migrations (version) VALUES ('20170328032315');

INSERT INTO schema_migrations (version) VALUES ('20170328041033');

INSERT INTO schema_migrations (version) VALUES ('20170328041612');

INSERT INTO schema_migrations (version) VALUES ('20170329091744');

INSERT INTO schema_migrations (version) VALUES ('20170330021321');

INSERT INTO schema_migrations (version) VALUES ('20170330024020');

INSERT INTO schema_migrations (version) VALUES ('20170330085453');

INSERT INTO schema_migrations (version) VALUES ('20170405032811');

INSERT INTO schema_migrations (version) VALUES ('20170405095149');

INSERT INTO schema_migrations (version) VALUES ('20170405102238');

INSERT INTO schema_migrations (version) VALUES ('20170405103350');

INSERT INTO schema_migrations (version) VALUES ('20170407021241');

INSERT INTO schema_migrations (version) VALUES ('20170413104155');

INSERT INTO schema_migrations (version) VALUES ('20170426090258');

INSERT INTO schema_migrations (version) VALUES ('20170503095149');

INSERT INTO schema_migrations (version) VALUES ('20170508072443');

INSERT INTO schema_migrations (version) VALUES ('20170511063406');

INSERT INTO schema_migrations (version) VALUES ('20170512033752');

INSERT INTO schema_migrations (version) VALUES ('20170515110349');

INSERT INTO schema_migrations (version) VALUES ('20170516030131');

INSERT INTO schema_migrations (version) VALUES ('20170517033210');

INSERT INTO schema_migrations (version) VALUES ('20170517115900');

INSERT INTO schema_migrations (version) VALUES ('20170518023812');

INSERT INTO schema_migrations (version) VALUES ('20170522031253');

INSERT INTO schema_migrations (version) VALUES ('20170523024140');

INSERT INTO schema_migrations (version) VALUES ('20170523033445');

INSERT INTO schema_migrations (version) VALUES ('20170524072223');

INSERT INTO schema_migrations (version) VALUES ('20170524084442');

INSERT INTO schema_migrations (version) VALUES ('20170524141551');

INSERT INTO schema_migrations (version) VALUES ('20170524143619');

INSERT INTO schema_migrations (version) VALUES ('20170525074435');

INSERT INTO schema_migrations (version) VALUES ('20170525081545');

INSERT INTO schema_migrations (version) VALUES ('20170525122357');

INSERT INTO schema_migrations (version) VALUES ('20170525122854');

INSERT INTO schema_migrations (version) VALUES ('20170526023917');

INSERT INTO schema_migrations (version) VALUES ('20170526075604');

INSERT INTO schema_migrations (version) VALUES ('20170527030638');

INSERT INTO schema_migrations (version) VALUES ('20170531030439');

INSERT INTO schema_migrations (version) VALUES ('20170531094608');

INSERT INTO schema_migrations (version) VALUES ('20170605023625');

INSERT INTO schema_migrations (version) VALUES ('20170605071114');

INSERT INTO schema_migrations (version) VALUES ('20170605104634');

INSERT INTO schema_migrations (version) VALUES ('20170607070918');

INSERT INTO schema_migrations (version) VALUES ('20170612071114');

INSERT INTO schema_migrations (version) VALUES ('20170613094220');

INSERT INTO schema_migrations (version) VALUES ('20170613104922');

INSERT INTO schema_migrations (version) VALUES ('20170614090148');

INSERT INTO schema_migrations (version) VALUES ('20170615080435');

INSERT INTO schema_migrations (version) VALUES ('20170616090148');

INSERT INTO schema_migrations (version) VALUES ('20170616104800');

INSERT INTO schema_migrations (version) VALUES ('20170619090148');

INSERT INTO schema_migrations (version) VALUES ('20170619090149');

INSERT INTO schema_migrations (version) VALUES ('20170620024352');

INSERT INTO schema_migrations (version) VALUES ('20170620113759');

INSERT INTO schema_migrations (version) VALUES ('20170620121650');

INSERT INTO schema_migrations (version) VALUES ('20170620122220');

INSERT INTO schema_migrations (version) VALUES ('20170621071620');

INSERT INTO schema_migrations (version) VALUES ('20170622023452');

INSERT INTO schema_migrations (version) VALUES ('20170628033049');

INSERT INTO schema_migrations (version) VALUES ('20170630023452');

INSERT INTO schema_migrations (version) VALUES ('20170703090107');

INSERT INTO schema_migrations (version) VALUES ('20170705084811');

INSERT INTO schema_migrations (version) VALUES ('20170707074132');

INSERT INTO schema_migrations (version) VALUES ('20170708031100');

INSERT INTO schema_migrations (version) VALUES ('20170711065141');

INSERT INTO schema_migrations (version) VALUES ('20170712104113');

INSERT INTO schema_migrations (version) VALUES ('20170717031055');

INSERT INTO schema_migrations (version) VALUES ('20170718062148');

INSERT INTO schema_migrations (version) VALUES ('20170719034342');

INSERT INTO schema_migrations (version) VALUES ('20170721060603');

INSERT INTO schema_migrations (version) VALUES ('20170721092626');

INSERT INTO schema_migrations (version) VALUES ('20170721094426');

INSERT INTO schema_migrations (version) VALUES ('20170721100625');

INSERT INTO schema_migrations (version) VALUES ('20170723033902');

INSERT INTO schema_migrations (version) VALUES ('20170725031205');

INSERT INTO schema_migrations (version) VALUES ('20170725094220');

INSERT INTO schema_migrations (version) VALUES ('20170727022413');

INSERT INTO schema_migrations (version) VALUES ('20170727104722');

INSERT INTO schema_migrations (version) VALUES ('20170731023338');

INSERT INTO schema_migrations (version) VALUES ('20170802083724');

INSERT INTO schema_migrations (version) VALUES ('20170802114844');

INSERT INTO schema_migrations (version) VALUES ('20170803032132');

INSERT INTO schema_migrations (version) VALUES ('20170807074155');

INSERT INTO schema_migrations (version) VALUES ('20170810030736');

INSERT INTO schema_migrations (version) VALUES ('20170816061607');

INSERT INTO schema_migrations (version) VALUES ('20170816083558');

INSERT INTO schema_migrations (version) VALUES ('20170817113513');

INSERT INTO schema_migrations (version) VALUES ('20170818035224');

INSERT INTO schema_migrations (version) VALUES ('20170826065325');

INSERT INTO schema_migrations (version) VALUES ('20170827082054');

INSERT INTO schema_migrations (version) VALUES ('20170827082211');

INSERT INTO schema_migrations (version) VALUES ('20170828065059');

INSERT INTO schema_migrations (version) VALUES ('20170830140315');

INSERT INTO schema_migrations (version) VALUES ('20170831074646');

INSERT INTO schema_migrations (version) VALUES ('20170831083912');

INSERT INTO schema_migrations (version) VALUES ('20170831092637');

INSERT INTO schema_migrations (version) VALUES ('20170831093017');

INSERT INTO schema_migrations (version) VALUES ('20170901015405');

INSERT INTO schema_migrations (version) VALUES ('20170901083204');

INSERT INTO schema_migrations (version) VALUES ('20170901084232');

INSERT INTO schema_migrations (version) VALUES ('20170902065913');

INSERT INTO schema_migrations (version) VALUES ('20170903153147');

INSERT INTO schema_migrations (version) VALUES ('20170904105159');

INSERT INTO schema_migrations (version) VALUES ('20170905083637');

INSERT INTO schema_migrations (version) VALUES ('20170906063241');

INSERT INTO schema_migrations (version) VALUES ('20170906100428');

INSERT INTO schema_migrations (version) VALUES ('20170907024441');

INSERT INTO schema_migrations (version) VALUES ('20170907104712');

INSERT INTO schema_migrations (version) VALUES ('20170908033558');

INSERT INTO schema_migrations (version) VALUES ('20170912063137');

INSERT INTO schema_migrations (version) VALUES ('20170912113626');

INSERT INTO schema_migrations (version) VALUES ('20170913033127');

INSERT INTO schema_migrations (version) VALUES ('20170913064939');

INSERT INTO schema_migrations (version) VALUES ('20170914114840');

INSERT INTO schema_migrations (version) VALUES ('20170914115853');

INSERT INTO schema_migrations (version) VALUES ('20170915035003');

INSERT INTO schema_migrations (version) VALUES ('20170915062605');

INSERT INTO schema_migrations (version) VALUES ('20170918092104');

INSERT INTO schema_migrations (version) VALUES ('20170919022647');

INSERT INTO schema_migrations (version) VALUES ('20170920080759');

INSERT INTO schema_migrations (version) VALUES ('20170921070416');

INSERT INTO schema_migrations (version) VALUES ('20170921113315');

INSERT INTO schema_migrations (version) VALUES ('20170921120206');

INSERT INTO schema_migrations (version) VALUES ('20170921122557');

INSERT INTO schema_migrations (version) VALUES ('20170921125324');

INSERT INTO schema_migrations (version) VALUES ('20170921131509');

INSERT INTO schema_migrations (version) VALUES ('20170922025107');

INSERT INTO schema_migrations (version) VALUES ('20170922034347');

INSERT INTO schema_migrations (version) VALUES ('20170922085402');

INSERT INTO schema_migrations (version) VALUES ('20170925065747');

INSERT INTO schema_migrations (version) VALUES ('20170925073748');

INSERT INTO schema_migrations (version) VALUES ('20170926065359');

INSERT INTO schema_migrations (version) VALUES ('20170926095048');

INSERT INTO schema_migrations (version) VALUES ('20170926114840');

INSERT INTO schema_migrations (version) VALUES ('20170928093743');

INSERT INTO schema_migrations (version) VALUES ('20170929072523');

INSERT INTO schema_migrations (version) VALUES ('20170930071217');

INSERT INTO schema_migrations (version) VALUES ('20171011024302');

INSERT INTO schema_migrations (version) VALUES ('20171012104519');

INSERT INTO schema_migrations (version) VALUES ('20171016031726');

INSERT INTO schema_migrations (version) VALUES ('20171016075413');

INSERT INTO schema_migrations (version) VALUES ('20171016075414');

INSERT INTO schema_migrations (version) VALUES ('20171016075415');

INSERT INTO schema_migrations (version) VALUES ('20171016075416');

INSERT INTO schema_migrations (version) VALUES ('20171016092617');

INSERT INTO schema_migrations (version) VALUES ('20171016105954');

INSERT INTO schema_migrations (version) VALUES ('20171017032746');

INSERT INTO schema_migrations (version) VALUES ('20171019094045');

INSERT INTO schema_migrations (version) VALUES ('20171020031725');

INSERT INTO schema_migrations (version) VALUES ('20171020040805');

INSERT INTO schema_migrations (version) VALUES ('20171020062923');

INSERT INTO schema_migrations (version) VALUES ('20171024031726');

INSERT INTO schema_migrations (version) VALUES ('20171024080805');

INSERT INTO schema_migrations (version) VALUES ('20171101022357');

INSERT INTO schema_migrations (version) VALUES ('20171103025718');

INSERT INTO schema_migrations (version) VALUES ('20171103083304');

INSERT INTO schema_migrations (version) VALUES ('20171104131114');

INSERT INTO schema_migrations (version) VALUES ('20171107121443');

INSERT INTO schema_migrations (version) VALUES ('20171107133524');

INSERT INTO schema_migrations (version) VALUES ('20171108111328');

INSERT INTO schema_migrations (version) VALUES ('20171114082231');

INSERT INTO schema_migrations (version) VALUES ('20171115071700');

INSERT INTO schema_migrations (version) VALUES ('20171115093102');

INSERT INTO schema_migrations (version) VALUES ('20171115150530');

INSERT INTO schema_migrations (version) VALUES ('20171116052300');

INSERT INTO schema_migrations (version) VALUES ('20171117070233');

INSERT INTO schema_migrations (version) VALUES ('20171120035650');

INSERT INTO schema_migrations (version) VALUES ('20171120115838');

INSERT INTO schema_migrations (version) VALUES ('20171121100518');

INSERT INTO schema_migrations (version) VALUES ('20171122175828');

INSERT INTO schema_migrations (version) VALUES ('20171123021032');

INSERT INTO schema_migrations (version) VALUES ('20171123075413');

INSERT INTO schema_migrations (version) VALUES ('20171123094840');

INSERT INTO schema_migrations (version) VALUES ('20171124072029');

INSERT INTO schema_migrations (version) VALUES ('20171124120434');

INSERT INTO schema_migrations (version) VALUES ('20171127102917');

INSERT INTO schema_migrations (version) VALUES ('20171128074646');

INSERT INTO schema_migrations (version) VALUES ('20171129072724');

INSERT INTO schema_migrations (version) VALUES ('20171129072803');

INSERT INTO schema_migrations (version) VALUES ('20171129072836');

INSERT INTO schema_migrations (version) VALUES ('20171129142242');

INSERT INTO schema_migrations (version) VALUES ('20171130164800');

INSERT INTO schema_migrations (version) VALUES ('20171206071924');

INSERT INTO schema_migrations (version) VALUES ('20171208101921');

INSERT INTO schema_migrations (version) VALUES ('20171211031409');

INSERT INTO schema_migrations (version) VALUES ('20171211100730');

INSERT INTO schema_migrations (version) VALUES ('20171211121458');

INSERT INTO schema_migrations (version) VALUES ('20171214034307');

INSERT INTO schema_migrations (version) VALUES ('20171214080613');

INSERT INTO schema_migrations (version) VALUES ('20171215081718');

INSERT INTO schema_migrations (version) VALUES ('20171218023815');

INSERT INTO schema_migrations (version) VALUES ('20171218031414');

INSERT INTO schema_migrations (version) VALUES ('20171218063404');

INSERT INTO schema_migrations (version) VALUES ('20171219073011');

INSERT INTO schema_migrations (version) VALUES ('20171219074148');

INSERT INTO schema_migrations (version) VALUES ('20171227063135');

INSERT INTO schema_migrations (version) VALUES ('20171228053551');

INSERT INTO schema_migrations (version) VALUES ('20180103024147');

INSERT INTO schema_migrations (version) VALUES ('20180104031339');

INSERT INTO schema_migrations (version) VALUES ('20180105031734');

INSERT INTO schema_migrations (version) VALUES ('20180105065237');

INSERT INTO schema_migrations (version) VALUES ('20180110112104');

INSERT INTO schema_migrations (version) VALUES ('20180111091723');

INSERT INTO schema_migrations (version) VALUES ('20180115062517');

INSERT INTO schema_migrations (version) VALUES ('20180115070822');

INSERT INTO schema_migrations (version) VALUES ('20180115092734');

INSERT INTO schema_migrations (version) VALUES ('20180116104421');

INSERT INTO schema_migrations (version) VALUES ('20180117103525');

INSERT INTO schema_migrations (version) VALUES ('20180118074558');

INSERT INTO schema_migrations (version) VALUES ('20180126085616');

INSERT INTO schema_migrations (version) VALUES ('20180129083619');

INSERT INTO schema_migrations (version) VALUES ('20180131022414');

INSERT INTO schema_migrations (version) VALUES ('20180206022648');

INSERT INTO schema_migrations (version) VALUES ('20180208030136');

INSERT INTO schema_migrations (version) VALUES ('20180209030300');

INSERT INTO schema_migrations (version) VALUES ('20180213080519');

INSERT INTO schema_migrations (version) VALUES ('20180223063315');

INSERT INTO schema_migrations (version) VALUES ('20180228074753');

INSERT INTO schema_migrations (version) VALUES ('20180306090120');

INSERT INTO schema_migrations (version) VALUES ('20180312040941');

INSERT INTO schema_migrations (version) VALUES ('20180312062256');

INSERT INTO schema_migrations (version) VALUES ('20180316073818');

INSERT INTO schema_migrations (version) VALUES ('20180327091310');

INSERT INTO schema_migrations (version) VALUES ('20180328090724');

INSERT INTO schema_migrations (version) VALUES ('20180328091700');

INSERT INTO schema_migrations (version) VALUES ('20180328092439');

INSERT INTO schema_migrations (version) VALUES ('20180403105657');

INSERT INTO schema_migrations (version) VALUES ('20180404030924');

INSERT INTO schema_migrations (version) VALUES ('20180404035142');

INSERT INTO schema_migrations (version) VALUES ('20180419123344');

INSERT INTO schema_migrations (version) VALUES ('20180419123918');

INSERT INTO schema_migrations (version) VALUES ('20180421083717');

INSERT INTO schema_migrations (version) VALUES ('20180422014924');

INSERT INTO schema_migrations (version) VALUES ('20180502021341');

INSERT INTO schema_migrations (version) VALUES ('20180502021427');

INSERT INTO schema_migrations (version) VALUES ('20180503104512');

INSERT INTO schema_migrations (version) VALUES ('20180506061750');

INSERT INTO schema_migrations (version) VALUES ('20180507151539');

INSERT INTO schema_migrations (version) VALUES ('20180510090111');

INSERT INTO schema_migrations (version) VALUES ('20180511033602');

INSERT INTO schema_migrations (version) VALUES ('20180514063814');

INSERT INTO schema_migrations (version) VALUES ('20180515090021');

INSERT INTO schema_migrations (version) VALUES ('20180516071103');

INSERT INTO schema_migrations (version) VALUES ('20180517032204');

INSERT INTO schema_migrations (version) VALUES ('20180517085236');

INSERT INTO schema_migrations (version) VALUES ('20180517102014');

INSERT INTO schema_migrations (version) VALUES ('20180517104159');

INSERT INTO schema_migrations (version) VALUES ('20180521071044');

INSERT INTO schema_migrations (version) VALUES ('20180524031611');

INSERT INTO schema_migrations (version) VALUES ('20180524035155');

INSERT INTO schema_migrations (version) VALUES ('20180525032500');

INSERT INTO schema_migrations (version) VALUES ('20180525073717');

INSERT INTO schema_migrations (version) VALUES ('20180528104714');

INSERT INTO schema_migrations (version) VALUES ('20180529064014');

INSERT INTO schema_migrations (version) VALUES ('20180530022024');

INSERT INTO schema_migrations (version) VALUES ('20180531023306');

INSERT INTO schema_migrations (version) VALUES ('20180531073913');

INSERT INTO schema_migrations (version) VALUES ('20180531090139');

INSERT INTO schema_migrations (version) VALUES ('20180601023001');

INSERT INTO schema_migrations (version) VALUES ('20180601034247');

INSERT INTO schema_migrations (version) VALUES ('20180601065301');

INSERT INTO schema_migrations (version) VALUES ('20180601082725');

INSERT INTO schema_migrations (version) VALUES ('20180604061949');

INSERT INTO schema_migrations (version) VALUES ('20180604072822');

INSERT INTO schema_migrations (version) VALUES ('20180605072741');

INSERT INTO schema_migrations (version) VALUES ('20180606030402');

INSERT INTO schema_migrations (version) VALUES ('20180606060250');

INSERT INTO schema_migrations (version) VALUES ('20180607072635');

INSERT INTO schema_migrations (version) VALUES ('20180607092934');

INSERT INTO schema_migrations (version) VALUES ('20180607175539');

INSERT INTO schema_migrations (version) VALUES ('20180608081552');

INSERT INTO schema_migrations (version) VALUES ('20180611155826');

INSERT INTO schema_migrations (version) VALUES ('20180612072115');

INSERT INTO schema_migrations (version) VALUES ('20180612110517');

INSERT INTO schema_migrations (version) VALUES ('20180613025144');

INSERT INTO schema_migrations (version) VALUES ('20180614084816');

INSERT INTO schema_migrations (version) VALUES ('20180614135131');

INSERT INTO schema_migrations (version) VALUES ('20180614154851');

INSERT INTO schema_migrations (version) VALUES ('20180615033654');

INSERT INTO schema_migrations (version) VALUES ('20180619085354');

INSERT INTO schema_migrations (version) VALUES ('20180619102945');

INSERT INTO schema_migrations (version) VALUES ('20180626094041');

INSERT INTO schema_migrations (version) VALUES ('20180627164121');

INSERT INTO schema_migrations (version) VALUES ('20180628135131');

INSERT INTO schema_migrations (version) VALUES ('20180628154851');

INSERT INTO schema_migrations (version) VALUES ('20180629092421');

INSERT INTO schema_migrations (version) VALUES ('20180703090958');

INSERT INTO schema_migrations (version) VALUES ('20180706071506');

INSERT INTO schema_migrations (version) VALUES ('20180709024636');

INSERT INTO schema_migrations (version) VALUES ('20180712111044');

INSERT INTO schema_migrations (version) VALUES ('20180712235500');

INSERT INTO schema_migrations (version) VALUES ('20180712235501');

INSERT INTO schema_migrations (version) VALUES ('20180712235502');

INSERT INTO schema_migrations (version) VALUES ('20180716033324');

INSERT INTO schema_migrations (version) VALUES ('20180716033523');

INSERT INTO schema_migrations (version) VALUES ('20180716034429');

INSERT INTO schema_migrations (version) VALUES ('20180716061045');

INSERT INTO schema_migrations (version) VALUES ('20180716073329');

INSERT INTO schema_migrations (version) VALUES ('20180717024655');

INSERT INTO schema_migrations (version) VALUES ('20180718072639');

INSERT INTO schema_migrations (version) VALUES ('20180723023120');

INSERT INTO schema_migrations (version) VALUES ('20180723062753');

INSERT INTO schema_migrations (version) VALUES ('20180727030225');

INSERT INTO schema_migrations (version) VALUES ('20180802062720');

INSERT INTO schema_migrations (version) VALUES ('20180802093419');

INSERT INTO schema_migrations (version) VALUES ('20180806071643');

INSERT INTO schema_migrations (version) VALUES ('20180807025355');

INSERT INTO schema_migrations (version) VALUES ('20180807065230');

INSERT INTO schema_migrations (version) VALUES ('20180807094309');

INSERT INTO schema_migrations (version) VALUES ('20180809031311');

INSERT INTO schema_migrations (version) VALUES ('20180810170619');

INSERT INTO schema_migrations (version) VALUES ('20180813100925');

INSERT INTO schema_migrations (version) VALUES ('20180814062148');

INSERT INTO schema_migrations (version) VALUES ('20180814063150');

INSERT INTO schema_migrations (version) VALUES ('20180815030910');

INSERT INTO schema_migrations (version) VALUES ('20180815094512');

INSERT INTO schema_migrations (version) VALUES ('20180817055134');

INSERT INTO schema_migrations (version) VALUES ('20180820035728');

INSERT INTO schema_migrations (version) VALUES ('20180821100220');

INSERT INTO schema_migrations (version) VALUES ('20180831094939');

INSERT INTO schema_migrations (version) VALUES ('20180831095255');

INSERT INTO schema_migrations (version) VALUES ('20180904062119');

INSERT INTO schema_migrations (version) VALUES ('20180905070207');

INSERT INTO schema_migrations (version) VALUES ('20180905101252');

INSERT INTO schema_migrations (version) VALUES ('20180907034835');

INSERT INTO schema_migrations (version) VALUES ('20180907064755');

INSERT INTO schema_migrations (version) VALUES ('20180907124325');

INSERT INTO schema_migrations (version) VALUES ('20180907132524');

INSERT INTO schema_migrations (version) VALUES ('20180907132551');

INSERT INTO schema_migrations (version) VALUES ('20180908071254');

INSERT INTO schema_migrations (version) VALUES ('20180910073700');

INSERT INTO schema_migrations (version) VALUES ('20180913034916');

INSERT INTO schema_migrations (version) VALUES ('20180913070432');

INSERT INTO schema_migrations (version) VALUES ('20180914075303');

INSERT INTO schema_migrations (version) VALUES ('20180918063123');

INSERT INTO schema_migrations (version) VALUES ('20180919024108');

INSERT INTO schema_migrations (version) VALUES ('20180925092318');

INSERT INTO schema_migrations (version) VALUES ('20180925115304');

INSERT INTO schema_migrations (version) VALUES ('20180926024130');

INSERT INTO schema_migrations (version) VALUES ('20180926024632');

INSERT INTO schema_migrations (version) VALUES ('20180926101543');

INSERT INTO schema_migrations (version) VALUES ('20180926103806');

INSERT INTO schema_migrations (version) VALUES ('20180929062912');

INSERT INTO schema_migrations (version) VALUES ('20180929063437');

INSERT INTO schema_migrations (version) VALUES ('20181011101647');

INSERT INTO schema_migrations (version) VALUES ('20181015093231');

INSERT INTO schema_migrations (version) VALUES ('20181018051033');

INSERT INTO schema_migrations (version) VALUES ('20181018062658');

INSERT INTO schema_migrations (version) VALUES ('20181018090933');

INSERT INTO schema_migrations (version) VALUES ('20181025110738');

INSERT INTO schema_migrations (version) VALUES ('20181025125058');

INSERT INTO schema_migrations (version) VALUES ('20181026063459');

INSERT INTO schema_migrations (version) VALUES ('20181026064030');

INSERT INTO schema_migrations (version) VALUES ('20181028064058');

INSERT INTO schema_migrations (version) VALUES ('20181029061723');

INSERT INTO schema_migrations (version) VALUES ('20181030045425');

INSERT INTO schema_migrations (version) VALUES ('20181106051646');

INSERT INTO schema_migrations (version) VALUES ('20181106083201');

INSERT INTO schema_migrations (version) VALUES ('20181109094040');

INSERT INTO schema_migrations (version) VALUES ('20181113090737');

INSERT INTO schema_migrations (version) VALUES ('20181114070529');

INSERT INTO schema_migrations (version) VALUES ('20181121063829');

INSERT INTO schema_migrations (version) VALUES ('20181122100927');

INSERT INTO schema_migrations (version) VALUES ('20181123091124');

INSERT INTO schema_migrations (version) VALUES ('20181127081118');

INSERT INTO schema_migrations (version) VALUES ('20181128081445');

INSERT INTO schema_migrations (version) VALUES ('20181128082219');

INSERT INTO schema_migrations (version) VALUES ('20181128092528');

INSERT INTO schema_migrations (version) VALUES ('20181128102649');

INSERT INTO schema_migrations (version) VALUES ('20181130025421');

INSERT INTO schema_migrations (version) VALUES ('20181210084705');

INSERT INTO schema_migrations (version) VALUES ('20181211061022');

INSERT INTO schema_migrations (version) VALUES ('20181211090238');

INSERT INTO schema_migrations (version) VALUES ('20181213034127');

INSERT INTO schema_migrations (version) VALUES ('20181214021758');

INSERT INTO schema_migrations (version) VALUES ('20181219095742');

INSERT INTO schema_migrations (version) VALUES ('20181219103612');

INSERT INTO schema_migrations (version) VALUES ('20181219111829');

INSERT INTO schema_migrations (version) VALUES ('20181220024853');

INSERT INTO schema_migrations (version) VALUES ('20181220024922');

INSERT INTO schema_migrations (version) VALUES ('20181220024955');

INSERT INTO schema_migrations (version) VALUES ('20181220030511');

INSERT INTO schema_migrations (version) VALUES ('20181224035200');

INSERT INTO schema_migrations (version) VALUES ('20181224062558');

INSERT INTO schema_migrations (version) VALUES ('20181224092218');

INSERT INTO schema_migrations (version) VALUES ('20181224095716');

INSERT INTO schema_migrations (version) VALUES ('20181227075655');

INSERT INTO schema_migrations (version) VALUES ('20181227075851');

INSERT INTO schema_migrations (version) VALUES ('20190102024815');

INSERT INTO schema_migrations (version) VALUES ('20190103020009');

INSERT INTO schema_migrations (version) VALUES ('20190103030857');

INSERT INTO schema_migrations (version) VALUES ('20190104063208');

INSERT INTO schema_migrations (version) VALUES ('20190104073307');

INSERT INTO schema_migrations (version) VALUES ('20190108070807');

INSERT INTO schema_migrations (version) VALUES ('20190108071852');

INSERT INTO schema_migrations (version) VALUES ('20190110033806');

INSERT INTO schema_migrations (version) VALUES ('20190110093205');

INSERT INTO schema_migrations (version) VALUES ('20190114043659');

INSERT INTO schema_migrations (version) VALUES ('20190114103515');

INSERT INTO schema_migrations (version) VALUES ('20190117025841');

INSERT INTO schema_migrations (version) VALUES ('20190122065155');

INSERT INTO schema_migrations (version) VALUES ('20190122065327');

INSERT INTO schema_migrations (version) VALUES ('20190122065407');

INSERT INTO schema_migrations (version) VALUES ('20190123061001');

INSERT INTO schema_migrations (version) VALUES ('20190123071142');

INSERT INTO schema_migrations (version) VALUES ('20190124105419');

INSERT INTO schema_migrations (version) VALUES ('20190125022350');

INSERT INTO schema_migrations (version) VALUES ('20190129060724');

INSERT INTO schema_migrations (version) VALUES ('20190129100621');

INSERT INTO schema_migrations (version) VALUES ('20190129120149');

INSERT INTO schema_migrations (version) VALUES ('20190130030812');

INSERT INTO schema_migrations (version) VALUES ('20190130082203');

INSERT INTO schema_migrations (version) VALUES ('20190131045335');

INSERT INTO schema_migrations (version) VALUES ('20190211103753');

INSERT INTO schema_migrations (version) VALUES ('20190213034059');

INSERT INTO schema_migrations (version) VALUES ('20190214024631');

INSERT INTO schema_migrations (version) VALUES ('20190218021709');

INSERT INTO schema_migrations (version) VALUES ('20190226064807');

INSERT INTO schema_migrations (version) VALUES ('20190227074246');

INSERT INTO schema_migrations (version) VALUES ('20190304105935');

INSERT INTO schema_migrations (version) VALUES ('20190306075104');

INSERT INTO schema_migrations (version) VALUES ('20190307065908');

INSERT INTO schema_migrations (version) VALUES ('20190318085956');

INSERT INTO schema_migrations (version) VALUES ('20190320020604');

INSERT INTO schema_migrations (version) VALUES ('20190320080348');

INSERT INTO schema_migrations (version) VALUES ('20190322082213');

INSERT INTO schema_migrations (version) VALUES ('20190328024735');

INSERT INTO schema_migrations (version) VALUES ('20190328054657');

INSERT INTO schema_migrations (version) VALUES ('20190328054747');

INSERT INTO schema_migrations (version) VALUES ('20190328074549');

INSERT INTO schema_migrations (version) VALUES ('20190329075229');

INSERT INTO schema_migrations (version) VALUES ('20190329081501');

INSERT INTO schema_migrations (version) VALUES ('20190329084201');

INSERT INTO schema_migrations (version) VALUES ('20190329084936');

INSERT INTO schema_migrations (version) VALUES ('20190402072114');

INSERT INTO schema_migrations (version) VALUES ('20190408080304');

INSERT INTO schema_migrations (version) VALUES ('20190408084253');

INSERT INTO schema_migrations (version) VALUES ('20190409142035');

INSERT INTO schema_migrations (version) VALUES ('20190410062440');

INSERT INTO schema_migrations (version) VALUES ('20190410062556');

INSERT INTO schema_migrations (version) VALUES ('20190411033736');

INSERT INTO schema_migrations (version) VALUES ('20190412073826');

INSERT INTO schema_migrations (version) VALUES ('20190412090448');

INSERT INTO schema_migrations (version) VALUES ('20190415062639');

INSERT INTO schema_migrations (version) VALUES ('20190416023721');

INSERT INTO schema_migrations (version) VALUES ('20190416063222');

INSERT INTO schema_migrations (version) VALUES ('20190418112106');

INSERT INTO schema_migrations (version) VALUES ('20190419113305');

INSERT INTO schema_migrations (version) VALUES ('20190419115359');

INSERT INTO schema_migrations (version) VALUES ('20190423082727');

INSERT INTO schema_migrations (version) VALUES ('20190428105450');

INSERT INTO schema_migrations (version) VALUES ('20190429090018');

INSERT INTO schema_migrations (version) VALUES ('20190430091450');

INSERT INTO schema_migrations (version) VALUES ('20190508091401');

INSERT INTO schema_migrations (version) VALUES ('20190510023403');

INSERT INTO schema_migrations (version) VALUES ('20190510085017');

INSERT INTO schema_migrations (version) VALUES ('20190510085647');

INSERT INTO schema_migrations (version) VALUES ('20190510155556');

INSERT INTO schema_migrations (version) VALUES ('20190516030607');

INSERT INTO schema_migrations (version) VALUES ('20190517035113');

INSERT INTO schema_migrations (version) VALUES ('20190519082314');

INSERT INTO schema_migrations (version) VALUES ('20190521070556');

INSERT INTO schema_migrations (version) VALUES ('20190522041704');

INSERT INTO schema_migrations (version) VALUES ('20190522070152');

INSERT INTO schema_migrations (version) VALUES ('20190528093516');

INSERT INTO schema_migrations (version) VALUES ('20190528104345');

INSERT INTO schema_migrations (version) VALUES ('20190528174839');

INSERT INTO schema_migrations (version) VALUES ('20190529033657');

INSERT INTO schema_migrations (version) VALUES ('20190530070811');

INSERT INTO schema_migrations (version) VALUES ('20190603085641');

INSERT INTO schema_migrations (version) VALUES ('20190610113530');

INSERT INTO schema_migrations (version) VALUES ('20190611031201');

INSERT INTO schema_migrations (version) VALUES ('20190619105847');

INSERT INTO schema_migrations (version) VALUES ('20190621081330');

INSERT INTO schema_migrations (version) VALUES ('20190625070312');

INSERT INTO schema_migrations (version) VALUES ('20190626051527');

INSERT INTO schema_migrations (version) VALUES ('20190702073721');

INSERT INTO schema_migrations (version) VALUES ('20190703132835');

INSERT INTO schema_migrations (version) VALUES ('20190711033202');

INSERT INTO schema_migrations (version) VALUES ('20190711080432');

INSERT INTO schema_migrations (version) VALUES ('20190712084411');

INSERT INTO schema_migrations (version) VALUES ('20190717030715');

INSERT INTO schema_migrations (version) VALUES ('20190719091309');

INSERT INTO schema_migrations (version) VALUES ('20190719100142');

INSERT INTO schema_migrations (version) VALUES ('20190723072238');

INSERT INTO schema_migrations (version) VALUES ('20190723094915');

INSERT INTO schema_migrations (version) VALUES ('20190724065914');

INSERT INTO schema_migrations (version) VALUES ('20190724070541');

INSERT INTO schema_migrations (version) VALUES ('20190724071619');

INSERT INTO schema_migrations (version) VALUES ('20190726093546');

INSERT INTO schema_migrations (version) VALUES ('20190726100444');

INSERT INTO schema_migrations (version) VALUES ('20190726101320');

INSERT INTO schema_migrations (version) VALUES ('20190731082817');

INSERT INTO schema_migrations (version) VALUES ('20190805104105');

INSERT INTO schema_migrations (version) VALUES ('20190806062552');

INSERT INTO schema_migrations (version) VALUES ('20190807073240');

INSERT INTO schema_migrations (version) VALUES ('20190809045133');

INSERT INTO schema_migrations (version) VALUES ('20190809105830');

INSERT INTO schema_migrations (version) VALUES ('20190827044849');

INSERT INTO schema_migrations (version) VALUES ('20190827063407');

INSERT INTO schema_migrations (version) VALUES ('20190828105251');

INSERT INTO schema_migrations (version) VALUES ('20190829103406');

INSERT INTO schema_migrations (version) VALUES ('20190830080657');

INSERT INTO schema_migrations (version) VALUES ('20190905110740');

INSERT INTO schema_migrations (version) VALUES ('20190910033804');

INSERT INTO schema_migrations (version) VALUES ('20190914085637');

INSERT INTO schema_migrations (version) VALUES ('20190917025523');

INSERT INTO schema_migrations (version) VALUES ('20190919025600');

INSERT INTO schema_migrations (version) VALUES ('20190919084705');

INSERT INTO schema_migrations (version) VALUES ('20190923034432');

INSERT INTO schema_migrations (version) VALUES ('20190923094230');

INSERT INTO schema_migrations (version) VALUES ('20190923100633');

INSERT INTO schema_migrations (version) VALUES ('20190924024333');

INSERT INTO schema_migrations (version) VALUES ('20190925034432');

INSERT INTO schema_migrations (version) VALUES ('20190925034433');

INSERT INTO schema_migrations (version) VALUES ('20190926065456');

INSERT INTO schema_migrations (version) VALUES ('20190930063329');

INSERT INTO schema_migrations (version) VALUES ('20191010084847');

INSERT INTO schema_migrations (version) VALUES ('20191011075232');

INSERT INTO schema_migrations (version) VALUES ('20191015090628');

INSERT INTO schema_migrations (version) VALUES ('20191017082423');

INSERT INTO schema_migrations (version) VALUES ('20191022083054');

INSERT INTO schema_migrations (version) VALUES ('20191022111614');

INSERT INTO schema_migrations (version) VALUES ('20191025091752');

INSERT INTO schema_migrations (version) VALUES ('20191101101917');

INSERT INTO schema_migrations (version) VALUES ('20191107040403');

INSERT INTO schema_migrations (version) VALUES ('20191107040501');

INSERT INTO schema_migrations (version) VALUES ('20191107174020');

INSERT INTO schema_migrations (version) VALUES ('20191108033652');

INSERT INTO schema_migrations (version) VALUES ('20191112110519');

INSERT INTO schema_migrations (version) VALUES ('20191118044066');

INSERT INTO schema_migrations (version) VALUES ('20191118070533');

INSERT INTO schema_migrations (version) VALUES ('20191118084622');

INSERT INTO schema_migrations (version) VALUES ('20191118085308');

INSERT INTO schema_migrations (version) VALUES ('20191118121822');

INSERT INTO schema_migrations (version) VALUES ('20191121030008');

INSERT INTO schema_migrations (version) VALUES ('20191121080706');

INSERT INTO schema_migrations (version) VALUES ('20191122034853');

INSERT INTO schema_migrations (version) VALUES ('20191123122023');

INSERT INTO schema_migrations (version) VALUES ('20191125025533');

INSERT INTO schema_migrations (version) VALUES ('20191125104544');

INSERT INTO schema_migrations (version) VALUES ('20191127035628');

INSERT INTO schema_migrations (version) VALUES ('20191129024952');

INSERT INTO schema_migrations (version) VALUES ('20191203075537');

INSERT INTO schema_migrations (version) VALUES ('20191209083501');

INSERT INTO schema_migrations (version) VALUES ('20191209094241');

INSERT INTO schema_migrations (version) VALUES ('20191209120626');

INSERT INTO schema_migrations (version) VALUES ('20191211030050');

INSERT INTO schema_migrations (version) VALUES ('20191211091206');

INSERT INTO schema_migrations (version) VALUES ('20191211092055');

INSERT INTO schema_migrations (version) VALUES ('20191212024746');

INSERT INTO schema_migrations (version) VALUES ('20191212034225');

INSERT INTO schema_migrations (version) VALUES ('20191212073851');

INSERT INTO schema_migrations (version) VALUES ('20191212074446');

INSERT INTO schema_migrations (version) VALUES ('20191218080519');

INSERT INTO schema_migrations (version) VALUES ('20191220105806');

INSERT INTO schema_migrations (version) VALUES ('20191224081657');

INSERT INTO schema_migrations (version) VALUES ('20191225062647');

INSERT INTO schema_migrations (version) VALUES ('20200103021501');

INSERT INTO schema_migrations (version) VALUES ('20200110082704');

INSERT INTO schema_migrations (version) VALUES ('20200115124257');

INSERT INTO schema_migrations (version) VALUES ('20200115162250');

INSERT INTO schema_migrations (version) VALUES ('20200116030959');

INSERT INTO schema_migrations (version) VALUES ('20200116074156');

INSERT INTO schema_migrations (version) VALUES ('20200117032725');

INSERT INTO schema_migrations (version) VALUES ('20200117091826');

INSERT INTO schema_migrations (version) VALUES ('20200120023613');

INSERT INTO schema_migrations (version) VALUES ('20200204094128');

INSERT INTO schema_migrations (version) VALUES ('20200210031038');

INSERT INTO schema_migrations (version) VALUES ('20200211072807');

INSERT INTO schema_migrations (version) VALUES ('20200212150341');

INSERT INTO schema_migrations (version) VALUES ('20200213103527');

INSERT INTO schema_migrations (version) VALUES ('20200214033026');

INSERT INTO schema_migrations (version) VALUES ('20200214081859');

INSERT INTO schema_migrations (version) VALUES ('20200217064058');

INSERT INTO schema_migrations (version) VALUES ('20200217071242');

INSERT INTO schema_migrations (version) VALUES ('20200217085840');

INSERT INTO schema_migrations (version) VALUES ('20200217094025');

INSERT INTO schema_migrations (version) VALUES ('20200218032954');

INSERT INTO schema_migrations (version) VALUES ('20200218034617');

INSERT INTO schema_migrations (version) VALUES ('20200218071423');

INSERT INTO schema_migrations (version) VALUES ('20200218135941');

INSERT INTO schema_migrations (version) VALUES ('20200219020328');

INSERT INTO schema_migrations (version) VALUES ('20200219024356');

INSERT INTO schema_migrations (version) VALUES ('20200219133208');

INSERT INTO schema_migrations (version) VALUES ('20200221032747');

INSERT INTO schema_migrations (version) VALUES ('20200222075145');

INSERT INTO schema_migrations (version) VALUES ('20200225040113');

INSERT INTO schema_migrations (version) VALUES ('20200225060843');

INSERT INTO schema_migrations (version) VALUES ('20200225094049');

INSERT INTO schema_migrations (version) VALUES ('20200301091640');

INSERT INTO schema_migrations (version) VALUES ('20200302074206');

INSERT INTO schema_migrations (version) VALUES ('20200302104056');

INSERT INTO schema_migrations (version) VALUES ('20200302104918');

INSERT INTO schema_migrations (version) VALUES ('20200304071021');

INSERT INTO schema_migrations (version) VALUES ('20200306022435');

INSERT INTO schema_migrations (version) VALUES ('20200306192106');

INSERT INTO schema_migrations (version) VALUES ('20200310073549');

INSERT INTO schema_migrations (version) VALUES ('20200310074337');

INSERT INTO schema_migrations (version) VALUES ('20200311025326');

INSERT INTO schema_migrations (version) VALUES ('20200311081102');

INSERT INTO schema_migrations (version) VALUES ('20200312022341');

INSERT INTO schema_migrations (version) VALUES ('20200312154406');

INSERT INTO schema_migrations (version) VALUES ('20200313030055');

INSERT INTO schema_migrations (version) VALUES ('20200313110424');

INSERT INTO schema_migrations (version) VALUES ('20200313134823');

INSERT INTO schema_migrations (version) VALUES ('20200317114033');

INSERT INTO schema_migrations (version) VALUES ('20200318113327');

INSERT INTO schema_migrations (version) VALUES ('20200320012044');

INSERT INTO schema_migrations (version) VALUES ('20200320200633');

INSERT INTO schema_migrations (version) VALUES ('20200321044914');

INSERT INTO schema_migrations (version) VALUES ('20200324060951');

INSERT INTO schema_migrations (version) VALUES ('20200324112800');

INSERT INTO schema_migrations (version) VALUES ('20200325111537');

INSERT INTO schema_migrations (version) VALUES ('20200325164118');

INSERT INTO schema_migrations (version) VALUES ('20200330032706');

INSERT INTO schema_migrations (version) VALUES ('20200330083921');

INSERT INTO schema_migrations (version) VALUES ('20200403070228');

INSERT INTO schema_migrations (version) VALUES ('20200413050811');

INSERT INTO schema_migrations (version) VALUES ('20200413123708');

INSERT INTO schema_migrations (version) VALUES ('20200414094118');

INSERT INTO schema_migrations (version) VALUES ('20200415102952');

INSERT INTO schema_migrations (version) VALUES ('20200417052746');

INSERT INTO schema_migrations (version) VALUES ('20200423100026');

INSERT INTO schema_migrations (version) VALUES ('20200424055953');

INSERT INTO schema_migrations (version) VALUES ('20200424064236');

INSERT INTO schema_migrations (version) VALUES ('20200424085238');

INSERT INTO schema_migrations (version) VALUES ('20200427052034');

INSERT INTO schema_migrations (version) VALUES ('20200427105538');

INSERT INTO schema_migrations (version) VALUES ('20200507034456');

INSERT INTO schema_migrations (version) VALUES ('20200508060915');

INSERT INTO schema_migrations (version) VALUES ('20200509061519');

INSERT INTO schema_migrations (version) VALUES ('20200511022306');

INSERT INTO schema_migrations (version) VALUES ('20200513110212');

INSERT INTO schema_migrations (version) VALUES ('20200520025808');

INSERT INTO schema_migrations (version) VALUES ('20200521024454');

INSERT INTO schema_migrations (version) VALUES ('20200522034239');

INSERT INTO schema_migrations (version) VALUES ('20200525060122');

INSERT INTO schema_migrations (version) VALUES ('20200527064618');

INSERT INTO schema_migrations (version) VALUES ('20200527080810');

INSERT INTO schema_migrations (version) VALUES ('20200527105230');

INSERT INTO schema_migrations (version) VALUES ('20200528023052');

INSERT INTO schema_migrations (version) VALUES ('20200528070107');

INSERT INTO schema_migrations (version) VALUES ('20200529020652');

INSERT INTO schema_migrations (version) VALUES ('20200529025303');

INSERT INTO schema_migrations (version) VALUES ('20200602055257');

INSERT INTO schema_migrations (version) VALUES ('20200602062214');

INSERT INTO schema_migrations (version) VALUES ('20200602085545');

INSERT INTO schema_migrations (version) VALUES ('20200603050057');

INSERT INTO schema_migrations (version) VALUES ('20200603060126');

INSERT INTO schema_migrations (version) VALUES ('20200604101105');

INSERT INTO schema_migrations (version) VALUES ('20200608065756');

INSERT INTO schema_migrations (version) VALUES ('20200608091940');

INSERT INTO schema_migrations (version) VALUES ('20200610031005');

INSERT INTO schema_migrations (version) VALUES ('20200610104228');

INSERT INTO schema_migrations (version) VALUES ('20200616032434');

INSERT INTO schema_migrations (version) VALUES ('20200618054928');

INSERT INTO schema_migrations (version) VALUES ('20200618060023');

INSERT INTO schema_migrations (version) VALUES ('20200618060307');

INSERT INTO schema_migrations (version) VALUES ('20200618072223');

INSERT INTO schema_migrations (version) VALUES ('20200618081029');

INSERT INTO schema_migrations (version) VALUES ('20200619011337');

INSERT INTO schema_migrations (version) VALUES ('20200622063247');

INSERT INTO schema_migrations (version) VALUES ('20200622074236');

INSERT INTO schema_migrations (version) VALUES ('20200622092125');

INSERT INTO schema_migrations (version) VALUES ('20200622095020');

INSERT INTO schema_migrations (version) VALUES ('20200622104202');

INSERT INTO schema_migrations (version) VALUES ('20200623014607');

INSERT INTO schema_migrations (version) VALUES ('20200623015141');

INSERT INTO schema_migrations (version) VALUES ('20200623021301');

INSERT INTO schema_migrations (version) VALUES ('20200624031849');

INSERT INTO schema_migrations (version) VALUES ('20200628025751');

INSERT INTO schema_migrations (version) VALUES ('20200628030048');

INSERT INTO schema_migrations (version) VALUES ('20200628031135');

INSERT INTO schema_migrations (version) VALUES ('20200701032709');

INSERT INTO schema_migrations (version) VALUES ('20200703083928');

INSERT INTO schema_migrations (version) VALUES ('20200708095643');

INSERT INTO schema_migrations (version) VALUES ('20200708124620');

INSERT INTO schema_migrations (version) VALUES ('20200710023822');

INSERT INTO schema_migrations (version) VALUES ('20200710070507');

INSERT INTO schema_migrations (version) VALUES ('20200715075948');

INSERT INTO schema_migrations (version) VALUES ('20200716015254');

INSERT INTO schema_migrations (version) VALUES ('20200721080843');

INSERT INTO schema_migrations (version) VALUES ('20200722031033');

INSERT INTO schema_migrations (version) VALUES ('20200722054101');

INSERT INTO schema_migrations (version) VALUES ('20200722054912');

INSERT INTO schema_migrations (version) VALUES ('20200722075933');

INSERT INTO schema_migrations (version) VALUES ('20200722090929');

INSERT INTO schema_migrations (version) VALUES ('20200723075656');

INSERT INTO schema_migrations (version) VALUES ('20200723092259');

INSERT INTO schema_migrations (version) VALUES ('20200724060742');

INSERT INTO schema_migrations (version) VALUES ('20200724074149');

INSERT INTO schema_migrations (version) VALUES ('20200726114434');

INSERT INTO schema_migrations (version) VALUES ('20200727015407');

INSERT INTO schema_migrations (version) VALUES ('20200727055157');

INSERT INTO schema_migrations (version) VALUES ('20200727061825');

INSERT INTO schema_migrations (version) VALUES ('20200727075906');

INSERT INTO schema_migrations (version) VALUES ('20200727081218');

INSERT INTO schema_migrations (version) VALUES ('20200727101833');

INSERT INTO schema_migrations (version) VALUES ('20200729143647');

INSERT INTO schema_migrations (version) VALUES ('20200803062956');

INSERT INTO schema_migrations (version) VALUES ('20200804100635');

INSERT INTO schema_migrations (version) VALUES ('20200805053824');

INSERT INTO schema_migrations (version) VALUES ('20200805090727');

INSERT INTO schema_migrations (version) VALUES ('20200806100635');

INSERT INTO schema_migrations (version) VALUES ('20200806133844');

INSERT INTO schema_migrations (version) VALUES ('20200807033212');

INSERT INTO schema_migrations (version) VALUES ('20200807053443');

INSERT INTO schema_migrations (version) VALUES ('20200811081729');

INSERT INTO schema_migrations (version) VALUES ('20200812055733');

INSERT INTO schema_migrations (version) VALUES ('20200813092951');

INSERT INTO schema_migrations (version) VALUES ('20200816134731');

INSERT INTO schema_migrations (version) VALUES ('20200817093229');

INSERT INTO schema_migrations (version) VALUES ('20200818074824');

INSERT INTO schema_migrations (version) VALUES ('20200820095751');

INSERT INTO schema_migrations (version) VALUES ('20200825073225');

INSERT INTO schema_migrations (version) VALUES ('20200825104402');

INSERT INTO schema_migrations (version) VALUES ('20200901095803');

INSERT INTO schema_migrations (version) VALUES ('20200903120009');

INSERT INTO schema_migrations (version) VALUES ('20200908135324');

INSERT INTO schema_migrations (version) VALUES ('20200909051747');

INSERT INTO schema_migrations (version) VALUES ('20200910055705');

INSERT INTO schema_migrations (version) VALUES ('20200914101327');

INSERT INTO schema_migrations (version) VALUES ('20200915074520');

INSERT INTO schema_migrations (version) VALUES ('20200915093955');

INSERT INTO schema_migrations (version) VALUES ('20200915094015');

INSERT INTO schema_migrations (version) VALUES ('20200915094023');

INSERT INTO schema_migrations (version) VALUES ('20200917071752');

INSERT INTO schema_migrations (version) VALUES ('20200919094354');

INSERT INTO schema_migrations (version) VALUES ('20200922074027');

INSERT INTO schema_migrations (version) VALUES ('20200923022552');

INSERT INTO schema_migrations (version) VALUES ('20200923100411');

INSERT INTO schema_migrations (version) VALUES ('20200923100412');

INSERT INTO schema_migrations (version) VALUES ('20200923101336');

INSERT INTO schema_migrations (version) VALUES ('20200923114414');

INSERT INTO schema_migrations (version) VALUES ('20200924070509');

INSERT INTO schema_migrations (version) VALUES ('20200924081150');

INSERT INTO schema_migrations (version) VALUES ('20200925082717');

INSERT INTO schema_migrations (version) VALUES ('20201010100703');

INSERT INTO schema_migrations (version) VALUES ('20201010101639');

INSERT INTO schema_migrations (version) VALUES ('20201020070239');

INSERT INTO schema_migrations (version) VALUES ('20201022025847');

INSERT INTO schema_migrations (version) VALUES ('20201022054303');

INSERT INTO schema_migrations (version) VALUES ('20201029083931');

INSERT INTO schema_migrations (version) VALUES ('20201029114646');

INSERT INTO schema_migrations (version) VALUES ('20201102034510');

INSERT INTO schema_migrations (version) VALUES ('20201105014748');

INSERT INTO schema_migrations (version) VALUES ('20201105070850');

INSERT INTO schema_migrations (version) VALUES ('20201105070859');

INSERT INTO schema_migrations (version) VALUES ('20201106064110');

INSERT INTO schema_migrations (version) VALUES ('20201119110326');

INSERT INTO schema_migrations (version) VALUES ('20201125052838');

INSERT INTO schema_migrations (version) VALUES ('20201201084212');

INSERT INTO schema_migrations (version) VALUES ('20201201084616');

INSERT INTO schema_migrations (version) VALUES ('20201201095353');

INSERT INTO schema_migrations (version) VALUES ('20201204034031');

INSERT INTO schema_migrations (version) VALUES ('20201204122849');

INSERT INTO schema_migrations (version) VALUES ('20201204122906');

INSERT INTO schema_migrations (version) VALUES ('20201204122924');

INSERT INTO schema_migrations (version) VALUES ('20201209025806');

INSERT INTO schema_migrations (version) VALUES ('20201212093716');

INSERT INTO schema_migrations (version) VALUES ('20201215034951');

INSERT INTO schema_migrations (version) VALUES ('20201217021823');

INSERT INTO schema_migrations (version) VALUES ('20201217064356');

INSERT INTO schema_migrations (version) VALUES ('20201217072935');

INSERT INTO schema_migrations (version) VALUES ('20201218055947');

INSERT INTO schema_migrations (version) VALUES ('20201221093343');

INSERT INTO schema_migrations (version) VALUES ('20201223014356');

INSERT INTO schema_migrations (version) VALUES ('20201223085740');

INSERT INTO schema_migrations (version) VALUES ('20201223113033');

INSERT INTO schema_migrations (version) VALUES ('20201223120750');

INSERT INTO schema_migrations (version) VALUES ('20201224020735');

INSERT INTO schema_migrations (version) VALUES ('20201224055410');

INSERT INTO schema_migrations (version) VALUES ('20201224071100');

INSERT INTO schema_migrations (version) VALUES ('20201229043015');

INSERT INTO schema_migrations (version) VALUES ('20210102130722');

INSERT INTO schema_migrations (version) VALUES ('20210110025039');

INSERT INTO schema_migrations (version) VALUES ('20210111075604');

INSERT INTO schema_migrations (version) VALUES ('20210113061155');

INSERT INTO schema_migrations (version) VALUES ('20210113061208');

INSERT INTO schema_migrations (version) VALUES ('20210113062113');

INSERT INTO schema_migrations (version) VALUES ('20210113062651');

INSERT INTO schema_migrations (version) VALUES ('20210113062925');

INSERT INTO schema_migrations (version) VALUES ('20210113063029');

INSERT INTO schema_migrations (version) VALUES ('20210113063909');

INSERT INTO schema_migrations (version) VALUES ('20210113065149');

INSERT INTO schema_migrations (version) VALUES ('20210113071034');

INSERT INTO schema_migrations (version) VALUES ('20210114063527');

INSERT INTO schema_migrations (version) VALUES ('20210122095104');

INSERT INTO schema_migrations (version) VALUES ('20210124031122');

INSERT INTO schema_migrations (version) VALUES ('20210127082846');

INSERT INTO schema_migrations (version) VALUES ('20210127095115');

INSERT INTO schema_migrations (version) VALUES ('20210128082050');

INSERT INTO schema_migrations (version) VALUES ('20210129025516');

INSERT INTO schema_migrations (version) VALUES ('20210129035414');

INSERT INTO schema_migrations (version) VALUES ('20210203023927');

INSERT INTO schema_migrations (version) VALUES ('20210203100413');

INSERT INTO schema_migrations (version) VALUES ('20210204071738');

INSERT INTO schema_migrations (version) VALUES ('20210204074758');

INSERT INTO schema_migrations (version) VALUES ('20210207154511');

INSERT INTO schema_migrations (version) VALUES ('20210207160124');

INSERT INTO schema_migrations (version) VALUES ('20210210093920');

INSERT INTO schema_migrations (version) VALUES ('20210212121644');

INSERT INTO schema_migrations (version) VALUES ('20210316051917');

INSERT INTO schema_migrations (version) VALUES ('20210316052116');

INSERT INTO schema_migrations (version) VALUES ('20210316052139');

INSERT INTO schema_migrations (version) VALUES ('20210317093916');

INSERT INTO schema_migrations (version) VALUES ('20210319062937');

INSERT INTO schema_migrations (version) VALUES ('20210319083954');

INSERT INTO schema_migrations (version) VALUES ('20210323053522');

INSERT INTO schema_migrations (version) VALUES ('20210330022311');

INSERT INTO schema_migrations (version) VALUES ('20210401022717');

INSERT INTO schema_migrations (version) VALUES ('20210401071542');

INSERT INTO schema_migrations (version) VALUES ('20210406053553');

INSERT INTO schema_migrations (version) VALUES ('20210407075502');

INSERT INTO schema_migrations (version) VALUES ('20210408201651');

INSERT INTO schema_migrations (version) VALUES ('20210412065128');

INSERT INTO schema_migrations (version) VALUES ('20210413052941');

INSERT INTO schema_migrations (version) VALUES ('20210414014438');

INSERT INTO schema_migrations (version) VALUES ('20210415111355');

INSERT INTO schema_migrations (version) VALUES ('20210422070153');

INSERT INTO schema_migrations (version) VALUES ('20210422084729');

INSERT INTO schema_migrations (version) VALUES ('20210430070744');

INSERT INTO schema_migrations (version) VALUES ('20210506085854');

INSERT INTO schema_migrations (version) VALUES ('20210506100217');

INSERT INTO schema_migrations (version) VALUES ('20210507052437');

INSERT INTO schema_migrations (version) VALUES ('20210507072921');

INSERT INTO schema_migrations (version) VALUES ('20210510064428');

INSERT INTO schema_migrations (version) VALUES ('20210510091606');

INSERT INTO schema_migrations (version) VALUES ('20210512065441');

INSERT INTO schema_migrations (version) VALUES ('20210512144625');

INSERT INTO schema_migrations (version) VALUES ('20210517100243');

INSERT INTO schema_migrations (version) VALUES ('20210518022958');

INSERT INTO schema_migrations (version) VALUES ('20210524025329');

INSERT INTO schema_migrations (version) VALUES ('20210524054948');

INSERT INTO schema_migrations (version) VALUES ('20210525032953');

INSERT INTO schema_migrations (version) VALUES ('20210527030450');

INSERT INTO schema_migrations (version) VALUES ('20210529024710');

INSERT INTO schema_migrations (version) VALUES ('20210602082901');

INSERT INTO schema_migrations (version) VALUES ('20210602100420');

INSERT INTO schema_migrations (version) VALUES ('20210604030737');

INSERT INTO schema_migrations (version) VALUES ('20210604070103');

INSERT INTO schema_migrations (version) VALUES ('20210604114350');

INSERT INTO schema_migrations (version) VALUES ('20210604130357');

INSERT INTO schema_migrations (version) VALUES ('20210608116520');

INSERT INTO schema_migrations (version) VALUES ('20210609105949');

INSERT INTO schema_migrations (version) VALUES ('20210610093148');

INSERT INTO schema_migrations (version) VALUES ('20210610101956');

INSERT INTO schema_migrations (version) VALUES ('20210610174201');

INSERT INTO schema_migrations (version) VALUES ('20210615073401');

INSERT INTO schema_migrations (version) VALUES ('20210615110408');

INSERT INTO schema_migrations (version) VALUES ('20210615120347');

INSERT INTO schema_migrations (version) VALUES ('20210616020545');

INSERT INTO schema_migrations (version) VALUES ('20210616091504');

INSERT INTO schema_migrations (version) VALUES ('20210616093357');

INSERT INTO schema_migrations (version) VALUES ('20210617034522');

INSERT INTO schema_migrations (version) VALUES ('20210617073026');

INSERT INTO schema_migrations (version) VALUES ('20210618062057');

INSERT INTO schema_migrations (version) VALUES ('20210618081930');

INSERT INTO schema_migrations (version) VALUES ('20210621094826');

INSERT INTO schema_migrations (version) VALUES ('20210621104423');

INSERT INTO schema_migrations (version) VALUES ('20210622034048');

INSERT INTO schema_migrations (version) VALUES ('20210623061148');

INSERT INTO schema_migrations (version) VALUES ('20210624105055');

INSERT INTO schema_migrations (version) VALUES ('20210624181501');

INSERT INTO schema_migrations (version) VALUES ('20210624181502');

INSERT INTO schema_migrations (version) VALUES ('20210630081050');

INSERT INTO schema_migrations (version) VALUES ('20210630224158');

INSERT INTO schema_migrations (version) VALUES ('20210705084215');

INSERT INTO schema_migrations (version) VALUES ('20210707021416');

INSERT INTO schema_migrations (version) VALUES ('20210709054945');

INSERT INTO schema_migrations (version) VALUES ('20210709055931');

INSERT INTO schema_migrations (version) VALUES ('20210714021253');

INSERT INTO schema_migrations (version) VALUES ('20210714054625');

INSERT INTO schema_migrations (version) VALUES ('20210714090947');

INSERT INTO schema_migrations (version) VALUES ('20210715023151');

INSERT INTO schema_migrations (version) VALUES ('20210715081803');

INSERT INTO schema_migrations (version) VALUES ('20210716055037');

INSERT INTO schema_migrations (version) VALUES ('20210716083749');

INSERT INTO schema_migrations (version) VALUES ('20210719091541');

INSERT INTO schema_migrations (version) VALUES ('20210719100338');

INSERT INTO schema_migrations (version) VALUES ('20210721055907');

INSERT INTO schema_migrations (version) VALUES ('20210722081251');

INSERT INTO schema_migrations (version) VALUES ('20210726091208');

INSERT INTO schema_migrations (version) VALUES ('20210727054741');

INSERT INTO schema_migrations (version) VALUES ('20210727113359');

INSERT INTO schema_migrations (version) VALUES ('20210728030215');

INSERT INTO schema_migrations (version) VALUES ('20210728075401');

INSERT INTO schema_migrations (version) VALUES ('20210728082658');

INSERT INTO schema_migrations (version) VALUES ('20210728161358');

INSERT INTO schema_migrations (version) VALUES ('20210729081133');

INSERT INTO schema_migrations (version) VALUES ('20210729081449');

INSERT INTO schema_migrations (version) VALUES ('20210729084703');

INSERT INTO schema_migrations (version) VALUES ('20210729090311');

INSERT INTO schema_migrations (version) VALUES ('20210729090739');

INSERT INTO schema_migrations (version) VALUES ('20210729102628');

INSERT INTO schema_migrations (version) VALUES ('20210802023900');

INSERT INTO schema_migrations (version) VALUES ('20210802072341');

INSERT INTO schema_migrations (version) VALUES ('20210802074235');

INSERT INTO schema_migrations (version) VALUES ('20210805062628');

INSERT INTO schema_migrations (version) VALUES ('20210807060908');

INSERT INTO schema_migrations (version) VALUES ('20210810082201');

INSERT INTO schema_migrations (version) VALUES ('20210812055209');

INSERT INTO schema_migrations (version) VALUES ('20210812064730');

INSERT INTO schema_migrations (version) VALUES ('20210812103327');

INSERT INTO schema_migrations (version) VALUES ('20210813033414');

INSERT INTO schema_migrations (version) VALUES ('20210814110917');

INSERT INTO schema_migrations (version) VALUES ('20210820023714');

INSERT INTO schema_migrations (version) VALUES ('20210824065217');

INSERT INTO schema_migrations (version) VALUES ('20210824073910');

INSERT INTO schema_migrations (version) VALUES ('20210825062221');

INSERT INTO schema_migrations (version) VALUES ('20210825064059');

INSERT INTO schema_migrations (version) VALUES ('20210825065229');

INSERT INTO schema_migrations (version) VALUES ('20210825102220');

INSERT INTO schema_migrations (version) VALUES ('20210825104901');

INSERT INTO schema_migrations (version) VALUES ('20210825104902');

INSERT INTO schema_migrations (version) VALUES ('20210826061244');

INSERT INTO schema_migrations (version) VALUES ('20210830033008');

INSERT INTO schema_migrations (version) VALUES ('20210830102950');

INSERT INTO schema_migrations (version) VALUES ('20210831054443');

INSERT INTO schema_migrations (version) VALUES ('20210831055040');

INSERT INTO schema_migrations (version) VALUES ('20210831062710');

INSERT INTO schema_migrations (version) VALUES ('20210831101301');

INSERT INTO schema_migrations (version) VALUES ('20210902055556');

INSERT INTO schema_migrations (version) VALUES ('20210906065705');

INSERT INTO schema_migrations (version) VALUES ('20210908061116');

INSERT INTO schema_migrations (version) VALUES ('20210908072026');

INSERT INTO schema_migrations (version) VALUES ('20210909062833');

INSERT INTO schema_migrations (version) VALUES ('20210909065922');

INSERT INTO schema_migrations (version) VALUES ('20210913021520');

INSERT INTO schema_migrations (version) VALUES ('20210913052612');

INSERT INTO schema_migrations (version) VALUES ('20210913091721');

INSERT INTO schema_migrations (version) VALUES ('20210914074031');

INSERT INTO schema_migrations (version) VALUES ('20210916055453');

INSERT INTO schema_migrations (version) VALUES ('20210922032511');

INSERT INTO schema_migrations (version) VALUES ('20210922125150');

INSERT INTO schema_migrations (version) VALUES ('20210923002232');

INSERT INTO schema_migrations (version) VALUES ('20210923055258');

INSERT INTO schema_migrations (version) VALUES ('20210930020051');

