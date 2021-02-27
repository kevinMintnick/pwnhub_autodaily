/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3310
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3310
 Source Schema         : fucktryee

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 27/02/2021 13:03:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sign_config', '用户配置表', '', NULL, 'SignConfig', 'crud', 'com.ruoyi.system', 'system', 'signConfig', '用户配置', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2024\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"胖哈勃实验室\",\"treeCode\":\"\"}', 'admin', '2021-02-06 15:43:16', '', '2021-02-06 17:26:35', '');
INSERT INTO `gen_table` VALUES (2, 'sign_data_dict', '', NULL, NULL, 'SignDataDict', 'crud', 'com.ruoyi.system', 'system', 'dict', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-02-06 15:43:16', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'sign_data_item', '', NULL, NULL, 'SignDataItem', 'crud', 'com.ruoyi.system', 'system', 'item', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-02-06 15:43:16', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sign_log', '签到日志表', '', NULL, 'SignLog', 'crud', 'com.ruoyi.system', 'system', 'log', '签到日志', 'ruoyi', '0', '/', '{\"parentMenuId\":\"3\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统工具\",\"treeCode\":\"\"}', 'admin', '2021-02-06 15:43:16', '', '2021-02-06 16:34:52', '');
INSERT INTO `gen_table` VALUES (5, 'sign_setting', '签到系统设置表', '', NULL, 'SignSetting', 'crud', 'com.ruoyi.system', 'system', 'signSetting', '签到系统设置', 'ruoyi', '0', '/', '{\"parentMenuId\":\"3\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统工具\",\"treeCode\":\"\"}', 'admin', '2021-02-06 15:43:16', '', '2021-02-06 16:29:50', '');
INSERT INTO `gen_table` VALUES (6, 'sign_user', '用户表', '', NULL, 'SignUser', 'crud', 'com.ruoyi.system', 'system', 'signUser', '用户管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"3\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统工具\",\"treeCode\":\"\"}', 'admin', '2021-02-06 15:43:16', '', '2021-02-06 16:22:53', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'config_id', '配置编号', 'int', 'Long', 'configId', '1', '1', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (2, '1', 'stuNumber', '学号', 'int', 'Long', 'stuNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (3, '1', 'stuSystemId', '系统ID', 'varchar(255)', 'String', 'stuSystemId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (4, '1', 'stuName', '学生姓名', 'varchar(255)', 'String', 'stuName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (5, '1', 'stuClass', '班级', 'varchar(255)', 'String', 'stuClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (6, '1', 'stuUUID', '设备ID', 'varchar(255)', 'String', 'stuUUID', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (7, '1', 'stuToken', '标识符', 'varchar(255)', 'String', 'stuToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 17:26:35');
INSERT INTO `gen_table_column` VALUES (8, '2', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '2', 'datasource', NULL, 'varchar(30)', 'String', 'datasource', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '2', 'description', NULL, 'varchar(128)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '3', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '3', 'datasource', NULL, 'varchar(50)', 'String', 'datasource', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '3', 'code', NULL, 'varchar(8)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '3', 'val', NULL, 'varchar(128)', 'String', 'val', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-06 15:43:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '4', 'log_id', '日志编号', 'int', 'Long', 'logId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (16, '4', 'stu_number', '学号', 'varchar(25)', 'String', 'stuNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (17, '4', 'system_id', '系统编号', 'varchar(25)', 'String', 'systemId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (18, '4', 'temperature', '体温', 'varchar(255)', 'String', 'temperature', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (19, '4', 'address', '地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (20, '4', 'lat', '经度', 'varchar(255)', 'String', 'lat', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (21, '4', 'lng', '纬度', 'varchar(255)', 'String', 'lng', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (22, '4', 'status', '签到状态', 'int', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (23, '4', 'response', '响应', 'varchar(255)', 'String', 'response', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (24, '4', 'encrypt_key', '加密值', 'varchar(255)', 'String', 'encryptKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (25, '4', 'logDate', '日志日期', 'datetime', 'Date', 'logDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:34:52');
INSERT INTO `gen_table_column` VALUES (26, '5', 'setting_name', '设置名称', 'varchar(25)', 'String', 'settingName', '1', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 1, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:29:50');
INSERT INTO `gen_table_column` VALUES (27, '5', 'setting_value', '设置值', 'varchar(255)', 'String', 'settingValue', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:29:50');
INSERT INTO `gen_table_column` VALUES (28, '5', 'setting_explain', '备注', 'varchar(255)', 'String', 'settingExplain', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:29:50');
INSERT INTO `gen_table_column` VALUES (29, '6', 'platform_id', '签到平台ID', 'int', 'Long', 'platformId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (30, '6', 'stu_number', '学号', 'int', 'Long', 'stuNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (31, '6', 'platform_key', '自定义密钥', 'varchar(255)', 'String', 'platformKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (32, '6', 'areaType', '区域类型', 'int', 'Long', 'areaType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sign_area', 4, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (33, '6', 'address', '地址', 'varchar(255)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (34, '6', 'latlng', '经纬度', 'varchar(30)', 'String', 'latlng', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (35, '6', 'last_sign_date', '最后签到日期', 'datetime', 'Date', 'lastSignDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (36, '6', 'last_sign_status', '最后签到状态', 'int', 'Long', 'lastSignStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (37, '6', 'enabled', '是否启用', 'int', 'Long', 'enabled', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'sign_enabled', 9, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');
INSERT INTO `gen_table_column` VALUES (38, '6', 'createDate', '注册日期', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-02-06 15:43:16', NULL, '2021-02-06 16:22:53');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', '0 0 */1 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME101', 'DEFAULT', '1 36 6 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME102', 'DEFAULT', '1 6 19 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME103', 'DEFAULT', '0 0 */1 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME104', 'DEFAULT', '1 31 6 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME105', 'DEFAULT', '1 1 19 * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017779FA49B078707400007070707400013174000D302030202A2F31202A202A203F74001474657374456E63727970745461736B2E7461736B74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000064740012E6B58BE8AF95414553E58AA0E5AF86E4B8B274000131740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME101', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777A0AB0E878707400007070707400013174000C312033362036202A202A203F74000B72655369676E2E7461736B74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006574000CE697A9E4B88AE9878DE7ADBE74000131740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME102', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777A0B35B878707400007070707400013174000C312036203139202A202A203F74000B72655369676E2E7461736B74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006674000CE6999AE4B88AE9878DE7ADBE74000131740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME103', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777A0CA8D078707400007070707400013174000D302030202A2F31202A202A203F7400196F627461696E456E63727970744B65795461736B2E7461736B74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006774001BE6ADA3E58899E88EB7E58F96E696B0E79A84E58AA0E5AF86E4B8B274000131740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME104', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzJobExecution', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777A0E2B8878707400007070707400013074000C312033312036202A202A203F7400186D756C74695468726561645369676E5461736B2E7461736B74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000068740015E5A49AE7BABFE7A88BE7ADBEE588B0202D20E697A974000131740001307800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME105', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzJobExecution', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001777A0FA28878707400007070707400013074000C312031203139202A202A203F7400186D756C74695468726561645369676E5461736B2E7461736B74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000069740015E5A49AE7BABFE7A88BE7ADBEE588B0202D20E6999A74000131740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'izuf617vxjqa4wnzgwwjvmz1612663657808', 1614401167932, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 1614402000000, 1614398400000, 5, 'WAITING', 'CRON', 1612663658000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME101', 'DEFAULT', 'TASK_CLASS_NAME101', 'DEFAULT', NULL, 1614465361000, 1614378961000, 5, 'WAITING', 'CRON', 1612663658000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME102', 'DEFAULT', 'TASK_CLASS_NAME102', 'DEFAULT', NULL, 1614423961000, 1614337561000, 5, 'WAITING', 'CRON', 1612663659000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME103', 'DEFAULT', 'TASK_CLASS_NAME103', 'DEFAULT', NULL, 1614402000000, 1614398400000, 5, 'WAITING', 'CRON', 1612663659000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME104', 'DEFAULT', 'TASK_CLASS_NAME104', 'DEFAULT', NULL, 1614465061000, 1614378661000, 5, 'WAITING', 'CRON', 1612663659000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME105', 'DEFAULT', 'TASK_CLASS_NAME105', 'DEFAULT', NULL, 1613041261000, 1612954861000, 5, 'PAUSED', 'CRON', 1612663659000, 0, NULL, -1, '');

-- ----------------------------
-- Table structure for sign_config
-- ----------------------------
DROP TABLE IF EXISTS `sign_config`;
CREATE TABLE `sign_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `stuNumber` int NULL DEFAULT NULL,
  `stuSystemId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuUUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1360 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_config
-- ----------------------------

-- ----------------------------
-- Table structure for sign_data_dict
-- ----------------------------
DROP TABLE IF EXISTS `sign_data_dict`;
CREATE TABLE `sign_data_dict`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `datasource` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_data_dict
-- ----------------------------
INSERT INTO `sign_data_dict` VALUES (1, 'area_type', '区域类型');

-- ----------------------------
-- Table structure for sign_data_item
-- ----------------------------
DROP TABLE IF EXISTS `sign_data_item`;
CREATE TABLE `sign_data_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `datasource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `val` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_data_item
-- ----------------------------
INSERT INTO `sign_data_item` VALUES (1, 'area_type', '1', '学府东苑');
INSERT INTO `sign_data_item` VALUES (2, 'area_type', '2', '学府西苑');
INSERT INTO `sign_data_item` VALUES (3, 'area_type', '3', '教学区');
INSERT INTO `sign_data_item` VALUES (4, 'area_type', '0', '校外');

-- ----------------------------
-- Table structure for sign_log
-- ----------------------------
DROP TABLE IF EXISTS `sign_log`;
CREATE TABLE `sign_log`  (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `stu_number` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `system_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `temperature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL,
  `response` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `encrypt_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logDate` datetime(0) NOT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18358 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_log
-- ----------------------------

-- ----------------------------
-- Table structure for sign_setting
-- ----------------------------
DROP TABLE IF EXISTS `sign_setting`;
CREATE TABLE `sign_setting`  (
  `setting_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`setting_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_setting
-- ----------------------------
INSERT INTO `sign_setting` VALUES ('allow_register', 'true', '是否允许注册');
INSERT INTO `sign_setting` VALUES ('encrypt', 'JLS3yTeedOQbLqA3', 'AES加密的密码');
INSERT INTO `sign_setting` VALUES ('ProhibitRegistrationTips', '站长跑路了，真的跑路了……', '禁止注册的提示');

-- ----------------------------
-- Table structure for sign_user
-- ----------------------------
DROP TABLE IF EXISTS `sign_user`;
CREATE TABLE `sign_user`  (
  `platform_id` int NOT NULL AUTO_INCREMENT COMMENT '签到平台ID 自增主键 ',
  `stu_number` int NOT NULL COMMENT '学号',
  `platform_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义密钥 用于停启用账户 查询记录',
  `areaType` int NOT NULL COMMENT '区域类型',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `latlng` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `last_sign_date` datetime(0) NOT NULL DEFAULT '1970-01-01 12:00:00' COMMENT '最后签到日期',
  `last_sign_status` int NOT NULL,
  `enabled` int NOT NULL COMMENT '是否启用',
  `createDate` datetime(0) NOT NULL,
  PRIMARY KEY (`platform_id`) USING BTREE,
  UNIQUE INDEX `stu_number`(`stu_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-02-06 15:24:24', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-06 15:24:02', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-06 15:24:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-06 15:24:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '校外区域', '0', 'sign_area', NULL, NULL, 'Y', '0', 'admin', '2021-02-06 16:18:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '学府东苑', '1', 'sign_area', NULL, NULL, 'Y', '0', 'admin', '2021-02-06 16:18:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '学府西苑', '2', 'sign_area', NULL, NULL, 'Y', '0', 'admin', '2021-02-06 16:19:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '启用', '1', 'sign_enabled', NULL, 'success', 'Y', '0', 'admin', '2021-02-06 16:21:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '禁用', '0', 'sign_enabled', NULL, 'danger', 'Y', '0', 'admin', '2021-02-06 16:22:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-02-06 15:24:20', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '区域类型', 'sign_area', '0', 'admin', '2021-02-06 16:18:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '签到启用状态', 'sign_enabled', '0', 'admin', '2021-02-06 16:21:21', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (100, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '0 0 */1 * * ?', '1', '1', '0', 'admin', '2021-02-07 08:53:02', 'admin', '2021-02-07 09:08:21', '');
INSERT INTO `sys_job` VALUES (101, '早上重签', 'DEFAULT', 'reSign.task', '1 36 6 * * ?', '1', '1', '0', 'admin', '2021-02-07 09:10:57', '', '2021-02-07 09:16:29', '');
INSERT INTO `sys_job` VALUES (102, '晚上重签', 'DEFAULT', 'reSign.task', '1 6 19 * * ?', '1', '1', '0', 'admin', '2021-02-07 09:11:31', '', '2021-02-07 09:16:31', '');
INSERT INTO `sys_job` VALUES (103, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '0 0 */1 * * ?', '1', '1', '0', 'admin', '2021-02-07 09:13:06', '', '2021-02-07 09:16:33', '');
INSERT INTO `sys_job` VALUES (104, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '1 31 6 * * ?', '1', '0', '0', 'admin', '2021-02-07 09:14:45', 'admin', '2021-02-07 09:37:16', '');
INSERT INTO `sys_job` VALUES (105, '多线程签到 - 晚', 'DEFAULT', 'multiThreadSignTask.task', '1 1 19 * * ?', '1', '0', '1', 'admin', '2021-02-07 09:16:21', 'admin', '2021-02-11 18:27:34', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1041 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '测试AES加密串', 'DEFAULT', 'com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask()', '测试AES加密串 总共耗时：4毫秒', '1', 'java.lang.IllegalAccessException: Class com.ruoyi.quartz.util.JobInvokeUtil can not access a member of class com.ruoyi.fucktryee.task.TestEncryptTask with modifiers \"private\"\r\n	at sun.reflect.Reflection.ensureMemberAccess(Reflection.java:102)\r\n	at java.lang.reflect.AccessibleObject.slowCheckMemberAccess(AccessibleObject.java:296)\r\n	at java.lang.reflect.AccessibleObject.checkAccess(AccessibleObject.java:288)\r\n	at java.lang.reflect.Method.invoke(Method.java:491)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:38)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2021-02-07 08:53:32');
INSERT INTO `sys_job_log` VALUES (2, '测试AES加密串', 'DEFAULT', 'com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask()', '测试AES加密串 总共耗时：4毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:38)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: java.lang.NullPointerException\r\n	at com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask(TestEncryptTask.java:25)\r\n	... 10 more\r\n', '2021-02-07 08:54:56');
INSERT INTO `sys_job_log` VALUES (3, '测试AES加密串', 'DEFAULT', 'com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask', '测试AES加密串 总共耗时：0毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:38)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: java.lang.NullPointerException\r\n	at com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask(TestEncryptTask.java:25)\r\n	... 10 more\r\n', '2021-02-07 08:56:20');
INSERT INTO `sys_job_log` VALUES (4, '测试AES加密串', 'DEFAULT', 'ryTask.testEncryptTask', '测试AES加密串 总共耗时：3毫秒', '1', 'java.lang.NoSuchMethodException: com.ruoyi.quartz.task.RyTask.testEncryptTask()\r\n	at java.lang.Class.getDeclaredMethod(Class.java:2130)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:60)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2021-02-07 08:59:13');
INSERT INTO `sys_job_log` VALUES (5, '测试AES加密串', 'DEFAULT', 'ryTask.testEncryptTask', '测试AES加密串 总共耗时：1毫秒', '1', 'java.lang.NoSuchMethodException: com.ruoyi.quartz.task.RyTask.testEncryptTask()\r\n	at java.lang.Class.getDeclaredMethod(Class.java:2130)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:60)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2021-02-07 09:00:00');
INSERT INTO `sys_job_log` VALUES (6, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：278毫秒', '0', '', '2021-02-07 09:08:43');
INSERT INTO `sys_job_log` VALUES (7, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：372毫秒', '0', '', '2021-02-07 09:19:05');
INSERT INTO `sys_job_log` VALUES (8, '多线程签到 - 早', 'DEFAULT', 'mutilThreadSignTask.task', '多线程签到 - 早 总共耗时：3毫秒', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'mutilThreadSignTask\' available\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:816)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1288)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:298)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:202)\r\n	at com.ruoyi.common.utils.spring.SpringUtils.getBean(SpringUtils.java:49)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:32)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2021-02-07 09:19:41');
INSERT INTO `sys_job_log` VALUES (9, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：988毫秒', '0', '', '2021-02-07 09:23:01');
INSERT INTO `sys_job_log` VALUES (10, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：1034毫秒', '0', '', '2021-02-07 09:32:03');
INSERT INTO `sys_job_log` VALUES (11, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：1118毫秒', '0', '', '2021-02-07 09:35:30');
INSERT INTO `sys_job_log` VALUES (12, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：57054毫秒', '0', '', '2021-02-07 09:38:39');
INSERT INTO `sys_job_log` VALUES (13, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：1037毫秒', '0', '', '2021-02-07 11:00:01');
INSERT INTO `sys_job_log` VALUES (14, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：1011毫秒', '0', '', '2021-02-07 11:00:01');
INSERT INTO `sys_job_log` VALUES (15, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：194毫秒', '0', '', '2021-02-07 12:00:00');
INSERT INTO `sys_job_log` VALUES (16, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：250毫秒', '0', '', '2021-02-07 12:00:00');
INSERT INTO `sys_job_log` VALUES (17, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：436毫秒', '0', '', '2021-02-07 13:00:00');
INSERT INTO `sys_job_log` VALUES (18, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：434毫秒', '0', '', '2021-02-07 13:00:00');
INSERT INTO `sys_job_log` VALUES (19, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：317毫秒', '0', '', '2021-02-07 14:00:00');
INSERT INTO `sys_job_log` VALUES (20, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：294毫秒', '0', '', '2021-02-07 14:00:00');
INSERT INTO `sys_job_log` VALUES (21, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：226毫秒', '0', '', '2021-02-07 15:00:00');
INSERT INTO `sys_job_log` VALUES (22, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：253毫秒', '0', '', '2021-02-07 15:00:00');
INSERT INTO `sys_job_log` VALUES (23, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：169毫秒', '0', '', '2021-02-07 16:00:00');
INSERT INTO `sys_job_log` VALUES (24, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：169毫秒', '0', '', '2021-02-07 16:00:00');
INSERT INTO `sys_job_log` VALUES (25, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-07 17:00:00');
INSERT INTO `sys_job_log` VALUES (26, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：209毫秒', '0', '', '2021-02-07 17:00:00');
INSERT INTO `sys_job_log` VALUES (27, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-07 18:00:00');
INSERT INTO `sys_job_log` VALUES (28, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-07 18:00:00');
INSERT INTO `sys_job_log` VALUES (29, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：214毫秒', '0', '', '2021-02-07 19:00:00');
INSERT INTO `sys_job_log` VALUES (30, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-07 19:00:00');
INSERT INTO `sys_job_log` VALUES (31, '多线程签到 - 晚', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 晚 总共耗时：65355毫秒', '0', '', '2021-02-07 19:02:06');
INSERT INTO `sys_job_log` VALUES (32, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：37毫秒', '0', '', '2021-02-07 19:06:01');
INSERT INTO `sys_job_log` VALUES (33, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：263毫秒', '0', '', '2021-02-07 20:00:00');
INSERT INTO `sys_job_log` VALUES (34, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：264毫秒', '0', '', '2021-02-07 20:00:00');
INSERT INTO `sys_job_log` VALUES (35, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：160毫秒', '0', '', '2021-02-07 21:00:00');
INSERT INTO `sys_job_log` VALUES (36, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：158毫秒', '0', '', '2021-02-07 21:00:00');
INSERT INTO `sys_job_log` VALUES (37, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-07 22:00:00');
INSERT INTO `sys_job_log` VALUES (38, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：153毫秒', '0', '', '2021-02-07 22:00:00');
INSERT INTO `sys_job_log` VALUES (39, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-07 23:00:00');
INSERT INTO `sys_job_log` VALUES (40, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：156毫秒', '0', '', '2021-02-07 23:00:00');
INSERT INTO `sys_job_log` VALUES (41, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：193毫秒', '0', '', '2021-02-08 00:00:00');
INSERT INTO `sys_job_log` VALUES (42, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：232毫秒', '0', '', '2021-02-08 00:00:00');
INSERT INTO `sys_job_log` VALUES (43, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：695毫秒', '0', '', '2021-02-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (44, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：656毫秒', '0', '', '2021-02-08 01:00:01');
INSERT INTO `sys_job_log` VALUES (45, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：165毫秒', '0', '', '2021-02-08 02:00:00');
INSERT INTO `sys_job_log` VALUES (46, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：175毫秒', '0', '', '2021-02-08 02:00:00');
INSERT INTO `sys_job_log` VALUES (47, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：492毫秒', '0', '', '2021-02-08 03:00:00');
INSERT INTO `sys_job_log` VALUES (48, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：268毫秒', '0', '', '2021-02-08 03:00:00');
INSERT INTO `sys_job_log` VALUES (49, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：240毫秒', '0', '', '2021-02-08 04:00:00');
INSERT INTO `sys_job_log` VALUES (50, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：260毫秒', '0', '', '2021-02-08 04:00:00');
INSERT INTO `sys_job_log` VALUES (51, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：212毫秒', '0', '', '2021-02-08 05:00:00');
INSERT INTO `sys_job_log` VALUES (52, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：208毫秒', '0', '', '2021-02-08 05:00:00');
INSERT INTO `sys_job_log` VALUES (53, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：130毫秒', '0', '', '2021-02-08 06:00:00');
INSERT INTO `sys_job_log` VALUES (54, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：154毫秒', '0', '', '2021-02-08 06:00:00');
INSERT INTO `sys_job_log` VALUES (55, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：56459毫秒', '0', '', '2021-02-08 06:31:57');
INSERT INTO `sys_job_log` VALUES (56, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：10毫秒', '0', '', '2021-02-08 06:36:01');
INSERT INTO `sys_job_log` VALUES (57, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：152毫秒', '0', '', '2021-02-08 07:00:00');
INSERT INTO `sys_job_log` VALUES (58, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-08 07:00:00');
INSERT INTO `sys_job_log` VALUES (59, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：211毫秒', '0', '', '2021-02-08 08:00:00');
INSERT INTO `sys_job_log` VALUES (60, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：264毫秒', '0', '', '2021-02-08 08:00:00');
INSERT INTO `sys_job_log` VALUES (61, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：154毫秒', '0', '', '2021-02-08 09:00:00');
INSERT INTO `sys_job_log` VALUES (62, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：139毫秒', '0', '', '2021-02-08 09:00:00');
INSERT INTO `sys_job_log` VALUES (63, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-08 10:00:00');
INSERT INTO `sys_job_log` VALUES (64, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：235毫秒', '0', '', '2021-02-08 10:00:00');
INSERT INTO `sys_job_log` VALUES (65, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：153毫秒', '0', '', '2021-02-08 11:00:00');
INSERT INTO `sys_job_log` VALUES (66, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：244毫秒', '0', '', '2021-02-08 11:00:00');
INSERT INTO `sys_job_log` VALUES (67, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-08 12:00:00');
INSERT INTO `sys_job_log` VALUES (68, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：244毫秒', '0', '', '2021-02-08 12:00:00');
INSERT INTO `sys_job_log` VALUES (69, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：453毫秒', '0', '', '2021-02-08 13:00:00');
INSERT INTO `sys_job_log` VALUES (70, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：417毫秒', '0', '', '2021-02-08 13:00:00');
INSERT INTO `sys_job_log` VALUES (71, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：158毫秒', '0', '', '2021-02-08 14:00:00');
INSERT INTO `sys_job_log` VALUES (72, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：206毫秒', '0', '', '2021-02-08 14:00:00');
INSERT INTO `sys_job_log` VALUES (73, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：274毫秒', '0', '', '2021-02-08 15:00:00');
INSERT INTO `sys_job_log` VALUES (74, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-08 15:00:00');
INSERT INTO `sys_job_log` VALUES (75, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：210毫秒', '0', '', '2021-02-08 16:00:00');
INSERT INTO `sys_job_log` VALUES (76, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-08 16:00:00');
INSERT INTO `sys_job_log` VALUES (77, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：468毫秒', '0', '', '2021-02-08 17:00:00');
INSERT INTO `sys_job_log` VALUES (78, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：325毫秒', '0', '', '2021-02-08 17:00:00');
INSERT INTO `sys_job_log` VALUES (79, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-08 18:00:00');
INSERT INTO `sys_job_log` VALUES (80, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：195毫秒', '0', '', '2021-02-08 18:00:00');
INSERT INTO `sys_job_log` VALUES (81, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：208毫秒', '0', '', '2021-02-08 19:00:00');
INSERT INTO `sys_job_log` VALUES (82, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：219毫秒', '0', '', '2021-02-08 19:00:00');
INSERT INTO `sys_job_log` VALUES (83, '多线程签到 - 晚', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 晚 总共耗时：56611毫秒', '0', '', '2021-02-08 19:01:57');
INSERT INTO `sys_job_log` VALUES (84, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：11毫秒', '0', '', '2021-02-08 19:06:01');
INSERT INTO `sys_job_log` VALUES (85, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：246毫秒', '0', '', '2021-02-08 20:00:00');
INSERT INTO `sys_job_log` VALUES (86, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：168毫秒', '0', '', '2021-02-08 20:00:00');
INSERT INTO `sys_job_log` VALUES (87, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：160毫秒', '0', '', '2021-02-08 21:00:00');
INSERT INTO `sys_job_log` VALUES (88, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-08 21:00:00');
INSERT INTO `sys_job_log` VALUES (89, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-08 22:00:00');
INSERT INTO `sys_job_log` VALUES (90, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-08 22:00:00');
INSERT INTO `sys_job_log` VALUES (91, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：184毫秒', '0', '', '2021-02-08 23:00:00');
INSERT INTO `sys_job_log` VALUES (92, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：203毫秒', '0', '', '2021-02-08 23:00:00');
INSERT INTO `sys_job_log` VALUES (93, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-09 00:00:00');
INSERT INTO `sys_job_log` VALUES (94, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：216毫秒', '0', '', '2021-02-09 00:00:00');
INSERT INTO `sys_job_log` VALUES (95, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：187毫秒', '0', '', '2021-02-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (96, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：177毫秒', '0', '', '2021-02-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (97, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-09 02:00:00');
INSERT INTO `sys_job_log` VALUES (98, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：209毫秒', '0', '', '2021-02-09 02:00:00');
INSERT INTO `sys_job_log` VALUES (99, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：468毫秒', '0', '', '2021-02-09 03:00:00');
INSERT INTO `sys_job_log` VALUES (100, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：401毫秒', '0', '', '2021-02-09 03:00:00');
INSERT INTO `sys_job_log` VALUES (101, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：202毫秒', '0', '', '2021-02-09 04:00:00');
INSERT INTO `sys_job_log` VALUES (102, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：213毫秒', '0', '', '2021-02-09 04:00:00');
INSERT INTO `sys_job_log` VALUES (103, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：205毫秒', '0', '', '2021-02-09 05:00:00');
INSERT INTO `sys_job_log` VALUES (104, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：224毫秒', '0', '', '2021-02-09 05:00:00');
INSERT INTO `sys_job_log` VALUES (105, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：381毫秒', '0', '', '2021-02-09 06:00:00');
INSERT INTO `sys_job_log` VALUES (106, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：376毫秒', '0', '', '2021-02-09 06:00:00');
INSERT INTO `sys_job_log` VALUES (107, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：67310毫秒', '0', '', '2021-02-09 06:32:08');
INSERT INTO `sys_job_log` VALUES (108, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：36毫秒', '0', '', '2021-02-09 06:36:01');
INSERT INTO `sys_job_log` VALUES (109, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：155毫秒', '0', '', '2021-02-09 07:00:00');
INSERT INTO `sys_job_log` VALUES (110, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：224毫秒', '0', '', '2021-02-09 07:00:00');
INSERT INTO `sys_job_log` VALUES (111, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：174毫秒', '0', '', '2021-02-09 08:00:00');
INSERT INTO `sys_job_log` VALUES (112, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：164毫秒', '0', '', '2021-02-09 08:00:00');
INSERT INTO `sys_job_log` VALUES (113, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：188毫秒', '0', '', '2021-02-09 09:00:00');
INSERT INTO `sys_job_log` VALUES (114, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：215毫秒', '0', '', '2021-02-09 09:00:00');
INSERT INTO `sys_job_log` VALUES (115, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：115毫秒', '0', '', '2021-02-09 10:00:00');
INSERT INTO `sys_job_log` VALUES (116, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-09 10:00:00');
INSERT INTO `sys_job_log` VALUES (117, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：150毫秒', '0', '', '2021-02-09 11:00:00');
INSERT INTO `sys_job_log` VALUES (118, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：225毫秒', '0', '', '2021-02-09 11:00:00');
INSERT INTO `sys_job_log` VALUES (119, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-09 12:00:00');
INSERT INTO `sys_job_log` VALUES (120, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：182毫秒', '0', '', '2021-02-09 12:00:00');
INSERT INTO `sys_job_log` VALUES (121, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：218毫秒', '0', '', '2021-02-09 13:00:00');
INSERT INTO `sys_job_log` VALUES (122, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：225毫秒', '0', '', '2021-02-09 13:00:00');
INSERT INTO `sys_job_log` VALUES (123, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：172毫秒', '0', '', '2021-02-09 14:00:00');
INSERT INTO `sys_job_log` VALUES (124, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-09 14:00:00');
INSERT INTO `sys_job_log` VALUES (125, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：206毫秒', '0', '', '2021-02-09 15:00:00');
INSERT INTO `sys_job_log` VALUES (126, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：153毫秒', '0', '', '2021-02-09 15:00:00');
INSERT INTO `sys_job_log` VALUES (127, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：176毫秒', '0', '', '2021-02-09 16:00:00');
INSERT INTO `sys_job_log` VALUES (128, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：160毫秒', '0', '', '2021-02-09 16:00:00');
INSERT INTO `sys_job_log` VALUES (129, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-09 17:00:00');
INSERT INTO `sys_job_log` VALUES (130, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：155毫秒', '0', '', '2021-02-09 17:00:00');
INSERT INTO `sys_job_log` VALUES (131, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-09 18:00:00');
INSERT INTO `sys_job_log` VALUES (132, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：230毫秒', '0', '', '2021-02-09 18:00:00');
INSERT INTO `sys_job_log` VALUES (133, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-09 19:00:00');
INSERT INTO `sys_job_log` VALUES (134, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：198毫秒', '0', '', '2021-02-09 19:00:00');
INSERT INTO `sys_job_log` VALUES (135, '多线程签到 - 晚', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 晚 总共耗时：60024毫秒', '0', '', '2021-02-09 19:02:01');
INSERT INTO `sys_job_log` VALUES (136, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：12毫秒', '0', '', '2021-02-09 19:06:01');
INSERT INTO `sys_job_log` VALUES (137, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：122毫秒', '0', '', '2021-02-09 20:00:00');
INSERT INTO `sys_job_log` VALUES (138, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：181毫秒', '0', '', '2021-02-09 20:00:00');
INSERT INTO `sys_job_log` VALUES (139, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：262毫秒', '0', '', '2021-02-09 21:00:00');
INSERT INTO `sys_job_log` VALUES (140, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：233毫秒', '0', '', '2021-02-09 21:00:00');
INSERT INTO `sys_job_log` VALUES (141, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-09 22:00:00');
INSERT INTO `sys_job_log` VALUES (142, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：137毫秒', '0', '', '2021-02-09 22:00:00');
INSERT INTO `sys_job_log` VALUES (143, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：503毫秒', '0', '', '2021-02-09 23:00:00');
INSERT INTO `sys_job_log` VALUES (144, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：467毫秒', '0', '', '2021-02-09 23:00:00');
INSERT INTO `sys_job_log` VALUES (145, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：187毫秒', '0', '', '2021-02-10 00:00:00');
INSERT INTO `sys_job_log` VALUES (146, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：149毫秒', '0', '', '2021-02-10 00:00:00');
INSERT INTO `sys_job_log` VALUES (147, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：245毫秒', '0', '', '2021-02-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (148, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：237毫秒', '0', '', '2021-02-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (149, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：200毫秒', '0', '', '2021-02-10 02:00:00');
INSERT INTO `sys_job_log` VALUES (150, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：141毫秒', '0', '', '2021-02-10 02:00:00');
INSERT INTO `sys_job_log` VALUES (151, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：164毫秒', '0', '', '2021-02-10 03:00:00');
INSERT INTO `sys_job_log` VALUES (152, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-10 03:00:00');
INSERT INTO `sys_job_log` VALUES (153, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：372毫秒', '0', '', '2021-02-10 04:00:00');
INSERT INTO `sys_job_log` VALUES (154, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：165毫秒', '0', '', '2021-02-10 04:00:00');
INSERT INTO `sys_job_log` VALUES (155, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：407毫秒', '0', '', '2021-02-10 05:00:00');
INSERT INTO `sys_job_log` VALUES (156, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：447毫秒', '0', '', '2021-02-10 05:00:00');
INSERT INTO `sys_job_log` VALUES (157, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-10 06:00:00');
INSERT INTO `sys_job_log` VALUES (158, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：183毫秒', '0', '', '2021-02-10 06:00:00');
INSERT INTO `sys_job_log` VALUES (159, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：56521毫秒', '0', '', '2021-02-10 06:31:57');
INSERT INTO `sys_job_log` VALUES (160, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：28毫秒', '0', '', '2021-02-10 06:36:01');
INSERT INTO `sys_job_log` VALUES (161, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：141毫秒', '0', '', '2021-02-10 07:00:00');
INSERT INTO `sys_job_log` VALUES (162, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：267毫秒', '0', '', '2021-02-10 07:00:00');
INSERT INTO `sys_job_log` VALUES (163, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：181毫秒', '0', '', '2021-02-10 08:00:00');
INSERT INTO `sys_job_log` VALUES (164, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：210毫秒', '0', '', '2021-02-10 08:00:00');
INSERT INTO `sys_job_log` VALUES (165, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：148毫秒', '0', '', '2021-02-10 09:00:00');
INSERT INTO `sys_job_log` VALUES (166, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：207毫秒', '0', '', '2021-02-10 09:00:00');
INSERT INTO `sys_job_log` VALUES (167, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：402毫秒', '0', '', '2021-02-10 10:00:00');
INSERT INTO `sys_job_log` VALUES (168, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：368毫秒', '0', '', '2021-02-10 10:00:00');
INSERT INTO `sys_job_log` VALUES (169, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-10 11:00:00');
INSERT INTO `sys_job_log` VALUES (170, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：191毫秒', '0', '', '2021-02-10 11:00:00');
INSERT INTO `sys_job_log` VALUES (171, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：137毫秒', '0', '', '2021-02-10 12:00:00');
INSERT INTO `sys_job_log` VALUES (172, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：210毫秒', '0', '', '2021-02-10 12:00:00');
INSERT INTO `sys_job_log` VALUES (173, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：152毫秒', '0', '', '2021-02-10 13:00:00');
INSERT INTO `sys_job_log` VALUES (174, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-10 13:00:00');
INSERT INTO `sys_job_log` VALUES (175, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：212毫秒', '0', '', '2021-02-10 14:00:00');
INSERT INTO `sys_job_log` VALUES (176, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：226毫秒', '0', '', '2021-02-10 14:00:00');
INSERT INTO `sys_job_log` VALUES (177, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：225毫秒', '0', '', '2021-02-10 15:00:00');
INSERT INTO `sys_job_log` VALUES (178, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-10 15:00:00');
INSERT INTO `sys_job_log` VALUES (179, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：274毫秒', '0', '', '2021-02-10 16:00:00');
INSERT INTO `sys_job_log` VALUES (180, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：197毫秒', '0', '', '2021-02-10 16:00:00');
INSERT INTO `sys_job_log` VALUES (181, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：219毫秒', '0', '', '2021-02-10 17:00:00');
INSERT INTO `sys_job_log` VALUES (182, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-10 17:00:00');
INSERT INTO `sys_job_log` VALUES (183, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：242毫秒', '0', '', '2021-02-10 18:00:00');
INSERT INTO `sys_job_log` VALUES (184, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：233毫秒', '0', '', '2021-02-10 18:00:00');
INSERT INTO `sys_job_log` VALUES (185, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-10 19:00:00');
INSERT INTO `sys_job_log` VALUES (186, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：223毫秒', '0', '', '2021-02-10 19:00:00');
INSERT INTO `sys_job_log` VALUES (187, '多线程签到 - 晚', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 晚 总共耗时：59861毫秒', '0', '', '2021-02-10 19:02:00');
INSERT INTO `sys_job_log` VALUES (188, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：27毫秒', '0', '', '2021-02-10 19:06:01');
INSERT INTO `sys_job_log` VALUES (189, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：128毫秒', '0', '', '2021-02-10 20:00:00');
INSERT INTO `sys_job_log` VALUES (190, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：204毫秒', '0', '', '2021-02-10 20:00:00');
INSERT INTO `sys_job_log` VALUES (191, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：252毫秒', '0', '', '2021-02-10 21:00:00');
INSERT INTO `sys_job_log` VALUES (192, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：147毫秒', '0', '', '2021-02-10 21:00:00');
INSERT INTO `sys_job_log` VALUES (193, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：188毫秒', '0', '', '2021-02-10 22:00:00');
INSERT INTO `sys_job_log` VALUES (194, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：207毫秒', '0', '', '2021-02-10 22:00:00');
INSERT INTO `sys_job_log` VALUES (195, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：282毫秒', '0', '', '2021-02-10 23:00:00');
INSERT INTO `sys_job_log` VALUES (196, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：243毫秒', '0', '', '2021-02-10 23:00:00');
INSERT INTO `sys_job_log` VALUES (197, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：213毫秒', '0', '', '2021-02-11 00:00:00');
INSERT INTO `sys_job_log` VALUES (198, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-11 00:00:00');
INSERT INTO `sys_job_log` VALUES (199, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：1191毫秒', '0', '', '2021-02-11 01:00:01');
INSERT INTO `sys_job_log` VALUES (200, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：1219毫秒', '0', '', '2021-02-11 01:00:01');
INSERT INTO `sys_job_log` VALUES (201, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：469毫秒', '0', '', '2021-02-11 02:00:00');
INSERT INTO `sys_job_log` VALUES (202, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：464毫秒', '0', '', '2021-02-11 02:00:00');
INSERT INTO `sys_job_log` VALUES (203, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：279毫秒', '0', '', '2021-02-11 03:00:00');
INSERT INTO `sys_job_log` VALUES (204, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：176毫秒', '0', '', '2021-02-11 03:00:00');
INSERT INTO `sys_job_log` VALUES (205, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：274毫秒', '0', '', '2021-02-11 04:00:00');
INSERT INTO `sys_job_log` VALUES (206, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-11 04:00:00');
INSERT INTO `sys_job_log` VALUES (207, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：193毫秒', '0', '', '2021-02-11 05:00:00');
INSERT INTO `sys_job_log` VALUES (208, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：208毫秒', '0', '', '2021-02-11 05:00:00');
INSERT INTO `sys_job_log` VALUES (209, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：505毫秒', '0', '', '2021-02-11 06:00:00');
INSERT INTO `sys_job_log` VALUES (210, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：517毫秒', '0', '', '2021-02-11 06:00:00');
INSERT INTO `sys_job_log` VALUES (211, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：60548毫秒', '0', '', '2021-02-11 06:32:01');
INSERT INTO `sys_job_log` VALUES (212, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：57毫秒', '0', '', '2021-02-11 06:36:01');
INSERT INTO `sys_job_log` VALUES (213, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：142毫秒', '0', '', '2021-02-11 07:00:00');
INSERT INTO `sys_job_log` VALUES (214, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-11 07:00:00');
INSERT INTO `sys_job_log` VALUES (215, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：142毫秒', '0', '', '2021-02-11 08:00:00');
INSERT INTO `sys_job_log` VALUES (216, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：152毫秒', '0', '', '2021-02-11 08:00:00');
INSERT INTO `sys_job_log` VALUES (217, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：191毫秒', '0', '', '2021-02-11 09:00:00');
INSERT INTO `sys_job_log` VALUES (218, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：249毫秒', '0', '', '2021-02-11 09:00:00');
INSERT INTO `sys_job_log` VALUES (219, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-11 10:00:00');
INSERT INTO `sys_job_log` VALUES (220, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：209毫秒', '0', '', '2021-02-11 10:00:00');
INSERT INTO `sys_job_log` VALUES (221, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：189毫秒', '0', '', '2021-02-11 11:00:00');
INSERT INTO `sys_job_log` VALUES (222, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：195毫秒', '0', '', '2021-02-11 11:00:00');
INSERT INTO `sys_job_log` VALUES (223, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：185毫秒', '0', '', '2021-02-11 12:00:00');
INSERT INTO `sys_job_log` VALUES (224, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：206毫秒', '0', '', '2021-02-11 12:00:00');
INSERT INTO `sys_job_log` VALUES (225, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：181毫秒', '0', '', '2021-02-11 13:00:00');
INSERT INTO `sys_job_log` VALUES (226, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：237毫秒', '0', '', '2021-02-11 13:00:00');
INSERT INTO `sys_job_log` VALUES (227, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：302毫秒', '0', '', '2021-02-11 14:00:00');
INSERT INTO `sys_job_log` VALUES (228, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：260毫秒', '0', '', '2021-02-11 14:00:00');
INSERT INTO `sys_job_log` VALUES (229, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-11 15:00:00');
INSERT INTO `sys_job_log` VALUES (230, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：251毫秒', '0', '', '2021-02-11 15:00:00');
INSERT INTO `sys_job_log` VALUES (231, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：501毫秒', '0', '', '2021-02-11 16:00:00');
INSERT INTO `sys_job_log` VALUES (232, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：268毫秒', '0', '', '2021-02-11 16:00:00');
INSERT INTO `sys_job_log` VALUES (233, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：177毫秒', '0', '', '2021-02-11 17:00:00');
INSERT INTO `sys_job_log` VALUES (234, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：155毫秒', '0', '', '2021-02-11 17:00:00');
INSERT INTO `sys_job_log` VALUES (235, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：227毫秒', '0', '', '2021-02-11 18:00:00');
INSERT INTO `sys_job_log` VALUES (236, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：151毫秒', '0', '', '2021-02-11 18:00:00');
INSERT INTO `sys_job_log` VALUES (237, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：234毫秒', '0', '', '2021-02-11 19:00:00');
INSERT INTO `sys_job_log` VALUES (238, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：160毫秒', '0', '', '2021-02-11 19:00:00');
INSERT INTO `sys_job_log` VALUES (239, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：43毫秒', '0', '', '2021-02-11 19:06:01');
INSERT INTO `sys_job_log` VALUES (240, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：228毫秒', '0', '', '2021-02-11 20:00:00');
INSERT INTO `sys_job_log` VALUES (241, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：157毫秒', '0', '', '2021-02-11 20:00:00');
INSERT INTO `sys_job_log` VALUES (242, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：288毫秒', '0', '', '2021-02-11 21:00:00');
INSERT INTO `sys_job_log` VALUES (243, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：212毫秒', '0', '', '2021-02-11 21:00:00');
INSERT INTO `sys_job_log` VALUES (244, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-11 22:00:00');
INSERT INTO `sys_job_log` VALUES (245, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-11 22:00:00');
INSERT INTO `sys_job_log` VALUES (246, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：187毫秒', '0', '', '2021-02-11 23:00:00');
INSERT INTO `sys_job_log` VALUES (247, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：199毫秒', '0', '', '2021-02-11 23:00:00');
INSERT INTO `sys_job_log` VALUES (248, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：261毫秒', '0', '', '2021-02-12 00:00:00');
INSERT INTO `sys_job_log` VALUES (249, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：211毫秒', '0', '', '2021-02-12 00:00:00');
INSERT INTO `sys_job_log` VALUES (250, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (251, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：205毫秒', '0', '', '2021-02-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (252, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-12 02:00:00');
INSERT INTO `sys_job_log` VALUES (253, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-12 02:00:00');
INSERT INTO `sys_job_log` VALUES (254, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：267毫秒', '0', '', '2021-02-12 03:00:00');
INSERT INTO `sys_job_log` VALUES (255, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：146毫秒', '0', '', '2021-02-12 03:00:00');
INSERT INTO `sys_job_log` VALUES (256, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：429毫秒', '0', '', '2021-02-12 04:00:00');
INSERT INTO `sys_job_log` VALUES (257, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：265毫秒', '0', '', '2021-02-12 04:00:00');
INSERT INTO `sys_job_log` VALUES (258, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：142毫秒', '0', '', '2021-02-12 05:00:00');
INSERT INTO `sys_job_log` VALUES (259, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：153毫秒', '0', '', '2021-02-12 05:00:00');
INSERT INTO `sys_job_log` VALUES (260, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：413毫秒', '0', '', '2021-02-12 06:00:00');
INSERT INTO `sys_job_log` VALUES (261, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：458毫秒', '0', '', '2021-02-12 06:00:00');
INSERT INTO `sys_job_log` VALUES (262, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：56657毫秒', '0', '', '2021-02-12 06:31:57');
INSERT INTO `sys_job_log` VALUES (263, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：18毫秒', '0', '', '2021-02-12 06:36:01');
INSERT INTO `sys_job_log` VALUES (264, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：174毫秒', '0', '', '2021-02-12 07:00:00');
INSERT INTO `sys_job_log` VALUES (265, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：187毫秒', '0', '', '2021-02-12 07:00:00');
INSERT INTO `sys_job_log` VALUES (266, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：218毫秒', '0', '', '2021-02-12 08:00:00');
INSERT INTO `sys_job_log` VALUES (267, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：222毫秒', '0', '', '2021-02-12 08:00:00');
INSERT INTO `sys_job_log` VALUES (268, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-12 09:00:00');
INSERT INTO `sys_job_log` VALUES (269, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：145毫秒', '0', '', '2021-02-12 09:00:00');
INSERT INTO `sys_job_log` VALUES (270, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：177毫秒', '0', '', '2021-02-12 10:00:00');
INSERT INTO `sys_job_log` VALUES (271, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：187毫秒', '0', '', '2021-02-12 10:00:00');
INSERT INTO `sys_job_log` VALUES (272, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：285毫秒', '0', '', '2021-02-12 11:00:00');
INSERT INTO `sys_job_log` VALUES (273, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-12 11:00:00');
INSERT INTO `sys_job_log` VALUES (274, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：191毫秒', '0', '', '2021-02-12 12:00:00');
INSERT INTO `sys_job_log` VALUES (275, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-12 12:00:00');
INSERT INTO `sys_job_log` VALUES (276, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：196毫秒', '0', '', '2021-02-12 13:00:00');
INSERT INTO `sys_job_log` VALUES (277, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-12 13:00:00');
INSERT INTO `sys_job_log` VALUES (278, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：135毫秒', '0', '', '2021-02-12 14:00:00');
INSERT INTO `sys_job_log` VALUES (279, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：159毫秒', '0', '', '2021-02-12 14:00:00');
INSERT INTO `sys_job_log` VALUES (280, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：141毫秒', '0', '', '2021-02-12 15:00:00');
INSERT INTO `sys_job_log` VALUES (281, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：145毫秒', '0', '', '2021-02-12 15:00:00');
INSERT INTO `sys_job_log` VALUES (282, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：277毫秒', '0', '', '2021-02-12 16:00:00');
INSERT INTO `sys_job_log` VALUES (283, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：194毫秒', '0', '', '2021-02-12 16:00:00');
INSERT INTO `sys_job_log` VALUES (284, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-12 17:00:00');
INSERT INTO `sys_job_log` VALUES (285, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：191毫秒', '0', '', '2021-02-12 17:00:00');
INSERT INTO `sys_job_log` VALUES (286, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：180毫秒', '0', '', '2021-02-12 18:00:00');
INSERT INTO `sys_job_log` VALUES (287, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-12 18:00:00');
INSERT INTO `sys_job_log` VALUES (288, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：153毫秒', '0', '', '2021-02-12 19:00:00');
INSERT INTO `sys_job_log` VALUES (289, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：173毫秒', '0', '', '2021-02-12 19:00:00');
INSERT INTO `sys_job_log` VALUES (290, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：13毫秒', '0', '', '2021-02-12 19:06:01');
INSERT INTO `sys_job_log` VALUES (291, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：193毫秒', '0', '', '2021-02-12 20:00:00');
INSERT INTO `sys_job_log` VALUES (292, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：153毫秒', '0', '', '2021-02-12 20:00:00');
INSERT INTO `sys_job_log` VALUES (293, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：256毫秒', '0', '', '2021-02-12 21:00:00');
INSERT INTO `sys_job_log` VALUES (294, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：209毫秒', '0', '', '2021-02-12 21:00:00');
INSERT INTO `sys_job_log` VALUES (295, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-12 22:00:00');
INSERT INTO `sys_job_log` VALUES (296, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：162毫秒', '0', '', '2021-02-12 22:00:00');
INSERT INTO `sys_job_log` VALUES (297, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：1169毫秒', '0', '', '2021-02-12 23:00:01');
INSERT INTO `sys_job_log` VALUES (298, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：1180毫秒', '0', '', '2021-02-12 23:00:01');
INSERT INTO `sys_job_log` VALUES (299, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：230毫秒', '0', '', '2021-02-13 00:00:00');
INSERT INTO `sys_job_log` VALUES (300, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：195毫秒', '0', '', '2021-02-13 00:00:00');
INSERT INTO `sys_job_log` VALUES (301, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：286毫秒', '0', '', '2021-02-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (302, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：236毫秒', '0', '', '2021-02-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (303, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：149毫秒', '0', '', '2021-02-13 02:00:00');
INSERT INTO `sys_job_log` VALUES (304, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-13 02:00:00');
INSERT INTO `sys_job_log` VALUES (305, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：191毫秒', '0', '', '2021-02-13 03:00:00');
INSERT INTO `sys_job_log` VALUES (306, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：232毫秒', '0', '', '2021-02-13 03:00:00');
INSERT INTO `sys_job_log` VALUES (307, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：470毫秒', '0', '', '2021-02-13 04:00:00');
INSERT INTO `sys_job_log` VALUES (308, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：393毫秒', '0', '', '2021-02-13 04:00:00');
INSERT INTO `sys_job_log` VALUES (309, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：179毫秒', '0', '', '2021-02-13 05:00:00');
INSERT INTO `sys_job_log` VALUES (310, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：149毫秒', '0', '', '2021-02-13 05:00:00');
INSERT INTO `sys_job_log` VALUES (311, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：423毫秒', '0', '', '2021-02-13 06:00:00');
INSERT INTO `sys_job_log` VALUES (312, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：435毫秒', '0', '', '2021-02-13 06:00:00');
INSERT INTO `sys_job_log` VALUES (313, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：54557毫秒', '0', '', '2021-02-13 06:31:55');
INSERT INTO `sys_job_log` VALUES (314, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：10毫秒', '0', '', '2021-02-13 06:36:01');
INSERT INTO `sys_job_log` VALUES (315, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：223毫秒', '0', '', '2021-02-13 07:00:00');
INSERT INTO `sys_job_log` VALUES (316, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：154毫秒', '0', '', '2021-02-13 07:00:00');
INSERT INTO `sys_job_log` VALUES (317, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：153毫秒', '0', '', '2021-02-13 08:00:00');
INSERT INTO `sys_job_log` VALUES (318, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：175毫秒', '0', '', '2021-02-13 08:00:00');
INSERT INTO `sys_job_log` VALUES (319, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-13 09:00:00');
INSERT INTO `sys_job_log` VALUES (320, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：214毫秒', '0', '', '2021-02-13 09:00:00');
INSERT INTO `sys_job_log` VALUES (321, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-13 10:00:00');
INSERT INTO `sys_job_log` VALUES (322, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：201毫秒', '0', '', '2021-02-13 10:00:00');
INSERT INTO `sys_job_log` VALUES (323, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：200毫秒', '0', '', '2021-02-13 11:00:00');
INSERT INTO `sys_job_log` VALUES (324, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：199毫秒', '0', '', '2021-02-13 11:00:00');
INSERT INTO `sys_job_log` VALUES (325, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：157毫秒', '0', '', '2021-02-13 12:00:00');
INSERT INTO `sys_job_log` VALUES (326, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：151毫秒', '0', '', '2021-02-13 12:00:00');
INSERT INTO `sys_job_log` VALUES (327, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：202毫秒', '0', '', '2021-02-13 13:00:00');
INSERT INTO `sys_job_log` VALUES (328, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-13 13:00:00');
INSERT INTO `sys_job_log` VALUES (329, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：176毫秒', '0', '', '2021-02-13 14:00:00');
INSERT INTO `sys_job_log` VALUES (330, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：253毫秒', '0', '', '2021-02-13 14:00:00');
INSERT INTO `sys_job_log` VALUES (331, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：250毫秒', '0', '', '2021-02-13 15:00:00');
INSERT INTO `sys_job_log` VALUES (332, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：250毫秒', '0', '', '2021-02-13 15:00:00');
INSERT INTO `sys_job_log` VALUES (333, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：152毫秒', '0', '', '2021-02-13 16:00:00');
INSERT INTO `sys_job_log` VALUES (334, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：159毫秒', '0', '', '2021-02-13 16:00:00');
INSERT INTO `sys_job_log` VALUES (335, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：264毫秒', '0', '', '2021-02-13 17:00:00');
INSERT INTO `sys_job_log` VALUES (336, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：145毫秒', '0', '', '2021-02-13 17:00:00');
INSERT INTO `sys_job_log` VALUES (337, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：155毫秒', '0', '', '2021-02-13 18:00:00');
INSERT INTO `sys_job_log` VALUES (338, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：214毫秒', '0', '', '2021-02-13 18:00:00');
INSERT INTO `sys_job_log` VALUES (339, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：174毫秒', '0', '', '2021-02-13 19:00:00');
INSERT INTO `sys_job_log` VALUES (340, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：149毫秒', '0', '', '2021-02-13 19:00:00');
INSERT INTO `sys_job_log` VALUES (341, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：19毫秒', '0', '', '2021-02-13 19:06:01');
INSERT INTO `sys_job_log` VALUES (342, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：158毫秒', '0', '', '2021-02-13 20:00:00');
INSERT INTO `sys_job_log` VALUES (343, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：156毫秒', '0', '', '2021-02-13 20:00:00');
INSERT INTO `sys_job_log` VALUES (344, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：193毫秒', '0', '', '2021-02-13 21:00:00');
INSERT INTO `sys_job_log` VALUES (345, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：214毫秒', '0', '', '2021-02-13 21:00:00');
INSERT INTO `sys_job_log` VALUES (346, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-13 22:00:00');
INSERT INTO `sys_job_log` VALUES (347, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：235毫秒', '0', '', '2021-02-13 22:00:00');
INSERT INTO `sys_job_log` VALUES (348, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：163毫秒', '0', '', '2021-02-13 23:00:00');
INSERT INTO `sys_job_log` VALUES (349, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：190毫秒', '0', '', '2021-02-13 23:00:00');
INSERT INTO `sys_job_log` VALUES (350, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：181毫秒', '0', '', '2021-02-14 00:00:00');
INSERT INTO `sys_job_log` VALUES (351, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：191毫秒', '0', '', '2021-02-14 00:00:00');
INSERT INTO `sys_job_log` VALUES (352, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：182毫秒', '0', '', '2021-02-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (353, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：267毫秒', '0', '', '2021-02-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (354, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：204毫秒', '0', '', '2021-02-14 02:00:00');
INSERT INTO `sys_job_log` VALUES (355, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：227毫秒', '0', '', '2021-02-14 02:00:00');
INSERT INTO `sys_job_log` VALUES (356, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：392毫秒', '0', '', '2021-02-14 03:00:00');
INSERT INTO `sys_job_log` VALUES (357, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：407毫秒', '0', '', '2021-02-14 03:00:00');
INSERT INTO `sys_job_log` VALUES (358, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：186毫秒', '0', '', '2021-02-14 04:00:00');
INSERT INTO `sys_job_log` VALUES (359, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：160毫秒', '0', '', '2021-02-14 04:00:00');
INSERT INTO `sys_job_log` VALUES (360, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：155毫秒', '0', '', '2021-02-14 05:00:00');
INSERT INTO `sys_job_log` VALUES (361, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：163毫秒', '0', '', '2021-02-14 05:00:00');
INSERT INTO `sys_job_log` VALUES (362, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：366毫秒', '0', '', '2021-02-14 06:00:00');
INSERT INTO `sys_job_log` VALUES (363, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：408毫秒', '0', '', '2021-02-14 06:00:00');
INSERT INTO `sys_job_log` VALUES (364, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：56622毫秒', '0', '', '2021-02-14 06:31:57');
INSERT INTO `sys_job_log` VALUES (365, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：10毫秒', '0', '', '2021-02-14 06:36:01');
INSERT INTO `sys_job_log` VALUES (366, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-14 07:00:00');
INSERT INTO `sys_job_log` VALUES (367, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：244毫秒', '0', '', '2021-02-14 07:00:00');
INSERT INTO `sys_job_log` VALUES (368, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：465毫秒', '0', '', '2021-02-14 08:00:00');
INSERT INTO `sys_job_log` VALUES (369, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：261毫秒', '0', '', '2021-02-14 08:00:00');
INSERT INTO `sys_job_log` VALUES (370, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：408毫秒', '0', '', '2021-02-14 09:00:00');
INSERT INTO `sys_job_log` VALUES (371, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：382毫秒', '0', '', '2021-02-14 09:00:00');
INSERT INTO `sys_job_log` VALUES (372, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：172毫秒', '0', '', '2021-02-14 10:00:00');
INSERT INTO `sys_job_log` VALUES (373, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-14 10:00:00');
INSERT INTO `sys_job_log` VALUES (374, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：137毫秒', '0', '', '2021-02-14 11:00:00');
INSERT INTO `sys_job_log` VALUES (375, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：143毫秒', '0', '', '2021-02-14 11:00:00');
INSERT INTO `sys_job_log` VALUES (376, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：182毫秒', '0', '', '2021-02-14 12:00:00');
INSERT INTO `sys_job_log` VALUES (377, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-14 12:00:00');
INSERT INTO `sys_job_log` VALUES (378, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-14 13:00:00');
INSERT INTO `sys_job_log` VALUES (379, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-14 13:00:00');
INSERT INTO `sys_job_log` VALUES (380, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：163毫秒', '0', '', '2021-02-14 14:00:00');
INSERT INTO `sys_job_log` VALUES (381, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：239毫秒', '0', '', '2021-02-14 14:00:00');
INSERT INTO `sys_job_log` VALUES (382, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：141毫秒', '0', '', '2021-02-14 15:00:00');
INSERT INTO `sys_job_log` VALUES (383, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：200毫秒', '0', '', '2021-02-14 15:00:00');
INSERT INTO `sys_job_log` VALUES (384, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：136毫秒', '0', '', '2021-02-14 16:00:00');
INSERT INTO `sys_job_log` VALUES (385, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：190毫秒', '0', '', '2021-02-14 16:00:00');
INSERT INTO `sys_job_log` VALUES (386, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：150毫秒', '0', '', '2021-02-14 17:00:00');
INSERT INTO `sys_job_log` VALUES (387, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：149毫秒', '0', '', '2021-02-14 17:00:00');
INSERT INTO `sys_job_log` VALUES (388, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：216毫秒', '0', '', '2021-02-14 18:00:00');
INSERT INTO `sys_job_log` VALUES (389, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：231毫秒', '0', '', '2021-02-14 18:00:00');
INSERT INTO `sys_job_log` VALUES (390, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：148毫秒', '0', '', '2021-02-14 19:00:00');
INSERT INTO `sys_job_log` VALUES (391, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：202毫秒', '0', '', '2021-02-14 19:00:00');
INSERT INTO `sys_job_log` VALUES (392, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：12毫秒', '0', '', '2021-02-14 19:06:01');
INSERT INTO `sys_job_log` VALUES (393, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：231毫秒', '0', '', '2021-02-14 20:00:00');
INSERT INTO `sys_job_log` VALUES (394, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-14 20:00:00');
INSERT INTO `sys_job_log` VALUES (395, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：160毫秒', '0', '', '2021-02-14 21:00:00');
INSERT INTO `sys_job_log` VALUES (396, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：182毫秒', '0', '', '2021-02-14 21:00:00');
INSERT INTO `sys_job_log` VALUES (397, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：236毫秒', '0', '', '2021-02-14 22:00:00');
INSERT INTO `sys_job_log` VALUES (398, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：176毫秒', '0', '', '2021-02-14 22:00:00');
INSERT INTO `sys_job_log` VALUES (399, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：158毫秒', '0', '', '2021-02-14 23:00:00');
INSERT INTO `sys_job_log` VALUES (400, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：142毫秒', '0', '', '2021-02-14 23:00:00');
INSERT INTO `sys_job_log` VALUES (401, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：215毫秒', '0', '', '2021-02-15 00:00:00');
INSERT INTO `sys_job_log` VALUES (402, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：225毫秒', '0', '', '2021-02-15 00:00:00');
INSERT INTO `sys_job_log` VALUES (403, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：206毫秒', '0', '', '2021-02-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (404, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：168毫秒', '0', '', '2021-02-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (405, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：268毫秒', '0', '', '2021-02-15 02:00:00');
INSERT INTO `sys_job_log` VALUES (406, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-15 02:00:00');
INSERT INTO `sys_job_log` VALUES (407, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-15 03:00:00');
INSERT INTO `sys_job_log` VALUES (408, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：214毫秒', '0', '', '2021-02-15 03:00:00');
INSERT INTO `sys_job_log` VALUES (409, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：190毫秒', '0', '', '2021-02-15 04:00:00');
INSERT INTO `sys_job_log` VALUES (410, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：250毫秒', '0', '', '2021-02-15 04:00:00');
INSERT INTO `sys_job_log` VALUES (411, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：324毫秒', '0', '', '2021-02-15 05:00:00');
INSERT INTO `sys_job_log` VALUES (412, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：187毫秒', '0', '', '2021-02-15 05:00:00');
INSERT INTO `sys_job_log` VALUES (413, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：334毫秒', '0', '', '2021-02-15 06:00:00');
INSERT INTO `sys_job_log` VALUES (414, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：405毫秒', '0', '', '2021-02-15 06:00:00');
INSERT INTO `sys_job_log` VALUES (415, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：58854毫秒', '0', '', '2021-02-15 06:31:59');
INSERT INTO `sys_job_log` VALUES (416, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：29毫秒', '0', '', '2021-02-15 06:36:01');
INSERT INTO `sys_job_log` VALUES (417, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：169毫秒', '0', '', '2021-02-15 07:00:00');
INSERT INTO `sys_job_log` VALUES (418, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：162毫秒', '0', '', '2021-02-15 07:00:00');
INSERT INTO `sys_job_log` VALUES (419, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：164毫秒', '0', '', '2021-02-15 08:00:00');
INSERT INTO `sys_job_log` VALUES (420, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-15 08:00:00');
INSERT INTO `sys_job_log` VALUES (421, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：416毫秒', '0', '', '2021-02-15 09:00:00');
INSERT INTO `sys_job_log` VALUES (422, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：211毫秒', '0', '', '2021-02-15 09:00:00');
INSERT INTO `sys_job_log` VALUES (423, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：411毫秒', '0', '', '2021-02-15 10:00:00');
INSERT INTO `sys_job_log` VALUES (424, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：384毫秒', '0', '', '2021-02-15 10:00:00');
INSERT INTO `sys_job_log` VALUES (425, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-15 11:00:00');
INSERT INTO `sys_job_log` VALUES (426, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：156毫秒', '0', '', '2021-02-15 11:00:00');
INSERT INTO `sys_job_log` VALUES (427, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：357毫秒', '0', '', '2021-02-15 12:00:00');
INSERT INTO `sys_job_log` VALUES (428, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：434毫秒', '0', '', '2021-02-15 12:00:00');
INSERT INTO `sys_job_log` VALUES (429, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-15 13:00:00');
INSERT INTO `sys_job_log` VALUES (430, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-15 13:00:00');
INSERT INTO `sys_job_log` VALUES (431, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：154毫秒', '0', '', '2021-02-15 14:00:00');
INSERT INTO `sys_job_log` VALUES (432, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：202毫秒', '0', '', '2021-02-15 14:00:00');
INSERT INTO `sys_job_log` VALUES (433, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：255毫秒', '0', '', '2021-02-15 15:00:00');
INSERT INTO `sys_job_log` VALUES (434, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：215毫秒', '0', '', '2021-02-15 15:00:00');
INSERT INTO `sys_job_log` VALUES (435, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：139毫秒', '0', '', '2021-02-15 16:00:00');
INSERT INTO `sys_job_log` VALUES (436, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：151毫秒', '0', '', '2021-02-15 16:00:00');
INSERT INTO `sys_job_log` VALUES (437, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：299毫秒', '0', '', '2021-02-15 17:00:00');
INSERT INTO `sys_job_log` VALUES (438, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：208毫秒', '0', '', '2021-02-15 17:00:00');
INSERT INTO `sys_job_log` VALUES (439, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：278毫秒', '0', '', '2021-02-15 18:00:00');
INSERT INTO `sys_job_log` VALUES (440, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：215毫秒', '0', '', '2021-02-15 18:00:00');
INSERT INTO `sys_job_log` VALUES (441, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：144毫秒', '0', '', '2021-02-15 19:00:00');
INSERT INTO `sys_job_log` VALUES (442, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：206毫秒', '0', '', '2021-02-15 19:00:00');
INSERT INTO `sys_job_log` VALUES (443, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：40毫秒', '0', '', '2021-02-15 19:06:01');
INSERT INTO `sys_job_log` VALUES (444, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：134毫秒', '0', '', '2021-02-15 20:00:00');
INSERT INTO `sys_job_log` VALUES (445, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：184毫秒', '0', '', '2021-02-15 20:00:00');
INSERT INTO `sys_job_log` VALUES (446, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：219毫秒', '0', '', '2021-02-15 21:00:00');
INSERT INTO `sys_job_log` VALUES (447, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：244毫秒', '0', '', '2021-02-15 21:00:00');
INSERT INTO `sys_job_log` VALUES (448, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：156毫秒', '0', '', '2021-02-15 22:00:00');
INSERT INTO `sys_job_log` VALUES (449, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：147毫秒', '0', '', '2021-02-15 22:00:00');
INSERT INTO `sys_job_log` VALUES (450, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-15 23:00:00');
INSERT INTO `sys_job_log` VALUES (451, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：212毫秒', '0', '', '2021-02-15 23:00:00');
INSERT INTO `sys_job_log` VALUES (452, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：157毫秒', '0', '', '2021-02-16 00:00:00');
INSERT INTO `sys_job_log` VALUES (453, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：198毫秒', '0', '', '2021-02-16 00:00:00');
INSERT INTO `sys_job_log` VALUES (454, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：227毫秒', '0', '', '2021-02-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (455, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：224毫秒', '0', '', '2021-02-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (456, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：164毫秒', '0', '', '2021-02-16 02:00:00');
INSERT INTO `sys_job_log` VALUES (457, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：232毫秒', '0', '', '2021-02-16 02:00:00');
INSERT INTO `sys_job_log` VALUES (458, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-16 03:00:00');
INSERT INTO `sys_job_log` VALUES (459, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：190毫秒', '0', '', '2021-02-16 03:00:00');
INSERT INTO `sys_job_log` VALUES (460, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：132毫秒', '0', '', '2021-02-16 04:00:00');
INSERT INTO `sys_job_log` VALUES (461, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-16 04:00:00');
INSERT INTO `sys_job_log` VALUES (462, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：180毫秒', '0', '', '2021-02-16 05:00:00');
INSERT INTO `sys_job_log` VALUES (463, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-16 05:00:00');
INSERT INTO `sys_job_log` VALUES (464, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：163毫秒', '0', '', '2021-02-16 06:00:00');
INSERT INTO `sys_job_log` VALUES (465, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：167毫秒', '0', '', '2021-02-16 06:00:00');
INSERT INTO `sys_job_log` VALUES (466, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：54776毫秒', '0', '', '2021-02-16 06:31:55');
INSERT INTO `sys_job_log` VALUES (467, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：19毫秒', '0', '', '2021-02-16 06:36:01');
INSERT INTO `sys_job_log` VALUES (468, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：150毫秒', '0', '', '2021-02-16 07:00:00');
INSERT INTO `sys_job_log` VALUES (469, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：156毫秒', '0', '', '2021-02-16 07:00:00');
INSERT INTO `sys_job_log` VALUES (470, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：144毫秒', '0', '', '2021-02-16 08:00:00');
INSERT INTO `sys_job_log` VALUES (471, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：201毫秒', '0', '', '2021-02-16 08:00:00');
INSERT INTO `sys_job_log` VALUES (472, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：410毫秒', '0', '', '2021-02-16 09:00:00');
INSERT INTO `sys_job_log` VALUES (473, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：398毫秒', '0', '', '2021-02-16 09:00:00');
INSERT INTO `sys_job_log` VALUES (474, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：393毫秒', '0', '', '2021-02-16 10:00:00');
INSERT INTO `sys_job_log` VALUES (475, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：448毫秒', '0', '', '2021-02-16 10:00:00');
INSERT INTO `sys_job_log` VALUES (476, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：429毫秒', '0', '', '2021-02-16 11:00:00');
INSERT INTO `sys_job_log` VALUES (477, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：408毫秒', '0', '', '2021-02-16 11:00:00');
INSERT INTO `sys_job_log` VALUES (478, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：172毫秒', '0', '', '2021-02-16 12:00:00');
INSERT INTO `sys_job_log` VALUES (479, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：152毫秒', '0', '', '2021-02-16 12:00:00');
INSERT INTO `sys_job_log` VALUES (480, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：150毫秒', '0', '', '2021-02-16 13:00:00');
INSERT INTO `sys_job_log` VALUES (481, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：167毫秒', '0', '', '2021-02-16 13:00:00');
INSERT INTO `sys_job_log` VALUES (482, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：158毫秒', '0', '', '2021-02-16 14:00:00');
INSERT INTO `sys_job_log` VALUES (483, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：202毫秒', '0', '', '2021-02-16 14:00:00');
INSERT INTO `sys_job_log` VALUES (484, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：139毫秒', '0', '', '2021-02-16 15:00:00');
INSERT INTO `sys_job_log` VALUES (485, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：163毫秒', '0', '', '2021-02-16 15:00:00');
INSERT INTO `sys_job_log` VALUES (486, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：152毫秒', '0', '', '2021-02-16 16:00:00');
INSERT INTO `sys_job_log` VALUES (487, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：203毫秒', '0', '', '2021-02-16 16:00:00');
INSERT INTO `sys_job_log` VALUES (488, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：129毫秒', '0', '', '2021-02-16 17:00:00');
INSERT INTO `sys_job_log` VALUES (489, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：191毫秒', '0', '', '2021-02-16 17:00:00');
INSERT INTO `sys_job_log` VALUES (490, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：158毫秒', '0', '', '2021-02-16 18:00:00');
INSERT INTO `sys_job_log` VALUES (491, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：204毫秒', '0', '', '2021-02-16 18:00:00');
INSERT INTO `sys_job_log` VALUES (492, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：348毫秒', '0', '', '2021-02-16 19:00:00');
INSERT INTO `sys_job_log` VALUES (493, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：214毫秒', '0', '', '2021-02-16 19:00:00');
INSERT INTO `sys_job_log` VALUES (494, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：72毫秒', '0', '', '2021-02-16 19:06:01');
INSERT INTO `sys_job_log` VALUES (495, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：133毫秒', '0', '', '2021-02-16 20:00:00');
INSERT INTO `sys_job_log` VALUES (496, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：143毫秒', '0', '', '2021-02-16 20:00:00');
INSERT INTO `sys_job_log` VALUES (497, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：174毫秒', '0', '', '2021-02-16 21:00:00');
INSERT INTO `sys_job_log` VALUES (498, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：226毫秒', '0', '', '2021-02-16 21:00:00');
INSERT INTO `sys_job_log` VALUES (499, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：471毫秒', '0', '', '2021-02-16 22:00:00');
INSERT INTO `sys_job_log` VALUES (500, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：481毫秒', '0', '', '2021-02-16 22:00:00');
INSERT INTO `sys_job_log` VALUES (501, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：172毫秒', '0', '', '2021-02-16 23:00:00');
INSERT INTO `sys_job_log` VALUES (502, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：213毫秒', '0', '', '2021-02-16 23:00:00');
INSERT INTO `sys_job_log` VALUES (503, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：243毫秒', '0', '', '2021-02-17 00:00:00');
INSERT INTO `sys_job_log` VALUES (504, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：200毫秒', '0', '', '2021-02-17 00:00:00');
INSERT INTO `sys_job_log` VALUES (505, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：195毫秒', '0', '', '2021-02-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (506, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：179毫秒', '0', '', '2021-02-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (507, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-17 02:00:00');
INSERT INTO `sys_job_log` VALUES (508, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：191毫秒', '0', '', '2021-02-17 02:00:00');
INSERT INTO `sys_job_log` VALUES (509, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：197毫秒', '0', '', '2021-02-17 03:00:00');
INSERT INTO `sys_job_log` VALUES (510, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-17 03:00:00');
INSERT INTO `sys_job_log` VALUES (511, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：153毫秒', '0', '', '2021-02-17 04:00:00');
INSERT INTO `sys_job_log` VALUES (512, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：224毫秒', '0', '', '2021-02-17 04:00:00');
INSERT INTO `sys_job_log` VALUES (513, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：189毫秒', '0', '', '2021-02-17 05:00:00');
INSERT INTO `sys_job_log` VALUES (514, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-17 05:00:00');
INSERT INTO `sys_job_log` VALUES (515, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：146毫秒', '0', '', '2021-02-17 06:00:00');
INSERT INTO `sys_job_log` VALUES (516, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：169毫秒', '0', '', '2021-02-17 06:00:00');
INSERT INTO `sys_job_log` VALUES (517, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：62968毫秒', '0', '', '2021-02-17 06:32:03');
INSERT INTO `sys_job_log` VALUES (518, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：19毫秒', '0', '', '2021-02-17 06:36:01');
INSERT INTO `sys_job_log` VALUES (519, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：406毫秒', '0', '', '2021-02-17 07:00:00');
INSERT INTO `sys_job_log` VALUES (520, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：429毫秒', '0', '', '2021-02-17 07:00:00');
INSERT INTO `sys_job_log` VALUES (521, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：144毫秒', '0', '', '2021-02-17 08:00:00');
INSERT INTO `sys_job_log` VALUES (522, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：153毫秒', '0', '', '2021-02-17 08:00:00');
INSERT INTO `sys_job_log` VALUES (523, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-17 09:00:00');
INSERT INTO `sys_job_log` VALUES (524, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：180毫秒', '0', '', '2021-02-17 09:00:00');
INSERT INTO `sys_job_log` VALUES (525, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：362毫秒', '0', '', '2021-02-17 10:00:00');
INSERT INTO `sys_job_log` VALUES (526, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：367毫秒', '0', '', '2021-02-17 10:00:00');
INSERT INTO `sys_job_log` VALUES (527, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：423毫秒', '0', '', '2021-02-17 11:00:00');
INSERT INTO `sys_job_log` VALUES (528, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：441毫秒', '0', '', '2021-02-17 11:00:00');
INSERT INTO `sys_job_log` VALUES (529, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：160毫秒', '0', '', '2021-02-17 12:00:00');
INSERT INTO `sys_job_log` VALUES (530, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：142毫秒', '0', '', '2021-02-17 12:00:00');
INSERT INTO `sys_job_log` VALUES (531, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：189毫秒', '0', '', '2021-02-17 13:00:00');
INSERT INTO `sys_job_log` VALUES (532, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：205毫秒', '0', '', '2021-02-17 13:00:00');
INSERT INTO `sys_job_log` VALUES (533, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：630毫秒', '0', '', '2021-02-17 14:00:00');
INSERT INTO `sys_job_log` VALUES (534, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：504毫秒', '0', '', '2021-02-17 14:00:00');
INSERT INTO `sys_job_log` VALUES (535, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：146毫秒', '0', '', '2021-02-17 15:00:00');
INSERT INTO `sys_job_log` VALUES (536, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：137毫秒', '0', '', '2021-02-17 15:00:00');
INSERT INTO `sys_job_log` VALUES (537, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：186毫秒', '0', '', '2021-02-17 16:00:00');
INSERT INTO `sys_job_log` VALUES (538, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-17 16:00:00');
INSERT INTO `sys_job_log` VALUES (539, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-17 17:00:00');
INSERT INTO `sys_job_log` VALUES (540, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：152毫秒', '0', '', '2021-02-17 17:00:00');
INSERT INTO `sys_job_log` VALUES (541, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：204毫秒', '0', '', '2021-02-17 18:00:00');
INSERT INTO `sys_job_log` VALUES (542, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-17 18:00:00');
INSERT INTO `sys_job_log` VALUES (543, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：149毫秒', '0', '', '2021-02-17 19:00:00');
INSERT INTO `sys_job_log` VALUES (544, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-17 19:00:00');
INSERT INTO `sys_job_log` VALUES (545, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：90毫秒', '0', '', '2021-02-17 19:06:01');
INSERT INTO `sys_job_log` VALUES (546, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：163毫秒', '0', '', '2021-02-17 20:00:00');
INSERT INTO `sys_job_log` VALUES (547, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：211毫秒', '0', '', '2021-02-17 20:00:00');
INSERT INTO `sys_job_log` VALUES (548, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：148毫秒', '0', '', '2021-02-17 21:00:00');
INSERT INTO `sys_job_log` VALUES (549, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：206毫秒', '0', '', '2021-02-17 21:00:00');
INSERT INTO `sys_job_log` VALUES (550, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：430毫秒', '0', '', '2021-02-17 22:00:00');
INSERT INTO `sys_job_log` VALUES (551, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：451毫秒', '0', '', '2021-02-17 22:00:00');
INSERT INTO `sys_job_log` VALUES (552, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：188毫秒', '0', '', '2021-02-17 23:00:00');
INSERT INTO `sys_job_log` VALUES (553, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：159毫秒', '0', '', '2021-02-17 23:00:00');
INSERT INTO `sys_job_log` VALUES (554, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-18 00:00:00');
INSERT INTO `sys_job_log` VALUES (555, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：230毫秒', '0', '', '2021-02-18 00:00:00');
INSERT INTO `sys_job_log` VALUES (556, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：168毫秒', '0', '', '2021-02-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (557, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：177毫秒', '0', '', '2021-02-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (558, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：267毫秒', '0', '', '2021-02-18 02:00:00');
INSERT INTO `sys_job_log` VALUES (559, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-18 02:00:00');
INSERT INTO `sys_job_log` VALUES (560, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-18 03:00:00');
INSERT INTO `sys_job_log` VALUES (561, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-18 03:00:00');
INSERT INTO `sys_job_log` VALUES (562, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：151毫秒', '0', '', '2021-02-18 04:00:00');
INSERT INTO `sys_job_log` VALUES (563, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：148毫秒', '0', '', '2021-02-18 04:00:00');
INSERT INTO `sys_job_log` VALUES (564, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：147毫秒', '0', '', '2021-02-18 05:00:00');
INSERT INTO `sys_job_log` VALUES (565, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：219毫秒', '0', '', '2021-02-18 05:00:00');
INSERT INTO `sys_job_log` VALUES (566, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：151毫秒', '0', '', '2021-02-18 06:00:00');
INSERT INTO `sys_job_log` VALUES (567, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：164毫秒', '0', '', '2021-02-18 06:00:00');
INSERT INTO `sys_job_log` VALUES (568, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：62265毫秒', '0', '', '2021-02-18 06:32:03');
INSERT INTO `sys_job_log` VALUES (569, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：25毫秒', '0', '', '2021-02-18 06:36:01');
INSERT INTO `sys_job_log` VALUES (570, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-18 07:00:00');
INSERT INTO `sys_job_log` VALUES (571, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：187毫秒', '0', '', '2021-02-18 07:00:00');
INSERT INTO `sys_job_log` VALUES (572, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-18 08:00:00');
INSERT INTO `sys_job_log` VALUES (573, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：167毫秒', '0', '', '2021-02-18 08:00:00');
INSERT INTO `sys_job_log` VALUES (574, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：177毫秒', '0', '', '2021-02-18 09:00:00');
INSERT INTO `sys_job_log` VALUES (575, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：201毫秒', '0', '', '2021-02-18 09:00:00');
INSERT INTO `sys_job_log` VALUES (576, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：134毫秒', '0', '', '2021-02-18 10:00:00');
INSERT INTO `sys_job_log` VALUES (577, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：161毫秒', '0', '', '2021-02-18 10:00:00');
INSERT INTO `sys_job_log` VALUES (578, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：290毫秒', '0', '', '2021-02-18 11:00:00');
INSERT INTO `sys_job_log` VALUES (579, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：146毫秒', '0', '', '2021-02-18 11:00:00');
INSERT INTO `sys_job_log` VALUES (580, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：1228毫秒', '0', '', '2021-02-18 12:00:01');
INSERT INTO `sys_job_log` VALUES (581, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：1317毫秒', '0', '', '2021-02-18 12:00:01');
INSERT INTO `sys_job_log` VALUES (582, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：338毫秒', '0', '', '2021-02-18 13:00:00');
INSERT INTO `sys_job_log` VALUES (583, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：243毫秒', '0', '', '2021-02-18 13:00:00');
INSERT INTO `sys_job_log` VALUES (584, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：1238毫秒', '0', '', '2021-02-18 14:00:01');
INSERT INTO `sys_job_log` VALUES (585, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：1224毫秒', '0', '', '2021-02-18 14:00:01');
INSERT INTO `sys_job_log` VALUES (586, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-18 15:00:00');
INSERT INTO `sys_job_log` VALUES (587, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：164毫秒', '0', '', '2021-02-18 15:00:00');
INSERT INTO `sys_job_log` VALUES (588, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：191毫秒', '0', '', '2021-02-18 16:00:00');
INSERT INTO `sys_job_log` VALUES (589, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：192毫秒', '0', '', '2021-02-18 16:00:00');
INSERT INTO `sys_job_log` VALUES (590, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-18 17:00:00');
INSERT INTO `sys_job_log` VALUES (591, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：223毫秒', '0', '', '2021-02-18 17:00:00');
INSERT INTO `sys_job_log` VALUES (592, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：261毫秒', '0', '', '2021-02-18 18:00:00');
INSERT INTO `sys_job_log` VALUES (593, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：182毫秒', '0', '', '2021-02-18 18:00:00');
INSERT INTO `sys_job_log` VALUES (594, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：156毫秒', '0', '', '2021-02-18 19:00:00');
INSERT INTO `sys_job_log` VALUES (595, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：231毫秒', '0', '', '2021-02-18 19:00:00');
INSERT INTO `sys_job_log` VALUES (596, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：38毫秒', '0', '', '2021-02-18 19:06:01');
INSERT INTO `sys_job_log` VALUES (597, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：482毫秒', '0', '', '2021-02-18 20:00:00');
INSERT INTO `sys_job_log` VALUES (598, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：470毫秒', '0', '', '2021-02-18 20:00:00');
INSERT INTO `sys_job_log` VALUES (599, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：156毫秒', '0', '', '2021-02-18 21:00:00');
INSERT INTO `sys_job_log` VALUES (600, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：163毫秒', '0', '', '2021-02-18 21:00:00');
INSERT INTO `sys_job_log` VALUES (601, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-18 22:00:00');
INSERT INTO `sys_job_log` VALUES (602, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：167毫秒', '0', '', '2021-02-18 22:00:00');
INSERT INTO `sys_job_log` VALUES (603, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：828毫秒', '0', '', '2021-02-18 23:00:00');
INSERT INTO `sys_job_log` VALUES (604, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：819毫秒', '0', '', '2021-02-18 23:00:00');
INSERT INTO `sys_job_log` VALUES (605, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：239毫秒', '0', '', '2021-02-19 00:00:00');
INSERT INTO `sys_job_log` VALUES (606, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-19 00:00:00');
INSERT INTO `sys_job_log` VALUES (607, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：179毫秒', '0', '', '2021-02-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (608, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：187毫秒', '0', '', '2021-02-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (609, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：179毫秒', '0', '', '2021-02-19 02:00:00');
INSERT INTO `sys_job_log` VALUES (610, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：226毫秒', '0', '', '2021-02-19 02:00:00');
INSERT INTO `sys_job_log` VALUES (611, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：215毫秒', '0', '', '2021-02-19 03:00:00');
INSERT INTO `sys_job_log` VALUES (612, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：195毫秒', '0', '', '2021-02-19 03:00:00');
INSERT INTO `sys_job_log` VALUES (613, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：201毫秒', '0', '', '2021-02-19 04:00:00');
INSERT INTO `sys_job_log` VALUES (614, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：239毫秒', '0', '', '2021-02-19 04:00:00');
INSERT INTO `sys_job_log` VALUES (615, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：219毫秒', '0', '', '2021-02-19 05:00:00');
INSERT INTO `sys_job_log` VALUES (616, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：184毫秒', '0', '', '2021-02-19 05:00:00');
INSERT INTO `sys_job_log` VALUES (617, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：169毫秒', '0', '', '2021-02-19 06:00:00');
INSERT INTO `sys_job_log` VALUES (618, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：208毫秒', '0', '', '2021-02-19 06:00:00');
INSERT INTO `sys_job_log` VALUES (619, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：64485毫秒', '0', '', '2021-02-19 06:32:05');
INSERT INTO `sys_job_log` VALUES (620, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：30毫秒', '0', '', '2021-02-19 06:36:01');
INSERT INTO `sys_job_log` VALUES (621, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-19 07:00:00');
INSERT INTO `sys_job_log` VALUES (622, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：224毫秒', '0', '', '2021-02-19 07:00:00');
INSERT INTO `sys_job_log` VALUES (623, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：199毫秒', '0', '', '2021-02-19 08:00:00');
INSERT INTO `sys_job_log` VALUES (624, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：172毫秒', '0', '', '2021-02-19 08:00:00');
INSERT INTO `sys_job_log` VALUES (625, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：317毫秒', '0', '', '2021-02-19 09:00:00');
INSERT INTO `sys_job_log` VALUES (626, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-19 09:00:00');
INSERT INTO `sys_job_log` VALUES (627, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：206毫秒', '0', '', '2021-02-19 10:00:00');
INSERT INTO `sys_job_log` VALUES (628, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：266毫秒', '0', '', '2021-02-19 10:00:00');
INSERT INTO `sys_job_log` VALUES (629, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-19 11:00:00');
INSERT INTO `sys_job_log` VALUES (630, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：165毫秒', '0', '', '2021-02-19 11:00:00');
INSERT INTO `sys_job_log` VALUES (631, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-19 12:00:00');
INSERT INTO `sys_job_log` VALUES (632, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-19 12:00:00');
INSERT INTO `sys_job_log` VALUES (633, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：395毫秒', '0', '', '2021-02-19 13:00:00');
INSERT INTO `sys_job_log` VALUES (634, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-19 13:00:00');
INSERT INTO `sys_job_log` VALUES (635, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：167毫秒', '0', '', '2021-02-19 14:00:00');
INSERT INTO `sys_job_log` VALUES (636, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：157毫秒', '0', '', '2021-02-19 14:00:00');
INSERT INTO `sys_job_log` VALUES (637, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：2681毫秒', '0', '', '2021-02-19 15:00:02');
INSERT INTO `sys_job_log` VALUES (638, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：2789毫秒', '0', '', '2021-02-19 15:00:02');
INSERT INTO `sys_job_log` VALUES (639, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：184毫秒', '0', '', '2021-02-19 16:00:00');
INSERT INTO `sys_job_log` VALUES (640, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：156毫秒', '0', '', '2021-02-19 16:00:00');
INSERT INTO `sys_job_log` VALUES (641, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：889毫秒', '0', '', '2021-02-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (642, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：908毫秒', '0', '', '2021-02-19 17:00:01');
INSERT INTO `sys_job_log` VALUES (643, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：169毫秒', '0', '', '2021-02-19 18:00:00');
INSERT INTO `sys_job_log` VALUES (644, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：240毫秒', '0', '', '2021-02-19 18:00:00');
INSERT INTO `sys_job_log` VALUES (645, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：218毫秒', '0', '', '2021-02-19 19:00:00');
INSERT INTO `sys_job_log` VALUES (646, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：284毫秒', '0', '', '2021-02-19 19:00:00');
INSERT INTO `sys_job_log` VALUES (647, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：38毫秒', '0', '', '2021-02-19 19:06:01');
INSERT INTO `sys_job_log` VALUES (648, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：246毫秒', '0', '', '2021-02-19 20:00:00');
INSERT INTO `sys_job_log` VALUES (649, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：217毫秒', '0', '', '2021-02-19 20:00:00');
INSERT INTO `sys_job_log` VALUES (650, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：215毫秒', '0', '', '2021-02-19 21:00:00');
INSERT INTO `sys_job_log` VALUES (651, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-19 21:00:00');
INSERT INTO `sys_job_log` VALUES (652, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：195毫秒', '0', '', '2021-02-19 22:00:00');
INSERT INTO `sys_job_log` VALUES (653, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-19 22:00:00');
INSERT INTO `sys_job_log` VALUES (654, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：569毫秒', '0', '', '2021-02-19 23:00:00');
INSERT INTO `sys_job_log` VALUES (655, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：510毫秒', '0', '', '2021-02-19 23:00:00');
INSERT INTO `sys_job_log` VALUES (656, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：218毫秒', '0', '', '2021-02-20 00:00:00');
INSERT INTO `sys_job_log` VALUES (657, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：216毫秒', '0', '', '2021-02-20 00:00:00');
INSERT INTO `sys_job_log` VALUES (658, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (659, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (660, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：194毫秒', '0', '', '2021-02-20 02:00:00');
INSERT INTO `sys_job_log` VALUES (661, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：238毫秒', '0', '', '2021-02-20 02:00:00');
INSERT INTO `sys_job_log` VALUES (662, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：432毫秒', '0', '', '2021-02-20 03:00:00');
INSERT INTO `sys_job_log` VALUES (663, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：423毫秒', '0', '', '2021-02-20 03:00:00');
INSERT INTO `sys_job_log` VALUES (664, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：211毫秒', '0', '', '2021-02-20 04:00:00');
INSERT INTO `sys_job_log` VALUES (665, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：240毫秒', '0', '', '2021-02-20 04:00:00');
INSERT INTO `sys_job_log` VALUES (666, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：669毫秒', '0', '', '2021-02-20 05:00:00');
INSERT INTO `sys_job_log` VALUES (667, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：431毫秒', '0', '', '2021-02-20 05:00:00');
INSERT INTO `sys_job_log` VALUES (668, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：228毫秒', '0', '', '2021-02-20 06:00:00');
INSERT INTO `sys_job_log` VALUES (669, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：248毫秒', '0', '', '2021-02-20 06:00:00');
INSERT INTO `sys_job_log` VALUES (670, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：61137毫秒', '0', '', '2021-02-20 06:32:02');
INSERT INTO `sys_job_log` VALUES (671, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：33毫秒', '0', '', '2021-02-20 06:36:01');
INSERT INTO `sys_job_log` VALUES (672, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-20 07:00:00');
INSERT INTO `sys_job_log` VALUES (673, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：151毫秒', '0', '', '2021-02-20 07:00:00');
INSERT INTO `sys_job_log` VALUES (674, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：205毫秒', '0', '', '2021-02-20 08:00:00');
INSERT INTO `sys_job_log` VALUES (675, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：169毫秒', '0', '', '2021-02-20 08:00:00');
INSERT INTO `sys_job_log` VALUES (676, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：188毫秒', '0', '', '2021-02-20 09:00:00');
INSERT INTO `sys_job_log` VALUES (677, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：238毫秒', '0', '', '2021-02-20 09:00:00');
INSERT INTO `sys_job_log` VALUES (678, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：253毫秒', '0', '', '2021-02-20 10:00:00');
INSERT INTO `sys_job_log` VALUES (679, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：164毫秒', '0', '', '2021-02-20 10:00:00');
INSERT INTO `sys_job_log` VALUES (680, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：209毫秒', '0', '', '2021-02-20 11:00:00');
INSERT INTO `sys_job_log` VALUES (681, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-20 11:00:00');
INSERT INTO `sys_job_log` VALUES (682, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：236毫秒', '0', '', '2021-02-20 12:00:00');
INSERT INTO `sys_job_log` VALUES (683, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：191毫秒', '0', '', '2021-02-20 12:00:00');
INSERT INTO `sys_job_log` VALUES (684, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：238毫秒', '0', '', '2021-02-20 13:00:00');
INSERT INTO `sys_job_log` VALUES (685, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：219毫秒', '0', '', '2021-02-20 13:00:00');
INSERT INTO `sys_job_log` VALUES (686, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：291毫秒', '0', '', '2021-02-20 14:00:00');
INSERT INTO `sys_job_log` VALUES (687, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：239毫秒', '0', '', '2021-02-20 14:00:00');
INSERT INTO `sys_job_log` VALUES (688, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：198毫秒', '0', '', '2021-02-20 15:00:00');
INSERT INTO `sys_job_log` VALUES (689, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-20 15:00:00');
INSERT INTO `sys_job_log` VALUES (690, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：399毫秒', '0', '', '2021-02-20 16:00:00');
INSERT INTO `sys_job_log` VALUES (691, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：419毫秒', '0', '', '2021-02-20 16:00:00');
INSERT INTO `sys_job_log` VALUES (692, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：616毫秒', '0', '', '2021-02-20 17:00:00');
INSERT INTO `sys_job_log` VALUES (693, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：653毫秒', '0', '', '2021-02-20 17:00:00');
INSERT INTO `sys_job_log` VALUES (694, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：196毫秒', '0', '', '2021-02-20 18:00:00');
INSERT INTO `sys_job_log` VALUES (695, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：230毫秒', '0', '', '2021-02-20 18:00:00');
INSERT INTO `sys_job_log` VALUES (696, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：197毫秒', '0', '', '2021-02-20 19:00:00');
INSERT INTO `sys_job_log` VALUES (697, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：210毫秒', '0', '', '2021-02-20 19:00:00');
INSERT INTO `sys_job_log` VALUES (698, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：28毫秒', '0', '', '2021-02-20 19:06:01');
INSERT INTO `sys_job_log` VALUES (699, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：237毫秒', '0', '', '2021-02-20 20:00:00');
INSERT INTO `sys_job_log` VALUES (700, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：213毫秒', '0', '', '2021-02-20 20:00:00');
INSERT INTO `sys_job_log` VALUES (701, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：242毫秒', '0', '', '2021-02-20 21:00:00');
INSERT INTO `sys_job_log` VALUES (702, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：169毫秒', '0', '', '2021-02-20 21:00:00');
INSERT INTO `sys_job_log` VALUES (703, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：229毫秒', '0', '', '2021-02-20 22:00:00');
INSERT INTO `sys_job_log` VALUES (704, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：178毫秒', '0', '', '2021-02-20 22:00:00');
INSERT INTO `sys_job_log` VALUES (705, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：566毫秒', '0', '', '2021-02-20 23:00:00');
INSERT INTO `sys_job_log` VALUES (706, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：523毫秒', '0', '', '2021-02-20 23:00:00');
INSERT INTO `sys_job_log` VALUES (707, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：225毫秒', '0', '', '2021-02-21 00:00:00');
INSERT INTO `sys_job_log` VALUES (708, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-21 00:00:00');
INSERT INTO `sys_job_log` VALUES (709, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：216毫秒', '0', '', '2021-02-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (710, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：248毫秒', '0', '', '2021-02-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (711, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-21 02:00:00');
INSERT INTO `sys_job_log` VALUES (712, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：151毫秒', '0', '', '2021-02-21 02:00:00');
INSERT INTO `sys_job_log` VALUES (713, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：395毫秒', '0', '', '2021-02-21 03:00:00');
INSERT INTO `sys_job_log` VALUES (714, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：386毫秒', '0', '', '2021-02-21 03:00:00');
INSERT INTO `sys_job_log` VALUES (715, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：205毫秒', '0', '', '2021-02-21 04:00:00');
INSERT INTO `sys_job_log` VALUES (716, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：179毫秒', '0', '', '2021-02-21 04:00:00');
INSERT INTO `sys_job_log` VALUES (717, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：198毫秒', '0', '', '2021-02-21 05:00:00');
INSERT INTO `sys_job_log` VALUES (718, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：193毫秒', '0', '', '2021-02-21 05:00:00');
INSERT INTO `sys_job_log` VALUES (719, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：152毫秒', '0', '', '2021-02-21 06:00:00');
INSERT INTO `sys_job_log` VALUES (720, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：176毫秒', '0', '', '2021-02-21 06:00:00');
INSERT INTO `sys_job_log` VALUES (721, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：57998毫秒', '0', '', '2021-02-21 06:31:59');
INSERT INTO `sys_job_log` VALUES (722, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：7毫秒', '0', '', '2021-02-21 06:36:01');
INSERT INTO `sys_job_log` VALUES (723, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：149毫秒', '0', '', '2021-02-21 07:00:00');
INSERT INTO `sys_job_log` VALUES (724, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-21 07:00:00');
INSERT INTO `sys_job_log` VALUES (725, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：208毫秒', '0', '', '2021-02-21 08:00:00');
INSERT INTO `sys_job_log` VALUES (726, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：205毫秒', '0', '', '2021-02-21 08:00:00');
INSERT INTO `sys_job_log` VALUES (727, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：144毫秒', '0', '', '2021-02-21 09:00:00');
INSERT INTO `sys_job_log` VALUES (728, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：211毫秒', '0', '', '2021-02-21 09:00:00');
INSERT INTO `sys_job_log` VALUES (729, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：139毫秒', '0', '', '2021-02-21 10:00:00');
INSERT INTO `sys_job_log` VALUES (730, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：148毫秒', '0', '', '2021-02-21 10:00:00');
INSERT INTO `sys_job_log` VALUES (731, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：238毫秒', '0', '', '2021-02-21 11:00:00');
INSERT INTO `sys_job_log` VALUES (732, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-21 11:00:00');
INSERT INTO `sys_job_log` VALUES (733, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-21 12:00:00');
INSERT INTO `sys_job_log` VALUES (734, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：162毫秒', '0', '', '2021-02-21 12:00:00');
INSERT INTO `sys_job_log` VALUES (735, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：331毫秒', '0', '', '2021-02-21 13:00:00');
INSERT INTO `sys_job_log` VALUES (736, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：154毫秒', '0', '', '2021-02-21 13:00:00');
INSERT INTO `sys_job_log` VALUES (737, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-21 14:00:00');
INSERT INTO `sys_job_log` VALUES (738, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-21 14:00:00');
INSERT INTO `sys_job_log` VALUES (739, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：131毫秒', '0', '', '2021-02-21 15:00:00');
INSERT INTO `sys_job_log` VALUES (740, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-21 15:00:00');
INSERT INTO `sys_job_log` VALUES (741, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：337毫秒', '0', '', '2021-02-21 16:00:00');
INSERT INTO `sys_job_log` VALUES (742, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：417毫秒', '0', '', '2021-02-21 16:00:00');
INSERT INTO `sys_job_log` VALUES (743, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：139毫秒', '0', '', '2021-02-21 17:00:00');
INSERT INTO `sys_job_log` VALUES (744, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：188毫秒', '0', '', '2021-02-21 17:00:00');
INSERT INTO `sys_job_log` VALUES (745, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：185毫秒', '0', '', '2021-02-21 18:00:00');
INSERT INTO `sys_job_log` VALUES (746, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：223毫秒', '0', '', '2021-02-21 18:00:00');
INSERT INTO `sys_job_log` VALUES (747, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-21 19:00:00');
INSERT INTO `sys_job_log` VALUES (748, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：148毫秒', '0', '', '2021-02-21 19:00:00');
INSERT INTO `sys_job_log` VALUES (749, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：77毫秒', '0', '', '2021-02-21 19:06:01');
INSERT INTO `sys_job_log` VALUES (750, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：168毫秒', '0', '', '2021-02-21 20:00:00');
INSERT INTO `sys_job_log` VALUES (751, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-21 20:00:00');
INSERT INTO `sys_job_log` VALUES (752, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：449毫秒', '0', '', '2021-02-21 21:00:00');
INSERT INTO `sys_job_log` VALUES (753, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：474毫秒', '0', '', '2021-02-21 21:00:00');
INSERT INTO `sys_job_log` VALUES (754, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：136毫秒', '0', '', '2021-02-21 22:00:00');
INSERT INTO `sys_job_log` VALUES (755, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：152毫秒', '0', '', '2021-02-21 22:00:00');
INSERT INTO `sys_job_log` VALUES (756, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：511毫秒', '0', '', '2021-02-21 23:00:00');
INSERT INTO `sys_job_log` VALUES (757, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：509毫秒', '0', '', '2021-02-21 23:00:00');
INSERT INTO `sys_job_log` VALUES (758, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：299毫秒', '0', '', '2021-02-22 00:00:00');
INSERT INTO `sys_job_log` VALUES (759, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：164毫秒', '0', '', '2021-02-22 00:00:00');
INSERT INTO `sys_job_log` VALUES (760, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：232毫秒', '0', '', '2021-02-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (761, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：207毫秒', '0', '', '2021-02-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (762, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：210毫秒', '0', '', '2021-02-22 02:00:00');
INSERT INTO `sys_job_log` VALUES (763, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：206毫秒', '0', '', '2021-02-22 02:00:00');
INSERT INTO `sys_job_log` VALUES (764, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：185毫秒', '0', '', '2021-02-22 03:00:00');
INSERT INTO `sys_job_log` VALUES (765, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：186毫秒', '0', '', '2021-02-22 03:00:00');
INSERT INTO `sys_job_log` VALUES (766, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：360毫秒', '0', '', '2021-02-22 04:00:00');
INSERT INTO `sys_job_log` VALUES (767, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：355毫秒', '0', '', '2021-02-22 04:00:00');
INSERT INTO `sys_job_log` VALUES (768, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：223毫秒', '0', '', '2021-02-22 05:00:00');
INSERT INTO `sys_job_log` VALUES (769, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：146毫秒', '0', '', '2021-02-22 05:00:00');
INSERT INTO `sys_job_log` VALUES (770, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：162毫秒', '0', '', '2021-02-22 06:00:00');
INSERT INTO `sys_job_log` VALUES (771, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：200毫秒', '0', '', '2021-02-22 06:00:00');
INSERT INTO `sys_job_log` VALUES (772, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：59633毫秒', '0', '', '2021-02-22 06:32:00');
INSERT INTO `sys_job_log` VALUES (773, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：9毫秒', '0', '', '2021-02-22 06:36:01');
INSERT INTO `sys_job_log` VALUES (774, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：179毫秒', '0', '', '2021-02-22 07:00:00');
INSERT INTO `sys_job_log` VALUES (775, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：158毫秒', '0', '', '2021-02-22 07:00:00');
INSERT INTO `sys_job_log` VALUES (776, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：160毫秒', '0', '', '2021-02-22 08:00:00');
INSERT INTO `sys_job_log` VALUES (777, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：199毫秒', '0', '', '2021-02-22 08:00:00');
INSERT INTO `sys_job_log` VALUES (778, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-22 09:00:00');
INSERT INTO `sys_job_log` VALUES (779, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：327毫秒', '0', '', '2021-02-22 09:00:00');
INSERT INTO `sys_job_log` VALUES (780, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：258毫秒', '0', '', '2021-02-22 10:00:00');
INSERT INTO `sys_job_log` VALUES (781, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-22 10:00:00');
INSERT INTO `sys_job_log` VALUES (782, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：210毫秒', '0', '', '2021-02-22 11:00:00');
INSERT INTO `sys_job_log` VALUES (783, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：239毫秒', '0', '', '2021-02-22 11:00:00');
INSERT INTO `sys_job_log` VALUES (784, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：153毫秒', '0', '', '2021-02-22 12:00:00');
INSERT INTO `sys_job_log` VALUES (785, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-22 12:00:00');
INSERT INTO `sys_job_log` VALUES (786, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：135毫秒', '0', '', '2021-02-22 13:00:00');
INSERT INTO `sys_job_log` VALUES (787, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：152毫秒', '0', '', '2021-02-22 13:00:00');
INSERT INTO `sys_job_log` VALUES (788, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-22 14:00:00');
INSERT INTO `sys_job_log` VALUES (789, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：234毫秒', '0', '', '2021-02-22 14:00:00');
INSERT INTO `sys_job_log` VALUES (790, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：156毫秒', '0', '', '2021-02-22 15:00:00');
INSERT INTO `sys_job_log` VALUES (791, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：147毫秒', '0', '', '2021-02-22 15:00:00');
INSERT INTO `sys_job_log` VALUES (792, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：524毫秒', '0', '', '2021-02-22 16:00:00');
INSERT INTO `sys_job_log` VALUES (793, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：493毫秒', '0', '', '2021-02-22 16:00:00');
INSERT INTO `sys_job_log` VALUES (794, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-22 17:00:00');
INSERT INTO `sys_job_log` VALUES (795, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：149毫秒', '0', '', '2021-02-22 17:00:00');
INSERT INTO `sys_job_log` VALUES (796, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：157毫秒', '0', '', '2021-02-22 18:00:00');
INSERT INTO `sys_job_log` VALUES (797, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：188毫秒', '0', '', '2021-02-22 18:00:00');
INSERT INTO `sys_job_log` VALUES (798, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：157毫秒', '0', '', '2021-02-22 19:00:00');
INSERT INTO `sys_job_log` VALUES (799, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：202毫秒', '0', '', '2021-02-22 19:00:00');
INSERT INTO `sys_job_log` VALUES (800, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：44毫秒', '0', '', '2021-02-22 19:06:01');
INSERT INTO `sys_job_log` VALUES (801, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-22 20:00:00');
INSERT INTO `sys_job_log` VALUES (802, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：157毫秒', '0', '', '2021-02-22 20:00:00');
INSERT INTO `sys_job_log` VALUES (803, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：200毫秒', '0', '', '2021-02-22 21:00:00');
INSERT INTO `sys_job_log` VALUES (804, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：183毫秒', '0', '', '2021-02-22 21:00:00');
INSERT INTO `sys_job_log` VALUES (805, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：160毫秒', '0', '', '2021-02-22 22:00:00');
INSERT INTO `sys_job_log` VALUES (806, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：154毫秒', '0', '', '2021-02-22 22:00:00');
INSERT INTO `sys_job_log` VALUES (807, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：522毫秒', '0', '', '2021-02-22 23:00:00');
INSERT INTO `sys_job_log` VALUES (808, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：531毫秒', '0', '', '2021-02-22 23:00:00');
INSERT INTO `sys_job_log` VALUES (809, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：207毫秒', '0', '', '2021-02-23 00:00:00');
INSERT INTO `sys_job_log` VALUES (810, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-23 00:00:00');
INSERT INTO `sys_job_log` VALUES (811, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：188毫秒', '0', '', '2021-02-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (812, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：240毫秒', '0', '', '2021-02-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (813, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-23 02:00:00');
INSERT INTO `sys_job_log` VALUES (814, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：222毫秒', '0', '', '2021-02-23 02:00:00');
INSERT INTO `sys_job_log` VALUES (815, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：387毫秒', '0', '', '2021-02-23 03:00:00');
INSERT INTO `sys_job_log` VALUES (816, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：252毫秒', '0', '', '2021-02-23 03:00:00');
INSERT INTO `sys_job_log` VALUES (817, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：520毫秒', '0', '', '2021-02-23 04:00:00');
INSERT INTO `sys_job_log` VALUES (818, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：222毫秒', '0', '', '2021-02-23 04:00:00');
INSERT INTO `sys_job_log` VALUES (819, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：182毫秒', '0', '', '2021-02-23 05:00:00');
INSERT INTO `sys_job_log` VALUES (820, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：205毫秒', '0', '', '2021-02-23 05:00:00');
INSERT INTO `sys_job_log` VALUES (821, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：189毫秒', '0', '', '2021-02-23 06:00:00');
INSERT INTO `sys_job_log` VALUES (822, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：179毫秒', '0', '', '2021-02-23 06:00:00');
INSERT INTO `sys_job_log` VALUES (823, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：55226毫秒', '0', '', '2021-02-23 06:31:56');
INSERT INTO `sys_job_log` VALUES (824, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：19毫秒', '0', '', '2021-02-23 06:36:01');
INSERT INTO `sys_job_log` VALUES (825, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：157毫秒', '0', '', '2021-02-23 07:00:00');
INSERT INTO `sys_job_log` VALUES (826, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：155毫秒', '0', '', '2021-02-23 07:00:00');
INSERT INTO `sys_job_log` VALUES (827, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：276毫秒', '0', '', '2021-02-23 08:00:00');
INSERT INTO `sys_job_log` VALUES (828, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：201毫秒', '0', '', '2021-02-23 08:00:00');
INSERT INTO `sys_job_log` VALUES (829, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-23 09:00:00');
INSERT INTO `sys_job_log` VALUES (830, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：147毫秒', '0', '', '2021-02-23 09:00:00');
INSERT INTO `sys_job_log` VALUES (831, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：239毫秒', '0', '', '2021-02-23 10:00:00');
INSERT INTO `sys_job_log` VALUES (832, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：304毫秒', '0', '', '2021-02-23 10:00:00');
INSERT INTO `sys_job_log` VALUES (833, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：324毫秒', '0', '', '2021-02-23 11:00:00');
INSERT INTO `sys_job_log` VALUES (834, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：327毫秒', '0', '', '2021-02-23 11:00:00');
INSERT INTO `sys_job_log` VALUES (835, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：314毫秒', '0', '', '2021-02-23 12:00:00');
INSERT INTO `sys_job_log` VALUES (836, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：405毫秒', '0', '', '2021-02-23 12:00:00');
INSERT INTO `sys_job_log` VALUES (837, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：239毫秒', '0', '', '2021-02-23 13:00:00');
INSERT INTO `sys_job_log` VALUES (838, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：197毫秒', '0', '', '2021-02-23 13:00:00');
INSERT INTO `sys_job_log` VALUES (839, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：216毫秒', '0', '', '2021-02-23 14:00:00');
INSERT INTO `sys_job_log` VALUES (840, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：293毫秒', '0', '', '2021-02-23 14:00:00');
INSERT INTO `sys_job_log` VALUES (841, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：188毫秒', '0', '', '2021-02-23 15:00:00');
INSERT INTO `sys_job_log` VALUES (842, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：156毫秒', '0', '', '2021-02-23 15:00:00');
INSERT INTO `sys_job_log` VALUES (843, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-23 16:00:00');
INSERT INTO `sys_job_log` VALUES (844, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：215毫秒', '0', '', '2021-02-23 16:00:00');
INSERT INTO `sys_job_log` VALUES (845, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：384毫秒', '0', '', '2021-02-23 17:00:00');
INSERT INTO `sys_job_log` VALUES (846, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：174毫秒', '0', '', '2021-02-23 17:00:00');
INSERT INTO `sys_job_log` VALUES (847, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：153毫秒', '0', '', '2021-02-23 18:00:00');
INSERT INTO `sys_job_log` VALUES (848, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：158毫秒', '0', '', '2021-02-23 18:00:00');
INSERT INTO `sys_job_log` VALUES (849, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：193毫秒', '0', '', '2021-02-23 19:00:00');
INSERT INTO `sys_job_log` VALUES (850, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：235毫秒', '0', '', '2021-02-23 19:00:00');
INSERT INTO `sys_job_log` VALUES (851, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：55毫秒', '0', '', '2021-02-23 19:06:01');
INSERT INTO `sys_job_log` VALUES (852, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：231毫秒', '0', '', '2021-02-23 20:00:00');
INSERT INTO `sys_job_log` VALUES (853, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：226毫秒', '0', '', '2021-02-23 20:00:00');
INSERT INTO `sys_job_log` VALUES (854, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-23 21:00:00');
INSERT INTO `sys_job_log` VALUES (855, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-23 21:00:00');
INSERT INTO `sys_job_log` VALUES (856, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：179毫秒', '0', '', '2021-02-23 22:00:00');
INSERT INTO `sys_job_log` VALUES (857, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：198毫秒', '0', '', '2021-02-23 22:00:00');
INSERT INTO `sys_job_log` VALUES (858, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：385毫秒', '0', '', '2021-02-23 23:00:00');
INSERT INTO `sys_job_log` VALUES (859, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：321毫秒', '0', '', '2021-02-23 23:00:00');
INSERT INTO `sys_job_log` VALUES (860, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：176毫秒', '0', '', '2021-02-24 00:00:00');
INSERT INTO `sys_job_log` VALUES (861, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：235毫秒', '0', '', '2021-02-24 00:00:00');
INSERT INTO `sys_job_log` VALUES (862, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：177毫秒', '0', '', '2021-02-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (863, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：165毫秒', '0', '', '2021-02-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (864, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-24 02:00:00');
INSERT INTO `sys_job_log` VALUES (865, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：225毫秒', '0', '', '2021-02-24 02:00:00');
INSERT INTO `sys_job_log` VALUES (866, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：382毫秒', '0', '', '2021-02-24 03:00:00');
INSERT INTO `sys_job_log` VALUES (867, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：404毫秒', '0', '', '2021-02-24 03:00:00');
INSERT INTO `sys_job_log` VALUES (868, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：222毫秒', '0', '', '2021-02-24 04:00:00');
INSERT INTO `sys_job_log` VALUES (869, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：199毫秒', '0', '', '2021-02-24 04:00:00');
INSERT INTO `sys_job_log` VALUES (870, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：132毫秒', '0', '', '2021-02-24 05:00:00');
INSERT INTO `sys_job_log` VALUES (871, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：216毫秒', '0', '', '2021-02-24 05:00:00');
INSERT INTO `sys_job_log` VALUES (872, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：422毫秒', '0', '', '2021-02-24 06:00:00');
INSERT INTO `sys_job_log` VALUES (873, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：393毫秒', '0', '', '2021-02-24 06:00:00');
INSERT INTO `sys_job_log` VALUES (874, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：69296毫秒', '0', '', '2021-02-24 06:32:10');
INSERT INTO `sys_job_log` VALUES (875, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：46毫秒', '0', '', '2021-02-24 06:36:01');
INSERT INTO `sys_job_log` VALUES (876, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：168毫秒', '0', '', '2021-02-24 07:00:00');
INSERT INTO `sys_job_log` VALUES (877, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：146毫秒', '0', '', '2021-02-24 07:00:00');
INSERT INTO `sys_job_log` VALUES (878, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-24 08:00:00');
INSERT INTO `sys_job_log` VALUES (879, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：181毫秒', '0', '', '2021-02-24 08:00:00');
INSERT INTO `sys_job_log` VALUES (880, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：215毫秒', '0', '', '2021-02-24 09:00:00');
INSERT INTO `sys_job_log` VALUES (881, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：210毫秒', '0', '', '2021-02-24 09:00:00');
INSERT INTO `sys_job_log` VALUES (882, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：212毫秒', '0', '', '2021-02-24 10:00:00');
INSERT INTO `sys_job_log` VALUES (883, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：169毫秒', '0', '', '2021-02-24 10:00:00');
INSERT INTO `sys_job_log` VALUES (884, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：212毫秒', '0', '', '2021-02-24 11:00:00');
INSERT INTO `sys_job_log` VALUES (885, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：160毫秒', '0', '', '2021-02-24 11:00:00');
INSERT INTO `sys_job_log` VALUES (886, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：215毫秒', '0', '', '2021-02-24 12:00:00');
INSERT INTO `sys_job_log` VALUES (887, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：215毫秒', '0', '', '2021-02-24 12:00:00');
INSERT INTO `sys_job_log` VALUES (888, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：283毫秒', '0', '', '2021-02-24 13:00:00');
INSERT INTO `sys_job_log` VALUES (889, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：188毫秒', '0', '', '2021-02-24 13:00:00');
INSERT INTO `sys_job_log` VALUES (890, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：117毫秒', '0', '', '2021-02-24 14:00:00');
INSERT INTO `sys_job_log` VALUES (891, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：200毫秒', '0', '', '2021-02-24 14:00:00');
INSERT INTO `sys_job_log` VALUES (892, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-24 15:00:00');
INSERT INTO `sys_job_log` VALUES (893, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-24 15:00:00');
INSERT INTO `sys_job_log` VALUES (894, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-24 16:00:00');
INSERT INTO `sys_job_log` VALUES (895, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：204毫秒', '0', '', '2021-02-24 16:00:00');
INSERT INTO `sys_job_log` VALUES (896, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：408毫秒', '0', '', '2021-02-24 17:00:00');
INSERT INTO `sys_job_log` VALUES (897, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：413毫秒', '0', '', '2021-02-24 17:00:00');
INSERT INTO `sys_job_log` VALUES (898, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：154毫秒', '0', '', '2021-02-24 18:00:00');
INSERT INTO `sys_job_log` VALUES (899, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：185毫秒', '0', '', '2021-02-24 18:00:00');
INSERT INTO `sys_job_log` VALUES (900, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：207毫秒', '0', '', '2021-02-24 19:00:00');
INSERT INTO `sys_job_log` VALUES (901, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：160毫秒', '0', '', '2021-02-24 19:00:00');
INSERT INTO `sys_job_log` VALUES (902, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：25毫秒', '0', '', '2021-02-24 19:06:01');
INSERT INTO `sys_job_log` VALUES (903, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-24 20:00:00');
INSERT INTO `sys_job_log` VALUES (904, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：169毫秒', '0', '', '2021-02-24 20:00:00');
INSERT INTO `sys_job_log` VALUES (905, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：176毫秒', '0', '', '2021-02-24 21:00:00');
INSERT INTO `sys_job_log` VALUES (906, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：168毫秒', '0', '', '2021-02-24 21:00:00');
INSERT INTO `sys_job_log` VALUES (907, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：351毫秒', '0', '', '2021-02-24 22:00:00');
INSERT INTO `sys_job_log` VALUES (908, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：213毫秒', '0', '', '2021-02-24 22:00:00');
INSERT INTO `sys_job_log` VALUES (909, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：549毫秒', '0', '', '2021-02-24 23:00:00');
INSERT INTO `sys_job_log` VALUES (910, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：540毫秒', '0', '', '2021-02-24 23:00:00');
INSERT INTO `sys_job_log` VALUES (911, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-25 00:00:00');
INSERT INTO `sys_job_log` VALUES (912, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-25 00:00:00');
INSERT INTO `sys_job_log` VALUES (913, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (914, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：207毫秒', '0', '', '2021-02-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (915, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：232毫秒', '0', '', '2021-02-25 02:00:00');
INSERT INTO `sys_job_log` VALUES (916, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：202毫秒', '0', '', '2021-02-25 02:00:00');
INSERT INTO `sys_job_log` VALUES (917, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：137毫秒', '0', '', '2021-02-25 03:00:00');
INSERT INTO `sys_job_log` VALUES (918, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：221毫秒', '0', '', '2021-02-25 03:00:00');
INSERT INTO `sys_job_log` VALUES (919, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：177毫秒', '0', '', '2021-02-25 04:00:00');
INSERT INTO `sys_job_log` VALUES (920, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：204毫秒', '0', '', '2021-02-25 04:00:00');
INSERT INTO `sys_job_log` VALUES (921, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：339毫秒', '0', '', '2021-02-25 05:00:00');
INSERT INTO `sys_job_log` VALUES (922, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：398毫秒', '0', '', '2021-02-25 05:00:00');
INSERT INTO `sys_job_log` VALUES (923, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-25 06:00:00');
INSERT INTO `sys_job_log` VALUES (924, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：204毫秒', '0', '', '2021-02-25 06:00:00');
INSERT INTO `sys_job_log` VALUES (925, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：60924毫秒', '0', '', '2021-02-25 06:32:01');
INSERT INTO `sys_job_log` VALUES (926, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：24毫秒', '0', '', '2021-02-25 06:36:01');
INSERT INTO `sys_job_log` VALUES (927, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-25 07:00:00');
INSERT INTO `sys_job_log` VALUES (928, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：198毫秒', '0', '', '2021-02-25 07:00:00');
INSERT INTO `sys_job_log` VALUES (929, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：296毫秒', '0', '', '2021-02-25 08:00:00');
INSERT INTO `sys_job_log` VALUES (930, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：181毫秒', '0', '', '2021-02-25 08:00:00');
INSERT INTO `sys_job_log` VALUES (931, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：203毫秒', '0', '', '2021-02-25 09:00:00');
INSERT INTO `sys_job_log` VALUES (932, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：172毫秒', '0', '', '2021-02-25 09:00:00');
INSERT INTO `sys_job_log` VALUES (933, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：175毫秒', '0', '', '2021-02-25 10:00:00');
INSERT INTO `sys_job_log` VALUES (934, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：153毫秒', '0', '', '2021-02-25 10:00:00');
INSERT INTO `sys_job_log` VALUES (935, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：203毫秒', '0', '', '2021-02-25 11:00:00');
INSERT INTO `sys_job_log` VALUES (936, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：146毫秒', '0', '', '2021-02-25 11:00:00');
INSERT INTO `sys_job_log` VALUES (937, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-25 12:00:00');
INSERT INTO `sys_job_log` VALUES (938, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-25 12:00:00');
INSERT INTO `sys_job_log` VALUES (939, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：235毫秒', '0', '', '2021-02-25 13:00:00');
INSERT INTO `sys_job_log` VALUES (940, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：211毫秒', '0', '', '2021-02-25 13:00:00');
INSERT INTO `sys_job_log` VALUES (941, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-25 14:00:00');
INSERT INTO `sys_job_log` VALUES (942, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：182毫秒', '0', '', '2021-02-25 14:00:00');
INSERT INTO `sys_job_log` VALUES (943, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：177毫秒', '0', '', '2021-02-25 15:00:00');
INSERT INTO `sys_job_log` VALUES (944, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：219毫秒', '0', '', '2021-02-25 15:00:00');
INSERT INTO `sys_job_log` VALUES (945, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：174毫秒', '0', '', '2021-02-25 16:00:00');
INSERT INTO `sys_job_log` VALUES (946, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：190毫秒', '0', '', '2021-02-25 16:00:00');
INSERT INTO `sys_job_log` VALUES (947, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：479毫秒', '0', '', '2021-02-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (948, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：534毫秒', '0', '', '2021-02-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (949, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：147毫秒', '0', '', '2021-02-25 18:00:00');
INSERT INTO `sys_job_log` VALUES (950, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：159毫秒', '0', '', '2021-02-25 18:00:00');
INSERT INTO `sys_job_log` VALUES (951, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：183毫秒', '0', '', '2021-02-25 19:00:00');
INSERT INTO `sys_job_log` VALUES (952, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-25 19:00:00');
INSERT INTO `sys_job_log` VALUES (953, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：30毫秒', '0', '', '2021-02-25 19:06:01');
INSERT INTO `sys_job_log` VALUES (954, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：145毫秒', '0', '', '2021-02-25 20:00:00');
INSERT INTO `sys_job_log` VALUES (955, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：149毫秒', '0', '', '2021-02-25 20:00:00');
INSERT INTO `sys_job_log` VALUES (956, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：181毫秒', '0', '', '2021-02-25 21:00:00');
INSERT INTO `sys_job_log` VALUES (957, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：166毫秒', '0', '', '2021-02-25 21:00:00');
INSERT INTO `sys_job_log` VALUES (958, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：209毫秒', '0', '', '2021-02-25 22:00:00');
INSERT INTO `sys_job_log` VALUES (959, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-25 22:00:00');
INSERT INTO `sys_job_log` VALUES (960, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：407毫秒', '0', '', '2021-02-25 23:00:00');
INSERT INTO `sys_job_log` VALUES (961, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：396毫秒', '0', '', '2021-02-25 23:00:00');
INSERT INTO `sys_job_log` VALUES (962, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：267毫秒', '0', '', '2021-02-26 00:00:00');
INSERT INTO `sys_job_log` VALUES (963, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：175毫秒', '0', '', '2021-02-26 00:00:00');
INSERT INTO `sys_job_log` VALUES (964, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：494毫秒', '0', '', '2021-02-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (965, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：516毫秒', '0', '', '2021-02-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (966, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-26 02:00:00');
INSERT INTO `sys_job_log` VALUES (967, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：160毫秒', '0', '', '2021-02-26 02:00:00');
INSERT INTO `sys_job_log` VALUES (968, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-26 03:00:00');
INSERT INTO `sys_job_log` VALUES (969, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：217毫秒', '0', '', '2021-02-26 03:00:00');
INSERT INTO `sys_job_log` VALUES (970, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：163毫秒', '0', '', '2021-02-26 04:00:00');
INSERT INTO `sys_job_log` VALUES (971, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：236毫秒', '0', '', '2021-02-26 04:00:00');
INSERT INTO `sys_job_log` VALUES (972, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：202毫秒', '0', '', '2021-02-26 05:00:00');
INSERT INTO `sys_job_log` VALUES (973, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：141毫秒', '0', '', '2021-02-26 05:00:00');
INSERT INTO `sys_job_log` VALUES (974, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：173毫秒', '0', '', '2021-02-26 06:00:00');
INSERT INTO `sys_job_log` VALUES (975, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：194毫秒', '0', '', '2021-02-26 06:00:00');
INSERT INTO `sys_job_log` VALUES (976, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：54851毫秒', '0', '', '2021-02-26 06:31:55');
INSERT INTO `sys_job_log` VALUES (977, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：38毫秒', '0', '', '2021-02-26 06:36:01');
INSERT INTO `sys_job_log` VALUES (978, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：308毫秒', '0', '', '2021-02-26 07:00:00');
INSERT INTO `sys_job_log` VALUES (979, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：250毫秒', '0', '', '2021-02-26 07:00:00');
INSERT INTO `sys_job_log` VALUES (980, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：157毫秒', '0', '', '2021-02-26 08:00:00');
INSERT INTO `sys_job_log` VALUES (981, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：150毫秒', '0', '', '2021-02-26 08:00:00');
INSERT INTO `sys_job_log` VALUES (982, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-26 09:00:00');
INSERT INTO `sys_job_log` VALUES (983, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：144毫秒', '0', '', '2021-02-26 09:00:00');
INSERT INTO `sys_job_log` VALUES (984, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：172毫秒', '0', '', '2021-02-26 10:00:00');
INSERT INTO `sys_job_log` VALUES (985, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：239毫秒', '0', '', '2021-02-26 10:00:00');
INSERT INTO `sys_job_log` VALUES (986, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：201毫秒', '0', '', '2021-02-26 11:00:00');
INSERT INTO `sys_job_log` VALUES (987, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：155毫秒', '0', '', '2021-02-26 11:00:00');
INSERT INTO `sys_job_log` VALUES (988, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：178毫秒', '0', '', '2021-02-26 12:00:00');
INSERT INTO `sys_job_log` VALUES (989, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：170毫秒', '0', '', '2021-02-26 12:00:00');
INSERT INTO `sys_job_log` VALUES (990, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：171毫秒', '0', '', '2021-02-26 13:00:00');
INSERT INTO `sys_job_log` VALUES (991, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：179毫秒', '0', '', '2021-02-26 13:00:00');
INSERT INTO `sys_job_log` VALUES (992, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：417毫秒', '0', '', '2021-02-26 14:00:00');
INSERT INTO `sys_job_log` VALUES (993, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：422毫秒', '0', '', '2021-02-26 14:00:00');
INSERT INTO `sys_job_log` VALUES (994, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：185毫秒', '0', '', '2021-02-26 15:00:00');
INSERT INTO `sys_job_log` VALUES (995, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：164毫秒', '0', '', '2021-02-26 15:00:00');
INSERT INTO `sys_job_log` VALUES (996, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：439毫秒', '0', '', '2021-02-26 16:00:00');
INSERT INTO `sys_job_log` VALUES (997, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：489毫秒', '0', '', '2021-02-26 16:00:00');
INSERT INTO `sys_job_log` VALUES (998, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：161毫秒', '0', '', '2021-02-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (999, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：162毫秒', '0', '', '2021-02-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (1000, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：159毫秒', '0', '', '2021-02-26 18:00:00');
INSERT INTO `sys_job_log` VALUES (1001, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：147毫秒', '0', '', '2021-02-26 18:00:00');
INSERT INTO `sys_job_log` VALUES (1002, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：170毫秒', '0', '', '2021-02-26 19:00:00');
INSERT INTO `sys_job_log` VALUES (1003, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：218毫秒', '0', '', '2021-02-26 19:00:00');
INSERT INTO `sys_job_log` VALUES (1004, '晚上重签', 'DEFAULT', 'reSign.task', '晚上重签 总共耗时：47毫秒', '0', '', '2021-02-26 19:06:01');
INSERT INTO `sys_job_log` VALUES (1005, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：163毫秒', '0', '', '2021-02-26 20:00:00');
INSERT INTO `sys_job_log` VALUES (1006, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：204毫秒', '0', '', '2021-02-26 20:00:00');
INSERT INTO `sys_job_log` VALUES (1007, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：150毫秒', '0', '', '2021-02-26 21:00:00');
INSERT INTO `sys_job_log` VALUES (1008, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：168毫秒', '0', '', '2021-02-26 21:00:00');
INSERT INTO `sys_job_log` VALUES (1009, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：194毫秒', '0', '', '2021-02-26 22:00:00');
INSERT INTO `sys_job_log` VALUES (1010, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：180毫秒', '0', '', '2021-02-26 22:00:00');
INSERT INTO `sys_job_log` VALUES (1011, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：259毫秒', '0', '', '2021-02-26 23:00:00');
INSERT INTO `sys_job_log` VALUES (1012, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：224毫秒', '0', '', '2021-02-26 23:00:00');
INSERT INTO `sys_job_log` VALUES (1013, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：134毫秒', '0', '', '2021-02-27 00:00:00');
INSERT INTO `sys_job_log` VALUES (1014, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-27 00:00:00');
INSERT INTO `sys_job_log` VALUES (1015, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：475毫秒', '0', '', '2021-02-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (1016, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：304毫秒', '0', '', '2021-02-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (1017, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：187毫秒', '0', '', '2021-02-27 02:00:00');
INSERT INTO `sys_job_log` VALUES (1018, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：177毫秒', '0', '', '2021-02-27 02:00:00');
INSERT INTO `sys_job_log` VALUES (1019, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：176毫秒', '0', '', '2021-02-27 03:00:00');
INSERT INTO `sys_job_log` VALUES (1020, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：220毫秒', '0', '', '2021-02-27 03:00:00');
INSERT INTO `sys_job_log` VALUES (1021, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：214毫秒', '0', '', '2021-02-27 04:00:00');
INSERT INTO `sys_job_log` VALUES (1022, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：183毫秒', '0', '', '2021-02-27 04:00:00');
INSERT INTO `sys_job_log` VALUES (1023, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：459毫秒', '0', '', '2021-02-27 05:00:00');
INSERT INTO `sys_job_log` VALUES (1024, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：419毫秒', '0', '', '2021-02-27 05:00:00');
INSERT INTO `sys_job_log` VALUES (1025, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：217毫秒', '0', '', '2021-02-27 06:00:00');
INSERT INTO `sys_job_log` VALUES (1026, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：197毫秒', '0', '', '2021-02-27 06:00:00');
INSERT INTO `sys_job_log` VALUES (1027, '多线程签到 - 早', 'DEFAULT', 'multiThreadSignTask.task', '多线程签到 - 早 总共耗时：60920毫秒', '0', '', '2021-02-27 06:32:02');
INSERT INTO `sys_job_log` VALUES (1028, '早上重签', 'DEFAULT', 'reSign.task', '早上重签 总共耗时：48毫秒', '0', '', '2021-02-27 06:36:01');
INSERT INTO `sys_job_log` VALUES (1029, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：207毫秒', '0', '', '2021-02-27 07:00:00');
INSERT INTO `sys_job_log` VALUES (1030, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：201毫秒', '0', '', '2021-02-27 07:00:00');
INSERT INTO `sys_job_log` VALUES (1031, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：384毫秒', '0', '', '2021-02-27 08:00:00');
INSERT INTO `sys_job_log` VALUES (1032, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：371毫秒', '0', '', '2021-02-27 08:00:00');
INSERT INTO `sys_job_log` VALUES (1033, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：186毫秒', '0', '', '2021-02-27 09:00:00');
INSERT INTO `sys_job_log` VALUES (1034, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：223毫秒', '0', '', '2021-02-27 09:00:00');
INSERT INTO `sys_job_log` VALUES (1035, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：211毫秒', '0', '', '2021-02-27 10:00:00');
INSERT INTO `sys_job_log` VALUES (1036, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-27 10:00:00');
INSERT INTO `sys_job_log` VALUES (1037, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：166毫秒', '0', '', '2021-02-27 11:00:00');
INSERT INTO `sys_job_log` VALUES (1038, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：229毫秒', '0', '', '2021-02-27 11:00:00');
INSERT INTO `sys_job_log` VALUES (1039, '测试AES加密串', 'DEFAULT', 'testEncryptTask.task', '测试AES加密串 总共耗时：192毫秒', '0', '', '2021-02-27 12:00:00');
INSERT INTO `sys_job_log` VALUES (1040, '正则获取新的加密串', 'DEFAULT', 'obtainEncryptKeyTask.task', '正则获取新的加密串 总共耗时：189毫秒', '0', '', '2021-02-27 12:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 15:42:58');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:03:04');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:07:54');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:17:13');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:24:14');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:27:55');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:29:28');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:30:48');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:32:25');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 16:40:54');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 17:20:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 17:26:07');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-06 17:27:52');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-06 19:54:39');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-06 20:57:06');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-06 23:09:53');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-06 23:10:11');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 08:45:40');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 08:51:13');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 08:54:22');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 08:58:25');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 09:07:58');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 09:18:41');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 09:22:04');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 09:31:40');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 09:34:56');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 09:37:06');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 10:09:41');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-07 10:12:20');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-07 10:14:21');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-02-07 10:16:12');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2021-02-07 10:16:14');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 10:16:21');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 10:16:59');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-07 10:17:24');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 10:17:29');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-07 10:32:40');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-07 15:55:36');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '122.246.55.228', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-07 15:55:43');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '39.190.211.48', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-08 21:23:42');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '39.190.211.48', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-02-08 21:23:49');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '39.190.211.48', 'XX XX', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2021-02-08 21:23:59');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '39.190.211.48', 'XX XX', 'Chrome Mobile', 'Android 1.x', '1', '密码输入错误1次', '2021-02-09 09:59:24');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '39.190.211.48', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-02-09 09:59:35');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '223.104.247.130', 'XX XX', 'Chrome Mobile', 'Android 1.x', '1', '密码输入错误1次', '2021-02-11 18:26:59');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '223.104.247.130', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-02-11 18:27:12');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '39.190.211.48', 'XX XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-14 14:39:52');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '39.190.211.48', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-14 14:39:58');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '123.152.77.123', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-19 08:12:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2037 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-02-06 15:24:08', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-02-06 15:24:08', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-02-06 15:24:08', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2021-02-06 15:24:08', 'admin', '2021-02-07 10:20:38', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-02-06 15:24:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-02-06 15:24:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-02-06 15:24:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-02-06 15:24:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-02-06 15:24:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-02-06 15:24:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-02-06 15:24:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-02-06 15:24:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-02-06 15:24:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-02-06 15:24:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-02-06 15:24:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-02-06 15:24:08', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-02-06 15:24:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-02-06 15:24:08', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-02-06 15:24:08', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', 'menuItem', 'C', '1', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-02-06 15:24:08', 'admin', '2021-02-07 10:20:25', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', 'menuItem', 'C', '1', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-02-06 15:24:08', 'admin', '2021-02-07 10:20:16', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-02-06 15:24:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-02-06 15:24:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-02-06 15:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '用户管理', 2024, 1, '/system/signUser', 'menuItem', 'C', '0', '1', 'system:signUser:view', '#', 'admin', '2021-02-06 16:10:12', 'admin', '2021-02-06 16:43:10', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (2007, '用户管理查询', 2006, 1, '#', '', 'F', '0', '1', 'system:signUser:list', '#', 'admin', '2021-02-06 16:10:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '用户管理新增', 2006, 2, '#', '', 'F', '0', '1', 'system:signUser:add', '#', 'admin', '2021-02-06 16:10:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '用户管理修改', 2006, 3, '#', '', 'F', '0', '1', 'system:signUser:edit', '#', 'admin', '2021-02-06 16:10:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '用户管理删除', 2006, 4, '#', '', 'F', '0', '1', 'system:signUser:remove', '#', 'admin', '2021-02-06 16:10:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '用户管理导出', 2006, 5, '#', '', 'F', '0', '1', 'system:signUser:export', '#', 'admin', '2021-02-06 16:10:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '签到系统设置', 2024, 1, '/system/signSetting', 'menuItem', 'C', '0', '1', 'system:signSetting:view', '#', 'admin', '2021-02-06 16:27:27', 'admin', '2021-02-06 16:42:59', '签到系统设置菜单');
INSERT INTO `sys_menu` VALUES (2013, '签到系统设置查询', 2012, 1, '#', '', 'F', '0', '1', 'system:signSetting:list', '#', 'admin', '2021-02-06 16:27:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '签到系统设置新增', 2012, 2, '#', '', 'F', '0', '1', 'system:signSetting:add', '#', 'admin', '2021-02-06 16:27:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '签到系统设置修改', 2012, 3, '#', '', 'F', '0', '1', 'system:signSetting:edit', '#', 'admin', '2021-02-06 16:27:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '签到系统设置删除', 2012, 4, '#', '', 'F', '0', '1', 'system:signSetting:remove', '#', 'admin', '2021-02-06 16:27:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '签到系统设置导出', 2012, 5, '#', '', 'F', '0', '1', 'system:signSetting:export', '#', 'admin', '2021-02-06 16:27:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '签到日志', 2024, 1, '/system/log', 'menuItem', 'C', '0', '1', 'system:log:view', '#', 'admin', '2021-02-06 16:40:04', 'admin', '2021-02-06 16:42:49', '签到日志菜单');
INSERT INTO `sys_menu` VALUES (2019, '签到日志查询', 2018, 1, '#', '', 'F', '0', '1', 'system:log:list', '#', 'admin', '2021-02-06 16:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '签到日志新增', 2018, 2, '#', '', 'F', '0', '1', 'system:log:add', '#', 'admin', '2021-02-06 16:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '签到日志修改', 2018, 3, '#', '', 'F', '0', '1', 'system:log:edit', '#', 'admin', '2021-02-06 16:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '签到日志删除', 2018, 4, '#', '', 'F', '0', '1', 'system:log:remove', '#', 'admin', '2021-02-06 16:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '签到日志导出', 2018, 5, '#', '', 'F', '0', '1', 'system:log:export', '#', 'admin', '2021-02-06 16:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '胖哈勃实验室', 3, 1, '#', 'menuItem', 'C', '0', '0', '', 'fa fa-heart', 'admin', '2021-02-06 16:42:31', 'admin', '2021-02-06 16:43:37', '');
INSERT INTO `sys_menu` VALUES (2031, '用户配置', 2024, 1, '/system/signConfig', '', 'C', '0', '1', 'system:signConfig:view', '#', 'admin', '2021-02-06 17:27:03', '', NULL, '用户配置菜单');
INSERT INTO `sys_menu` VALUES (2032, '用户配置查询', 2031, 1, '#', '', 'F', '0', '1', 'system:signConfig:list', '#', 'admin', '2021-02-06 17:27:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '用户配置新增', 2031, 2, '#', '', 'F', '0', '1', 'system:signConfig:add', '#', 'admin', '2021-02-06 17:27:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '用户配置修改', 2031, 3, '#', '', 'F', '0', '1', 'system:signConfig:edit', '#', 'admin', '2021-02-06 17:27:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '用户配置删除', 2031, 4, '#', '', 'F', '0', '1', 'system:signConfig:remove', '#', 'admin', '2021-02-06 17:27:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '用户配置导出', 2031, 5, '#', '', 'F', '0', '1', 'system:signConfig:export', '#', 'admin', '2021-02-06 17:27:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-02-06 15:24:31', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-02-06 15:24:31', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sign_user,sign_setting,sign_log,sign_data_item,sign_data_dict,sign_config\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 15:43:17');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 15:45:41');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sign_user', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 15:46:11');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 15:46:18');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sign_user', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 15:46:21');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 15:47:12');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_user', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 15:47:15');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:05:33');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sign_user', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:05:36');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"colu', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:06:26');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_user', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 16:06:29');
INSERT INTO `sys_oper_log` VALUES (111, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"区域类型\"],\"dictType\":[\"sign_area\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:18:16');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"校外区域\"],\"dictValue\":[\"0\"],\"dictType\":[\"sign_area\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:18:39');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"学府东苑\"],\"dictValue\":[\"1\"],\"dictType\":[\"sign_area\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:18:54');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"学府西苑\"],\"dictValue\":[\"2\"],\"dictType\":[\"sign_area\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:19:09');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"sign_area\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:20:34');
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"签到启用状态\"],\"dictType\":[\"sign_enabled\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:21:21');
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"启用\"],\"dictValue\":[\"1\"],\"dictType\":[\"sign_enabled\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:21:46');
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"禁用\"],\"dictValue\":[\"0\"],\"dictType\":[\"sign_enabled\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:22:04');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"sign_user\"],\"tableComment\":[\"用户表\"],\"className\":[\"SignUser\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"签到平台ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"platformId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"自定义密钥\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"platformKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"区域类型\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"areaType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"sign_area\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:22:53');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"sign_setting\"],\"tableComment\":[\"签到系统设置表\"],\"className\":[\"SignSetting\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"26\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设置名称\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"settingName\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"27\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设置值\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"settingValue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"28\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"备注\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"settingExplain\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"signSetting\"],\"functionName\":[\"签到系统设置\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genType\":[\"1\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:26:14');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sign_setting', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:26:18');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"sign_setting\"],\"tableComment\":[\"签到系统设置表\"],\"className\":[\"SignSetting\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"26\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设置名称\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"settingName\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"27\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设置值\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"settingValue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"28\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"备注\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"settingExplain\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"signSetting\"],\"functionName\":[\"签到系统设置\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:26:41');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_setting', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 16:26:45');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"sign_setting\"],\"tableComment\":[\"签到系统设置表\"],\"className\":[\"SignSetting\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"26\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设置名称\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"settingName\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"27\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设置值\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"settingValue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"28\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"备注\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"settingExplain\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"signSetting\"],\"functionName\":[\"签到系统设置\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:28:30');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"sign_setting\"],\"tableComment\":[\"签到系统设置表\"],\"className\":[\"SignSetting\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"26\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"设置名称\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"settingName\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"27\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"设置值\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"settingValue\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"28\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"备注\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"settingExplain\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"signSetting\"],\"functionName\":[\"签到系统设置\"],\"params[parentMenuId]\":[\"3\"],\"params[parentMenuName]\":[\"系统工具\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:29:51');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_setting', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 16:29:53');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"sign_log\"],\"tableComment\":[\"签到日志表\"],\"className\":[\"SignLog\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"15\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"日志编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"logId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"16\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"17\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"系统编号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"systemId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"18\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"体温\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"temperature\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"19\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"20\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"经度\"],\"columns', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:34:52');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_log', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 16:38:47');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"胖哈勃实验室（体温签到系统）\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-heart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:42:31');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"签到日志\"],\"url\":[\"/system/log\"],\"target\":[\"menuItem\"],\"perms\":[\"system:log:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:42:49');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"签到系统设置\"],\"url\":[\"/system/signSetting\"],\"target\":[\"menuItem\"],\"perms\":[\"system:signSetting:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:42:59');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/signUser\"],\"target\":[\"menuItem\"],\"perms\":[\"system:signUser:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:43:11');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2024\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"胖哈勃实验室\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-heart\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:43:37');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"sign_config\"],\"tableComment\":[\"用户配置表\"],\"className\":[\"SignConfig\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"configId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"stuSystemId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"stuClass\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"stuUUID\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isE', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:44:13');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"sign_config\"],\"tableComment\":[\"用户配置表\"],\"className\":[\"SignConfig\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"配置编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"configId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"系统ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"stuSystemId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"学生姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"班级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"stuClass\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"设备ID\"],\"columns[5].', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 16:45:00');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_config', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 17:22:03');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"sign_config\"],\"tableComment\":[\"用户配置表\"],\"className\":[\"SignConfig\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"配置编号\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"configId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"学号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"stuNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"系统ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"stuSystemId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"学生姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"班级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"stuClass\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"设备ID\"],\"columns[5].', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-06 17:26:35');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sign_config', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2021-02-06 17:26:39');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"sign_config,sign_log,sign_setting,sign_user\"]}', 'null', 0, NULL, '2021-02-06 20:57:24');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"sign_config,sign_log,sign_setting,sign_user\"]}', 'null', 0, NULL, '2021-02-06 20:57:28');
INSERT INTO `sys_oper_log` VALUES (141, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"测试AES加密串\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask()\"],\"cronExpression\":[\"0 0 */1 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:53:02');
INSERT INTO `sys_oper_log` VALUES (142, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:53:07');
INSERT INTO `sys_oper_log` VALUES (143, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:53:12');
INSERT INTO `sys_oper_log` VALUES (144, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:54:33');
INSERT INTO `sys_oper_log` VALUES (145, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"],\"updateBy\":[\"admin\"],\"jobName\":[\"测试AES加密串\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"com.ruoyi.fucktryee.task.TestEncryptTask.testEncryptTask\"],\"cronExpression\":[\"0 0 */1 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:55:57');
INSERT INTO `sys_oper_log` VALUES (146, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:56:03');
INSERT INTO `sys_oper_log` VALUES (147, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"],\"updateBy\":[\"admin\"],\"jobName\":[\"测试AES加密串\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"ryTask.testEncryptTask\"],\"cronExpression\":[\"0 0 */1 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:58:50');
INSERT INTO `sys_oper_log` VALUES (148, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 08:58:54');
INSERT INTO `sys_oper_log` VALUES (149, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"],\"updateBy\":[\"admin\"],\"jobName\":[\"测试AES加密串\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"testEncryptTask.task\"],\"cronExpression\":[\"0 0 */1 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:08:21');
INSERT INTO `sys_oper_log` VALUES (150, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:08:28');
INSERT INTO `sys_oper_log` VALUES (151, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"早上重签\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"reSign.task\"],\"cronExpression\":[\"1 36 6 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:10:57');
INSERT INTO `sys_oper_log` VALUES (152, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"晚上重签\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"reSign.task\"],\"cronExpression\":[\"1 6 19 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:11:31');
INSERT INTO `sys_oper_log` VALUES (153, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"正则获取新的加密串\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"obtainEncryptKeyTask.task\"],\"cronExpression\":[\"0 0 */1 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:13:06');
INSERT INTO `sys_oper_log` VALUES (154, '定时任务', 3, 'com.ruoyi.quartz.controller.SysJobController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/job/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:13:13');
INSERT INTO `sys_oper_log` VALUES (155, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 早\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"MutilThreadSignTask.task\"],\"cronExpression\":[\"1 31 6 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:14:45');
INSERT INTO `sys_oper_log` VALUES (156, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"],\"updateBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 早\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"mutilThreadSignTask.task\"],\"cronExpression\":[\"1 31 6 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:14:59');
INSERT INTO `sys_oper_log` VALUES (157, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 晚\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"mutilThreadSignTask.task\"],\"cronExpression\":[\"1 1 19 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:16:21');
INSERT INTO `sys_oper_log` VALUES (158, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"101\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:16:29');
INSERT INTO `sys_oper_log` VALUES (159, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"102\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:16:31');
INSERT INTO `sys_oper_log` VALUES (160, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"103\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:16:33');
INSERT INTO `sys_oper_log` VALUES (161, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:16:35');
INSERT INTO `sys_oper_log` VALUES (162, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"105\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:16:36');
INSERT INTO `sys_oper_log` VALUES (163, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"103\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:18:50');
INSERT INTO `sys_oper_log` VALUES (164, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:19:28');
INSERT INTO `sys_oper_log` VALUES (165, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"],\"updateBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 早\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"multiThreadSignTask.task\"],\"cronExpression\":[\"1 31 6 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:22:26');
INSERT INTO `sys_oper_log` VALUES (166, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"105\"],\"updateBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 晚\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"multiThreadSignTask.task\"],\"cronExpression\":[\"1 1 19 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:22:37');
INSERT INTO `sys_oper_log` VALUES (167, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"105\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:22:41');
INSERT INTO `sys_oper_log` VALUES (168, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:22:44');
INSERT INTO `sys_oper_log` VALUES (169, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:31:50');
INSERT INTO `sys_oper_log` VALUES (170, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:35:08');
INSERT INTO `sys_oper_log` VALUES (171, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"],\"updateBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 早\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"multiThreadSignTask.task\"],\"cronExpression\":[\"1 31 6 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:37:16');
INSERT INTO `sys_oper_log` VALUES (172, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"105\"],\"updateBy\":[\"admin\"],\"jobName\":[\"多线程签到 - 晚\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"multiThreadSignTask.task\"],\"cronExpression\":[\"1 1 19 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"0\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:37:21');
INSERT INTO `sys_oper_log` VALUES (173, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"104\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-07 09:37:26');
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '122.246.55.228', 'XX XX', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"胖哈勃实验室\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 'null', 1, '不允许操作超级管理员用户', '2021-02-07 10:10:06');
INSERT INTO `sys_oper_log` VALUES (175, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '122.246.55.228', 'XX XX', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-02-07 10:10:20');
INSERT INTO `sys_oper_log` VALUES (176, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '122.246.55.228', 'XX XX', '{\"jobId\":[\"105\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-02-07 10:17:41');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '122.246.55.228', 'XX XX', '{\"menuId\":[\"116\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"系统接口\"],\"url\":[\"/tool/swagger\"],\"target\":[\"menuItem\"],\"perms\":[\"tool:swagger:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-gg\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-02-07 10:20:16');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '122.246.55.228', 'XX XX', '{\"menuId\":[\"115\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"代码生成\"],\"url\":[\"/tool/gen\"],\"target\":[\"menuItem\"],\"perms\":[\"tool:gen:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-code\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-02-07 10:20:25');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '122.246.55.228', 'XX XX', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-02-07 10:20:39');
INSERT INTO `sys_oper_log` VALUES (180, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '223.104.247.130', 'XX XX', '{\"jobId\":[\"105\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"1\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2021-02-11 18:27:34');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-02-06 15:24:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-02-06 15:24:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-02-06 15:24:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-02-06 15:24:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-02-06 15:24:07', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2021-02-06 15:24:07', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

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
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '8e6d98b90472783cc73c17047ddccf36', 'c92a7a', '0', '0', '123.152.77.123', '2021-02-19 08:12:30', '2021-02-07 10:10:20', 'admin', '2021-02-06 15:24:04', '', '2021-02-19 08:12:29', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-02-06 15:24:04', '2021-02-06 15:24:04', 'admin', '2021-02-06 15:24:04', '', NULL, '测试员');

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
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
