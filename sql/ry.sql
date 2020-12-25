/*
 Navicat Premium Data Transfer

 Source Server         : Mysql_localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 172.31.2.43:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 25/12/2020 14:40:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(0) NOT NULL,
  `sched_time` bigint(0) NOT NULL,
  `priority` int(0) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176057E451078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176057E451078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176057E451078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(0) NOT NULL,
  `checkin_interval` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'Z0887-wangdong1608281462944', 1608282875692, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(0) NOT NULL,
  `repeat_interval` bigint(0) NOT NULL,
  `times_triggered` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(0) NULL DEFAULT NULL,
  `int_prop_2` int(0) NULL DEFAULT NULL,
  `long_prop_1` bigint(0) NULL DEFAULT NULL,
  `long_prop_2` bigint(0) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(0) NULL DEFAULT NULL,
  `prev_fire_time` bigint(0) NULL DEFAULT NULL,
  `priority` int(0) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(0) NOT NULL,
  `end_time` bigint(0) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(0) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1608281470000, -1, 5, 'PAUSED', 'CRON', 1608281463000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1608281475000, -1, 5, 'PAUSED', 'CRON', 1608281463000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1608281480000, -1, 5, 'PAUSED', 'CRON', 1608281463000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team_a_id` bigint(0) NOT NULL COMMENT '参赛球队甲方id',
  `team_b_id` bigint(0) NOT NULL COMMENT '参赛球队乙方id',
  `game_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `site` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `session` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次',
  `part_a_goals` int(0) NULL DEFAULT NULL COMMENT '甲方球队分数',
  `part_b_goals` int(0) NULL DEFAULT NULL COMMENT '乙方球队分数',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '赛程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES (10, 7990775794644878303, 7990775794644878300, '2020-12-09 00:00:00', 'ddd', '1', 1, 2, '', '2020-12-08 17:26:41', '', '2020-12-11 15:10:38');
INSERT INTO `competition` VALUES (11, 7990775794644878300, 7990775794644878301, '2020-12-10 00:00:00', '的', '2', 33, 33, '', '2020-12-11 14:52:13', '', NULL);
INSERT INTO `competition` VALUES (12, 7990775794644878300, 7990775794644878301, '2020-12-01 00:00:00', '订单', '3', 33, 34, '', '2020-12-11 14:52:30', '', NULL);
INSERT INTO `competition` VALUES (13, 7990775794644878305, 7990775794644878311, '2020-12-10 06:30:00', '电动车', '11', 22, 444, '', '2020-12-11 15:24:15', '', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'team', '', NULL, NULL, 'Team', 'crud', 'com.ruoyi.system', 'system', 'team', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2020-12-03 06:20:16', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_news', '新闻表', NULL, NULL, 'SysNews', 'crud', 'com.ruoyi.system', 'system', 'news', '新闻', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-08 03:12:14', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'player', '球员表', NULL, NULL, 'Player', 'crud', 'com.ruoyi.system', 'system', 'player', '球员', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-08 08:49:11', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'competition', '赛程表', NULL, NULL, 'Competition', 'crud', 'com.ruoyi.system', 'system', 'competition', '赛程', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-08 09:22:23', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', NULL, 'int', 'Long', 'id', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'logo', NULL, 'varchar(255)', 'String', 'logo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'name', NULL, 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'win', NULL, 'int', 'Long', 'win', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'lose', NULL, 'int', 'Long', 'lose', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'flat', NULL, 'int', 'Long', 'flat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'score', NULL, 'int', 'Long', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'session', NULL, 'int', 'Long', 'session', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '1', 'goal', NULL, 'int', 'Long', 'goal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '1', 'conceded', NULL, 'int', 'Long', 'conceded', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-12-03 06:20:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '2', 'news_id', '公告ID', 'int', 'Long', 'newsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'news_title', '公告标题', 'varchar(50)', 'String', 'newsTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'news_content', '公告内容', 'varchar(2000)', 'String', 'newsContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 3, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '2', 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2020-12-08 03:12:14', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'id', 'ID', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'team_id', '球队id', 'int', 'Long', 'teamId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '3', 'head_portrait', '头像', 'varchar(50)', 'String', 'headPortrait', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '3', 'name', '姓名', 'varchar(2000)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'textarea', '', 4, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '3', 'birthdate', '出生年月', 'char(1)', 'String', 'birthdate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '3', 'location', '位置', 'char(1)', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '3', 'nationality', '国籍/籍贯', 'char(1)', 'String', 'nationality', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'appearance', '出场', 'char(1)', 'String', 'appearance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '3', 'goals', '进球', 'char(1)', 'String', 'goals', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2020-12-08 08:49:11', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '4', 'id', 'ID', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '4', 'team_a_id', '参赛球队甲方id', 'bigint', 'Long', 'teamAId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '4', 'team_b_id', '参赛球队乙方id', 'bigint', 'Long', 'teamBId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '4', 'game_time', '时间', 'datetime', 'Date', 'gameTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '4', 'site', '地点', 'varchar(200)', 'String', 'site', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '4', 'session', '场次', 'varchar(20)', 'String', 'session', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '4', 'part_a_goals', '甲方球队分数', 'int', 'Long', 'partAGoals', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '4', 'part_b_goals', '乙方球队分数', 'int', 'Long', 'partBGoals', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-12-08 09:22:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2020-12-08 09:22:23', '', NULL);

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team_id` bigint(0) NOT NULL COMMENT '球队id',
  `head_portrait` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `birthdate` date NULL DEFAULT NULL COMMENT '出生年月',
  `location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `nationality` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍/籍贯',
  `appearance` int(0) NULL DEFAULT NULL COMMENT '出场',
  `goals` int(0) NULL DEFAULT NULL COMMENT '进球',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '球员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES (11, 7990775794644878300, 'http://localhost:8087/ry/profile/upload/2020/12/14/7c0be1a7-1b18-407a-a65a-192e9edab123.jpg', 'www', '1993-07-01', 'zhong', 'zhongg', 2, 33, '', '2020-12-10 13:38:36', '', NULL);
INSERT INTO `player` VALUES (12, 7990775794644878300, 'http://localhost:8087/ry/profile/upload/2020/12/14/7c0be1a7-1b18-407a-a65a-192e9edab123.jpg', '防守打法', '2019-08-08', '都是', '发送到', 1, 11, '', '2020-12-11 14:40:41', '', NULL);
INSERT INTO `player` VALUES (13, 7990775794644878302, 'http://localhost:8087/ry/profile/upload/2020/12/14/7c0be1a7-1b18-407a-a65a-192e9edab123.jpg', '无所谓', '2020-12-15', '是', '问下', 1, 222, '', '2020-12-11 15:48:25', '', NULL);
INSERT INTO `player` VALUES (14, 7990775794644878308, 'http://localhost:8087/ry/profile/upload/2020/12/14/7c0be1a7-1b18-407a-a65a-192e9edab123.jpg', 'e\'de\'f', '2020-11-29', '曾多次', '121', 11, 111, '', '2020-12-14 19:40:38', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2020-11-27 00:58:50', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-27 00:58:46', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-27 00:58:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '广州恒大淘宝', '7990775794644878300', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:04:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '北京中赫国安', '7990775794644878301', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:04:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '上海上港', '7990775794644878302', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:04:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '江苏苏宁易购', '7990775794644878303', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:05:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 5, '山东鲁能泰山', '7990775794644878304', 'team_select', '', '', 'Y', '0', 'admin', '2020-12-11 06:05:18', 'admin', '2020-12-11 06:06:06', '');
INSERT INTO `sys_dict_data` VALUES (105, 6, '武汉卓尔', '7990775794644878305', 'team_select', '', '', 'Y', '0', 'admin', '2020-12-11 06:05:41', 'admin', '2020-12-11 06:06:13', '');
INSERT INTO `sys_dict_data` VALUES (106, 7, '天津泰达', '7990775794644878306', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:06:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 8, '河南建业', '7990775794644878307', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:06:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 9, '大连一方', '7990775794644878308', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:06:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 10, '重庆斯威', '7990775794644878309', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:07:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 11, '河北华夏幸福', '7990775794644878310', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:07:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 12, '广州富力', '7990775794644878311', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:07:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 13, '上海绿地申花', '7990775794644878312', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:07:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 14, '天津天海', '7990775794644878313', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:08:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 15, '深圳佳兆业', '7990775794644878314', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:08:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 16, '北京人和', '7990775794644878315', 'team_select', NULL, NULL, 'Y', '0', 'admin', '2020-12-11 06:08:23', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-11-27 00:58:49', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '球队列表选择', 'team_select', '0', 'admin', '2020-12-11 06:01:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-11-27 00:58:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-11-27 00:58:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-27 00:58:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：2毫秒', '0', '', '2020-12-03 02:48:45');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:49:00');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:49:15');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:49:30');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:49:45');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:50:00');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:50:15');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:50:30');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:50:45');
INSERT INTO `sys_job_log` VALUES (10, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2020-12-03 02:51:00');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-12-03 02:51:15');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-30 05:50:31');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-02 02:24:29');
INSERT INTO `sys_logininfor` VALUES (102, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2020-12-02 02:31:00');
INSERT INTO `sys_logininfor` VALUES (103, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-02 02:31:14');
INSERT INTO `sys_logininfor` VALUES (104, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-02 02:34:29');
INSERT INTO `sys_logininfor` VALUES (105, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-02 02:37:26');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-02 05:23:15');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-02 05:23:23');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 02:45:54');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-03 02:55:05');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-03 03:27:51');
INSERT INTO `sys_logininfor` VALUES (111, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-03 03:28:00');
INSERT INTO `sys_logininfor` VALUES (112, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-03 03:28:04');
INSERT INTO `sys_logininfor` VALUES (113, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 03:28:09');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 05:39:28');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 06:14:35');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 06:20:00');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 06:57:16');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 09:02:02');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-12-03 09:14:30');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-03 09:14:34');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-03 12:14:49');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-04 01:24:14');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-04 01:51:48');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-04 02:06:43');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-04 02:10:52');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-04 02:11:03');
INSERT INTO `sys_logininfor` VALUES (127, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-12-04 02:11:12');
INSERT INTO `sys_logininfor` VALUES (128, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-04 02:11:21');
INSERT INTO `sys_logininfor` VALUES (129, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-04 02:11:24');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-04 08:06:22');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-04 08:27:24');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-04 08:36:36');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-07 06:02:42');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-07 06:25:42');
INSERT INTO `sys_logininfor` VALUES (135, 'cs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-07 06:25:49');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-07 11:15:01');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-07 11:31:23');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-07 11:47:09');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-07 12:08:47');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-07 12:16:19');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-12-07 12:22:49');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-07 12:22:52');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 02:18:52');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 03:18:44');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 05:22:17');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-08 05:43:49');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-08 06:17:24');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-08 06:36:54');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 06:36:58');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:22:32');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:24:06');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:42:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:49:51');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:52:13');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:57:15');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-08 07:57:55');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 07:58:00');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 08:02:35');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 08:48:56');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-08 09:04:21');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 09:04:25');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 09:07:29');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-08 09:26:08');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-08 11:23:37');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-09 06:39:09');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-09 06:39:10');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-09 06:46:45');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-09 06:50:51');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-09 06:51:01');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-09 08:14:10');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-09 08:14:14');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-09 08:38:41');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-09 09:45:49');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-10 00:41:49');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-10 01:42:16');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-10 01:43:21');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-10 05:26:22');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-10 08:04:46');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-10 08:23:59');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 00:56:59');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-11 00:58:55');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-11 05:36:46');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-11 05:36:50');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 05:36:54');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-11 05:46:43');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 05:46:45');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 05:48:29');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-11 05:52:31');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 05:52:34');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 06:18:20');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 06:39:51');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-12-11 06:49:23');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-11 06:49:26');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 06:51:29');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 06:54:41');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-11 07:45:32');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-11 07:47:47');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 07:54:58');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 07:59:02');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 08:04:38');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 08:08:03');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-11 09:56:23');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-12 02:59:36');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-12 02:59:58');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 01:03:03');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 01:04:43');
INSERT INTO `sys_logininfor` VALUES (207, 'wd', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2020-12-14 05:56:36');
INSERT INTO `sys_logininfor` VALUES (208, 'wd', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 05:56:47');
INSERT INTO `sys_logininfor` VALUES (209, 'wd', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 06:10:40');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 06:10:44');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 06:43:49');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 07:29:01');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 08:17:47');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 08:57:51');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 09:00:02');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 09:00:05');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 09:06:52');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 10:56:19');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 11:07:08');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-15 11:58:53');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-15 12:25:00');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-18 08:51:20');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-18 09:17:43');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-18 09:25:19');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-18 09:25:32');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-19 05:39:23');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-19 06:41:01');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-19 06:53:13');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-19 07:32:10');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '172.31.2.46', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-24 01:33:41');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2024 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2020-11-27 00:58:47', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', -1, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2020-11-27 00:58:47', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', 'fa fa-user-o', 'admin', '2020-11-27 00:58:47', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', 'fa fa-user-secret', 'admin', '2020-11-27 00:58:47', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', 'fa fa-th-list', 'admin', '2020-11-27 00:58:47', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2020-12-11 06:00:26', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2020-11-27 00:58:47', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2020-11-27 00:58:47', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', 'fa fa-tasks', 'admin', '2020-11-27 00:58:47', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', 'fa fa-bug', 'admin', '2020-11-27 00:58:47', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', 'monitor:server:view', 'fa fa-server', 'admin', '2020-11-27 00:58:47', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', 'monitor:cache:view', 'fa fa-cube', 'admin', '2020-11-27 00:58:47', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', 'fa fa-wpforms', 'admin', '2020-11-27 00:58:47', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', 'fa fa-code', 'admin', '2020-11-27 00:58:47', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', 'fa fa-gg', 'admin', '2020-11-27 00:58:47', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2020-11-27 00:58:47', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2020-11-27 00:58:47', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2020-11-27 00:58:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '球队管理', 1, 1, '/system/team', '', 'C', '0', 'system:team:view', '#', 'admin', '2020-12-08 02:36:35', '', NULL, '球队管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '球队管理查询', 1, 1, '#', '', 'F', '0', 'system:team:list', '#', 'admin', '2020-12-08 02:36:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '球队管理新增', 1, 2, '#', '', 'F', '0', 'system:team:add', '#', 'admin', '2020-12-08 02:36:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '球队管理修改', 1, 3, '#', '', 'F', '0', 'system:team:edit', '#', 'admin', '2020-12-08 02:36:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '球队管理删除', 1, 4, '#', '', 'F', '0', 'system:team:remove', '#', 'admin', '2020-12-08 02:36:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '球队管理导出', 1, 5, '#', '', 'F', '0', 'system:team:export', '#', 'admin', '2020-12-08 02:36:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '新闻管理', 1, 1, '/system/news', '', 'C', '0', 'system:news:view', '#', 'admin', '2020-12-08 03:13:43', '', NULL, '新闻菜单');
INSERT INTO `sys_menu` VALUES (2008, '新闻查询', 1, 1, '#', '', 'F', '0', 'system:news:list', '#', 'admin', '2020-12-08 03:13:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '新闻新增', 1, 2, '#', '', 'F', '0', 'system:news:add', '#', 'admin', '2020-12-08 03:13:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '新闻修改', 1, 3, '#', '', 'F', '0', 'system:news:edit', '#', 'admin', '2020-12-08 03:13:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '新闻删除', 1, 4, '#', '', 'F', '0', 'system:news:remove', '#', 'admin', '2020-12-08 03:13:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '新闻导出', 1, 5, '#', '', 'F', '0', 'system:news:export', '#', 'admin', '2020-12-08 03:13:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '球员管理', 1, 1, '/system/player', '', 'C', '0', 'system:player:view', '#', 'admin', '2020-12-08 08:51:09', '', NULL, '球员菜单');
INSERT INTO `sys_menu` VALUES (2014, '球员查询', 1, 1, '#', '', 'F', '0', 'system:player:list', '#', 'admin', '2020-12-08 08:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '球员新增', 1, 2, '#', '', 'F', '0', 'system:player:add', '#', 'admin', '2020-12-08 08:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '球员修改', 1, 3, '#', '', 'F', '0', 'system:player:edit', '#', 'admin', '2020-12-08 08:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '球员删除', 1, 4, '#', '', 'F', '0', 'system:player:remove', '#', 'admin', '2020-12-08 08:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '球员导出', 1, 5, '#', '', 'F', '0', 'system:player:export', '#', 'admin', '2020-12-08 08:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '赛程管理', 1, 1, '/system/competition', '', 'C', '0', 'system:competition:view', '#', 'admin', '2020-12-08 09:23:02', '', NULL, '赛程菜单');
INSERT INTO `sys_menu` VALUES (2020, '赛程查询', 1, 1, '#', '', 'F', '0', 'system:competition:list', '#', 'admin', '2020-12-08 09:23:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '赛程新增', 1, 2, '#', '', 'F', '0', 'system:competition:add', '#', 'admin', '2020-12-08 09:23:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '赛程修改', 1, 3, '#', '', 'F', '0', 'system:competition:edit', '#', 'admin', '2020-12-08 09:23:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '赛程删除', 1, 4, '#', '', 'F', '0', 'system:competition:remove', '#', 'admin', '2020-12-08 09:23:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '赛程导出', 1, 5, '#', '', 'F', '0', 'system:competition:export', '#', 'admin', '2020-12-08 09:23:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_news
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news`  (
  `news_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `news_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `news_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '新闻状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_news
-- ----------------------------
INSERT INTO `sys_news` VALUES (10, 'fvggf', 'fefeefefewwsws', '0', '', '2020-12-08 13:35:51', '', '2020-12-08 13:36:46', 'wef');
INSERT INTO `sys_news` VALUES (11, '第一个', '的第三方的辅导班', '0', '', '2020-12-08 15:52:47', '', NULL, '');
INSERT INTO `sys_news` VALUES (12, '2020赛季中国足球协会超甲升降级附加赛赛程发布', '11月18日19:35，浙江能源绿城VS武汉卓尔的比赛将在苏州奥林匹克体育中心进行。', '0', '', '2020-12-08 16:03:54', '', NULL, '');
INSERT INTO `sys_news` VALUES (13, '赛后声音 | 超甲升降级附加赛次回合武汉卓尔VS浙江能源绿城赛后新闻发布会综述', '11月22日19:35，2020赛季中国足球协会超甲升降级附加赛次回合，武汉卓尔1-0小胜浙江能源绿城。赛后，绿城主教练郑雄、卓尔领队庞利出席了赛后新闻发布会。', '0', '', '2020-12-08 16:04:14', '', NULL, '');
INSERT INTO `sys_news` VALUES (14, '第二遍', '大大大的简欧四季豆飞电风扇懂法守法佛挡杀佛所多多多多多多多多', '0', '', '2020-12-09 14:50:38', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2020-11-27 00:58:51', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2020-11-27 00:58:51', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/ry/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"team\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 06:20:16');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/ry/tool/gen/download/team', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2020-12-03 06:20:49');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"F\"],\"menuName\":[\"球队管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:team:view\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-04 02:13:54');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"球队管理\"],\"url\":[\"/system/team\"],\"target\":[\"menuItem\"],\"perms\":[\"system:team:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-04 02:15:35');
INSERT INTO `sys_oper_log` VALUES (104, '增加球队信息', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"123\"],\"name\":[\"123\"],\"win\":[\"123\"],\"lose\":[\"12\"],\"flat\":[\"123\"],\"score\":[\"12\"],\"session\":[\"123\"],\"goal\":[\"123\"],\"conceded\":[\"123\"]}', 'null', 1, 'For input string: \"aef7042edec544f5ac44c18d639ea755\"', '2020-12-07 12:16:38');
INSERT INTO `sys_oper_log` VALUES (105, '增加球队信息', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"123\"],\"name\":[\"123\"],\"win\":[\"123\"],\"lose\":[\"123\"],\"flat\":[\"123\"],\"score\":[\"123\"],\"session\":[\"123\"],\"goal\":[\"132\"],\"conceded\":[\"123\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may exist in file [E:\\use\\ry\\demo2\\ruoyi-system\\target\\classes\\mapper\\system\\TeamMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TeamMapper.insertTeam-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into team          ( id,             logo,             name,             win,             lose,             flat,             score,             session,             goal,             conceded )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2020-12-07 12:23:06');
INSERT INTO `sys_oper_log` VALUES (106, '增加球队信息', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"123\"],\"name\":[\"123\"],\"win\":[\"123\"],\"lose\":[\"123\"],\"flat\":[\"123\"],\"score\":[\"123\"],\"session\":[\"123\"],\"goal\":[\"132\"],\"conceded\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-07 12:30:12');
INSERT INTO `sys_oper_log` VALUES (107, '【请填写功能名称】', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"logo\":[\"ww\"],\"name\":[\"一号\"],\"win\":[\"1\"],\"lose\":[\"1\"],\"flat\":[\"1\"],\"score\":[\"22\"],\"session\":[\"2\"],\"goal\":[\"2\"],\"conceded\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 02:50:23');
INSERT INTO `sys_oper_log` VALUES (108, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5303311184078244000\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-08 02:52:22');
INSERT INTO `sys_oper_log` VALUES (109, '【请填写功能名称】', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 02:52:28');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/ry/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_news\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 03:12:14');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/ry/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_news\"]}', 'null', 0, NULL, '2020-12-08 03:12:56');
INSERT INTO `sys_oper_log` VALUES (112, '新闻', 1, 'com.ruoyi.system.controller.SysNewsController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/news/add', '127.0.0.1', '内网IP', '{\"newsTitle\":[\"fvggf\"],\"newsContent\":[\"<p>fefeefefew</p>\"],\"remark\":[\"wef\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 05:35:51');
INSERT INTO `sys_oper_log` VALUES (113, '新闻', 2, 'com.ruoyi.system.controller.SysNewsController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/news/edit', '127.0.0.1', '内网IP', '{\"newsId\":[\"10\"],\"newsTitle\":[\"fvggf\"],\"newsContent\":[\"fefeefefewwsws\"],\"remark\":[\"wef\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 05:36:46');
INSERT INTO `sys_oper_log` VALUES (114, '增加球队信息', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"32\"],\"name\":[\"32\"],\"win\":[\"32\"],\"lose\":[\"32\"],\"flat\":[\"32\"],\"score\":[\"32\"],\"session\":[\"32\"],\"goal\":[\"323\"],\"conceded\":[\"32\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 05:49:43');
INSERT INTO `sys_oper_log` VALUES (115, '增加球队信息', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"234\"],\"name\":[\"4324\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 05:51:03');
INSERT INTO `sys_oper_log` VALUES (116, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8727929656830200000\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-08 06:44:50');
INSERT INTO `sys_oper_log` VALUES (117, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4324\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-08 06:44:57');
INSERT INTO `sys_oper_log` VALUES (118, '新闻', 1, 'com.ruoyi.system.controller.SysNewsController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/news/add', '127.0.0.1', '内网IP', '{\"newsTitle\":[\"第一个\"],\"newsContent\":[\"<p>的第三方的辅导班</p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 07:52:47');
INSERT INTO `sys_oper_log` VALUES (119, '新闻', 1, 'com.ruoyi.system.controller.SysNewsController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/news/add', '127.0.0.1', '内网IP', '{\"newsTitle\":[\"2020赛季中国足球协会超甲升降级附加赛赛程发布\"],\"newsContent\":[\"<pre style=\\\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'Consolas\';font-size:12.8pt;\\\"><span style=\\\"color:#808080;\\\">11</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">月</span><span style=\\\"color:#808080;\\\">18</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">日</span><span style=\\\"color:#808080;\\\">19:35</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">，浙江能源绿城</span><span style=\\\"color:#808080;\\\">VS</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">武汉卓尔的比赛将在苏州奥林匹克体育中心进行。</span></pre>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 08:03:54');
INSERT INTO `sys_oper_log` VALUES (120, '新闻', 1, 'com.ruoyi.system.controller.SysNewsController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/news/add', '127.0.0.1', '内网IP', '{\"newsTitle\":[\"赛后声音 | 超甲升降级附加赛次回合武汉卓尔VS浙江能源绿城赛后新闻发布会综述\"],\"newsContent\":[\"<pre style=\\\"background-color:#2b2b2b;color:#a9b7c6;font-family:\'Consolas\';font-size:12.8pt;\\\"><span style=\\\"color:#808080;\\\">11</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">月</span><span style=\\\"color:#808080;\\\">22</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">日</span><span style=\\\"color:#808080;\\\">19:35</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">，</span><span style=\\\"color:#808080;\\\">2020</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">赛季中国足球协会超甲升降级附加赛次回合，武汉卓尔</span><span style=\\\"color:#808080;\\\">1-0</span><span style=\\\"color:#808080;font-family:\'宋体\';\\\">小胜浙江能源绿城。赛后，绿城主教练郑雄、卓尔领队庞利出席了赛后新闻发布会。</span></pre>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 08:04:13');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/ry/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"player\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 08:49:11');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/ry/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"player\"]}', 'null', 0, NULL, '2020-12-08 08:49:53');
INSERT INTO `sys_oper_log` VALUES (123, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078243547\"],\"headPortrait\":[\"11\"],\"name\":[\"ww\"],\"birthdate\":[\"2020-05-05\"],\"location\":[\"qianf\"],\"nationality\":[\"zhongg \"],\"appearance\":[\"1\"],\"goals\":[\"22\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'team_id\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'team_id\' at row 1\n; Data truncation: Out of range value for column \'team_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'team_id\' at row 1', '2020-12-08 09:05:21');
INSERT INTO `sys_oper_log` VALUES (124, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078243547\"],\"headPortrait\":[\"11\"],\"name\":[\"ww\"],\"birthdate\":[\"2020-05-05\"],\"location\":[\"qianf\"],\"nationality\":[\"zhongg \"],\"appearance\":[\"1\"],\"goals\":[\"22\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'birthdate\' at row 1\n; Data truncation: Data too long for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'birthdate\' at row 1', '2020-12-08 09:06:59');
INSERT INTO `sys_oper_log` VALUES (125, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078243547\"],\"headPortrait\":[\"22\"],\"name\":[\"dede\"],\"birthdate\":[\"2020.2.2\"],\"location\":[\"zhong\"],\"nationality\":[\"ff\"],\"appearance\":[\"1\"],\"goals\":[\"232\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'birthdate\' at row 1\n; Data truncation: Data too long for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'birthdate\' at row 1', '2020-12-08 09:07:54');
INSERT INTO `sys_oper_log` VALUES (126, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078243547\"],\"headPortrait\":[\"22\"],\"name\":[\"dede\"],\"birthdate\":[\"2020.2.2\"],\"location\":[\"zhong\"],\"nationality\":[\"ff\"],\"appearance\":[\"1\"],\"goals\":[\"232\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'location\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'location\' at row 1\n; Data truncation: Data too long for column \'location\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'location\' at row 1', '2020-12-08 09:08:50');
INSERT INTO `sys_oper_log` VALUES (127, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078243547\"],\"headPortrait\":[\"22\"],\"name\":[\"dede\"],\"birthdate\":[\"2020.2.2\"],\"location\":[\"zhong\"],\"nationality\":[\"ff\"],\"appearance\":[\"1\"],\"goals\":[\"232\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'location\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'location\' at row 1\n; Data truncation: Data too long for column \'location\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'location\' at row 1', '2020-12-08 09:10:10');
INSERT INTO `sys_oper_log` VALUES (128, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078243547\"],\"headPortrait\":[\"22\"],\"name\":[\"dede\"],\"birthdate\":[\"2020.2.2\"],\"location\":[\"zhong\"],\"nationality\":[\"ff\"],\"appearance\":[\"1\"],\"goals\":[\"232\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 09:10:49');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/ry/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"competition\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 09:22:23');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/ry/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"competition\"]}', 'null', 0, NULL, '2020-12-08 09:22:28');
INSERT INTO `sys_oper_log` VALUES (131, '赛程', 1, 'com.ruoyi.web.controller.system.CompetitionController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/competition/add', '127.0.0.1', '内网IP', '{\"teamAId\":[\"5303311184078243547\"],\"teamBId\":[\"7873991167345359299\"],\"gameTime\":[\"2020-12-09\"],\"site\":[\"ddd\"],\"session\":[\"1\"],\"partAGoals\":[\"1\"],\"partBGoals\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 09:26:41');
INSERT INTO `sys_oper_log` VALUES (132, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8727929656830200000\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-08 11:24:27');
INSERT INTO `sys_oper_log` VALUES (133, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078244000\"],\"headPortrait\":[\"123\"],\"name\":[\"123\"],\"birthdate\":[\"123\"],\"location\":[\"123\"],\"nationality\":[\"123\"],\"appearance\":[\"123\"],\"goals\":[\"123\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\use\\ry\\demo2\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1\n; Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1', '2020-12-08 11:27:26');
INSERT INTO `sys_oper_log` VALUES (134, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078244000\"],\"headPortrait\":[\"123\"],\"name\":[\"123\"],\"birthdate\":[\"\"],\"location\":[\"123\"],\"nationality\":[\"123\"],\"appearance\":[\"123\"],\"goals\":[\"123\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\use\\ry\\demo2\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1', '2020-12-08 11:27:37');
INSERT INTO `sys_oper_log` VALUES (135, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078244000\"],\"headPortrait\":[\"123\"],\"name\":[\"123\"],\"birthdate\":[\"123\"],\"location\":[\"123\"],\"nationality\":[\"123\"],\"appearance\":[\"123\"],\"goals\":[\"123\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\use\\ry\\demo2\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1\n; Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'123\' for column \'birthdate\' at row 1', '2020-12-08 11:28:05');
INSERT INTO `sys_oper_log` VALUES (136, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"5303311184078244000\"],\"headPortrait\":[\"123\"],\"name\":[\"123\"],\"birthdate\":[\"\"],\"location\":[\"123\"],\"nationality\":[\"123\"],\"appearance\":[\"123\"],\"goals\":[\"123\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\use\\ry\\demo2\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1\n; Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'birthdate\' at row 1', '2020-12-08 11:28:12');
INSERT INTO `sys_oper_log` VALUES (137, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"id\":[\"4324\"],\"logo\":[\"\"],\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 11:28:37');
INSERT INTO `sys_oper_log` VALUES (138, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4324\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 11:29:11');
INSERT INTO `sys_oper_log` VALUES (139, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8727929656830200000\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-08 11:29:15');
INSERT INTO `sys_oper_log` VALUES (140, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"logo\":[\"\"],\"name\":[\"4324\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\use\\ry\\demo2\\ruoyi-system\\target\\classes\\mapper\\system\\TeamMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TeamMapper.insertTeam-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into team          ( logo,             name )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-12-08 11:29:29');
INSERT INTO `sys_oper_log` VALUES (141, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"id\":[\"123\"],\"logo\":[\"\"],\"name\":[\"4324\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 11:29:40');
INSERT INTO `sys_oper_log` VALUES (142, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-08 11:29:45');
INSERT INTO `sys_oper_log` VALUES (143, '新闻', 1, 'com.ruoyi.system.controller.SysNewsController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/news/add', '127.0.0.1', '内网IP', '{\"newsTitle\":[\"第二遍\"],\"newsContent\":[\"<p>大大大的简欧四季豆飞电风扇懂法守法佛挡杀佛所多多多多多多多多</p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 06:50:38');
INSERT INTO `sys_oper_log` VALUES (144, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"id\":[\"7990775794644878396\"],\"logo\":[\"\"],\"name\":[\"sds\"],\"win\":[\"1\"],\"lose\":[\"1\"],\"flat\":[\"1\"],\"score\":[\"1\"],\"session\":[\"1\"],\"goal\":[\"1\"],\"conceded\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 07:12:09');
INSERT INTO `sys_oper_log` VALUES (145, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878300\"],\"headPortrait\":[\"22\"],\"name\":[\"www\"],\"birthdate\":[\"1993.7.1\"],\"location\":[\"zhong\"],\"nationality\":[\"zhongg\"],\"appearance\":[\"2\"],\"goals\":[\"33\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:38:36');
INSERT INTO `sys_oper_log` VALUES (146, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 08:24:34');
INSERT INTO `sys_oper_log` VALUES (147, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 08:28:12');
INSERT INTO `sys_oper_log` VALUES (148, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6037677469619373000\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-10 08:28:17');
INSERT INTO `sys_oper_log` VALUES (149, '球队', 3, 'com.ruoyi.system.controller.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6037677469619373000\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-10 08:28:21');
INSERT INTO `sys_oper_log` VALUES (150, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"球队列表选择\"],\"dictType\":[\"team_select\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:01:18');
INSERT INTO `sys_oper_log` VALUES (151, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878300\"],\"dictValue\":[\"广州恒大淘宝\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:04:13');
INSERT INTO `sys_oper_log` VALUES (152, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878301\"],\"dictValue\":[\"北京中赫国安\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:04:41');
INSERT INTO `sys_oper_log` VALUES (153, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878302\"],\"dictValue\":[\"上海上港\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:04:54');
INSERT INTO `sys_oper_log` VALUES (154, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878303\"],\"dictValue\":[\"江苏苏宁易购\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:05:06');
INSERT INTO `sys_oper_log` VALUES (155, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"Frz1t0c2uTVFoAkuFuZ0Vd0m5uIi\"],\"dictValue\":[\"山东鲁能泰山\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:05:18');
INSERT INTO `sys_oper_log` VALUES (156, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"FiHTwQi7DEP84Imh2x3Agznej55f\"],\"dictValue\":[\"武汉卓尔\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:05:41');
INSERT INTO `sys_oper_log` VALUES (157, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"7990775794644878304\"],\"dictValue\":[\"山东鲁能泰山\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:06:06');
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"7990775794644878305\"],\"dictValue\":[\"武汉卓尔\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:06:13');
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878306\"],\"dictValue\":[\"天津泰达\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"7\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:06:31');
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878307\"],\"dictValue\":[\"河南建业\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"8\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:06:45');
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878308\"],\"dictValue\":[\"大连一方\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"9\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:06:56');
INSERT INTO `sys_oper_log` VALUES (162, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878309\"],\"dictValue\":[\"重庆斯威\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:07:08');
INSERT INTO `sys_oper_log` VALUES (163, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878310\"],\"dictValue\":[\"河北华夏幸福\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"11\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:07:21');
INSERT INTO `sys_oper_log` VALUES (164, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878311\"],\"dictValue\":[\"广州富力\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"12\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:07:42');
INSERT INTO `sys_oper_log` VALUES (165, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878312\"],\"dictValue\":[\"上海绿地申花\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"13\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:07:53');
INSERT INTO `sys_oper_log` VALUES (166, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878313\"],\"dictValue\":[\"天津天海\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"14\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:08:03');
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878314\"],\"dictValue\":[\"深圳佳兆业\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"15\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:08:13');
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"7990775794644878315\"],\"dictValue\":[\"北京人和\"],\"dictType\":[\"team_select\"],\"cssClass\":[\"\"],\"dictSort\":[\"16\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:08:23');
INSERT INTO `sys_oper_log` VALUES (169, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878300\"],\"headPortrait\":[\"sss\"],\"name\":[\"ddfdf\"],\"birthdate\":[\"df\"],\"location\":[\"vdvd\"],\"nationality\":[\"vds\"],\"appearance\":[\"vsdv\"],\"goals\":[\"sdv\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'df\' for column \'birthdate\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'df\' for column \'birthdate\' at row 1\n; Data truncation: Incorrect date value: \'df\' for column \'birthdate\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect date value: \'df\' for column \'birthdate\' at row 1', '2020-12-11 06:25:01');
INSERT INTO `sys_oper_log` VALUES (170, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"\"],\"headPortrait\":[\"w\"],\"name\":[\"\"],\"birthdate\":[\"2020-12-18\"],\"location\":[\"\"],\"nationality\":[\"\"],\"appearance\":[\"\"],\"goals\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'\' for column \'appearance\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'\' for column \'appearance\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'\' for column \'appearance\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'\' for column \'appearance\' at row 1', '2020-12-11 06:28:36');
INSERT INTO `sys_oper_log` VALUES (171, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878300\"],\"headPortrait\":[\"多少度\"],\"name\":[\"防守打法\"],\"birthdate\":[\"2019-08-08\"],\"location\":[\"都是\"],\"nationality\":[\"发送到\"],\"appearance\":[\"1\"],\"goals\":[\"11\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:40:41');
INSERT INTO `sys_oper_log` VALUES (172, '赛程', 1, 'com.ruoyi.web.controller.system.CompetitionController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/competition/add', '127.0.0.1', '内网IP', '{\"teamAId\":[\"7990775794644878300\"],\"teamBId\":[\"7990775794644878301\"],\"gameTime\":[\"2020-12-10\"],\"site\":[\"的\"],\"session\":[\"2\"],\"partAGoals\":[\"33\"],\"partBGoals\":[\"33\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:52:12');
INSERT INTO `sys_oper_log` VALUES (173, '赛程', 1, 'com.ruoyi.web.controller.system.CompetitionController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/competition/add', '127.0.0.1', '内网IP', '{\"teamAId\":[\"7990775794644878300\"],\"teamBId\":[\"7990775794644878301\"],\"gameTime\":[\"2020-12-01\"],\"site\":[\"订单\"],\"session\":[\"3\"],\"partAGoals\":[\"33\"],\"partBGoals\":[\"34\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:52:30');
INSERT INTO `sys_oper_log` VALUES (174, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/ry/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:06:00');
INSERT INTO `sys_oper_log` VALUES (175, '赛程', 2, 'com.ruoyi.web.controller.system.CompetitionController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/competition/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"teamAId\":[\"7990775794644878303\"],\"teamBId\":[\"7990775794644878300\"],\"gameTime\":[\"2020-12-09\"],\"site\":[\"ddd\"],\"session\":[\"1\"],\"partAGoals\":[\"1\"],\"partBGoals\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:10:37');
INSERT INTO `sys_oper_log` VALUES (176, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/ry/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:13:09');
INSERT INTO `sys_oper_log` VALUES (177, '赛程', 1, 'com.ruoyi.web.controller.system.CompetitionController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/competition/add', '127.0.0.1', '内网IP', '{\"teamAId\":[\"7990775794644878305\"],\"teamBId\":[\"7990775794644878311\"],\"gameTime\":[\"2020-12-10 06:30\"],\"site\":[\"电动车\"],\"session\":[\"11\"],\"partAGoals\":[\"22\"],\"partBGoals\":[\"444\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:24:15');
INSERT INTO `sys_oper_log` VALUES (178, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878302\"],\"headPortrait\":[\"爽歪歪\"],\"name\":[\"无所谓\"],\"birthdate\":[\"2020-12-15\"],\"location\":[\"是\"],\"nationality\":[\"问下\"],\"appearance\":[\"1\"],\"goals\":[\"222\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:48:24');
INSERT INTO `sys_oper_log` VALUES (179, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"dd\"],\"name\":[\"fdfsdf\"],\"win\":[\"1\"],\"lose\":[\"1\"],\"flat\":[\"1\"],\"score\":[\"1\"],\"session\":[\"1\"],\"goal\":[\"1\"],\"conceded\":[\"1\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\TeamMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TeamMapper.insertTeam-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into team          ( logo,             name,             win,             lose,             flat,             score,             session,             goal,             conceded )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-12-11 08:00:33');
INSERT INTO `sys_oper_log` VALUES (180, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"dsf\"],\"name\":[\"fsdf\"],\"win\":[\"1\"],\"lose\":[\"1\"],\"flat\":[\"1\"],\"score\":[\"1\"],\"session\":[\"1\"],\"goal\":[\"1\"],\"conceded\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:05:01');
INSERT INTO `sys_oper_log` VALUES (181, '球队', 1, 'com.ruoyi.system.controller.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"fdf\"],\"name\":[\"fdsfsd\"],\"win\":[\"3\"],\"lose\":[\"3\"],\"flat\":[\"3\"],\"score\":[\"3\"],\"session\":[\"3\"],\"goal\":[\"3\"],\"conceded\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:08:18');
INSERT INTO `sys_oper_log` VALUES (182, '球队', 2, 'com.ruoyi.system.controller.TeamController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/edit', '127.0.0.1', '内网IP', '{\"id\":[\"-5321771037789865847\"],\"logo\":[\"dsf\"],\"name\":[\"fsdf\"],\"win\":[\"1\"],\"lose\":[\"1\"],\"flat\":[\"1\"],\"score\":[\"1\"],\"session\":[\"1\"],\"goal\":[\"1\"],\"conceded\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:08:37');
INSERT INTO `sys_oper_log` VALUES (183, '球员', 3, 'com.ruoyi.web.controller.system.PlayerController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:15:34');
INSERT INTO `sys_oper_log` VALUES (184, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 06:17:29');
INSERT INTO `sys_oper_log` VALUES (185, '球队', 3, 'com.ruoyi.web.controller.system.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8516277467180835175\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 06:17:38');
INSERT INTO `sys_oper_log` VALUES (186, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"传参\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 08:59:41');
INSERT INTO `sys_oper_log` VALUES (187, '球队', 3, 'com.ruoyi.web.controller.system.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5402457875736925568\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:00:15');
INSERT INTO `sys_oper_log` VALUES (188, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:00:48');
INSERT INTO `sys_oper_log` VALUES (189, '球队', 3, 'com.ruoyi.web.controller.system.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8618317309597360410\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:02:44');
INSERT INTO `sys_oper_log` VALUES (190, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:09:30');
INSERT INTO `sys_oper_log` VALUES (191, '球队', 3, 'com.ruoyi.web.controller.system.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5443418749440551321\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:09:40');
INSERT INTO `sys_oper_log` VALUES (192, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:11:12');
INSERT INTO `sys_oper_log` VALUES (193, '球队', 3, 'com.ruoyi.web.controller.system.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6894989089612338304\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:11:19');
INSERT INTO `sys_oper_log` VALUES (194, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:15:49');
INSERT INTO `sys_oper_log` VALUES (195, '球队', 3, 'com.ruoyi.web.controller.system.TeamController.remove()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7473229221631464961\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:22:41');
INSERT INTO `sys_oper_log` VALUES (196, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:30:12');
INSERT INTO `sys_oper_log` VALUES (197, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"http://localhost:8087/ry/profile/upload/2020/12/14/95cd081d-d14e-49bb-81f1-e82c0da197a3.jpg\"],\"name\":[\"\"],\"win\":[\"\"],\"lose\":[\"\"],\"flat\":[\"\"],\"score\":[\"\"],\"session\":[\"\"],\"goal\":[\"\"],\"conceded\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 09:32:30');
INSERT INTO `sys_oper_log` VALUES (198, '球队', 1, 'com.ruoyi.web.controller.system.TeamController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/team/add', '127.0.0.1', '内网IP', '{\"logo\":[\"http://localhost:8087/ry/profile/upload/2020/12/14/91d52bd5-3aee-43b7-9d48-9e0ae1af745e.jpg\"],\"name\":[\"我是\"],\"win\":[\"1\"],\"lose\":[\"1\"],\"flat\":[\"2\"],\"score\":[\"3\"],\"session\":[\"2\"],\"goal\":[\"33\"],\"conceded\":[\"33\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 11:27:45');
INSERT INTO `sys_oper_log` VALUES (199, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878302\"],\"headPortrait\":[\"http://localhost:8087/ry/profile/upload/2020/12/14/f1045874-7b6d-4176-adb1-e2fcf3afcba2.jpg\"],\"name\":[\"顶顶顶\"],\"birthdate\":[\"2020-12-01\"],\"location\":[\"顶顶\"],\"nationality\":[\"丰调\"],\"appearance\":[\"1\"],\"goals\":[\"2\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'head_portrait\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'head_portrait\' at row 1\n; Data truncation: Data too long for column \'head_portrait\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'head_portrait\' at row 1', '2020-12-14 11:38:25');
INSERT INTO `sys_oper_log` VALUES (200, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878301\"],\"headPortrait\":[\"http://localhost:8087/ry/profile/upload/2020/12/14/767cb91a-1dff-4f6c-9045-d52275c07d11.jpg\"],\"name\":[\"顶顶顶\"],\"birthdate\":[\"2020-11-30\"],\"location\":[\"的\"],\"nationality\":[\"的2\"],\"appearance\":[\"2\"],\"goals\":[\"22\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'head_portrait\' at row 1\r\n### The error may exist in file [E:\\demo\\y_project-RuoYi-master\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\PlayerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.PlayerMapper.insertPlayer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into player          ( team_id,             head_portrait,             name,             birthdate,             location,             nationality,             appearance,             goals,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'head_portrait\' at row 1\n; Data truncation: Data too long for column \'head_portrait\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'head_portrait\' at row 1', '2020-12-14 11:39:29');
INSERT INTO `sys_oper_log` VALUES (201, '球员', 1, 'com.ruoyi.web.controller.system.PlayerController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry/system/player/add', '127.0.0.1', '内网IP', '{\"teamId\":[\"7990775794644878308\"],\"headPortrait\":[\"http://localhost:8087/ry/profile/upload/2020/12/14/7c0be1a7-1b18-407a-a65a-192e9edab123.jpg\"],\"name\":[\"e\'de\'f\"],\"birthdate\":[\"2020-11-29\"],\"location\":[\"曾多次\"],\"nationality\":[\"121\"],\"appearance\":[\"11\"],\"goals\":[\"111\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 11:40:37');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2020-11-27 00:58:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2020-11-27 00:58:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2020-11-27 00:58:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2020-11-27 00:58:47', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2020/12/11/2670cd70-1eea-4c01-95d2-f9650cd57351.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '172.31.2.46', '2020-12-24 09:33:42', '2020-11-27 00:58:46', 'admin', '2020-11-27 00:58:46', '', '2020-12-24 01:33:41', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2020-11-27 00:58:46', '2020-11-27 00:58:46', 'admin', '2020-11-27 00:58:46', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'cs', 'cs', '01', '', '', '0', '', '4d2bdab151e4443dfd7c5c8f17003ae1', 'f29ad5', '0', '0', '127.0.0.1', '2020-12-07 14:25:50', '2020-12-02 10:31:00', '', '2020-12-02 02:31:00', '', '2020-12-07 06:25:49', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'wd', 'wd', '01', '', '', '0', '', 'ab867d1d77ef701431c46820661fc141', '87d4d1', '0', '0', '127.0.0.1', '2020-12-14 13:56:48', '2020-12-14 13:56:36', '', '2020-12-14 05:56:36', '', '2020-12-14 05:56:47', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('5b6450bf-27dc-4321-bbc2-64a923ab8c71', 'admin', '研发部门', '172.31.2.46', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-12-24 09:32:56', '2020-12-24 09:33:42', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '球队logo，图片的路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '球队名称',
  `win` int(0) NULL DEFAULT NULL COMMENT '赢',
  `lose` int(0) NULL DEFAULT NULL COMMENT '输',
  `flat` int(0) NULL DEFAULT NULL COMMENT '平',
  `score` int(0) NULL DEFAULT NULL COMMENT '积分',
  `session` int(0) NULL DEFAULT NULL COMMENT '场次',
  `goal` int(0) NULL DEFAULT NULL COMMENT '进球',
  `conceded` int(0) NULL DEFAULT NULL COMMENT '丢球'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (7990775794644878300, 'Fun6NJ2j9vFHViXGT9M5UvY-V7QL.jpg', '广州恒大淘宝', 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878301, 'FoBIzWyGBez6hMwpJ4kDW87dgI75.jpg', '北京中赫国安', 1, 1, 1, 2, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878302, 'Fv6HRz-L8N9SnYbtDmLtF00j6fY4.jpg', '上海上港', 1, 1, 1, 3, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878303, 'FoSZaaHVVdsq72dMvUm73JM-LucZ.jpg', '江苏苏宁易购', 1, 1, 1, 4, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878304, 'Frz1t0c2uTVFoAkuFuZ0Vd0m5uIi.jpg', '山东鲁能泰山', 1, 1, 1, 5, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878305, 'FiHTwQi7DEP84Imh2x3Agznej55f.jpg', '武汉卓尔', 1, 1, 1, 6, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878306, 'FtS-frsJHyHO4gbzoaeGpESetGK_.jpg', '天津泰达', 1, 1, 1, 7, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878307, 'FhbXg7FZf3UtjiHgeKGFpyaU86vP.jpg', '河南建业', 1, 1, 1, 8, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878308, 'FiTVAwpnl506Lj28aEZdXN6O_NTY.jpg', '大连一方', 1, 1, 1, 9, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878309, 'FhnVQd9tUYHhw9Ku-j1n00UdAq8Z.jpg', '重庆斯威', 1, 1, 1, 11, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878310, 'FqtHmS_1OZRajvJ9Km4U1U5f3VAO.jpg', '河北华夏幸福', 1, 1, 1, 12, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878311, 'FgVAEKNTP255RO3YPQuCKR5ceuTd.jpg', '广州富力', 1, 1, 1, 13, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878312, 'FmvJJIM4MaN3SqUByPSx_uY9F-yb.jpg', '上海绿地申花', 1, 1, 1, 14, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878313, 'Fvb9LOb7OzM650iMqmJRp1PsF512.jpg', '天津天海', 1, 1, 1, 15, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878314, 'Fs0VE3zzoh316SLPKaQ3jXDSa-Jo.jpg', '深圳佳兆业', 1, 1, 1, 16, 1, 1, 1);
INSERT INTO `team` VALUES (7990775794644878315, 'FijuS5LjoA_WjcdWtv3qodW2I3aX.jpg', '北京人和', 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `team` VALUES (8245873522613078360, 'http://localhost:8087/ry/profile/upload/2020/12/14/91d52bd5-3aee-43b7-9d48-9e0ae1af745e.jpg', '我是', 1, 1, 2, 3, 2, 33, 33);

SET FOREIGN_KEY_CHECKS = 1;
