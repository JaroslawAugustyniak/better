/*
 Navicat MySQL Data Transfer

 Source Server         : scooge - hostinger - better.augustyniak.xyz
 Source Server Type    : MySQL
 Source Server Version : 110806 (11.8.6-MariaDB-log)
 Source Host           : 147.93.73.22:3306
 Source Schema         : u434154286_Kttms

 Target Server Type    : MySQL
 Target Server Version : 110806 (11.8.6-MariaDB-log)
 File Encoding         : 65001

 Date: 28/05/2026 22:15:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wp_actionscheduler_actions
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
CREATE TABLE `wp_actionscheduler_actions`  (
  `action_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint UNSIGNED NOT NULL DEFAULT 10,
  `args` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `schedule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  PRIMARY KEY (`action_id`) USING BTREE,
  INDEX `hook_status_scheduled_date_gmt`(`hook`(163) ASC, `status` ASC, `scheduled_date_gmt` ASC) USING BTREE,
  INDEX `status_scheduled_date_gmt`(`status` ASC, `scheduled_date_gmt` ASC) USING BTREE,
  INDEX `scheduled_date_gmt`(`scheduled_date_gmt` ASC) USING BTREE,
  INDEX `args`(`args` ASC) USING BTREE,
  INDEX `group_id`(`group_id` ASC) USING BTREE,
  INDEX `last_attempt_gmt`(`last_attempt_gmt` ASC) USING BTREE,
  INDEX `claim_id_status_priority_scheduled_date_gmt`(`claim_id` ASC, `status` ASC, `priority` ASC, `scheduled_date_gmt` ASC) USING BTREE,
  INDEX `status_last_attempt_gmt`(`status` ASC, `last_attempt_gmt` ASC) USING BTREE,
  INDEX `status_claim_id`(`status` ASC, `claim_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_actionscheduler_actions
-- ----------------------------
INSERT INTO `wp_actionscheduler_actions` VALUES (5, 'hostinger-reach/jobs/cleanup_carts/start', 'complete', '2026-05-21 09:28:02', '2026-05-21 09:28:02', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1779355682;s:18:\"\0*\0first_timestamp\";i:1779355682;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1779355682;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 1, 1, '2026-05-27 06:28:47', '2026-05-27 06:28:47', 1, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (6, 'action_scheduler/migration_hook', 'complete', '2026-05-21 09:29:02', '2026-05-21 09:29:02', 10, '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1779355742;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1779355742;}', 2, 1, '2026-05-27 06:28:47', '2026-05-27 06:28:47', 1, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (7, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2026-05-21 09:28:37', '2026-05-21 09:28:37', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1779355717;s:18:\"\0*\0first_timestamp\";i:1779355717;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1779355717;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2026-05-27 06:28:47', '2026-05-27 06:28:47', 1, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (8, 'hostinger-reach/jobs/cleanup_carts/start', 'complete', '2026-05-28 06:28:47', '2026-05-28 06:28:47', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1779949727;s:18:\"\0*\0first_timestamp\";i:1779355682;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1779949727;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 1, 1, '2026-05-28 09:42:44', '2026-05-28 09:42:44', 45, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (9, 'action_scheduler_run_recurring_actions_schedule_hook', 'complete', '2026-05-28 06:28:47', '2026-05-28 06:28:47', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1779949727;s:18:\"\0*\0first_timestamp\";i:1779355717;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1779949727;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 1, '2026-05-28 09:42:44', '2026-05-28 09:42:44', 45, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (10, 'hostinger-reach/jobs/cleanup_carts/start', 'pending', '2026-05-29 09:42:44', '2026-05-29 09:42:44', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1780047764;s:18:\"\0*\0first_timestamp\";i:1779355682;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1780047764;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);
INSERT INTO `wp_actionscheduler_actions` VALUES (11, 'action_scheduler_run_recurring_actions_schedule_hook', 'pending', '2026-05-29 09:42:44', '2026-05-29 09:42:44', 20, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1780047764;s:18:\"\0*\0first_timestamp\";i:1779355717;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1780047764;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);

-- ----------------------------
-- Table structure for wp_actionscheduler_claims
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
CREATE TABLE `wp_actionscheduler_claims`  (
  `claim_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`) USING BTREE,
  INDEX `date_created_gmt`(`date_created_gmt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_actionscheduler_claims
-- ----------------------------

-- ----------------------------
-- Table structure for wp_actionscheduler_groups
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
CREATE TABLE `wp_actionscheduler_groups`  (
  `group_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  INDEX `slug`(`slug`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_actionscheduler_groups
-- ----------------------------
INSERT INTO `wp_actionscheduler_groups` VALUES (1, 'hostinger-reach');
INSERT INTO `wp_actionscheduler_groups` VALUES (2, 'action-scheduler-migration');
INSERT INTO `wp_actionscheduler_groups` VALUES (3, 'ActionScheduler');

-- ----------------------------
-- Table structure for wp_actionscheduler_logs
-- ----------------------------
DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
CREATE TABLE `wp_actionscheduler_logs`  (
  `log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `action_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `action_id`(`action_id` ASC) USING BTREE,
  INDEX `log_date_gmt`(`log_date_gmt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_actionscheduler_logs
-- ----------------------------
INSERT INTO `wp_actionscheduler_logs` VALUES (1, 5, 'action created', '2026-05-21 09:28:02', '2026-05-21 09:28:02');
INSERT INTO `wp_actionscheduler_logs` VALUES (2, 6, 'action created', '2026-05-21 09:28:02', '2026-05-21 09:28:02');
INSERT INTO `wp_actionscheduler_logs` VALUES (3, 7, 'action created', '2026-05-21 09:28:37', '2026-05-21 09:28:37');
INSERT INTO `wp_actionscheduler_logs` VALUES (4, 5, 'action started via WP Cron', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (5, 5, 'action complete via WP Cron', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (6, 8, 'action created', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (7, 6, 'action started via WP Cron', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (8, 6, 'action complete via WP Cron', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (9, 7, 'action started via WP Cron', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (10, 7, 'action complete via WP Cron', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (11, 9, 'action created', '2026-05-27 06:28:47', '2026-05-27 06:28:47');
INSERT INTO `wp_actionscheduler_logs` VALUES (12, 8, 'action started via WP Cron', '2026-05-28 09:42:44', '2026-05-28 09:42:44');
INSERT INTO `wp_actionscheduler_logs` VALUES (13, 8, 'action complete via WP Cron', '2026-05-28 09:42:44', '2026-05-28 09:42:44');
INSERT INTO `wp_actionscheduler_logs` VALUES (14, 10, 'action created', '2026-05-28 09:42:44', '2026-05-28 09:42:44');
INSERT INTO `wp_actionscheduler_logs` VALUES (15, 9, 'action started via WP Cron', '2026-05-28 09:42:44', '2026-05-28 09:42:44');
INSERT INTO `wp_actionscheduler_logs` VALUES (16, 9, 'action complete via WP Cron', '2026-05-28 09:42:44', '2026-05-28 09:42:44');
INSERT INTO `wp_actionscheduler_logs` VALUES (17, 11, 'action created', '2026-05-28 09:42:44', '2026-05-28 09:42:44');

-- ----------------------------
-- Table structure for wp_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta`  (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `comment_id`(`comment_id` ASC) USING BTREE,
  INDEX `meta_key`(`meta_key`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_commentmeta
-- ----------------------------

-- ----------------------------
-- Table structure for wp_comments
-- ----------------------------
DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments`  (
  `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`) USING BTREE,
  INDEX `comment_post_ID`(`comment_post_ID` ASC) USING BTREE,
  INDEX `comment_approved_date_gmt`(`comment_approved` ASC, `comment_date_gmt` ASC) USING BTREE,
  INDEX `comment_date_gmt`(`comment_date_gmt` ASC) USING BTREE,
  INDEX `comment_parent`(`comment_parent` ASC) USING BTREE,
  INDEX `comment_author_email`(`comment_author_email`(10) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_comments
-- ----------------------------
INSERT INTO `wp_comments` VALUES (1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2026-05-21 09:27:42', '2026-05-21 09:27:42', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- ----------------------------
-- Table structure for wp_hostinger_reach_carts
-- ----------------------------
DROP TABLE IF EXISTS `wp_hostinger_reach_carts`;
CREATE TABLE `wp_hostinger_reach_carts`  (
  `hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint UNSIGNED NULL DEFAULT NULL,
  `customer_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `totals` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `updated_at` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hash`) USING BTREE,
  UNIQUE INDEX `hash`(`hash` ASC) USING BTREE,
  INDEX `customer_id`(`customer_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_hostinger_reach_carts
-- ----------------------------

-- ----------------------------
-- Table structure for wp_hostinger_reach_contact_lists
-- ----------------------------
DROP TABLE IF EXISTS `wp_hostinger_reach_contact_lists`;
CREATE TABLE `wp_hostinger_reach_contact_lists`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_hostinger_reach_contact_lists
-- ----------------------------

-- ----------------------------
-- Table structure for wp_hostinger_reach_forms
-- ----------------------------
DROP TABLE IF EXISTS `wp_hostinger_reach_forms`;
CREATE TABLE `wp_hostinger_reach_forms`  (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `form_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `form_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `post_id` int NULL DEFAULT NULL,
  `contact_list_id` int NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `submissions` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `form_id`(`form_id` ASC) USING BTREE,
  INDEX `contact_list_id`(`contact_list_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_hostinger_reach_forms
-- ----------------------------

-- ----------------------------
-- Table structure for wp_links
-- ----------------------------
DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links`  (
  `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`) USING BTREE,
  INDEX `link_visible`(`link_visible` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_links
-- ----------------------------

-- ----------------------------
-- Table structure for wp_litespeed_url
-- ----------------------------
DROP TABLE IF EXISTS `wp_litespeed_url`;
CREATE TABLE `wp_litespeed_url`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cache_tags` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url`(191) ASC) USING BTREE,
  INDEX `cache_tags`(`cache_tags`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_litespeed_url
-- ----------------------------

-- ----------------------------
-- Table structure for wp_litespeed_url_file
-- ----------------------------
DROP TABLE IF EXISTS `wp_litespeed_url_file`;
CREATE TABLE `wp_litespeed_url_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url_id` bigint NOT NULL,
  `vary` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'md5 of final vary',
  `filename` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'md5 of file content',
  `type` tinyint NOT NULL COMMENT 'css=1,js=2,ccss=3,ucss=4',
  `mobile` tinyint NOT NULL COMMENT 'mobile=1',
  `webp` tinyint NOT NULL COMMENT 'webp=1',
  `expired` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `filename`(`filename` ASC) USING BTREE,
  INDEX `type`(`type` ASC) USING BTREE,
  INDEX `url_id_2`(`url_id` ASC, `vary` ASC, `type` ASC) USING BTREE,
  INDEX `filename_2`(`filename` ASC, `expired` ASC) USING BTREE,
  INDEX `url_id`(`url_id` ASC, `expired` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_litespeed_url_file
-- ----------------------------

-- ----------------------------
-- Table structure for wp_options
-- ----------------------------
DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options`  (
  `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`) USING BTREE,
  UNIQUE INDEX `option_name`(`option_name` ASC) USING BTREE,
  INDEX `autoload`(`autoload` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 388 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_options
-- ----------------------------
INSERT INTO `wp_options` VALUES (1, 'cron', 'a:15:{i:1779999057;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1779999068;a:1:{s:19:\"litespeed_task_lqip\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"litespeed_filter\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1780000063;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1780003717;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780007262;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780009062;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780010862;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780021090;a:1:{s:48:\"puc_cron_check_updates-hostinger-easy-onboarding\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780025251;a:1:{s:47:\"puc_cron_check_updates_theme-hostinger-ai-theme\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780041248;a:1:{s:45:\"puc_cron_check_updates-hostinger-ai-assistant\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780046863;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1780046917;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1780565264;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1780565317;a:1:{s:24:\"run_weekly_partner_astra\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on');
INSERT INTO `wp_options` VALUES (2, 'siteurl', 'https://better.augustyniak.xyz', 'on');
INSERT INTO `wp_options` VALUES (3, 'home', 'https://better.augustyniak.xyz', 'on');
INSERT INTO `wp_options` VALUES (4, 'blogname', 'better.augustyniak.xyz', 'on');
INSERT INTO `wp_options` VALUES (5, 'blogdescription', '', 'on');
INSERT INTO `wp_options` VALUES (6, 'users_can_register', '0', 'on');
INSERT INTO `wp_options` VALUES (7, 'admin_email', 'jar.augustyniak@gmail.com', 'on');
INSERT INTO `wp_options` VALUES (8, 'start_of_week', '1', 'on');
INSERT INTO `wp_options` VALUES (9, 'use_balanceTags', '0', 'on');
INSERT INTO `wp_options` VALUES (10, 'use_smilies', '1', 'on');
INSERT INTO `wp_options` VALUES (11, 'require_name_email', '1', 'on');
INSERT INTO `wp_options` VALUES (12, 'comments_notify', '1', 'on');
INSERT INTO `wp_options` VALUES (13, 'posts_per_rss', '10', 'on');
INSERT INTO `wp_options` VALUES (14, 'rss_use_excerpt', '0', 'on');
INSERT INTO `wp_options` VALUES (15, 'mailserver_url', 'mail.example.com', 'on');
INSERT INTO `wp_options` VALUES (16, 'mailserver_login', 'login@example.com', 'on');
INSERT INTO `wp_options` VALUES (17, 'mailserver_pass', '', 'on');
INSERT INTO `wp_options` VALUES (18, 'mailserver_port', '110', 'on');
INSERT INTO `wp_options` VALUES (19, 'default_category', '1', 'on');
INSERT INTO `wp_options` VALUES (20, 'default_comment_status', 'open', 'on');
INSERT INTO `wp_options` VALUES (21, 'default_ping_status', 'open', 'on');
INSERT INTO `wp_options` VALUES (22, 'default_pingback_flag', '1', 'on');
INSERT INTO `wp_options` VALUES (23, 'posts_per_page', '10', 'on');
INSERT INTO `wp_options` VALUES (24, 'date_format', 'F j, Y', 'on');
INSERT INTO `wp_options` VALUES (25, 'time_format', 'g:i a', 'on');
INSERT INTO `wp_options` VALUES (26, 'links_updated_date_format', 'F j, Y g:i a', 'on');
INSERT INTO `wp_options` VALUES (27, 'comment_moderation', '0', 'on');
INSERT INTO `wp_options` VALUES (28, 'moderation_notify', '1', 'on');
INSERT INTO `wp_options` VALUES (29, 'permalink_structure', '/%postname%/', 'on');
INSERT INTO `wp_options` VALUES (30, 'rewrite_rules', 'a:94:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:23:\"index.php?sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'on');
INSERT INTO `wp_options` VALUES (31, 'hack_file', '0', 'on');
INSERT INTO `wp_options` VALUES (32, 'blog_charset', 'UTF-8', 'on');
INSERT INTO `wp_options` VALUES (33, 'moderation_keys', '', 'off');
INSERT INTO `wp_options` VALUES (34, 'active_plugins', 'a:5:{i:0;s:49:\"hostinger-ai-assistant/hostinger-ai-assistant.php\";i:1;s:55:\"hostinger-easy-onboarding/hostinger-easy-onboarding.php\";i:2;s:35:\"hostinger-reach/hostinger-reach.php\";i:3;s:23:\"hostinger/hostinger.php\";i:4;s:35:\"litespeed-cache/litespeed-cache.php\";}', 'on');
INSERT INTO `wp_options` VALUES (35, 'category_base', '', 'on');
INSERT INTO `wp_options` VALUES (36, 'ping_sites', 'https://rpc.pingomatic.com/', 'on');
INSERT INTO `wp_options` VALUES (37, 'comment_max_links', '2', 'on');
INSERT INTO `wp_options` VALUES (38, 'gmt_offset', '0', 'on');
INSERT INTO `wp_options` VALUES (39, 'default_email_category', '1', 'on');
INSERT INTO `wp_options` VALUES (40, 'recently_edited', '', 'off');
INSERT INTO `wp_options` VALUES (41, 'template', 'hostinger-ai-theme', 'on');
INSERT INTO `wp_options` VALUES (42, 'stylesheet', 'hostinger-ai-theme', 'on');
INSERT INTO `wp_options` VALUES (43, 'comment_registration', '0', 'on');
INSERT INTO `wp_options` VALUES (44, 'html_type', 'text/html', 'on');
INSERT INTO `wp_options` VALUES (45, 'use_trackback', '0', 'on');
INSERT INTO `wp_options` VALUES (46, 'default_role', 'subscriber', 'on');
INSERT INTO `wp_options` VALUES (47, 'db_version', '61833', 'on');
INSERT INTO `wp_options` VALUES (48, 'uploads_use_yearmonth_folders', '1', 'on');
INSERT INTO `wp_options` VALUES (49, 'upload_path', '', 'on');
INSERT INTO `wp_options` VALUES (50, 'blog_public', '1', 'on');
INSERT INTO `wp_options` VALUES (51, 'default_link_category', '2', 'on');
INSERT INTO `wp_options` VALUES (52, 'show_on_front', 'posts', 'on');
INSERT INTO `wp_options` VALUES (53, 'tag_base', '', 'on');
INSERT INTO `wp_options` VALUES (54, 'show_avatars', '1', 'on');
INSERT INTO `wp_options` VALUES (55, 'avatar_rating', 'G', 'on');
INSERT INTO `wp_options` VALUES (56, 'upload_url_path', '', 'on');
INSERT INTO `wp_options` VALUES (57, 'thumbnail_size_w', '150', 'on');
INSERT INTO `wp_options` VALUES (58, 'thumbnail_size_h', '150', 'on');
INSERT INTO `wp_options` VALUES (59, 'thumbnail_crop', '1', 'on');
INSERT INTO `wp_options` VALUES (60, 'medium_size_w', '300', 'on');
INSERT INTO `wp_options` VALUES (61, 'medium_size_h', '300', 'on');
INSERT INTO `wp_options` VALUES (62, 'avatar_default', 'mystery', 'on');
INSERT INTO `wp_options` VALUES (63, 'large_size_w', '1024', 'on');
INSERT INTO `wp_options` VALUES (64, 'large_size_h', '1024', 'on');
INSERT INTO `wp_options` VALUES (65, 'image_default_link_type', 'none', 'on');
INSERT INTO `wp_options` VALUES (66, 'image_default_size', '', 'on');
INSERT INTO `wp_options` VALUES (67, 'image_default_align', '', 'on');
INSERT INTO `wp_options` VALUES (68, 'close_comments_for_old_posts', '0', 'on');
INSERT INTO `wp_options` VALUES (69, 'close_comments_days_old', '14', 'on');
INSERT INTO `wp_options` VALUES (70, 'thread_comments', '1', 'on');
INSERT INTO `wp_options` VALUES (71, 'thread_comments_depth', '5', 'on');
INSERT INTO `wp_options` VALUES (72, 'page_comments', '0', 'on');
INSERT INTO `wp_options` VALUES (73, 'comments_per_page', '50', 'on');
INSERT INTO `wp_options` VALUES (74, 'default_comments_page', 'newest', 'on');
INSERT INTO `wp_options` VALUES (75, 'comment_order', 'asc', 'on');
INSERT INTO `wp_options` VALUES (76, 'sticky_posts', 'a:0:{}', 'on');
INSERT INTO `wp_options` VALUES (77, 'widget_categories', 'a:0:{}', 'on');
INSERT INTO `wp_options` VALUES (78, 'widget_text', 'a:0:{}', 'on');
INSERT INTO `wp_options` VALUES (79, 'widget_rss', 'a:0:{}', 'on');
INSERT INTO `wp_options` VALUES (80, 'uninstall_plugins', 'a:1:{s:35:\"litespeed-cache/litespeed-cache.php\";s:47:\"LiteSpeed\\Activation::uninstall_litespeed_cache\";}', 'off');
INSERT INTO `wp_options` VALUES (81, 'timezone_string', '', 'on');
INSERT INTO `wp_options` VALUES (82, 'page_for_posts', '0', 'on');
INSERT INTO `wp_options` VALUES (83, 'page_on_front', '0', 'on');
INSERT INTO `wp_options` VALUES (84, 'default_post_format', '0', 'on');
INSERT INTO `wp_options` VALUES (85, 'link_manager_enabled', '0', 'on');
INSERT INTO `wp_options` VALUES (86, 'finished_splitting_shared_terms', '1', 'on');
INSERT INTO `wp_options` VALUES (87, 'site_icon', '0', 'on');
INSERT INTO `wp_options` VALUES (88, 'medium_large_size_w', '768', 'on');
INSERT INTO `wp_options` VALUES (89, 'medium_large_size_h', '0', 'on');
INSERT INTO `wp_options` VALUES (90, 'wp_page_for_privacy_policy', '3', 'on');
INSERT INTO `wp_options` VALUES (91, 'show_comments_cookies_opt_in', '1', 'on');
INSERT INTO `wp_options` VALUES (92, 'admin_email_lifespan', '1794907662', 'on');
INSERT INTO `wp_options` VALUES (93, 'disallowed_keys', '', 'off');
INSERT INTO `wp_options` VALUES (94, 'comment_previously_approved', '1', 'on');
INSERT INTO `wp_options` VALUES (95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off');
INSERT INTO `wp_options` VALUES (96, 'auto_update_core_dev', 'enabled', 'on');
INSERT INTO `wp_options` VALUES (97, 'auto_update_core_minor', 'enabled', 'on');
INSERT INTO `wp_options` VALUES (98, 'auto_update_core_major', 'enabled', 'on');
INSERT INTO `wp_options` VALUES (99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on');
INSERT INTO `wp_options` VALUES (100, 'wp_attachment_pages_enabled', '0', 'on');
INSERT INTO `wp_options` VALUES (101, 'wp_notes_notify', '1', 'on');
INSERT INTO `wp_options` VALUES (102, 'initial_db_version', '61833', 'on');
INSERT INTO `wp_options` VALUES (103, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'on');
INSERT INTO `wp_options` VALUES (104, 'fresh_site', '1', 'off');
INSERT INTO `wp_options` VALUES (105, 'user_count', '1', 'off');
INSERT INTO `wp_options` VALUES (106, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (107, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'auto');
INSERT INTO `wp_options` VALUES (108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (110, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (111, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (112, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (113, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (114, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (115, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (116, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (117, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (118, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (119, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (120, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (121, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options` VALUES (124, 'WPLANG', 'pl_PL', 'auto');
INSERT INTO `wp_options` VALUES (125, '_site_transient_timeout_wp_theme_files_patterns-f49f810a638bc0cb79712946928815e3', '1779357466', 'off');
INSERT INTO `wp_options` VALUES (126, '_site_transient_wp_theme_files_patterns-f49f810a638bc0cb79712946928815e3', 'a:2:{s:7:\"version\";s:3:\"1.5\";s:8:\"patterns\";a:98:{s:21:\"banner-about-book.php\";a:4:{s:5:\"title\";s:28:\"Banner with book description\";s:4:\"slug\";s:34:\"twentytwentyfive/banner-about-book\";s:11:\"description\";s:66:\"Banner with book description and accompanying image for promotion.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:28:\"banner-cover-big-heading.php\";a:4:{s:5:\"title\";s:22:\"Cover with big heading\";s:4:\"slug\";s:41:\"twentytwentyfive/banner-cover-big-heading\";s:11:\"description\";s:82:\"A full-width cover section with a large background image and an oversized heading.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}}s:22:\"banner-intro-image.php\";a:4:{s:5:\"title\";s:49:\"Short heading and paragraph and image on the left\";s:4:\"slug\";s:35:\"twentytwentyfive/banner-intro-image\";s:11:\"description\";s:68:\"A Intro pattern with Short heading, paragraph and image on the left.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:16:\"banner-intro.php\";a:4:{s:5:\"title\";s:35:\"Intro with left-aligned description\";s:4:\"slug\";s:29:\"twentytwentyfive/banner-intro\";s:11:\"description\";s:66:\"A large left-aligned heading with a brand name emphasized in bold.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:17:\"banner-poster.php\";a:4:{s:5:\"title\";s:19:\"Poster-like section\";s:4:\"slug\";s:30:\"twentytwentyfive/banner-poster\";s:11:\"description\";s:78:\"A section that can be used as a banner or a landing page to announce an event.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:5:\"media\";}}s:43:\"banner-with-description-and-images-grid.php\";a:4:{s:5:\"title\";s:39:\"Banner with description and images grid\";s:4:\"slug\";s:47:\"twentytwentyfive/banner-description-images-grid\";s:11:\"description\";s:75:\"A banner with a short paragraph, and two images displayed in a grid layout.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:18:\"binding-format.php\";a:4:{s:5:\"title\";s:16:\"Post format name\";s:4:\"slug\";s:31:\"twentytwentyfive/binding-format\";s:11:\"description\";s:75:\"Prints the name of the post format with the help of the Block Bindings API.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:12:\"comments.php\";a:5:{s:5:\"title\";s:8:\"Comments\";s:4:\"slug\";s:25:\"twentytwentyfive/comments\";s:11:\"description\";s:63:\"Comments area with comments list, pagination, and comment form.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:13:\"core/comments\";}}s:32:\"contact-centered-social-link.php\";a:5:{s:5:\"title\";s:30:\"Centered link and social links\";s:4:\"slug\";s:45:\"twentytwentyfive/contact-centered-social-link\";s:11:\"description\";s:73:\"Centered contact section with a prominent message and social media links.\";s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:3:{i:0;s:7:\"contact\";i:1;s:3:\"faq\";i:2;s:9:\"questions\";}}s:26:\"contact-info-locations.php\";a:6:{s:5:\"title\";s:27:\"Contact, info and locations\";s:4:\"slug\";s:39:\"twentytwentyfive/contact-info-locations\";s:11:\"description\";s:78:\"Contact section with social media links, email, and multiple location details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"location\";}}s:29:\"contact-location-and-link.php\";a:4:{s:5:\"title\";s:25:\"Contact location and link\";s:4:\"slug\";s:42:\"twentytwentyfive/contact-location-and-link\";s:11:\"description\";s:89:\"Contact section with a location address, a directions link, and an image of the location.\";s:10:\"categories\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"featured\";}}s:18:\"cta-book-links.php\";a:4:{s:5:\"title\";s:30:\"Call to action with book links\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-book-links\";s:11:\"description\";s:74:\"A call to action section with links to get the book in different websites.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:22:\"cta-book-locations.php\";a:4:{s:5:\"title\";s:29:\"Call to action with locations\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-book-locations\";s:11:\"description\";s:82:\"A call to action section with links to get the book in the most popular locations.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:24:\"cta-centered-heading.php\";a:4:{s:5:\"title\";s:16:\"Centered heading\";s:4:\"slug\";s:37:\"twentytwentyfive/cta-centered-heading\";s:11:\"description\";s:53:\"A hero with a centered heading, paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:19:\"cta-events-list.php\";a:4:{s:5:\"title\";s:11:\"Events list\";s:4:\"slug\";s:32:\"twentytwentyfive/cta-events-list\";s:11:\"description\";s:37:\"A list of events with call to action.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:26:\"cta-grid-products-link.php\";a:5:{s:5:\"title\";s:54:\"Call to action with grid layout with products and link\";s:4:\"slug\";s:39:\"twentytwentyfive/cta-grid-products-link\";s:11:\"description\";s:42:\"A call to action featuring product images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"featured\";}}s:22:\"cta-heading-search.php\";a:4:{s:5:\"title\";s:23:\"Heading and search form\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-heading-search\";s:11:\"description\";s:54:\"Large heading with a search form for quick navigation.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:18:\"cta-newsletter.php\";a:5:{s:5:\"title\";s:18:\"Newsletter sign-up\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-newsletter\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:10:\"newsletter\";}}s:15:\"event-3-col.php\";a:5:{s:5:\"title\";s:46:\"Events, 3 columns with event images and titles\";s:4:\"slug\";s:28:\"twentytwentyfive/event-3-col\";s:11:\"description\";s:95:\"A header with title and text and three columns that show 3 events with their images and titles.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:6:\"events\";i:1;s:7:\"columns\";i:2;s:6:\"images\";}}s:14:\"event-rsvp.php\";a:7:{s:5:\"title\";s:10:\"Event RSVP\";s:4:\"slug\";s:27:\"twentytwentyfive/event-rsvp\";s:11:\"description\";s:64:\"RSVP for an upcoming event with a cover image and event details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:4:\"rsvp\";i:2;s:5:\"event\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:18:\"event-schedule.php\";a:5:{s:5:\"title\";s:14:\"Event schedule\";s:4:\"slug\";s:31:\"twentytwentyfive/event-schedule\";s:11:\"description\";s:54:\"A section with specified dates and times for an event.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}s:8:\"keywords\";a:4:{i:0;s:6:\"events\";i:1;s:6:\"agenda\";i:2;s:8:\"schedule\";i:3;s:8:\"lectures\";}}s:19:\"footer-centered.php\";a:5:{s:5:\"title\";s:15:\"Centered footer\";s:4:\"slug\";s:32:\"twentytwentyfive/footer-centered\";s:11:\"description\";s:44:\"Footer with centered site title and tagline.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:18:\"footer-columns.php\";a:5:{s:5:\"title\";s:19:\"Footer with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/footer-columns\";s:11:\"description\";s:45:\"Footer columns with title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:21:\"footer-newsletter.php\";a:5:{s:5:\"title\";s:29:\"Footer with newsletter signup\";s:4:\"slug\";s:34:\"twentytwentyfive/footer-newsletter\";s:11:\"description\";s:51:\"Footer with large site title and newsletter signup.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:17:\"footer-social.php\";a:5:{s:5:\"title\";s:33:\"Centered footer with social links\";s:4:\"slug\";s:30:\"twentytwentyfive/footer-social\";s:11:\"description\";s:49:\"Footer with centered site title and social links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:10:\"footer.php\";a:5:{s:5:\"title\";s:6:\"Footer\";s:4:\"slug\";s:23:\"twentytwentyfive/footer\";s:11:\"description\";s:51:\"Footer columns with logo, title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:16:\"format-audio.php\";a:4:{s:5:\"title\";s:12:\"Audio format\";s:4:\"slug\";s:29:\"twentytwentyfive/format-audio\";s:11:\"description\";s:73:\"An audio post format with an image, title, audio player, and description.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"format-link.php\";a:4:{s:5:\"title\";s:11:\"Link format\";s:4:\"slug\";s:28:\"twentytwentyfive/format-link\";s:11:\"description\";s:77:\"A link post format with a description and an emphasized link for key content.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"grid-videos.php\";a:4:{s:5:\"title\";s:16:\"Grid with videos\";s:4:\"slug\";s:28:\"twentytwentyfive/grid-videos\";s:11:\"description\";s:19:\"A grid with videos.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:24:\"grid-with-categories.php\";a:5:{s:5:\"title\";s:20:\"Grid with categories\";s:4:\"slug\";s:37:\"twentytwentyfive/grid-with-categories\";s:11:\"description\";s:41:\"A grid section with different categories.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:19:\"header-centered.php\";a:5:{s:5:\"title\";s:20:\"Centered site header\";s:4:\"slug\";s:32:\"twentytwentyfive/header-centered\";s:11:\"description\";s:52:\"Site header with centered site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:18:\"header-columns.php\";a:5:{s:5:\"title\";s:19:\"Header with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/header-columns\";s:11:\"description\";s:54:\"Site header with site title and navigation in columns.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:22:\"header-large-title.php\";a:5:{s:5:\"title\";s:23:\"Header with large title\";s:4:\"slug\";s:35:\"twentytwentyfive/header-large-title\";s:11:\"description\";s:63:\"Site header with large site title and right-aligned navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:10:\"header.php\";a:5:{s:5:\"title\";s:6:\"Header\";s:4:\"slug\";s:23:\"twentytwentyfive/header\";s:11:\"description\";s:43:\"Site header with site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:36:\"heading-and-paragraph-with-image.php\";a:4:{s:5:\"title\";s:45:\"Heading and paragraph with image on the right\";s:4:\"slug\";s:49:\"twentytwentyfive/heading-and-paragraph-with-image\";s:11:\"description\";s:89:\"A two-column section with a heading and paragraph on the left, and an image on the right.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:13:\"hero-book.php\";a:5:{s:5:\"title\";s:9:\"Hero book\";s:4:\"slug\";s:26:\"twentytwentyfive/hero-book\";s:11:\"description\";s:66:\"A hero section for the book with a description and pre-order link.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:25:\"hero-full-width-image.php\";a:4:{s:5:\"title\";s:22:\"Hero, full width image\";s:4:\"slug\";s:38:\"twentytwentyfive/hero-full-width-image\";s:11:\"description\";s:68:\"A hero with a full width image, heading, short paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:41:\"hero-overlapped-book-cover-with-links.php\";a:4:{s:5:\"title\";s:38:\"Hero, overlapped book cover with links\";s:4:\"slug\";s:54:\"twentytwentyfive/hero-overlapped-book-cover-with-links\";s:11:\"description\";s:47:\"A hero with an overlapped book cover and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:16:\"hero-podcast.php\";a:5:{s:5:\"title\";s:12:\"Hero podcast\";s:4:\"slug\";s:29:\"twentytwentyfive/hero-podcast\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:14:\"hidden-404.php\";a:4:{s:5:\"title\";s:3:\"404\";s:4:\"slug\";s:27:\"twentytwentyfive/hidden-404\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"hidden-blog-heading.php\";a:4:{s:5:\"title\";s:19:\"Hidden blog heading\";s:4:\"slug\";s:36:\"twentytwentyfive/hidden-blog-heading\";s:11:\"description\";s:52:\"Hidden heading for the home page and index template.\";s:8:\"inserter\";b:0;}s:17:\"hidden-search.php\";a:4:{s:5:\"title\";s:6:\"Search\";s:4:\"slug\";s:30:\"twentytwentyfive/hidden-search\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:18:\"hidden-sidebar.php\";a:4:{s:5:\"title\";s:7:\"Sidebar\";s:4:\"slug\";s:31:\"twentytwentyfive/hidden-sidebar\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:21:\"hidden-written-by.php\";a:4:{s:5:\"title\";s:10:\"Written by\";s:4:\"slug\";s:34:\"twentytwentyfive/hidden-written-by\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:9:\"logos.php\";a:4:{s:5:\"title\";s:5:\"Logos\";s:4:\"slug\";s:22:\"twentytwentyfive/logos\";s:11:\"description\";s:77:\"Showcasing the podcast\'s clients with a heading and a series of client logos.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:24:\"media-instagram-grid.php\";a:5:{s:5:\"title\";s:14:\"Instagram grid\";s:4:\"slug\";s:37:\"twentytwentyfive/media-instagram-grid\";s:11:\"description\";s:62:\"A grid section with photos and a link to an Instagram profile.\";s:13:\"viewportWidth\";i:1440;s:10:\"categories\";a:3:{i:0;s:5:\"media\";i:1;s:7:\"gallery\";i:2;s:8:\"featured\";}}s:14:\"more-posts.php\";a:5:{s:5:\"title\";s:10:\"More posts\";s:4:\"slug\";s:27:\"twentytwentyfive/more-posts\";s:11:\"description\";s:45:\"Displays a list of posts with title and date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:21:\"overlapped-images.php\";a:4:{s:5:\"title\";s:41:\"Overlapping images and paragraph on right\";s:4:\"slug\";s:34:\"twentytwentyfive/overlapped-images\";s:11:\"description\";s:53:\"A section with overlapping images, and a description.\";s:10:\"categories\";a:2:{i:0;s:5:\"about\";i:1;s:8:\"featured\";}}s:22:\"page-business-home.php\";a:8:{s:5:\"title\";s:17:\"Business homepage\";s:4:\"slug\";s:35:\"twentytwentyfive/page-business-home\";s:11:\"description\";s:28:\"A business homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:20:\"page-coming-soon.php\";a:8:{s:5:\"title\";s:11:\"Coming soon\";s:4:\"slug\";s:33:\"twentytwentyfive/page-coming-soon\";s:11:\"description\";s:96:\"A full-width cover banner that can be applied to a page or it can work as a single landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:15:\"page-cv-bio.php\";a:7:{s:5:\"title\";s:6:\"CV/bio\";s:4:\"slug\";s:28:\"twentytwentyfive/page-cv-bio\";s:11:\"description\";s:36:\"A pattern for a CV/Bio landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:21:\"page-landing-book.php\";a:8:{s:5:\"title\";s:21:\"Landing page for book\";s:4:\"slug\";s:34:\"twentytwentyfive/page-landing-book\";s:11:\"description\";s:104:\"A landing page for the book with a hero section, pre-order links, locations, FAQs and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:22:\"page-landing-event.php\";a:8:{s:5:\"title\";s:22:\"Landing page for event\";s:4:\"slug\";s:35:\"twentytwentyfive/page-landing-event\";s:11:\"description\";s:87:\"A landing page for the event with a hero section, description, FAQs and call to action.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:24:\"page-landing-podcast.php\";a:8:{s:5:\"title\";s:24:\"Landing page for podcast\";s:4:\"slug\";s:37:\"twentytwentyfive/page-landing-podcast\";s:11:\"description\";s:111:\"A landing page for the podcast with a hero section, description, logos, grid with videos and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:50:\"page-link-in-bio-heading-paragraph-links-image.php\";a:7:{s:5:\"title\";s:59:\"Link in bio heading, paragraph, links and full-height image\";s:4:\"slug\";s:63:\"twentytwentyfive/page-link-in-bio-heading-paragraph-links-image\";s:11:\"description\";s:84:\"A link in bio landing page with a heading, paragraph, links and a full height image.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:33:\"page-link-in-bio-wide-margins.php\";a:7:{s:5:\"title\";s:48:\"Link in bio with profile, links and wide margins\";s:4:\"slug\";s:46:\"twentytwentyfive/page-link-in-bio-wide-margins\";s:11:\"description\";s:86:\"A link in bio landing page with social links, a profile photo and a brief description.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:39:\"page-link-in-bio-with-tight-margins.php\";a:8:{s:5:\"title\";s:30:\"Link in bio with tight margins\";s:4:\"slug\";s:52:\"twentytwentyfive/page-link-in-bio-with-tight-margins\";s:11:\"description\";s:90:\"A full-width, full-height link in bio section with an image, a paragraph and social links.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:23:\"page-portfolio-home.php\";a:8:{s:5:\"title\";s:18:\"Portfolio homepage\";s:4:\"slug\";s:36:\"twentytwentyfive/page-portfolio-home\";s:11:\"description\";s:29:\"A portfolio homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"posts\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:18:\"page-shop-home.php\";a:8:{s:5:\"title\";s:13:\"Shop homepage\";s:4:\"slug\";s:31:\"twentytwentyfive/page-shop-home\";s:11:\"description\";s:24:\"A shop homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:21:\"twentytwentyfive_page\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:19:\"post-navigation.php\";a:5:{s:5:\"title\";s:15:\"Post navigation\";s:4:\"slug\";s:32:\"twentytwentyfive/post-navigation\";s:11:\"description\";s:29:\"Next and previous post links.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/post-navigation-link\";}}s:17:\"pricing-2-col.php\";a:5:{s:5:\"title\";s:18:\"Pricing, 2 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-2-col\";s:11:\"description\";s:88:\"Pricing section with two columns, pricing plan, description, and call-to-action buttons.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:17:\"pricing-3-col.php\";a:4:{s:5:\"title\";s:18:\"Pricing, 3 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-3-col\";s:11:\"description\";s:100:\"A three-column boxed pricing table designed to showcase services, descriptions, and pricing options.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:18:\"services-3-col.php\";a:4:{s:5:\"title\";s:19:\"Services, 3 columns\";s:4:\"slug\";s:31:\"twentytwentyfive/services-3-col\";s:11:\"description\";s:56:\"Three columns with images and text to showcase services.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:36:\"services-subscriber-only-section.php\";a:4:{s:5:\"title\";s:33:\"Services, subscriber only section\";s:4:\"slug\";s:49:\"twentytwentyfive/services-subscriber-only-section\";s:11:\"description\";s:72:\"A subscriber-only section highlighting exclusive services and offerings.\";s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"services\";}}s:24:\"services-team-photos.php\";a:4:{s:5:\"title\";s:21:\"Services, team photos\";s:4:\"slug\";s:37:\"twentytwentyfive/services-team-photos\";s:11:\"description\";s:59:\"Display team photos in a services section with grid layout.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:14:\"call-to-action\";i:2;s:8:\"featured\";}}s:37:\"template-404-vertical-header-blog.php\";a:5:{s:5:\"title\";s:17:\"Right-aligned 404\";s:4:\"slug\";s:50:\"twentytwentyfive/template-404-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:3:\"404\";}}s:30:\"template-archive-news-blog.php\";a:6:{s:5:\"title\";s:17:\"News blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:31:\"template-archive-photo-blog.php\";a:6:{s:5:\"title\";s:18:\"Photo blog archive\";s:4:\"slug\";s:44:\"twentytwentyfive/template-archive-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:30:\"template-archive-text-blog.php\";a:6:{s:5:\"title\";s:17:\"Text blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:41:\"template-archive-vertical-header-blog.php\";a:6:{s:5:\"title\";s:21:\"Right-aligned archive\";s:4:\"slug\";s:54:\"twentytwentyfive/template-archive-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:27:\"template-home-news-blog.php\";a:6:{s:5:\"title\";s:14:\"News blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-home-photo-blog.php\";a:6:{s:5:\"title\";s:15:\"Photo blog home\";s:4:\"slug\";s:41:\"twentytwentyfive/template-home-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:38:\"template-home-posts-grid-news-blog.php\";a:5:{s:5:\"title\";s:34:\"News blog with featured posts grid\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-posts-grid-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:27:\"template-home-text-blog.php\";a:6:{s:5:\"title\";s:14:\"Text blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:10:\"front-page\";i:1;s:4:\"home\";}}s:38:\"template-home-vertical-header-blog.php\";a:6:{s:5:\"title\";s:18:\"Right-aligned home\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:40:\"template-home-with-sidebar-news-blog.php\";a:6:{s:5:\"title\";s:22:\"News blog with sidebar\";s:4:\"slug\";s:53:\"twentytwentyfive/template-home-with-sidebar-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-page-photo-blog.php\";a:5:{s:5:\"title\";s:15:\"Photo blog page\";s:4:\"slug\";s:41:\"twentytwentyfive/template-page-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:38:\"template-page-vertical-header-blog.php\";a:5:{s:5:\"title\";s:18:\"Right-aligned page\";s:4:\"slug\";s:51:\"twentytwentyfive/template-page-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:33:\"template-query-loop-news-blog.php\";a:4:{s:5:\"title\";s:20:\"News blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:34:\"template-query-loop-photo-blog.php\";a:6:{s:5:\"title\";s:16:\"Photo blog posts\";s:4:\"slug\";s:47:\"twentytwentyfive/template-query-loop-photo-blog\";s:11:\"description\";s:54:\"A list of posts, 3 columns, with only featured images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:33:\"template-query-loop-text-blog.php\";a:4:{s:5:\"title\";s:20:\"Text blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-text-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:44:\"template-query-loop-vertical-header-blog.php\";a:4:{s:5:\"title\";s:24:\"Right-aligned query loop\";s:4:\"slug\";s:57:\"twentytwentyfive/template-query-loop-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"template-query-loop.php\";a:5:{s:5:\"title\";s:23:\"List of posts, 1 column\";s:4:\"slug\";s:36:\"twentytwentyfive/template-query-loop\";s:11:\"description\";s:61:\"A list of posts, 1 column, with featured image and post date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:29:\"template-search-news-blog.php\";a:6:{s:5:\"title\";s:24:\"News blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:30:\"template-search-photo-blog.php\";a:6:{s:5:\"title\";s:25:\"Photo blog search results\";s:4:\"slug\";s:43:\"twentytwentyfive/template-search-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:29:\"template-search-text-blog.php\";a:6:{s:5:\"title\";s:24:\"Text blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-search-vertical-header-blog.php\";a:6:{s:5:\"title\";s:26:\"Right-aligned blog, search\";s:4:\"slug\";s:53:\"twentytwentyfive/template-search-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-single-left-aligned-content.php\";a:6:{s:5:\"title\";s:30:\"Post with left-aligned content\";s:4:\"slug\";s:47:\"twentytwentyfive/post-with-left-aligned-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-news-blog.php\";a:6:{s:5:\"title\";s:34:\"News blog single post with sidebar\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:26:\"template-single-offset.php\";a:6:{s:5:\"title\";s:34:\"Offset post without featured image\";s:4:\"slug\";s:39:\"twentytwentyfive/template-single-offset\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:30:\"template-single-photo-blog.php\";a:6:{s:5:\"title\";s:22:\"Photo blog single post\";s:4:\"slug\";s:43:\"twentytwentyfive/template-single-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-text-blog.php\";a:6:{s:5:\"title\";s:21:\"Text blog single post\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:40:\"template-single-vertical-header-blog.php\";a:6:{s:5:\"title\";s:25:\"Right-aligned single post\";s:4:\"slug\";s:53:\"twentytwentyfive/template-single-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:22:\"testimonials-2-col.php\";a:5:{s:5:\"title\";s:21:\"2 columns with avatar\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-2-col\";s:11:\"description\";s:42:\"Two columns with testimonials and avatars.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-6-col.php\";a:5:{s:5:\"title\";s:35:\"3 column layout with 6 testimonials\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-6-col\";s:11:\"description\";s:86:\"A section with three columns and two rows, each containing a testimonial and citation.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-large.php\";a:5:{s:5:\"title\";s:32:\"Review with large image on right\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-large\";s:11:\"description\";s:46:\"A testimonial with a large image on the right.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:13:\"text-faqs.php\";a:6:{s:5:\"title\";s:4:\"FAQs\";s:4:\"slug\";s:26:\"twentytwentyfive/text-faqs\";s:11:\"description\";s:68:\"A FAQs section with a FAQ heading and list of questions and answers.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:4:\"text\";i:1;s:5:\"about\";}s:8:\"keywords\";a:5:{i:0;s:3:\"faq\";i:1;s:5:\"about\";i:2;s:10:\"frequently\";i:3;s:5:\"asked\";i:4;s:9:\"questions\";}}s:19:\"vertical-header.php\";a:6:{s:5:\"title\";s:20:\"Vertical site header\";s:4:\"slug\";s:32:\"twentytwentyfive/vertical-header\";s:11:\"description\";s:52:\"Vertical site header with site title and navigation.\";s:13:\"viewportWidth\";i:300;s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:34:\"core/template-part/vertical-header\";}}}}', 'off');
INSERT INTO `wp_options` VALUES (127, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:63:\"https://downloads.wordpress.org/release/pl_PL/wordpress-7.0.zip\";s:6:\"locale\";s:5:\"pl_PL\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:63:\"https://downloads.wordpress.org/release/pl_PL/wordpress-7.0.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"7.0\";s:7:\"version\";s:3:\"7.0\";s:11:\"php_version\";s:3:\"7.4\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1779355671;s:15:\"version_checked\";s:3:\"7.0\";s:12:\"translations\";a:0:{}}', 'off');
INSERT INTO `wp_options` VALUES (129, '_site_transient_timeout_theme_roots', '1779357471', 'off');
INSERT INTO `wp_options` VALUES (130, '_site_transient_theme_roots', 'a:3:{s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}', 'off');
INSERT INTO `wp_options` VALUES (131, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1779355687;s:7:\"checked\";a:3:{s:16:\"twentytwentyfive\";s:3:\"1.5\";s:16:\"twentytwentyfour\";s:3:\"1.5\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.5.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.5.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:16:\"twentytwentyfive\";s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"1.5\";s:7:\"updated\";s:19:\"2025-08-25 15:59:32\";s:7:\"package\";s:80:\"https://downloads.wordpress.org/translation/theme/twentytwentyfive/1.5/pl_PL.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:17:\"twentytwentythree\";s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"1.6\";s:7:\"updated\";s:19:\"2024-11-14 06:20:13\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/theme/twentytwentythree/1.6/pl_PL.zip\";s:10:\"autoupdate\";b:1;}}}', 'off');
INSERT INTO `wp_options` VALUES (133, 'optin_monster_api_activation_redirect_disabled', 'true', 'auto');
INSERT INTO `wp_options` VALUES (134, 'wpforms_activation_redirect', 'true', 'auto');
INSERT INTO `wp_options` VALUES (135, 'aioseo_activation_redirect', 'false', 'auto');
INSERT INTO `wp_options` VALUES (136, 'hts_new_installation', 'new', 'auto');
INSERT INTO `wp_options` VALUES (138, 'hostinger_show_onboarding', '1', 'auto');
INSERT INTO `wp_options` VALUES (140, 'action_scheduler_hybrid_store_demarkation', '4', 'auto');
INSERT INTO `wp_options` VALUES (141, 'schema-ActionScheduler_StoreSchema', '8.0.1779355677', 'auto');
INSERT INTO `wp_options` VALUES (142, 'schema-ActionScheduler_LoggerSchema', '3.0.1779355677', 'auto');
INSERT INTO `wp_options` VALUES (145, 'hostinger_tools', 'a:8:{s:16:\"maintenance_mode\";b:0;s:11:\"bypass_code\";s:16:\"GeUXaUZozHeXWdVA\";s:15:\"disable_xml_rpc\";b:0;s:11:\"force_https\";b:0;s:9:\"force_www\";b:0;s:31:\"disable_authentication_password\";b:0;s:15:\"enable_llms_txt\";b:0;s:9:\"optin_mcp\";b:0;}', 'off');
INSERT INTO `wp_options` VALUES (149, 'hostinger-reach-db-version', '1.2.1', 'off');
INSERT INTO `wp_options` VALUES (150, 'external_updates-hostinger-easy-onboarding', 'O:8:\"stdClass\":5:{s:9:\"lastCheck\";i:1779982462;s:14:\"checkedVersion\";s:6:\"2.1.23\";s:6:\"update\";O:8:\"stdClass\":11:{s:4:\"slug\";s:25:\"hostinger-easy-onboarding\";s:7:\"version\";s:6:\"2.1.23\";s:12:\"download_url\";s:89:\"https://wp-update.hostinger.io/?action=download&slug=hostinger-easy-onboarding&ver=2.1.23\";s:12:\"translations\";a:0:{}s:2:\"id\";i:0;s:8:\"homepage\";s:21:\"https://hostinger.com\";s:6:\"tested\";s:7:\"6.9.999\";s:12:\"requires_php\";s:3:\"8.0\";s:14:\"upgrade_notice\";N;s:5:\"icons\";a:0:{}s:8:\"filename\";s:55:\"hostinger-easy-onboarding/hostinger-easy-onboarding.php\";}s:11:\"updateClass\";s:50:\"YahnisElsts\\PluginUpdateChecker\\v5p6\\Plugin\\Update\";s:15:\"updateBaseClass\";s:13:\"Plugin\\Update\";}', 'off');
INSERT INTO `wp_options` VALUES (151, 'external_updates-hostinger-ai-assistant', 'O:8:\"stdClass\":5:{s:9:\"lastCheck\";i:1779988886;s:14:\"checkedVersion\";s:6:\"3.0.39\";s:6:\"update\";O:8:\"stdClass\":11:{s:4:\"slug\";s:22:\"hostinger-ai-assistant\";s:7:\"version\";s:6:\"3.0.39\";s:12:\"download_url\";s:86:\"https://wp-update.hostinger.io/?action=download&slug=hostinger-ai-assistant&ver=3.0.39\";s:12:\"translations\";a:0:{}s:2:\"id\";i:0;s:8:\"homepage\";s:21:\"https://hostinger.com\";s:6:\"tested\";s:7:\"6.9.999\";s:12:\"requires_php\";s:3:\"8.0\";s:14:\"upgrade_notice\";N;s:5:\"icons\";a:0:{}s:8:\"filename\";s:49:\"hostinger-ai-assistant/hostinger-ai-assistant.php\";}s:11:\"updateClass\";s:50:\"YahnisElsts\\PluginUpdateChecker\\v5p6\\Plugin\\Update\";s:15:\"updateBaseClass\";s:13:\"Plugin\\Update\";}', 'off');
INSERT INTO `wp_options` VALUES (152, 'hostinger_appearance', 'none', 'off');
INSERT INTO `wp_options` VALUES (155, 'litespeed.conf.hash', 'OxBfHRgwzplRw2ci1fvzaibEqvZoIdHU', 'auto');
INSERT INTO `wp_options` VALUES (156, 'litespeed.conf.api_key', '', 'auto');
INSERT INTO `wp_options` VALUES (157, 'litespeed.conf.auto_upgrade', '', 'auto');
INSERT INTO `wp_options` VALUES (158, 'litespeed.conf.server_ip', '', 'auto');
INSERT INTO `wp_options` VALUES (159, 'litespeed.conf.guest', '', 'auto');
INSERT INTO `wp_options` VALUES (160, 'litespeed.conf.guest_optm', '', 'auto');
INSERT INTO `wp_options` VALUES (161, 'litespeed.conf.news', '1', 'auto');
INSERT INTO `wp_options` VALUES (162, 'litespeed.conf.cache', '1', 'auto');
INSERT INTO `wp_options` VALUES (163, 'litespeed.conf.cache-priv', '1', 'auto');
INSERT INTO `wp_options` VALUES (164, 'litespeed.conf.cache-commenter', '1', 'auto');
INSERT INTO `wp_options` VALUES (165, 'litespeed.conf.cache-rest', '1', 'auto');
INSERT INTO `wp_options` VALUES (166, 'litespeed.conf.cache-page_login', '1', 'auto');
INSERT INTO `wp_options` VALUES (167, 'litespeed.conf.cache-mobile', '', 'auto');
INSERT INTO `wp_options` VALUES (168, 'litespeed.conf.cache-mobile_rules', '[\"Mobile\",\"Android\",\"Silk\\/\",\"Kindle\",\"BlackBerry\",\"Opera Mini\",\"Opera Mobi\"]', 'auto');
INSERT INTO `wp_options` VALUES (169, 'litespeed.conf.cache-browser', '', 'auto');
INSERT INTO `wp_options` VALUES (170, 'litespeed.conf.cache-exc_useragents', '[]', 'auto');
INSERT INTO `wp_options` VALUES (171, 'litespeed.conf.cache-exc_cookies', '[]', 'auto');
INSERT INTO `wp_options` VALUES (172, 'litespeed.conf.cache-exc_qs', '[]', 'auto');
INSERT INTO `wp_options` VALUES (173, 'litespeed.conf.cache-exc_cat', '[]', 'auto');
INSERT INTO `wp_options` VALUES (174, 'litespeed.conf.cache-exc_tag', '[]', 'auto');
INSERT INTO `wp_options` VALUES (175, 'litespeed.conf.cache-force_uri', '[]', 'auto');
INSERT INTO `wp_options` VALUES (176, 'litespeed.conf.cache-force_pub_uri', '[]', 'auto');
INSERT INTO `wp_options` VALUES (177, 'litespeed.conf.cache-priv_uri', '[]', 'auto');
INSERT INTO `wp_options` VALUES (178, 'litespeed.conf.cache-exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (179, 'litespeed.conf.cache-exc_roles', '[]', 'auto');
INSERT INTO `wp_options` VALUES (180, 'litespeed.conf.cache-drop_qs', '[\"fbclid\",\"gclid\",\"utm*\",\"_ga\"]', 'auto');
INSERT INTO `wp_options` VALUES (181, 'litespeed.conf.cache-ttl_pub', '604800', 'auto');
INSERT INTO `wp_options` VALUES (182, 'litespeed.conf.cache-ttl_priv', '1800', 'auto');
INSERT INTO `wp_options` VALUES (183, 'litespeed.conf.cache-ttl_frontpage', '604800', 'auto');
INSERT INTO `wp_options` VALUES (184, 'litespeed.conf.cache-ttl_feed', '604800', 'auto');
INSERT INTO `wp_options` VALUES (185, 'litespeed.conf.cache-ttl_rest', '604800', 'auto');
INSERT INTO `wp_options` VALUES (186, 'litespeed.conf.cache-ttl_browser', '31557600', 'auto');
INSERT INTO `wp_options` VALUES (187, 'litespeed.conf.cache-ttl_status', '[\"404 3600\",\"500 600\"]', 'auto');
INSERT INTO `wp_options` VALUES (188, 'litespeed.conf.cache-login_cookie', '', 'auto');
INSERT INTO `wp_options` VALUES (189, 'litespeed.conf.cache-ajax_ttl', '[]', 'auto');
INSERT INTO `wp_options` VALUES (190, 'litespeed.conf.cache-vary_cookies', '[]', 'auto');
INSERT INTO `wp_options` VALUES (191, 'litespeed.conf.cache-vary_group', '[]', 'auto');
INSERT INTO `wp_options` VALUES (192, 'litespeed.conf.purge-upgrade', '', 'auto');
INSERT INTO `wp_options` VALUES (193, 'litespeed.conf.purge-stale', '', 'auto');
INSERT INTO `wp_options` VALUES (194, 'litespeed.conf.purge-post_all', '', 'auto');
INSERT INTO `wp_options` VALUES (195, 'litespeed.conf.purge-post_f', '1', 'auto');
INSERT INTO `wp_options` VALUES (196, 'litespeed.conf.purge-post_h', '1', 'auto');
INSERT INTO `wp_options` VALUES (197, 'litespeed.conf.purge-post_p', '1', 'auto');
INSERT INTO `wp_options` VALUES (198, 'litespeed.conf.purge-post_pwrp', '1', 'auto');
INSERT INTO `wp_options` VALUES (199, 'litespeed.conf.purge-post_a', '1', 'auto');
INSERT INTO `wp_options` VALUES (200, 'litespeed.conf.purge-post_y', '', 'auto');
INSERT INTO `wp_options` VALUES (201, 'litespeed.conf.purge-post_m', '1', 'auto');
INSERT INTO `wp_options` VALUES (202, 'litespeed.conf.purge-post_d', '', 'auto');
INSERT INTO `wp_options` VALUES (203, 'litespeed.conf.purge-post_t', '1', 'auto');
INSERT INTO `wp_options` VALUES (204, 'litespeed.conf.purge-post_pt', '1', 'auto');
INSERT INTO `wp_options` VALUES (205, 'litespeed.conf.purge-timed_urls', '[]', 'auto');
INSERT INTO `wp_options` VALUES (206, 'litespeed.conf.purge-timed_urls_time', '', 'auto');
INSERT INTO `wp_options` VALUES (207, 'litespeed.conf.purge-hook_all', '[\"switch_theme\",\"wp_create_nav_menu\",\"wp_update_nav_menu\",\"wp_delete_nav_menu\",\"create_term\",\"edit_terms\",\"delete_term\",\"add_link\",\"edit_link\",\"delete_link\"]', 'auto');
INSERT INTO `wp_options` VALUES (208, 'litespeed.conf.esi', '', 'auto');
INSERT INTO `wp_options` VALUES (209, 'litespeed.conf.esi-cache_admbar', '1', 'auto');
INSERT INTO `wp_options` VALUES (210, 'litespeed.conf.esi-cache_commform', '1', 'auto');
INSERT INTO `wp_options` VALUES (211, 'litespeed.conf.esi-nonce', '[\"stats_nonce\",\"subscribe_nonce\"]', 'auto');
INSERT INTO `wp_options` VALUES (212, 'litespeed.conf.util-instant_click', '', 'auto');
INSERT INTO `wp_options` VALUES (213, 'litespeed.conf.util-no_https_vary', '', 'auto');
INSERT INTO `wp_options` VALUES (214, 'litespeed.conf.debug-disable_all', '', 'auto');
INSERT INTO `wp_options` VALUES (215, 'litespeed.conf.debug', '0', 'auto');
INSERT INTO `wp_options` VALUES (216, 'litespeed.conf.debug-ips', '[\"127.0.0.1\"]', 'auto');
INSERT INTO `wp_options` VALUES (217, 'litespeed.conf.debug-level', '', 'auto');
INSERT INTO `wp_options` VALUES (218, 'litespeed.conf.debug-filesize', '3', 'auto');
INSERT INTO `wp_options` VALUES (219, 'litespeed.conf.debug-collapse_qs', '', 'auto');
INSERT INTO `wp_options` VALUES (220, 'litespeed.conf.debug-inc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (221, 'litespeed.conf.debug-exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (222, 'litespeed.conf.debug-exc_strings', '[]', 'auto');
INSERT INTO `wp_options` VALUES (223, 'litespeed.conf.db_optm-revisions_max', '0', 'auto');
INSERT INTO `wp_options` VALUES (224, 'litespeed.conf.db_optm-revisions_age', '0', 'auto');
INSERT INTO `wp_options` VALUES (225, 'litespeed.conf.optm-css_min', '', 'auto');
INSERT INTO `wp_options` VALUES (226, 'litespeed.conf.optm-css_comb', '', 'auto');
INSERT INTO `wp_options` VALUES (227, 'litespeed.conf.optm-css_comb_ext_inl', '1', 'auto');
INSERT INTO `wp_options` VALUES (228, 'litespeed.conf.optm-ucss', '', 'auto');
INSERT INTO `wp_options` VALUES (229, 'litespeed.conf.optm-ucss_inline', '', 'auto');
INSERT INTO `wp_options` VALUES (230, 'litespeed.conf.optm-ucss_whitelist', '[]', 'auto');
INSERT INTO `wp_options` VALUES (231, 'litespeed.conf.optm-ucss_file_exc_inline', '[]', 'auto');
INSERT INTO `wp_options` VALUES (232, 'litespeed.conf.optm-ucss_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (233, 'litespeed.conf.optm-css_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (234, 'litespeed.conf.optm-js_min', '', 'auto');
INSERT INTO `wp_options` VALUES (235, 'litespeed.conf.optm-js_comb', '', 'auto');
INSERT INTO `wp_options` VALUES (236, 'litespeed.conf.optm-js_comb_ext_inl', '1', 'auto');
INSERT INTO `wp_options` VALUES (237, 'litespeed.conf.optm-js_delay_inc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (238, 'litespeed.conf.optm-js_exc', '[\"jquery.js\",\"jquery.min.js\"]', 'auto');
INSERT INTO `wp_options` VALUES (239, 'litespeed.conf.optm-html_min', '', 'auto');
INSERT INTO `wp_options` VALUES (240, 'litespeed.conf.optm-html_lazy', '[]', 'auto');
INSERT INTO `wp_options` VALUES (241, 'litespeed.conf.optm-html_skip_comment', '[]', 'auto');
INSERT INTO `wp_options` VALUES (242, 'litespeed.conf.optm-qs_rm', '', 'auto');
INSERT INTO `wp_options` VALUES (243, 'litespeed.conf.optm-ggfonts_rm', '', 'auto');
INSERT INTO `wp_options` VALUES (244, 'litespeed.conf.optm-css_async', '', 'auto');
INSERT INTO `wp_options` VALUES (245, 'litespeed.conf.optm-ccss_per_url', '', 'auto');
INSERT INTO `wp_options` VALUES (246, 'litespeed.conf.optm-ccss_sep_posttype', '[\"page\"]', 'auto');
INSERT INTO `wp_options` VALUES (247, 'litespeed.conf.optm-ccss_sep_uri', '[]', 'auto');
INSERT INTO `wp_options` VALUES (248, 'litespeed.conf.optm-ccss_whitelist', '[]', 'auto');
INSERT INTO `wp_options` VALUES (249, 'litespeed.conf.optm-css_async_inline', '1', 'auto');
INSERT INTO `wp_options` VALUES (250, 'litespeed.conf.optm-css_font_display', '', 'auto');
INSERT INTO `wp_options` VALUES (251, 'litespeed.conf.optm-js_defer', '0', 'auto');
INSERT INTO `wp_options` VALUES (252, 'litespeed.conf.optm-emoji_rm', '', 'auto');
INSERT INTO `wp_options` VALUES (253, 'litespeed.conf.optm-noscript_rm', '', 'auto');
INSERT INTO `wp_options` VALUES (254, 'litespeed.conf.optm-ggfonts_async', '', 'auto');
INSERT INTO `wp_options` VALUES (255, 'litespeed.conf.optm-exc_roles', '[]', 'auto');
INSERT INTO `wp_options` VALUES (256, 'litespeed.conf.optm-ccss_con', '', 'auto');
INSERT INTO `wp_options` VALUES (257, 'litespeed.conf.optm-js_defer_exc', '[\"jquery.js\",\"jquery.min.js\",\"gtm.js\",\"analytics.js\"]', 'auto');
INSERT INTO `wp_options` VALUES (258, 'litespeed.conf.optm-gm_js_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (259, 'litespeed.conf.optm-dns_prefetch', '[]', 'auto');
INSERT INTO `wp_options` VALUES (260, 'litespeed.conf.optm-dns_prefetch_ctrl', '', 'auto');
INSERT INTO `wp_options` VALUES (261, 'litespeed.conf.optm-dns_preconnect', '[]', 'auto');
INSERT INTO `wp_options` VALUES (262, 'litespeed.conf.optm-exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (263, 'litespeed.conf.optm-guest_only', '1', 'auto');
INSERT INTO `wp_options` VALUES (264, 'litespeed.conf.object', '1', 'auto');
INSERT INTO `wp_options` VALUES (265, 'litespeed.conf.object-kind', '', 'auto');
INSERT INTO `wp_options` VALUES (266, 'litespeed.conf.object-host', '::1', 'auto');
INSERT INTO `wp_options` VALUES (267, 'litespeed.conf.object-port', '11211', 'auto');
INSERT INTO `wp_options` VALUES (268, 'litespeed.conf.object-life', '360', 'auto');
INSERT INTO `wp_options` VALUES (269, 'litespeed.conf.object-persistent', '1', 'auto');
INSERT INTO `wp_options` VALUES (270, 'litespeed.conf.object-admin', '1', 'auto');
INSERT INTO `wp_options` VALUES (271, 'litespeed.conf.object-db_id', '0', 'auto');
INSERT INTO `wp_options` VALUES (272, 'litespeed.conf.object-user', '', 'auto');
INSERT INTO `wp_options` VALUES (273, 'litespeed.conf.object-pswd', '', 'auto');
INSERT INTO `wp_options` VALUES (274, 'litespeed.conf.object-global_groups', '[\"users\",\"userlogins\",\"useremail\",\"userslugs\",\"usermeta\",\"user_meta\",\"site-transient\",\"site-options\",\"site-lookup\",\"site-details\",\"blog-lookup\",\"blog-details\",\"blog-id-cache\",\"rss\",\"global-posts\",\"global-cache-test\"]', 'auto');
INSERT INTO `wp_options` VALUES (275, 'litespeed.conf.object-non_persistent_groups', '[\"comment\",\"counts\",\"plugins\",\"wc_session_id\"]', 'auto');
INSERT INTO `wp_options` VALUES (276, 'litespeed.conf.discuss-avatar_cache', '', 'auto');
INSERT INTO `wp_options` VALUES (277, 'litespeed.conf.discuss-avatar_cron', '', 'auto');
INSERT INTO `wp_options` VALUES (278, 'litespeed.conf.discuss-avatar_cache_ttl', '604800', 'auto');
INSERT INTO `wp_options` VALUES (279, 'litespeed.conf.optm-localize', '', 'auto');
INSERT INTO `wp_options` VALUES (280, 'litespeed.conf.optm-localize_domains', '[\"### Popular scripts ###\",\"https:\\/\\/platform.twitter.com\\/widgets.js\",\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"]', 'auto');
INSERT INTO `wp_options` VALUES (281, 'litespeed.conf.media-lazy', '', 'auto');
INSERT INTO `wp_options` VALUES (282, 'litespeed.conf.media-lazy_placeholder', '', 'auto');
INSERT INTO `wp_options` VALUES (283, 'litespeed.conf.media-placeholder_resp', '', 'auto');
INSERT INTO `wp_options` VALUES (284, 'litespeed.conf.media-placeholder_resp_color', '#cfd4db', 'auto');
INSERT INTO `wp_options` VALUES (285, 'litespeed.conf.media-placeholder_resp_svg', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{width}\" height=\"{height}\" viewBox=\"0 0 {width} {height}\"><rect width=\"100%\" height=\"100%\" style=\"fill:{color};fill-opacity: 0.1;\"/></svg>', 'auto');
INSERT INTO `wp_options` VALUES (286, 'litespeed.conf.media-lqip', '', 'auto');
INSERT INTO `wp_options` VALUES (287, 'litespeed.conf.media-lqip_qual', '4', 'auto');
INSERT INTO `wp_options` VALUES (288, 'litespeed.conf.media-lqip_min_w', '150', 'auto');
INSERT INTO `wp_options` VALUES (289, 'litespeed.conf.media-lqip_min_h', '150', 'auto');
INSERT INTO `wp_options` VALUES (290, 'litespeed.conf.media-placeholder_resp_async', '1', 'auto');
INSERT INTO `wp_options` VALUES (291, 'litespeed.conf.media-iframe_lazy', '', 'auto');
INSERT INTO `wp_options` VALUES (292, 'litespeed.conf.media-add_missing_sizes', '', 'auto');
INSERT INTO `wp_options` VALUES (293, 'litespeed.conf.media-lazy_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (294, 'litespeed.conf.media-lazy_cls_exc', '[\"wmu-preview-img\"]', 'auto');
INSERT INTO `wp_options` VALUES (295, 'litespeed.conf.media-lazy_parent_cls_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (296, 'litespeed.conf.media-iframe_lazy_cls_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (297, 'litespeed.conf.media-iframe_lazy_parent_cls_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (298, 'litespeed.conf.media-lazy_uri_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (299, 'litespeed.conf.media-lqip_exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (300, 'litespeed.conf.media-vpi', '', 'auto');
INSERT INTO `wp_options` VALUES (301, 'litespeed.conf.media-vpi_cron', '', 'auto');
INSERT INTO `wp_options` VALUES (302, 'litespeed.conf.media-auto_rescale_ori', '', 'auto');
INSERT INTO `wp_options` VALUES (303, 'litespeed.conf.img_optm-auto', '', 'auto');
INSERT INTO `wp_options` VALUES (304, 'litespeed.conf.img_optm-ori', '1', 'auto');
INSERT INTO `wp_options` VALUES (305, 'litespeed.conf.img_optm-rm_bkup', '', 'auto');
INSERT INTO `wp_options` VALUES (306, 'litespeed.conf.img_optm-webp', '0', 'auto');
INSERT INTO `wp_options` VALUES (307, 'litespeed.conf.img_optm-lossless', '', 'auto');
INSERT INTO `wp_options` VALUES (308, 'litespeed.conf.img_optm-sizes_skipped', '[]', 'auto');
INSERT INTO `wp_options` VALUES (309, 'litespeed.conf.img_optm-exif', '1', 'auto');
INSERT INTO `wp_options` VALUES (310, 'litespeed.conf.img_optm-webp_attr', '[\"img.src\",\"div.data-thumb\",\"img.data-src\",\"img.data-lazyload\",\"div.data-large_image\",\"img.retina_logo_url\",\"div.data-parallax-image\",\"div.data-vc-parallax-image\",\"video.poster\"]', 'auto');
INSERT INTO `wp_options` VALUES (311, 'litespeed.conf.img_optm-webp_replace_srcset', '', 'auto');
INSERT INTO `wp_options` VALUES (312, 'litespeed.conf.img_optm-jpg_quality', '82', 'auto');
INSERT INTO `wp_options` VALUES (313, 'litespeed.conf.crawler', '', 'auto');
INSERT INTO `wp_options` VALUES (314, 'litespeed.conf.crawler-crawl_interval', '302400', 'auto');
INSERT INTO `wp_options` VALUES (315, 'litespeed.conf.crawler-load_limit', '1', 'auto');
INSERT INTO `wp_options` VALUES (316, 'litespeed.conf.crawler-sitemap', '', 'auto');
INSERT INTO `wp_options` VALUES (317, 'litespeed.conf.crawler-roles', '[]', 'auto');
INSERT INTO `wp_options` VALUES (318, 'litespeed.conf.crawler-cookies', '[]', 'auto');
INSERT INTO `wp_options` VALUES (319, 'litespeed.conf.misc-heartbeat_front', '', 'auto');
INSERT INTO `wp_options` VALUES (320, 'litespeed.conf.misc-heartbeat_front_ttl', '60', 'auto');
INSERT INTO `wp_options` VALUES (321, 'litespeed.conf.misc-heartbeat_back', '', 'auto');
INSERT INTO `wp_options` VALUES (322, 'litespeed.conf.misc-heartbeat_back_ttl', '60', 'auto');
INSERT INTO `wp_options` VALUES (323, 'litespeed.conf.misc-heartbeat_editor', '', 'auto');
INSERT INTO `wp_options` VALUES (324, 'litespeed.conf.misc-heartbeat_editor_ttl', '15', 'auto');
INSERT INTO `wp_options` VALUES (325, 'litespeed.conf.cdn', '', 'auto');
INSERT INTO `wp_options` VALUES (326, 'litespeed.conf.cdn-ori', '[]', 'auto');
INSERT INTO `wp_options` VALUES (327, 'litespeed.conf.cdn-ori_dir', '[\"wp-content\",\"wp-includes\"]', 'auto');
INSERT INTO `wp_options` VALUES (328, 'litespeed.conf.cdn-exc', '[]', 'auto');
INSERT INTO `wp_options` VALUES (329, 'litespeed.conf.cdn-quic', '', 'auto');
INSERT INTO `wp_options` VALUES (330, 'litespeed.conf.cdn-cloudflare', '', 'auto');
INSERT INTO `wp_options` VALUES (331, 'litespeed.conf.cdn-cloudflare_email', '', 'auto');
INSERT INTO `wp_options` VALUES (332, 'litespeed.conf.cdn-cloudflare_key', '', 'auto');
INSERT INTO `wp_options` VALUES (333, 'litespeed.conf.cdn-cloudflare_name', '', 'auto');
INSERT INTO `wp_options` VALUES (334, 'litespeed.conf.cdn-cloudflare_zone', '', 'auto');
INSERT INTO `wp_options` VALUES (335, 'litespeed.conf.cdn-cloudflare_clear', '', 'auto');
INSERT INTO `wp_options` VALUES (336, 'litespeed.conf.cdn-mapping', '[{\"url\":\"\",\"inc_img\":\"1\",\"inc_css\":\"1\",\"inc_js\":\"1\",\"filetype\":[\".aac\",\".css\",\".eot\",\".gif\",\".jpeg\",\".jpg\",\".js\",\".less\",\".mp3\",\".mp4\",\".ogg\",\".otf\",\".pdf\",\".png\",\".svg\",\".ttf\",\".webp\",\".woff\",\".woff2\"]}]', 'auto');
INSERT INTO `wp_options` VALUES (337, 'litespeed.conf.cdn-attr', '[\".src\",\".data-src\",\".href\",\".poster\",\"source.srcset\"]', 'auto');
INSERT INTO `wp_options` VALUES (338, 'litespeed.conf.qc-nameservers', '', 'auto');
INSERT INTO `wp_options` VALUES (339, 'litespeed.conf.qc-cname', '', 'auto');
INSERT INTO `wp_options` VALUES (340, 'litespeed.conf.debug-disable_tmp', '0', 'auto');
INSERT INTO `wp_options` VALUES (341, 'litespeed.cloud._summary', '{\"curr_request.ver_check\":0,\"last_request.ver_check\":1779355687,\"news.utime\":1779865732,\"curr_request.news\":0,\"last_request.news\":1779865732}', 'auto');
INSERT INTO `wp_options` VALUES (342, 'hostinger_subscription_id', 'AzqgaFUvqEr8n25X0', 'on');
INSERT INTO `wp_options` VALUES (343, 'hostinger_hosting_plan', 'hostinger_business_v2', 'on');
INSERT INTO `wp_options` VALUES (344, 'hostinger_client_type', 'pro', 'off');
INSERT INTO `wp_options` VALUES (345, 'recently_activated', 'a:1:{s:35:\"litespeed-cache/litespeed-cache.php\";i:1779355689;}', 'off');
INSERT INTO `wp_options` VALUES (346, 'hostinger_builder_type', 'blank', 'off');
INSERT INTO `wp_options` VALUES (347, 'hostinger_website_id', '5a72bb4d757ff68774ae9ece66d4bbdb', 'off');
INSERT INTO `wp_options` VALUES (348, 'hostinger_created_at', '2026-05-21 09:27:49', 'off');
INSERT INTO `wp_options` VALUES (349, 'hostinger_reseller', 'hostinger.com', 'off');
INSERT INTO `wp_options` VALUES (350, 'hostinger_country', 'PL', 'off');
INSERT INTO `wp_options` VALUES (351, 'hostinger_currency_code', 'USD', 'off');
INSERT INTO `wp_options` VALUES (352, 'litespeed.purge.queue', '-1', 'auto');
INSERT INTO `wp_options` VALUES (353, 'litespeed.purge.queue2', '-1', 'auto');
INSERT INTO `wp_options` VALUES (354, 'hostinger_first_login_at', '2026-05-21 09:28:37', 'auto');
INSERT INTO `wp_options` VALUES (355, 'action_scheduler_lock_async-request-runner', '6a16f31a7cf678.93463915|1779888982', 'no');
INSERT INTO `wp_options` VALUES (356, 'litespeed.admin_display.thirdparty_litespeed_check', '1', 'auto');
INSERT INTO `wp_options` VALUES (357, 'hostinger_onboarding_steps_was_completed', '0', 'auto');
INSERT INTO `wp_options` VALUES (358, 'litespeed.gui.lscwp_whm_install', '-1', 'auto');
INSERT INTO `wp_options` VALUES (359, 'litespeed.gui.dismiss', '-1', 'auto');
INSERT INTO `wp_options` VALUES (360, 'litespeed.data.upgrading', '-1', 'auto');
INSERT INTO `wp_options` VALUES (361, 'litespeed.admin_display.messages', '[\"<div class=\\\"litespeed_icon notice notice-success is-dismissible\\\"><p>Wyczyszczono ca\\u0142\\u0105 pami\\u0119\\u0107 podr\\u0119czn\\u0105 pomy\\u015blnie.<\\/p><\\/div>\"]', 'auto');
INSERT INTO `wp_options` VALUES (362, 'can_compress_scripts', '0', 'on');
INSERT INTO `wp_options` VALUES (364, 'hostinger_onboarding_completed', '1', 'auto');
INSERT INTO `wp_options` VALUES (365, 'theme_mods_twentytwentyfive', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1779355731;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'off');
INSERT INTO `wp_options` VALUES (366, 'current_theme', 'Hostinger AI theme', 'auto');
INSERT INTO `wp_options` VALUES (367, 'theme_mods_hostinger-ai-theme', 'a:3:{s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'on');
INSERT INTO `wp_options` VALUES (368, 'theme_switched', '', 'auto');
INSERT INTO `wp_options` VALUES (369, 'litespeed.optimize.timestamp_purge_css', '1779932443', 'auto');
INSERT INTO `wp_options` VALUES (370, 'puc_external_updates_theme-hostinger-ai-theme', 'O:8:\"stdClass\":5:{s:9:\"lastCheck\";i:1779961364;s:14:\"checkedVersion\";s:6:\"2.0.17\";s:6:\"update\";O:8:\"stdClass\":5:{s:4:\"slug\";s:18:\"hostinger-ai-theme\";s:7:\"version\";s:6:\"2.0.19\";s:12:\"download_url\";s:82:\"https://wp-update.hostinger.io/?action=download&slug=hostinger-ai-theme&ver=2.0.19\";s:12:\"translations\";a:0:{}s:11:\"details_url\";s:21:\"https://hostinger.com\";}s:11:\"updateClass\";s:49:\"YahnisElsts\\PluginUpdateChecker\\v5p6\\Theme\\Update\";s:15:\"updateBaseClass\";s:12:\"Theme\\Update\";}', 'off');
INSERT INTO `wp_options` VALUES (371, 'hostinger_ai_version', '6a0ed05de5fef', 'on');
INSERT INTO `wp_options` VALUES (372, 'hostinger_ai_font', 'Junge, serif', 'auto');
INSERT INTO `wp_options` VALUES (373, 'hostinger_ai_assistant_mcp_jwt_token_registry', 'a:4:{s:32:\"kaMclvSONLnnqi26ORBh8dJbJ9B20mkU\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779355746;s:10:\"expires_at\";i:1779359346;}s:32:\"y8pyNMUQQmZMxSqkR26jfkAeOTvU74IG\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779865711;s:10:\"expires_at\";i:1779869311;}s:32:\"cbbvhhVerNuXmK4JorWz7CCqXZwOYMf2\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779887947;s:10:\"expires_at\";i:1779891547;}s:32:\"j6k9w2raTnt26QwEjsM7IcosLodLCeJJ\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779887954;s:10:\"expires_at\";i:1779891554;}}', 'auto');
INSERT INTO `wp_options` VALUES (374, 'recovery_keys', 'a:0:{}', 'off');
INSERT INTO `wp_options` VALUES (375, 'action_scheduler_migration_status', 'complete', 'auto');
INSERT INTO `wp_options` VALUES (376, 'as_has_wp_comment_logs', 'no', 'on');
INSERT INTO `wp_options` VALUES (378, 'finished_updating_comment_type', '1', 'auto');
INSERT INTO `wp_options` VALUES (379, 'amplitude_event_wordpress.easy_onboarding.enter_2026-05-27', '1779865714', 'no');
INSERT INTO `wp_options` VALUES (380, 'litespeed.gui._summary', '{\"new_version\":1780470532,\"score\":1781075332}', 'auto');
INSERT INTO `wp_options` VALUES (381, 'hostinger_easy_onboarding_steps', 'a:1:{s:13:\"website_setup\";a:1:{s:14:\"connect_domain\";b:1;}}', 'off');
INSERT INTO `wp_options` VALUES (382, 'amplitude_event_wordpress.preview_site_2026-05-27', '1779865817', 'no');
INSERT INTO `wp_options` VALUES (383, 'category_children', 'a:0:{}', 'auto');
INSERT INTO `wp_options` VALUES (384, 'litespeed.conf._version', '7.6.2', 'auto');
INSERT INTO `wp_options` VALUES (385, 'litespeed.conf.guest_uas', '[\"Lighthouse\",\"GTmetrix\",\"Google\",\"Pingdom\",\"bot\",\"spider\",\"PTST\",\"HeadlessChrome\"]', 'auto');
INSERT INTO `wp_options` VALUES (386, 'litespeed.conf.guest_ips', '[\"208.70.247.157\",\"172.255.48.130\",\"172.255.48.131\",\"172.255.48.132\",\"172.255.48.133\",\"172.255.48.134\",\"172.255.48.135\",\"172.255.48.136\",\"172.255.48.137\",\"172.255.48.138\",\"172.255.48.139\",\"172.255.48.140\",\"172.255.48.141\",\"172.255.48.142\",\"172.255.48.143\",\"172.255.48.144\",\"172.255.48.145\",\"172.255.48.146\",\"172.255.48.147\",\"52.229.122.240\",\"104.214.72.101\",\"13.66.7.11\",\"13.85.24.83\",\"13.85.24.90\",\"13.85.82.26\",\"40.74.242.253\",\"40.74.243.13\",\"40.74.243.176\",\"104.214.48.247\",\"157.55.189.189\",\"104.214.110.135\",\"70.37.83.240\",\"65.52.36.250\",\"13.78.216.56\",\"52.162.212.163\",\"23.96.34.105\",\"65.52.113.236\",\"172.255.61.34\",\"172.255.61.35\",\"172.255.61.36\",\"172.255.61.37\",\"172.255.61.38\",\"172.255.61.39\",\"172.255.61.40\",\"104.41.2.19\",\"191.235.98.164\",\"191.235.99.221\",\"191.232.194.51\",\"52.237.235.185\",\"52.237.250.73\",\"52.237.236.145\",\"104.211.143.8\",\"104.211.165.53\",\"52.172.14.87\",\"40.83.89.214\",\"52.175.57.81\",\"20.188.63.151\",\"20.52.36.49\",\"52.246.165.153\",\"51.144.102.233\",\"13.76.97.224\",\"102.133.169.66\",\"52.231.199.170\",\"13.53.162.7\",\"40.123.218.94\"]', 'auto');
INSERT INTO `wp_options` VALUES (387, 'litespeed.conf.object-transients', '1', 'auto');

-- ----------------------------
-- Table structure for wp_options_bckp
-- ----------------------------
DROP TABLE IF EXISTS `wp_options_bckp`;
CREATE TABLE `wp_options_bckp`  (
  `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`) USING BTREE,
  UNIQUE INDEX `option_name`(`option_name` ASC) USING BTREE,
  INDEX `autoload`(`autoload` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 388 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_options_bckp
-- ----------------------------
INSERT INTO `wp_options_bckp` VALUES (1, 'cron', 'a:15:{i:1779999057;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1779999068;a:1:{s:19:\"litespeed_task_lqip\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"litespeed_filter\";s:4:\"args\";a:0:{}s:8:\"interval\";i:60;}}}i:1780000063;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1780003717;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780007262;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780009062;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780010862;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780021090;a:1:{s:48:\"puc_cron_check_updates-hostinger-easy-onboarding\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780025251;a:1:{s:47:\"puc_cron_check_updates_theme-hostinger-ai-theme\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780041248;a:1:{s:45:\"puc_cron_check_updates-hostinger-ai-assistant\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1780046863;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1780046917;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1780565264;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1780565317;a:1:{s:24:\"run_weekly_partner_astra\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on');
INSERT INTO `wp_options_bckp` VALUES (2, 'siteurl', 'https://better.augustyniak.xyz', 'on');
INSERT INTO `wp_options_bckp` VALUES (3, 'home', 'https://better.augustyniak.xyz', 'on');
INSERT INTO `wp_options_bckp` VALUES (4, 'blogname', 'better.augustyniak.xyz', 'on');
INSERT INTO `wp_options_bckp` VALUES (5, 'blogdescription', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (6, 'users_can_register', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (7, 'admin_email', 'jar.augustyniak@gmail.com', 'on');
INSERT INTO `wp_options_bckp` VALUES (8, 'start_of_week', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (9, 'use_balanceTags', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (10, 'use_smilies', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (11, 'require_name_email', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (12, 'comments_notify', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (13, 'posts_per_rss', '10', 'on');
INSERT INTO `wp_options_bckp` VALUES (14, 'rss_use_excerpt', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (15, 'mailserver_url', 'mail.example.com', 'on');
INSERT INTO `wp_options_bckp` VALUES (16, 'mailserver_login', 'login@example.com', 'on');
INSERT INTO `wp_options_bckp` VALUES (17, 'mailserver_pass', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (18, 'mailserver_port', '110', 'on');
INSERT INTO `wp_options_bckp` VALUES (19, 'default_category', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (20, 'default_comment_status', 'open', 'on');
INSERT INTO `wp_options_bckp` VALUES (21, 'default_ping_status', 'open', 'on');
INSERT INTO `wp_options_bckp` VALUES (22, 'default_pingback_flag', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (23, 'posts_per_page', '10', 'on');
INSERT INTO `wp_options_bckp` VALUES (24, 'date_format', 'F j, Y', 'on');
INSERT INTO `wp_options_bckp` VALUES (25, 'time_format', 'g:i a', 'on');
INSERT INTO `wp_options_bckp` VALUES (26, 'links_updated_date_format', 'F j, Y g:i a', 'on');
INSERT INTO `wp_options_bckp` VALUES (27, 'comment_moderation', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (28, 'moderation_notify', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (29, 'permalink_structure', '/%postname%/', 'on');
INSERT INTO `wp_options_bckp` VALUES (30, 'rewrite_rules', 'a:94:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:23:\"index.php?sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'on');
INSERT INTO `wp_options_bckp` VALUES (31, 'hack_file', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (32, 'blog_charset', 'UTF-8', 'on');
INSERT INTO `wp_options_bckp` VALUES (33, 'moderation_keys', '', 'off');
INSERT INTO `wp_options_bckp` VALUES (34, 'active_plugins', 'a:5:{i:0;s:49:\"hostinger-ai-assistant/hostinger-ai-assistant.php\";i:1;s:55:\"hostinger-easy-onboarding/hostinger-easy-onboarding.php\";i:2;s:35:\"hostinger-reach/hostinger-reach.php\";i:3;s:23:\"hostinger/hostinger.php\";i:4;s:35:\"litespeed-cache/litespeed-cache.php\";}', 'on');
INSERT INTO `wp_options_bckp` VALUES (35, 'category_base', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (36, 'ping_sites', 'https://rpc.pingomatic.com/', 'on');
INSERT INTO `wp_options_bckp` VALUES (37, 'comment_max_links', '2', 'on');
INSERT INTO `wp_options_bckp` VALUES (38, 'gmt_offset', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (39, 'default_email_category', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (40, 'recently_edited', '', 'off');
INSERT INTO `wp_options_bckp` VALUES (41, 'template', 'hostinger-ai-theme', 'on');
INSERT INTO `wp_options_bckp` VALUES (42, 'stylesheet', 'hostinger-ai-theme', 'on');
INSERT INTO `wp_options_bckp` VALUES (43, 'comment_registration', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (44, 'html_type', 'text/html', 'on');
INSERT INTO `wp_options_bckp` VALUES (45, 'use_trackback', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (46, 'default_role', 'subscriber', 'on');
INSERT INTO `wp_options_bckp` VALUES (47, 'db_version', '61833', 'on');
INSERT INTO `wp_options_bckp` VALUES (48, 'uploads_use_yearmonth_folders', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (49, 'upload_path', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (50, 'blog_public', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (51, 'default_link_category', '2', 'on');
INSERT INTO `wp_options_bckp` VALUES (52, 'show_on_front', 'posts', 'on');
INSERT INTO `wp_options_bckp` VALUES (53, 'tag_base', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (54, 'show_avatars', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (55, 'avatar_rating', 'G', 'on');
INSERT INTO `wp_options_bckp` VALUES (56, 'upload_url_path', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (57, 'thumbnail_size_w', '150', 'on');
INSERT INTO `wp_options_bckp` VALUES (58, 'thumbnail_size_h', '150', 'on');
INSERT INTO `wp_options_bckp` VALUES (59, 'thumbnail_crop', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (60, 'medium_size_w', '300', 'on');
INSERT INTO `wp_options_bckp` VALUES (61, 'medium_size_h', '300', 'on');
INSERT INTO `wp_options_bckp` VALUES (62, 'avatar_default', 'mystery', 'on');
INSERT INTO `wp_options_bckp` VALUES (63, 'large_size_w', '1024', 'on');
INSERT INTO `wp_options_bckp` VALUES (64, 'large_size_h', '1024', 'on');
INSERT INTO `wp_options_bckp` VALUES (65, 'image_default_link_type', 'none', 'on');
INSERT INTO `wp_options_bckp` VALUES (66, 'image_default_size', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (67, 'image_default_align', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (68, 'close_comments_for_old_posts', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (69, 'close_comments_days_old', '14', 'on');
INSERT INTO `wp_options_bckp` VALUES (70, 'thread_comments', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (71, 'thread_comments_depth', '5', 'on');
INSERT INTO `wp_options_bckp` VALUES (72, 'page_comments', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (73, 'comments_per_page', '50', 'on');
INSERT INTO `wp_options_bckp` VALUES (74, 'default_comments_page', 'newest', 'on');
INSERT INTO `wp_options_bckp` VALUES (75, 'comment_order', 'asc', 'on');
INSERT INTO `wp_options_bckp` VALUES (76, 'sticky_posts', 'a:0:{}', 'on');
INSERT INTO `wp_options_bckp` VALUES (77, 'widget_categories', 'a:0:{}', 'on');
INSERT INTO `wp_options_bckp` VALUES (78, 'widget_text', 'a:0:{}', 'on');
INSERT INTO `wp_options_bckp` VALUES (79, 'widget_rss', 'a:0:{}', 'on');
INSERT INTO `wp_options_bckp` VALUES (80, 'uninstall_plugins', 'a:1:{s:35:\"litespeed-cache/litespeed-cache.php\";s:47:\"LiteSpeed\\Activation::uninstall_litespeed_cache\";}', 'off');
INSERT INTO `wp_options_bckp` VALUES (81, 'timezone_string', '', 'on');
INSERT INTO `wp_options_bckp` VALUES (82, 'page_for_posts', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (83, 'page_on_front', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (84, 'default_post_format', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (85, 'link_manager_enabled', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (86, 'finished_splitting_shared_terms', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (87, 'site_icon', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (88, 'medium_large_size_w', '768', 'on');
INSERT INTO `wp_options_bckp` VALUES (89, 'medium_large_size_h', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (90, 'wp_page_for_privacy_policy', '3', 'on');
INSERT INTO `wp_options_bckp` VALUES (91, 'show_comments_cookies_opt_in', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (92, 'admin_email_lifespan', '1794907662', 'on');
INSERT INTO `wp_options_bckp` VALUES (93, 'disallowed_keys', '', 'off');
INSERT INTO `wp_options_bckp` VALUES (94, 'comment_previously_approved', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off');
INSERT INTO `wp_options_bckp` VALUES (96, 'auto_update_core_dev', 'enabled', 'on');
INSERT INTO `wp_options_bckp` VALUES (97, 'auto_update_core_minor', 'enabled', 'on');
INSERT INTO `wp_options_bckp` VALUES (98, 'auto_update_core_major', 'enabled', 'on');
INSERT INTO `wp_options_bckp` VALUES (99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on');
INSERT INTO `wp_options_bckp` VALUES (100, 'wp_attachment_pages_enabled', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (101, 'wp_notes_notify', '1', 'on');
INSERT INTO `wp_options_bckp` VALUES (102, 'initial_db_version', '61833', 'on');
INSERT INTO `wp_options_bckp` VALUES (103, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'on');
INSERT INTO `wp_options_bckp` VALUES (104, 'fresh_site', '1', 'off');
INSERT INTO `wp_options_bckp` VALUES (105, 'user_count', '1', 'off');
INSERT INTO `wp_options_bckp` VALUES (106, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (107, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (110, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (111, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (112, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (113, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (114, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (115, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (116, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (117, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (118, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (119, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (120, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (121, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (124, 'WPLANG', 'pl_PL', 'auto');
INSERT INTO `wp_options_bckp` VALUES (125, '_site_transient_timeout_wp_theme_files_patterns-f49f810a638bc0cb79712946928815e3', '1779357466', 'off');
INSERT INTO `wp_options_bckp` VALUES (126, '_site_transient_wp_theme_files_patterns-f49f810a638bc0cb79712946928815e3', 'a:2:{s:7:\"version\";s:3:\"1.5\";s:8:\"patterns\";a:98:{s:21:\"banner-about-book.php\";a:4:{s:5:\"title\";s:28:\"Banner with book description\";s:4:\"slug\";s:34:\"twentytwentyfive/banner-about-book\";s:11:\"description\";s:66:\"Banner with book description and accompanying image for promotion.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:28:\"banner-cover-big-heading.php\";a:4:{s:5:\"title\";s:22:\"Cover with big heading\";s:4:\"slug\";s:41:\"twentytwentyfive/banner-cover-big-heading\";s:11:\"description\";s:82:\"A full-width cover section with a large background image and an oversized heading.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}}s:22:\"banner-intro-image.php\";a:4:{s:5:\"title\";s:49:\"Short heading and paragraph and image on the left\";s:4:\"slug\";s:35:\"twentytwentyfive/banner-intro-image\";s:11:\"description\";s:68:\"A Intro pattern with Short heading, paragraph and image on the left.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:16:\"banner-intro.php\";a:4:{s:5:\"title\";s:35:\"Intro with left-aligned description\";s:4:\"slug\";s:29:\"twentytwentyfive/banner-intro\";s:11:\"description\";s:66:\"A large left-aligned heading with a brand name emphasized in bold.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:17:\"banner-poster.php\";a:4:{s:5:\"title\";s:19:\"Poster-like section\";s:4:\"slug\";s:30:\"twentytwentyfive/banner-poster\";s:11:\"description\";s:78:\"A section that can be used as a banner or a landing page to announce an event.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:5:\"media\";}}s:43:\"banner-with-description-and-images-grid.php\";a:4:{s:5:\"title\";s:39:\"Banner with description and images grid\";s:4:\"slug\";s:47:\"twentytwentyfive/banner-description-images-grid\";s:11:\"description\";s:75:\"A banner with a short paragraph, and two images displayed in a grid layout.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:18:\"binding-format.php\";a:4:{s:5:\"title\";s:16:\"Post format name\";s:4:\"slug\";s:31:\"twentytwentyfive/binding-format\";s:11:\"description\";s:75:\"Prints the name of the post format with the help of the Block Bindings API.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:12:\"comments.php\";a:5:{s:5:\"title\";s:8:\"Comments\";s:4:\"slug\";s:25:\"twentytwentyfive/comments\";s:11:\"description\";s:63:\"Comments area with comments list, pagination, and comment form.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:13:\"core/comments\";}}s:32:\"contact-centered-social-link.php\";a:5:{s:5:\"title\";s:30:\"Centered link and social links\";s:4:\"slug\";s:45:\"twentytwentyfive/contact-centered-social-link\";s:11:\"description\";s:73:\"Centered contact section with a prominent message and social media links.\";s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:3:{i:0;s:7:\"contact\";i:1;s:3:\"faq\";i:2;s:9:\"questions\";}}s:26:\"contact-info-locations.php\";a:6:{s:5:\"title\";s:27:\"Contact, info and locations\";s:4:\"slug\";s:39:\"twentytwentyfive/contact-info-locations\";s:11:\"description\";s:78:\"Contact section with social media links, email, and multiple location details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"location\";}}s:29:\"contact-location-and-link.php\";a:4:{s:5:\"title\";s:25:\"Contact location and link\";s:4:\"slug\";s:42:\"twentytwentyfive/contact-location-and-link\";s:11:\"description\";s:89:\"Contact section with a location address, a directions link, and an image of the location.\";s:10:\"categories\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"featured\";}}s:18:\"cta-book-links.php\";a:4:{s:5:\"title\";s:30:\"Call to action with book links\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-book-links\";s:11:\"description\";s:74:\"A call to action section with links to get the book in different websites.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:22:\"cta-book-locations.php\";a:4:{s:5:\"title\";s:29:\"Call to action with locations\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-book-locations\";s:11:\"description\";s:82:\"A call to action section with links to get the book in the most popular locations.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:24:\"cta-centered-heading.php\";a:4:{s:5:\"title\";s:16:\"Centered heading\";s:4:\"slug\";s:37:\"twentytwentyfive/cta-centered-heading\";s:11:\"description\";s:53:\"A hero with a centered heading, paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:19:\"cta-events-list.php\";a:4:{s:5:\"title\";s:11:\"Events list\";s:4:\"slug\";s:32:\"twentytwentyfive/cta-events-list\";s:11:\"description\";s:37:\"A list of events with call to action.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:26:\"cta-grid-products-link.php\";a:5:{s:5:\"title\";s:54:\"Call to action with grid layout with products and link\";s:4:\"slug\";s:39:\"twentytwentyfive/cta-grid-products-link\";s:11:\"description\";s:42:\"A call to action featuring product images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"featured\";}}s:22:\"cta-heading-search.php\";a:4:{s:5:\"title\";s:23:\"Heading and search form\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-heading-search\";s:11:\"description\";s:54:\"Large heading with a search form for quick navigation.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:18:\"cta-newsletter.php\";a:5:{s:5:\"title\";s:18:\"Newsletter sign-up\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-newsletter\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:10:\"newsletter\";}}s:15:\"event-3-col.php\";a:5:{s:5:\"title\";s:46:\"Events, 3 columns with event images and titles\";s:4:\"slug\";s:28:\"twentytwentyfive/event-3-col\";s:11:\"description\";s:95:\"A header with title and text and three columns that show 3 events with their images and titles.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:6:\"events\";i:1;s:7:\"columns\";i:2;s:6:\"images\";}}s:14:\"event-rsvp.php\";a:7:{s:5:\"title\";s:10:\"Event RSVP\";s:4:\"slug\";s:27:\"twentytwentyfive/event-rsvp\";s:11:\"description\";s:64:\"RSVP for an upcoming event with a cover image and event details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:4:\"rsvp\";i:2;s:5:\"event\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:18:\"event-schedule.php\";a:5:{s:5:\"title\";s:14:\"Event schedule\";s:4:\"slug\";s:31:\"twentytwentyfive/event-schedule\";s:11:\"description\";s:54:\"A section with specified dates and times for an event.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}s:8:\"keywords\";a:4:{i:0;s:6:\"events\";i:1;s:6:\"agenda\";i:2;s:8:\"schedule\";i:3;s:8:\"lectures\";}}s:19:\"footer-centered.php\";a:5:{s:5:\"title\";s:15:\"Centered footer\";s:4:\"slug\";s:32:\"twentytwentyfive/footer-centered\";s:11:\"description\";s:44:\"Footer with centered site title and tagline.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:18:\"footer-columns.php\";a:5:{s:5:\"title\";s:19:\"Footer with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/footer-columns\";s:11:\"description\";s:45:\"Footer columns with title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:21:\"footer-newsletter.php\";a:5:{s:5:\"title\";s:29:\"Footer with newsletter signup\";s:4:\"slug\";s:34:\"twentytwentyfive/footer-newsletter\";s:11:\"description\";s:51:\"Footer with large site title and newsletter signup.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:17:\"footer-social.php\";a:5:{s:5:\"title\";s:33:\"Centered footer with social links\";s:4:\"slug\";s:30:\"twentytwentyfive/footer-social\";s:11:\"description\";s:49:\"Footer with centered site title and social links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:10:\"footer.php\";a:5:{s:5:\"title\";s:6:\"Footer\";s:4:\"slug\";s:23:\"twentytwentyfive/footer\";s:11:\"description\";s:51:\"Footer columns with logo, title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:16:\"format-audio.php\";a:4:{s:5:\"title\";s:12:\"Audio format\";s:4:\"slug\";s:29:\"twentytwentyfive/format-audio\";s:11:\"description\";s:73:\"An audio post format with an image, title, audio player, and description.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"format-link.php\";a:4:{s:5:\"title\";s:11:\"Link format\";s:4:\"slug\";s:28:\"twentytwentyfive/format-link\";s:11:\"description\";s:77:\"A link post format with a description and an emphasized link for key content.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"grid-videos.php\";a:4:{s:5:\"title\";s:16:\"Grid with videos\";s:4:\"slug\";s:28:\"twentytwentyfive/grid-videos\";s:11:\"description\";s:19:\"A grid with videos.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:24:\"grid-with-categories.php\";a:5:{s:5:\"title\";s:20:\"Grid with categories\";s:4:\"slug\";s:37:\"twentytwentyfive/grid-with-categories\";s:11:\"description\";s:41:\"A grid section with different categories.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:19:\"header-centered.php\";a:5:{s:5:\"title\";s:20:\"Centered site header\";s:4:\"slug\";s:32:\"twentytwentyfive/header-centered\";s:11:\"description\";s:52:\"Site header with centered site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:18:\"header-columns.php\";a:5:{s:5:\"title\";s:19:\"Header with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/header-columns\";s:11:\"description\";s:54:\"Site header with site title and navigation in columns.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:22:\"header-large-title.php\";a:5:{s:5:\"title\";s:23:\"Header with large title\";s:4:\"slug\";s:35:\"twentytwentyfive/header-large-title\";s:11:\"description\";s:63:\"Site header with large site title and right-aligned navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:10:\"header.php\";a:5:{s:5:\"title\";s:6:\"Header\";s:4:\"slug\";s:23:\"twentytwentyfive/header\";s:11:\"description\";s:43:\"Site header with site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:36:\"heading-and-paragraph-with-image.php\";a:4:{s:5:\"title\";s:45:\"Heading and paragraph with image on the right\";s:4:\"slug\";s:49:\"twentytwentyfive/heading-and-paragraph-with-image\";s:11:\"description\";s:89:\"A two-column section with a heading and paragraph on the left, and an image on the right.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:13:\"hero-book.php\";a:5:{s:5:\"title\";s:9:\"Hero book\";s:4:\"slug\";s:26:\"twentytwentyfive/hero-book\";s:11:\"description\";s:66:\"A hero section for the book with a description and pre-order link.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:25:\"hero-full-width-image.php\";a:4:{s:5:\"title\";s:22:\"Hero, full width image\";s:4:\"slug\";s:38:\"twentytwentyfive/hero-full-width-image\";s:11:\"description\";s:68:\"A hero with a full width image, heading, short paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:41:\"hero-overlapped-book-cover-with-links.php\";a:4:{s:5:\"title\";s:38:\"Hero, overlapped book cover with links\";s:4:\"slug\";s:54:\"twentytwentyfive/hero-overlapped-book-cover-with-links\";s:11:\"description\";s:47:\"A hero with an overlapped book cover and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:16:\"hero-podcast.php\";a:5:{s:5:\"title\";s:12:\"Hero podcast\";s:4:\"slug\";s:29:\"twentytwentyfive/hero-podcast\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:14:\"hidden-404.php\";a:4:{s:5:\"title\";s:3:\"404\";s:4:\"slug\";s:27:\"twentytwentyfive/hidden-404\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"hidden-blog-heading.php\";a:4:{s:5:\"title\";s:19:\"Hidden blog heading\";s:4:\"slug\";s:36:\"twentytwentyfive/hidden-blog-heading\";s:11:\"description\";s:52:\"Hidden heading for the home page and index template.\";s:8:\"inserter\";b:0;}s:17:\"hidden-search.php\";a:4:{s:5:\"title\";s:6:\"Search\";s:4:\"slug\";s:30:\"twentytwentyfive/hidden-search\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:18:\"hidden-sidebar.php\";a:4:{s:5:\"title\";s:7:\"Sidebar\";s:4:\"slug\";s:31:\"twentytwentyfive/hidden-sidebar\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:21:\"hidden-written-by.php\";a:4:{s:5:\"title\";s:10:\"Written by\";s:4:\"slug\";s:34:\"twentytwentyfive/hidden-written-by\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:9:\"logos.php\";a:4:{s:5:\"title\";s:5:\"Logos\";s:4:\"slug\";s:22:\"twentytwentyfive/logos\";s:11:\"description\";s:77:\"Showcasing the podcast\'s clients with a heading and a series of client logos.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:24:\"media-instagram-grid.php\";a:5:{s:5:\"title\";s:14:\"Instagram grid\";s:4:\"slug\";s:37:\"twentytwentyfive/media-instagram-grid\";s:11:\"description\";s:62:\"A grid section with photos and a link to an Instagram profile.\";s:13:\"viewportWidth\";i:1440;s:10:\"categories\";a:3:{i:0;s:5:\"media\";i:1;s:7:\"gallery\";i:2;s:8:\"featured\";}}s:14:\"more-posts.php\";a:5:{s:5:\"title\";s:10:\"More posts\";s:4:\"slug\";s:27:\"twentytwentyfive/more-posts\";s:11:\"description\";s:45:\"Displays a list of posts with title and date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:21:\"overlapped-images.php\";a:4:{s:5:\"title\";s:41:\"Overlapping images and paragraph on right\";s:4:\"slug\";s:34:\"twentytwentyfive/overlapped-images\";s:11:\"description\";s:53:\"A section with overlapping images, and a description.\";s:10:\"categories\";a:2:{i:0;s:5:\"about\";i:1;s:8:\"featured\";}}s:22:\"page-business-home.php\";a:8:{s:5:\"title\";s:17:\"Business homepage\";s:4:\"slug\";s:35:\"twentytwentyfive/page-business-home\";s:11:\"description\";s:28:\"A business homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:20:\"page-coming-soon.php\";a:8:{s:5:\"title\";s:11:\"Coming soon\";s:4:\"slug\";s:33:\"twentytwentyfive/page-coming-soon\";s:11:\"description\";s:96:\"A full-width cover banner that can be applied to a page or it can work as a single landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:15:\"page-cv-bio.php\";a:7:{s:5:\"title\";s:6:\"CV/bio\";s:4:\"slug\";s:28:\"twentytwentyfive/page-cv-bio\";s:11:\"description\";s:36:\"A pattern for a CV/Bio landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:21:\"page-landing-book.php\";a:8:{s:5:\"title\";s:21:\"Landing page for book\";s:4:\"slug\";s:34:\"twentytwentyfive/page-landing-book\";s:11:\"description\";s:104:\"A landing page for the book with a hero section, pre-order links, locations, FAQs and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:22:\"page-landing-event.php\";a:8:{s:5:\"title\";s:22:\"Landing page for event\";s:4:\"slug\";s:35:\"twentytwentyfive/page-landing-event\";s:11:\"description\";s:87:\"A landing page for the event with a hero section, description, FAQs and call to action.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:24:\"page-landing-podcast.php\";a:8:{s:5:\"title\";s:24:\"Landing page for podcast\";s:4:\"slug\";s:37:\"twentytwentyfive/page-landing-podcast\";s:11:\"description\";s:111:\"A landing page for the podcast with a hero section, description, logos, grid with videos and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:50:\"page-link-in-bio-heading-paragraph-links-image.php\";a:7:{s:5:\"title\";s:59:\"Link in bio heading, paragraph, links and full-height image\";s:4:\"slug\";s:63:\"twentytwentyfive/page-link-in-bio-heading-paragraph-links-image\";s:11:\"description\";s:84:\"A link in bio landing page with a heading, paragraph, links and a full height image.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:33:\"page-link-in-bio-wide-margins.php\";a:7:{s:5:\"title\";s:48:\"Link in bio with profile, links and wide margins\";s:4:\"slug\";s:46:\"twentytwentyfive/page-link-in-bio-wide-margins\";s:11:\"description\";s:86:\"A link in bio landing page with social links, a profile photo and a brief description.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:39:\"page-link-in-bio-with-tight-margins.php\";a:8:{s:5:\"title\";s:30:\"Link in bio with tight margins\";s:4:\"slug\";s:52:\"twentytwentyfive/page-link-in-bio-with-tight-margins\";s:11:\"description\";s:90:\"A full-width, full-height link in bio section with an image, a paragraph and social links.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:23:\"page-portfolio-home.php\";a:8:{s:5:\"title\";s:18:\"Portfolio homepage\";s:4:\"slug\";s:36:\"twentytwentyfive/page-portfolio-home\";s:11:\"description\";s:29:\"A portfolio homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"posts\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:18:\"page-shop-home.php\";a:8:{s:5:\"title\";s:13:\"Shop homepage\";s:4:\"slug\";s:31:\"twentytwentyfive/page-shop-home\";s:11:\"description\";s:24:\"A shop homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:21:\"twentytwentyfive_page\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:19:\"post-navigation.php\";a:5:{s:5:\"title\";s:15:\"Post navigation\";s:4:\"slug\";s:32:\"twentytwentyfive/post-navigation\";s:11:\"description\";s:29:\"Next and previous post links.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/post-navigation-link\";}}s:17:\"pricing-2-col.php\";a:5:{s:5:\"title\";s:18:\"Pricing, 2 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-2-col\";s:11:\"description\";s:88:\"Pricing section with two columns, pricing plan, description, and call-to-action buttons.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:17:\"pricing-3-col.php\";a:4:{s:5:\"title\";s:18:\"Pricing, 3 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-3-col\";s:11:\"description\";s:100:\"A three-column boxed pricing table designed to showcase services, descriptions, and pricing options.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:18:\"services-3-col.php\";a:4:{s:5:\"title\";s:19:\"Services, 3 columns\";s:4:\"slug\";s:31:\"twentytwentyfive/services-3-col\";s:11:\"description\";s:56:\"Three columns with images and text to showcase services.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:36:\"services-subscriber-only-section.php\";a:4:{s:5:\"title\";s:33:\"Services, subscriber only section\";s:4:\"slug\";s:49:\"twentytwentyfive/services-subscriber-only-section\";s:11:\"description\";s:72:\"A subscriber-only section highlighting exclusive services and offerings.\";s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"services\";}}s:24:\"services-team-photos.php\";a:4:{s:5:\"title\";s:21:\"Services, team photos\";s:4:\"slug\";s:37:\"twentytwentyfive/services-team-photos\";s:11:\"description\";s:59:\"Display team photos in a services section with grid layout.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:14:\"call-to-action\";i:2;s:8:\"featured\";}}s:37:\"template-404-vertical-header-blog.php\";a:5:{s:5:\"title\";s:17:\"Right-aligned 404\";s:4:\"slug\";s:50:\"twentytwentyfive/template-404-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:3:\"404\";}}s:30:\"template-archive-news-blog.php\";a:6:{s:5:\"title\";s:17:\"News blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:31:\"template-archive-photo-blog.php\";a:6:{s:5:\"title\";s:18:\"Photo blog archive\";s:4:\"slug\";s:44:\"twentytwentyfive/template-archive-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:30:\"template-archive-text-blog.php\";a:6:{s:5:\"title\";s:17:\"Text blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:41:\"template-archive-vertical-header-blog.php\";a:6:{s:5:\"title\";s:21:\"Right-aligned archive\";s:4:\"slug\";s:54:\"twentytwentyfive/template-archive-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:27:\"template-home-news-blog.php\";a:6:{s:5:\"title\";s:14:\"News blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-home-photo-blog.php\";a:6:{s:5:\"title\";s:15:\"Photo blog home\";s:4:\"slug\";s:41:\"twentytwentyfive/template-home-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:38:\"template-home-posts-grid-news-blog.php\";a:5:{s:5:\"title\";s:34:\"News blog with featured posts grid\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-posts-grid-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:27:\"template-home-text-blog.php\";a:6:{s:5:\"title\";s:14:\"Text blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:10:\"front-page\";i:1;s:4:\"home\";}}s:38:\"template-home-vertical-header-blog.php\";a:6:{s:5:\"title\";s:18:\"Right-aligned home\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:40:\"template-home-with-sidebar-news-blog.php\";a:6:{s:5:\"title\";s:22:\"News blog with sidebar\";s:4:\"slug\";s:53:\"twentytwentyfive/template-home-with-sidebar-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-page-photo-blog.php\";a:5:{s:5:\"title\";s:15:\"Photo blog page\";s:4:\"slug\";s:41:\"twentytwentyfive/template-page-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:38:\"template-page-vertical-header-blog.php\";a:5:{s:5:\"title\";s:18:\"Right-aligned page\";s:4:\"slug\";s:51:\"twentytwentyfive/template-page-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:33:\"template-query-loop-news-blog.php\";a:4:{s:5:\"title\";s:20:\"News blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:34:\"template-query-loop-photo-blog.php\";a:6:{s:5:\"title\";s:16:\"Photo blog posts\";s:4:\"slug\";s:47:\"twentytwentyfive/template-query-loop-photo-blog\";s:11:\"description\";s:54:\"A list of posts, 3 columns, with only featured images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:33:\"template-query-loop-text-blog.php\";a:4:{s:5:\"title\";s:20:\"Text blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-text-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:44:\"template-query-loop-vertical-header-blog.php\";a:4:{s:5:\"title\";s:24:\"Right-aligned query loop\";s:4:\"slug\";s:57:\"twentytwentyfive/template-query-loop-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"template-query-loop.php\";a:5:{s:5:\"title\";s:23:\"List of posts, 1 column\";s:4:\"slug\";s:36:\"twentytwentyfive/template-query-loop\";s:11:\"description\";s:61:\"A list of posts, 1 column, with featured image and post date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:29:\"template-search-news-blog.php\";a:6:{s:5:\"title\";s:24:\"News blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:30:\"template-search-photo-blog.php\";a:6:{s:5:\"title\";s:25:\"Photo blog search results\";s:4:\"slug\";s:43:\"twentytwentyfive/template-search-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:29:\"template-search-text-blog.php\";a:6:{s:5:\"title\";s:24:\"Text blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-search-vertical-header-blog.php\";a:6:{s:5:\"title\";s:26:\"Right-aligned blog, search\";s:4:\"slug\";s:53:\"twentytwentyfive/template-search-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-single-left-aligned-content.php\";a:6:{s:5:\"title\";s:30:\"Post with left-aligned content\";s:4:\"slug\";s:47:\"twentytwentyfive/post-with-left-aligned-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-news-blog.php\";a:6:{s:5:\"title\";s:34:\"News blog single post with sidebar\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:26:\"template-single-offset.php\";a:6:{s:5:\"title\";s:34:\"Offset post without featured image\";s:4:\"slug\";s:39:\"twentytwentyfive/template-single-offset\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:30:\"template-single-photo-blog.php\";a:6:{s:5:\"title\";s:22:\"Photo blog single post\";s:4:\"slug\";s:43:\"twentytwentyfive/template-single-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-text-blog.php\";a:6:{s:5:\"title\";s:21:\"Text blog single post\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:40:\"template-single-vertical-header-blog.php\";a:6:{s:5:\"title\";s:25:\"Right-aligned single post\";s:4:\"slug\";s:53:\"twentytwentyfive/template-single-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:22:\"testimonials-2-col.php\";a:5:{s:5:\"title\";s:21:\"2 columns with avatar\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-2-col\";s:11:\"description\";s:42:\"Two columns with testimonials and avatars.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-6-col.php\";a:5:{s:5:\"title\";s:35:\"3 column layout with 6 testimonials\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-6-col\";s:11:\"description\";s:86:\"A section with three columns and two rows, each containing a testimonial and citation.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-large.php\";a:5:{s:5:\"title\";s:32:\"Review with large image on right\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-large\";s:11:\"description\";s:46:\"A testimonial with a large image on the right.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:13:\"text-faqs.php\";a:6:{s:5:\"title\";s:4:\"FAQs\";s:4:\"slug\";s:26:\"twentytwentyfive/text-faqs\";s:11:\"description\";s:68:\"A FAQs section with a FAQ heading and list of questions and answers.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:4:\"text\";i:1;s:5:\"about\";}s:8:\"keywords\";a:5:{i:0;s:3:\"faq\";i:1;s:5:\"about\";i:2;s:10:\"frequently\";i:3;s:5:\"asked\";i:4;s:9:\"questions\";}}s:19:\"vertical-header.php\";a:6:{s:5:\"title\";s:20:\"Vertical site header\";s:4:\"slug\";s:32:\"twentytwentyfive/vertical-header\";s:11:\"description\";s:52:\"Vertical site header with site title and navigation.\";s:13:\"viewportWidth\";i:300;s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:34:\"core/template-part/vertical-header\";}}}}', 'off');
INSERT INTO `wp_options_bckp` VALUES (127, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:63:\"https://downloads.wordpress.org/release/pl_PL/wordpress-7.0.zip\";s:6:\"locale\";s:5:\"pl_PL\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:63:\"https://downloads.wordpress.org/release/pl_PL/wordpress-7.0.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"7.0\";s:7:\"version\";s:3:\"7.0\";s:11:\"php_version\";s:3:\"7.4\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1779355671;s:15:\"version_checked\";s:3:\"7.0\";s:12:\"translations\";a:0:{}}', 'off');
INSERT INTO `wp_options_bckp` VALUES (129, '_site_transient_timeout_theme_roots', '1779357471', 'off');
INSERT INTO `wp_options_bckp` VALUES (130, '_site_transient_theme_roots', 'a:3:{s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}', 'off');
INSERT INTO `wp_options_bckp` VALUES (131, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1779355687;s:7:\"checked\";a:3:{s:16:\"twentytwentyfive\";s:3:\"1.5\";s:16:\"twentytwentyfour\";s:3:\"1.5\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.5.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.5.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:16:\"twentytwentyfive\";s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"1.5\";s:7:\"updated\";s:19:\"2025-08-25 15:59:32\";s:7:\"package\";s:80:\"https://downloads.wordpress.org/translation/theme/twentytwentyfive/1.5/pl_PL.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:17:\"twentytwentythree\";s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"1.6\";s:7:\"updated\";s:19:\"2024-11-14 06:20:13\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/theme/twentytwentythree/1.6/pl_PL.zip\";s:10:\"autoupdate\";b:1;}}}', 'off');
INSERT INTO `wp_options_bckp` VALUES (133, 'optin_monster_api_activation_redirect_disabled', 'true', 'auto');
INSERT INTO `wp_options_bckp` VALUES (134, 'wpforms_activation_redirect', 'true', 'auto');
INSERT INTO `wp_options_bckp` VALUES (135, 'aioseo_activation_redirect', 'false', 'auto');
INSERT INTO `wp_options_bckp` VALUES (136, 'hts_new_installation', 'new', 'auto');
INSERT INTO `wp_options_bckp` VALUES (138, 'hostinger_show_onboarding', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (140, 'action_scheduler_hybrid_store_demarkation', '4', 'auto');
INSERT INTO `wp_options_bckp` VALUES (141, 'schema-ActionScheduler_StoreSchema', '8.0.1779355677', 'auto');
INSERT INTO `wp_options_bckp` VALUES (142, 'schema-ActionScheduler_LoggerSchema', '3.0.1779355677', 'auto');
INSERT INTO `wp_options_bckp` VALUES (145, 'hostinger_tools', 'a:8:{s:16:\"maintenance_mode\";b:0;s:11:\"bypass_code\";s:16:\"GeUXaUZozHeXWdVA\";s:15:\"disable_xml_rpc\";b:0;s:11:\"force_https\";b:0;s:9:\"force_www\";b:0;s:31:\"disable_authentication_password\";b:0;s:15:\"enable_llms_txt\";b:0;s:9:\"optin_mcp\";b:0;}', 'off');
INSERT INTO `wp_options_bckp` VALUES (149, 'hostinger-reach-db-version', '1.2.1', 'off');
INSERT INTO `wp_options_bckp` VALUES (150, 'external_updates-hostinger-easy-onboarding', 'O:8:\"stdClass\":5:{s:9:\"lastCheck\";i:1779982462;s:14:\"checkedVersion\";s:6:\"2.1.23\";s:6:\"update\";O:8:\"stdClass\":11:{s:4:\"slug\";s:25:\"hostinger-easy-onboarding\";s:7:\"version\";s:6:\"2.1.23\";s:12:\"download_url\";s:89:\"https://wp-update.hostinger.io/?action=download&slug=hostinger-easy-onboarding&ver=2.1.23\";s:12:\"translations\";a:0:{}s:2:\"id\";i:0;s:8:\"homepage\";s:21:\"https://hostinger.com\";s:6:\"tested\";s:7:\"6.9.999\";s:12:\"requires_php\";s:3:\"8.0\";s:14:\"upgrade_notice\";N;s:5:\"icons\";a:0:{}s:8:\"filename\";s:55:\"hostinger-easy-onboarding/hostinger-easy-onboarding.php\";}s:11:\"updateClass\";s:50:\"YahnisElsts\\PluginUpdateChecker\\v5p6\\Plugin\\Update\";s:15:\"updateBaseClass\";s:13:\"Plugin\\Update\";}', 'off');
INSERT INTO `wp_options_bckp` VALUES (151, 'external_updates-hostinger-ai-assistant', 'O:8:\"stdClass\":5:{s:9:\"lastCheck\";i:1779988886;s:14:\"checkedVersion\";s:6:\"3.0.39\";s:6:\"update\";O:8:\"stdClass\":11:{s:4:\"slug\";s:22:\"hostinger-ai-assistant\";s:7:\"version\";s:6:\"3.0.39\";s:12:\"download_url\";s:86:\"https://wp-update.hostinger.io/?action=download&slug=hostinger-ai-assistant&ver=3.0.39\";s:12:\"translations\";a:0:{}s:2:\"id\";i:0;s:8:\"homepage\";s:21:\"https://hostinger.com\";s:6:\"tested\";s:7:\"6.9.999\";s:12:\"requires_php\";s:3:\"8.0\";s:14:\"upgrade_notice\";N;s:5:\"icons\";a:0:{}s:8:\"filename\";s:49:\"hostinger-ai-assistant/hostinger-ai-assistant.php\";}s:11:\"updateClass\";s:50:\"YahnisElsts\\PluginUpdateChecker\\v5p6\\Plugin\\Update\";s:15:\"updateBaseClass\";s:13:\"Plugin\\Update\";}', 'off');
INSERT INTO `wp_options_bckp` VALUES (152, 'hostinger_appearance', 'none', 'off');
INSERT INTO `wp_options_bckp` VALUES (155, 'litespeed.conf.hash', 'OxBfHRgwzplRw2ci1fvzaibEqvZoIdHU', 'auto');
INSERT INTO `wp_options_bckp` VALUES (156, 'litespeed.conf.api_key', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (157, 'litespeed.conf.auto_upgrade', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (158, 'litespeed.conf.server_ip', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (159, 'litespeed.conf.guest', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (160, 'litespeed.conf.guest_optm', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (161, 'litespeed.conf.news', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (162, 'litespeed.conf.cache', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (163, 'litespeed.conf.cache-priv', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (164, 'litespeed.conf.cache-commenter', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (165, 'litespeed.conf.cache-rest', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (166, 'litespeed.conf.cache-page_login', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (167, 'litespeed.conf.cache-mobile', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (168, 'litespeed.conf.cache-mobile_rules', '[\"Mobile\",\"Android\",\"Silk\\/\",\"Kindle\",\"BlackBerry\",\"Opera Mini\",\"Opera Mobi\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (169, 'litespeed.conf.cache-browser', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (170, 'litespeed.conf.cache-exc_useragents', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (171, 'litespeed.conf.cache-exc_cookies', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (172, 'litespeed.conf.cache-exc_qs', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (173, 'litespeed.conf.cache-exc_cat', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (174, 'litespeed.conf.cache-exc_tag', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (175, 'litespeed.conf.cache-force_uri', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (176, 'litespeed.conf.cache-force_pub_uri', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (177, 'litespeed.conf.cache-priv_uri', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (178, 'litespeed.conf.cache-exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (179, 'litespeed.conf.cache-exc_roles', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (180, 'litespeed.conf.cache-drop_qs', '[\"fbclid\",\"gclid\",\"utm*\",\"_ga\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (181, 'litespeed.conf.cache-ttl_pub', '604800', 'auto');
INSERT INTO `wp_options_bckp` VALUES (182, 'litespeed.conf.cache-ttl_priv', '1800', 'auto');
INSERT INTO `wp_options_bckp` VALUES (183, 'litespeed.conf.cache-ttl_frontpage', '604800', 'auto');
INSERT INTO `wp_options_bckp` VALUES (184, 'litespeed.conf.cache-ttl_feed', '604800', 'auto');
INSERT INTO `wp_options_bckp` VALUES (185, 'litespeed.conf.cache-ttl_rest', '604800', 'auto');
INSERT INTO `wp_options_bckp` VALUES (186, 'litespeed.conf.cache-ttl_browser', '31557600', 'auto');
INSERT INTO `wp_options_bckp` VALUES (187, 'litespeed.conf.cache-ttl_status', '[\"404 3600\",\"500 600\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (188, 'litespeed.conf.cache-login_cookie', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (189, 'litespeed.conf.cache-ajax_ttl', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (190, 'litespeed.conf.cache-vary_cookies', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (191, 'litespeed.conf.cache-vary_group', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (192, 'litespeed.conf.purge-upgrade', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (193, 'litespeed.conf.purge-stale', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (194, 'litespeed.conf.purge-post_all', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (195, 'litespeed.conf.purge-post_f', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (196, 'litespeed.conf.purge-post_h', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (197, 'litespeed.conf.purge-post_p', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (198, 'litespeed.conf.purge-post_pwrp', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (199, 'litespeed.conf.purge-post_a', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (200, 'litespeed.conf.purge-post_y', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (201, 'litespeed.conf.purge-post_m', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (202, 'litespeed.conf.purge-post_d', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (203, 'litespeed.conf.purge-post_t', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (204, 'litespeed.conf.purge-post_pt', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (205, 'litespeed.conf.purge-timed_urls', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (206, 'litespeed.conf.purge-timed_urls_time', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (207, 'litespeed.conf.purge-hook_all', '[\"switch_theme\",\"wp_create_nav_menu\",\"wp_update_nav_menu\",\"wp_delete_nav_menu\",\"create_term\",\"edit_terms\",\"delete_term\",\"add_link\",\"edit_link\",\"delete_link\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (208, 'litespeed.conf.esi', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (209, 'litespeed.conf.esi-cache_admbar', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (210, 'litespeed.conf.esi-cache_commform', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (211, 'litespeed.conf.esi-nonce', '[\"stats_nonce\",\"subscribe_nonce\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (212, 'litespeed.conf.util-instant_click', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (213, 'litespeed.conf.util-no_https_vary', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (214, 'litespeed.conf.debug-disable_all', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (215, 'litespeed.conf.debug', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (216, 'litespeed.conf.debug-ips', '[\"127.0.0.1\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (217, 'litespeed.conf.debug-level', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (218, 'litespeed.conf.debug-filesize', '3', 'auto');
INSERT INTO `wp_options_bckp` VALUES (219, 'litespeed.conf.debug-collapse_qs', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (220, 'litespeed.conf.debug-inc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (221, 'litespeed.conf.debug-exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (222, 'litespeed.conf.debug-exc_strings', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (223, 'litespeed.conf.db_optm-revisions_max', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (224, 'litespeed.conf.db_optm-revisions_age', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (225, 'litespeed.conf.optm-css_min', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (226, 'litespeed.conf.optm-css_comb', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (227, 'litespeed.conf.optm-css_comb_ext_inl', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (228, 'litespeed.conf.optm-ucss', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (229, 'litespeed.conf.optm-ucss_inline', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (230, 'litespeed.conf.optm-ucss_whitelist', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (231, 'litespeed.conf.optm-ucss_file_exc_inline', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (232, 'litespeed.conf.optm-ucss_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (233, 'litespeed.conf.optm-css_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (234, 'litespeed.conf.optm-js_min', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (235, 'litespeed.conf.optm-js_comb', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (236, 'litespeed.conf.optm-js_comb_ext_inl', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (237, 'litespeed.conf.optm-js_delay_inc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (238, 'litespeed.conf.optm-js_exc', '[\"jquery.js\",\"jquery.min.js\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (239, 'litespeed.conf.optm-html_min', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (240, 'litespeed.conf.optm-html_lazy', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (241, 'litespeed.conf.optm-html_skip_comment', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (242, 'litespeed.conf.optm-qs_rm', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (243, 'litespeed.conf.optm-ggfonts_rm', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (244, 'litespeed.conf.optm-css_async', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (245, 'litespeed.conf.optm-ccss_per_url', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (246, 'litespeed.conf.optm-ccss_sep_posttype', '[\"page\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (247, 'litespeed.conf.optm-ccss_sep_uri', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (248, 'litespeed.conf.optm-ccss_whitelist', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (249, 'litespeed.conf.optm-css_async_inline', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (250, 'litespeed.conf.optm-css_font_display', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (251, 'litespeed.conf.optm-js_defer', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (252, 'litespeed.conf.optm-emoji_rm', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (253, 'litespeed.conf.optm-noscript_rm', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (254, 'litespeed.conf.optm-ggfonts_async', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (255, 'litespeed.conf.optm-exc_roles', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (256, 'litespeed.conf.optm-ccss_con', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (257, 'litespeed.conf.optm-js_defer_exc', '[\"jquery.js\",\"jquery.min.js\",\"gtm.js\",\"analytics.js\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (258, 'litespeed.conf.optm-gm_js_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (259, 'litespeed.conf.optm-dns_prefetch', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (260, 'litespeed.conf.optm-dns_prefetch_ctrl', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (261, 'litespeed.conf.optm-dns_preconnect', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (262, 'litespeed.conf.optm-exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (263, 'litespeed.conf.optm-guest_only', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (264, 'litespeed.conf.object', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (265, 'litespeed.conf.object-kind', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (266, 'litespeed.conf.object-host', '::1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (267, 'litespeed.conf.object-port', '11211', 'auto');
INSERT INTO `wp_options_bckp` VALUES (268, 'litespeed.conf.object-life', '360', 'auto');
INSERT INTO `wp_options_bckp` VALUES (269, 'litespeed.conf.object-persistent', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (270, 'litespeed.conf.object-admin', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (271, 'litespeed.conf.object-db_id', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (272, 'litespeed.conf.object-user', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (273, 'litespeed.conf.object-pswd', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (274, 'litespeed.conf.object-global_groups', '[\"users\",\"userlogins\",\"useremail\",\"userslugs\",\"usermeta\",\"user_meta\",\"site-transient\",\"site-options\",\"site-lookup\",\"site-details\",\"blog-lookup\",\"blog-details\",\"blog-id-cache\",\"rss\",\"global-posts\",\"global-cache-test\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (275, 'litespeed.conf.object-non_persistent_groups', '[\"comment\",\"counts\",\"plugins\",\"wc_session_id\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (276, 'litespeed.conf.discuss-avatar_cache', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (277, 'litespeed.conf.discuss-avatar_cron', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (278, 'litespeed.conf.discuss-avatar_cache_ttl', '604800', 'auto');
INSERT INTO `wp_options_bckp` VALUES (279, 'litespeed.conf.optm-localize', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (280, 'litespeed.conf.optm-localize_domains', '[\"### Popular scripts ###\",\"https:\\/\\/platform.twitter.com\\/widgets.js\",\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (281, 'litespeed.conf.media-lazy', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (282, 'litespeed.conf.media-lazy_placeholder', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (283, 'litespeed.conf.media-placeholder_resp', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (284, 'litespeed.conf.media-placeholder_resp_color', '#cfd4db', 'auto');
INSERT INTO `wp_options_bckp` VALUES (285, 'litespeed.conf.media-placeholder_resp_svg', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{width}\" height=\"{height}\" viewBox=\"0 0 {width} {height}\"><rect width=\"100%\" height=\"100%\" style=\"fill:{color};fill-opacity: 0.1;\"/></svg>', 'auto');
INSERT INTO `wp_options_bckp` VALUES (286, 'litespeed.conf.media-lqip', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (287, 'litespeed.conf.media-lqip_qual', '4', 'auto');
INSERT INTO `wp_options_bckp` VALUES (288, 'litespeed.conf.media-lqip_min_w', '150', 'auto');
INSERT INTO `wp_options_bckp` VALUES (289, 'litespeed.conf.media-lqip_min_h', '150', 'auto');
INSERT INTO `wp_options_bckp` VALUES (290, 'litespeed.conf.media-placeholder_resp_async', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (291, 'litespeed.conf.media-iframe_lazy', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (292, 'litespeed.conf.media-add_missing_sizes', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (293, 'litespeed.conf.media-lazy_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (294, 'litespeed.conf.media-lazy_cls_exc', '[\"wmu-preview-img\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (295, 'litespeed.conf.media-lazy_parent_cls_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (296, 'litespeed.conf.media-iframe_lazy_cls_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (297, 'litespeed.conf.media-iframe_lazy_parent_cls_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (298, 'litespeed.conf.media-lazy_uri_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (299, 'litespeed.conf.media-lqip_exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (300, 'litespeed.conf.media-vpi', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (301, 'litespeed.conf.media-vpi_cron', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (302, 'litespeed.conf.media-auto_rescale_ori', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (303, 'litespeed.conf.img_optm-auto', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (304, 'litespeed.conf.img_optm-ori', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (305, 'litespeed.conf.img_optm-rm_bkup', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (306, 'litespeed.conf.img_optm-webp', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (307, 'litespeed.conf.img_optm-lossless', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (308, 'litespeed.conf.img_optm-sizes_skipped', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (309, 'litespeed.conf.img_optm-exif', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (310, 'litespeed.conf.img_optm-webp_attr', '[\"img.src\",\"div.data-thumb\",\"img.data-src\",\"img.data-lazyload\",\"div.data-large_image\",\"img.retina_logo_url\",\"div.data-parallax-image\",\"div.data-vc-parallax-image\",\"video.poster\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (311, 'litespeed.conf.img_optm-webp_replace_srcset', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (312, 'litespeed.conf.img_optm-jpg_quality', '82', 'auto');
INSERT INTO `wp_options_bckp` VALUES (313, 'litespeed.conf.crawler', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (314, 'litespeed.conf.crawler-crawl_interval', '302400', 'auto');
INSERT INTO `wp_options_bckp` VALUES (315, 'litespeed.conf.crawler-load_limit', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (316, 'litespeed.conf.crawler-sitemap', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (317, 'litespeed.conf.crawler-roles', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (318, 'litespeed.conf.crawler-cookies', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (319, 'litespeed.conf.misc-heartbeat_front', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (320, 'litespeed.conf.misc-heartbeat_front_ttl', '60', 'auto');
INSERT INTO `wp_options_bckp` VALUES (321, 'litespeed.conf.misc-heartbeat_back', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (322, 'litespeed.conf.misc-heartbeat_back_ttl', '60', 'auto');
INSERT INTO `wp_options_bckp` VALUES (323, 'litespeed.conf.misc-heartbeat_editor', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (324, 'litespeed.conf.misc-heartbeat_editor_ttl', '15', 'auto');
INSERT INTO `wp_options_bckp` VALUES (325, 'litespeed.conf.cdn', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (326, 'litespeed.conf.cdn-ori', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (327, 'litespeed.conf.cdn-ori_dir', '[\"wp-content\",\"wp-includes\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (328, 'litespeed.conf.cdn-exc', '[]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (329, 'litespeed.conf.cdn-quic', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (330, 'litespeed.conf.cdn-cloudflare', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (331, 'litespeed.conf.cdn-cloudflare_email', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (332, 'litespeed.conf.cdn-cloudflare_key', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (333, 'litespeed.conf.cdn-cloudflare_name', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (334, 'litespeed.conf.cdn-cloudflare_zone', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (335, 'litespeed.conf.cdn-cloudflare_clear', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (336, 'litespeed.conf.cdn-mapping', '[{\"url\":\"\",\"inc_img\":\"1\",\"inc_css\":\"1\",\"inc_js\":\"1\",\"filetype\":[\".aac\",\".css\",\".eot\",\".gif\",\".jpeg\",\".jpg\",\".js\",\".less\",\".mp3\",\".mp4\",\".ogg\",\".otf\",\".pdf\",\".png\",\".svg\",\".ttf\",\".webp\",\".woff\",\".woff2\"]}]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (337, 'litespeed.conf.cdn-attr', '[\".src\",\".data-src\",\".href\",\".poster\",\"source.srcset\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (338, 'litespeed.conf.qc-nameservers', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (339, 'litespeed.conf.qc-cname', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (340, 'litespeed.conf.debug-disable_tmp', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (341, 'litespeed.cloud._summary', '{\"curr_request.ver_check\":0,\"last_request.ver_check\":1779355687,\"news.utime\":1779865732,\"curr_request.news\":0,\"last_request.news\":1779865732}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (342, 'hostinger_subscription_id', 'AzqgaFUvqEr8n25X0', 'on');
INSERT INTO `wp_options_bckp` VALUES (343, 'hostinger_hosting_plan', 'hostinger_business_v2', 'on');
INSERT INTO `wp_options_bckp` VALUES (344, 'hostinger_client_type', 'pro', 'off');
INSERT INTO `wp_options_bckp` VALUES (345, 'recently_activated', 'a:1:{s:35:\"litespeed-cache/litespeed-cache.php\";i:1779355689;}', 'off');
INSERT INTO `wp_options_bckp` VALUES (346, 'hostinger_builder_type', 'blank', 'off');
INSERT INTO `wp_options_bckp` VALUES (347, 'hostinger_website_id', '5a72bb4d757ff68774ae9ece66d4bbdb', 'off');
INSERT INTO `wp_options_bckp` VALUES (348, 'hostinger_created_at', '2026-05-21 09:27:49', 'off');
INSERT INTO `wp_options_bckp` VALUES (349, 'hostinger_reseller', 'hostinger.com', 'off');
INSERT INTO `wp_options_bckp` VALUES (350, 'hostinger_country', 'PL', 'off');
INSERT INTO `wp_options_bckp` VALUES (351, 'hostinger_currency_code', 'USD', 'off');
INSERT INTO `wp_options_bckp` VALUES (352, 'litespeed.purge.queue', '-1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (353, 'litespeed.purge.queue2', '-1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (354, 'hostinger_first_login_at', '2026-05-21 09:28:37', 'auto');
INSERT INTO `wp_options_bckp` VALUES (355, 'action_scheduler_lock_async-request-runner', '6a16f31a7cf678.93463915|1779888982', 'no');
INSERT INTO `wp_options_bckp` VALUES (356, 'litespeed.admin_display.thirdparty_litespeed_check', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (357, 'hostinger_onboarding_steps_was_completed', '0', 'auto');
INSERT INTO `wp_options_bckp` VALUES (358, 'litespeed.gui.lscwp_whm_install', '-1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (359, 'litespeed.gui.dismiss', '-1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (360, 'litespeed.data.upgrading', '-1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (361, 'litespeed.admin_display.messages', '[\"<div class=\\\"litespeed_icon notice notice-success is-dismissible\\\"><p>Wyczyszczono ca\\u0142\\u0105 pami\\u0119\\u0107 podr\\u0119czn\\u0105 pomy\\u015blnie.<\\/p><\\/div>\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (362, 'can_compress_scripts', '0', 'on');
INSERT INTO `wp_options_bckp` VALUES (364, 'hostinger_onboarding_completed', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (365, 'theme_mods_twentytwentyfive', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1779355731;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'off');
INSERT INTO `wp_options_bckp` VALUES (366, 'current_theme', 'Hostinger AI theme', 'auto');
INSERT INTO `wp_options_bckp` VALUES (367, 'theme_mods_hostinger-ai-theme', 'a:3:{s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'on');
INSERT INTO `wp_options_bckp` VALUES (368, 'theme_switched', '', 'auto');
INSERT INTO `wp_options_bckp` VALUES (369, 'litespeed.optimize.timestamp_purge_css', '1779932443', 'auto');
INSERT INTO `wp_options_bckp` VALUES (370, 'puc_external_updates_theme-hostinger-ai-theme', 'O:8:\"stdClass\":5:{s:9:\"lastCheck\";i:1779961364;s:14:\"checkedVersion\";s:6:\"2.0.17\";s:6:\"update\";O:8:\"stdClass\":5:{s:4:\"slug\";s:18:\"hostinger-ai-theme\";s:7:\"version\";s:6:\"2.0.19\";s:12:\"download_url\";s:82:\"https://wp-update.hostinger.io/?action=download&slug=hostinger-ai-theme&ver=2.0.19\";s:12:\"translations\";a:0:{}s:11:\"details_url\";s:21:\"https://hostinger.com\";}s:11:\"updateClass\";s:49:\"YahnisElsts\\PluginUpdateChecker\\v5p6\\Theme\\Update\";s:15:\"updateBaseClass\";s:12:\"Theme\\Update\";}', 'off');
INSERT INTO `wp_options_bckp` VALUES (371, 'hostinger_ai_version', '6a0ed05de5fef', 'on');
INSERT INTO `wp_options_bckp` VALUES (372, 'hostinger_ai_font', 'Junge, serif', 'auto');
INSERT INTO `wp_options_bckp` VALUES (373, 'hostinger_ai_assistant_mcp_jwt_token_registry', 'a:4:{s:32:\"kaMclvSONLnnqi26ORBh8dJbJ9B20mkU\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779355746;s:10:\"expires_at\";i:1779359346;}s:32:\"y8pyNMUQQmZMxSqkR26jfkAeOTvU74IG\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779865711;s:10:\"expires_at\";i:1779869311;}s:32:\"cbbvhhVerNuXmK4JorWz7CCqXZwOYMf2\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779887947;s:10:\"expires_at\";i:1779891547;}s:32:\"j6k9w2raTnt26QwEjsM7IcosLodLCeJJ\";a:3:{s:7:\"user_id\";i:1;s:9:\"issued_at\";i:1779887954;s:10:\"expires_at\";i:1779891554;}}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (374, 'recovery_keys', 'a:0:{}', 'off');
INSERT INTO `wp_options_bckp` VALUES (375, 'action_scheduler_migration_status', 'complete', 'auto');
INSERT INTO `wp_options_bckp` VALUES (376, 'as_has_wp_comment_logs', 'no', 'on');
INSERT INTO `wp_options_bckp` VALUES (378, 'finished_updating_comment_type', '1', 'auto');
INSERT INTO `wp_options_bckp` VALUES (379, 'amplitude_event_wordpress.easy_onboarding.enter_2026-05-27', '1779865714', 'no');
INSERT INTO `wp_options_bckp` VALUES (380, 'litespeed.gui._summary', '{\"new_version\":1780470532,\"score\":1781075332}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (381, 'hostinger_easy_onboarding_steps', 'a:1:{s:13:\"website_setup\";a:1:{s:14:\"connect_domain\";b:1;}}', 'off');
INSERT INTO `wp_options_bckp` VALUES (382, 'amplitude_event_wordpress.preview_site_2026-05-27', '1779865817', 'no');
INSERT INTO `wp_options_bckp` VALUES (383, 'category_children', 'a:0:{}', 'auto');
INSERT INTO `wp_options_bckp` VALUES (384, 'litespeed.conf._version', '7.6.2', 'auto');
INSERT INTO `wp_options_bckp` VALUES (385, 'litespeed.conf.guest_uas', '[\"Lighthouse\",\"GTmetrix\",\"Google\",\"Pingdom\",\"bot\",\"spider\",\"PTST\",\"HeadlessChrome\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (386, 'litespeed.conf.guest_ips', '[\"208.70.247.157\",\"172.255.48.130\",\"172.255.48.131\",\"172.255.48.132\",\"172.255.48.133\",\"172.255.48.134\",\"172.255.48.135\",\"172.255.48.136\",\"172.255.48.137\",\"172.255.48.138\",\"172.255.48.139\",\"172.255.48.140\",\"172.255.48.141\",\"172.255.48.142\",\"172.255.48.143\",\"172.255.48.144\",\"172.255.48.145\",\"172.255.48.146\",\"172.255.48.147\",\"52.229.122.240\",\"104.214.72.101\",\"13.66.7.11\",\"13.85.24.83\",\"13.85.24.90\",\"13.85.82.26\",\"40.74.242.253\",\"40.74.243.13\",\"40.74.243.176\",\"104.214.48.247\",\"157.55.189.189\",\"104.214.110.135\",\"70.37.83.240\",\"65.52.36.250\",\"13.78.216.56\",\"52.162.212.163\",\"23.96.34.105\",\"65.52.113.236\",\"172.255.61.34\",\"172.255.61.35\",\"172.255.61.36\",\"172.255.61.37\",\"172.255.61.38\",\"172.255.61.39\",\"172.255.61.40\",\"104.41.2.19\",\"191.235.98.164\",\"191.235.99.221\",\"191.232.194.51\",\"52.237.235.185\",\"52.237.250.73\",\"52.237.236.145\",\"104.211.143.8\",\"104.211.165.53\",\"52.172.14.87\",\"40.83.89.214\",\"52.175.57.81\",\"20.188.63.151\",\"20.52.36.49\",\"52.246.165.153\",\"51.144.102.233\",\"13.76.97.224\",\"102.133.169.66\",\"52.231.199.170\",\"13.53.162.7\",\"40.123.218.94\"]', 'auto');
INSERT INTO `wp_options_bckp` VALUES (387, 'litespeed.conf.object-transients', '1', 'auto');

-- ----------------------------
-- Table structure for wp_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta`  (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  INDEX `meta_key`(`meta_key`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_postmeta
-- ----------------------------
INSERT INTO `wp_postmeta` VALUES (2, 3, '_wp_page_template', 'default');

-- ----------------------------
-- Table structure for wp_posts
-- ----------------------------
DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts`  (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT 0,
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `post_name`(`post_name`(191) ASC) USING BTREE,
  INDEX `type_status_date`(`post_type` ASC, `post_status` ASC, `post_date` ASC, `ID` ASC) USING BTREE,
  INDEX `post_parent`(`post_parent` ASC) USING BTREE,
  INDEX `post_author`(`post_author` ASC) USING BTREE,
  INDEX `type_status_author`(`post_type` ASC, `post_status` ASC, `post_author` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_posts
-- ----------------------------
INSERT INTO `wp_posts` VALUES (1, 1, '2026-05-21 09:27:42', '2026-05-21 09:27:42', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2026-05-21 09:27:42', '2026-05-21 09:27:42', '', 0, 'http://better.augustyniak.xyz/?p=1', 0, 'post', '', 1);
INSERT INTO `wp_posts` VALUES (3, 1, '2026-05-21 09:27:42', '2026-05-21 09:27:42', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://better.augustyniak.xyz.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2026-05-21 09:27:42', '2026-05-21 09:27:42', '', 0, 'http://better.augustyniak.xyz/?page_id=3', 0, 'page', '', 0);

-- ----------------------------
-- Table structure for wp_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships`  (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`, `term_taxonomy_id`) USING BTREE,
  INDEX `term_taxonomy_id`(`term_taxonomy_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_term_relationships
-- ----------------------------
INSERT INTO `wp_term_relationships` VALUES (1, 1, 0);

-- ----------------------------
-- Table structure for wp_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy`  (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`) USING BTREE,
  UNIQUE INDEX `term_id_taxonomy`(`term_id` ASC, `taxonomy` ASC) USING BTREE,
  INDEX `taxonomy`(`taxonomy` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_term_taxonomy
-- ----------------------------
INSERT INTO `wp_term_taxonomy` VALUES (1, 1, 'category', '', 0, 1);

-- ----------------------------
-- Table structure for wp_termmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta`  (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `term_id`(`term_id` ASC) USING BTREE,
  INDEX `meta_key`(`meta_key`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_termmeta
-- ----------------------------

-- ----------------------------
-- Table structure for wp_terms
-- ----------------------------
DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms`  (
  `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`) USING BTREE,
  INDEX `slug`(`slug`(191) ASC) USING BTREE,
  INDEX `name`(`name`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_terms
-- ----------------------------
INSERT INTO `wp_terms` VALUES (1, 'Uncategorized', 'uncategorized', 0);

-- ----------------------------
-- Table structure for wp_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta`  (
  `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL,
  PRIMARY KEY (`umeta_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `meta_key`(`meta_key`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_usermeta
-- ----------------------------
INSERT INTO `wp_usermeta` VALUES (1, 1, 'nickname', 'jar.augustyniak@gmail.com');
INSERT INTO `wp_usermeta` VALUES (2, 1, 'first_name', '');
INSERT INTO `wp_usermeta` VALUES (3, 1, 'last_name', '');
INSERT INTO `wp_usermeta` VALUES (4, 1, 'description', '');
INSERT INTO `wp_usermeta` VALUES (5, 1, 'rich_editing', 'true');
INSERT INTO `wp_usermeta` VALUES (6, 1, 'syntax_highlighting', 'true');
INSERT INTO `wp_usermeta` VALUES (7, 1, 'comment_shortcuts', 'false');
INSERT INTO `wp_usermeta` VALUES (8, 1, 'admin_color', 'modern');
INSERT INTO `wp_usermeta` VALUES (9, 1, 'use_ssl', '0');
INSERT INTO `wp_usermeta` VALUES (10, 1, 'show_admin_bar_front', 'true');
INSERT INTO `wp_usermeta` VALUES (11, 1, 'locale', '');
INSERT INTO `wp_usermeta` VALUES (12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (13, 1, 'wp_user_level', '10');
INSERT INTO `wp_usermeta` VALUES (14, 1, 'dismissed_wp_pointers', '');
INSERT INTO `wp_usermeta` VALUES (15, 1, 'show_welcome_panel', '1');
INSERT INTO `wp_usermeta` VALUES (16, 1, 'session_tokens', 'a:2:{s:64:\"750f9f143593a2d112c0ccc8eb0738a32ceb6ba62826413b6521f8d81a7c02c0\";a:4:{s:10:\"expiration\";i:1780038498;s:2:\"ip\";s:13:\"178.43.74.239\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36\";s:5:\"login\";i:1779865698;}s:64:\"9a3cee4627ddc90f7ec98bf8aa00742a2aa245fad2bbb016af2cc65cd313eda4\";a:4:{s:10:\"expiration\";i:1780060745;s:2:\"ip\";s:13:\"178.43.74.239\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36\";s:5:\"login\";i:1779887945;}}');

-- ----------------------------
-- Table structure for wp_users
-- ----------------------------
DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users`  (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT 0,
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `user_login_key`(`user_login` ASC) USING BTREE,
  INDEX `user_nicename`(`user_nicename` ASC) USING BTREE,
  INDEX `user_email`(`user_email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wp_users
-- ----------------------------
INSERT INTO `wp_users` VALUES (1, 'jar.augustyniak@gmail.com', '$wp$2y$10$1JuJAgQlyNzFQW89UlCt3O6DcsBH8X6FuvyPeeTjbkvew9B6w6YrC', 'jar-augustyniakgmail-com', 'jar.augustyniak@gmail.com', 'http://better.augustyniak.xyz', '2026-05-21 09:27:42', '', 0, 'jar.augustyniak@gmail.com');

SET FOREIGN_KEY_CHECKS = 1;
