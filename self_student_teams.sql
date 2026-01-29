/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3307
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3307
 Source Schema         : self_student_teams

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 30/08/2024 11:17:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for active_logs
-- ----------------------------
DROP TABLE IF EXISTS `active_logs`;
CREATE TABLE `active_logs`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名时间',
  `active_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动编号',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `active_id`(`active_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `active_logs_ibfk_1` FOREIGN KEY (`active_id`) REFERENCES `activities` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `active_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报名记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of active_logs
-- ----------------------------
INSERT INTO `active_logs` VALUES ('1724987005237', '2024-08-30 11:03:25', '1724987005218', '1642422100001');
INSERT INTO `active_logs` VALUES ('1724987182127', '2024-08-30 11:06:22', '1724987182108', '1642422100001');

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `comm` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动概述',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动详情',
  `ask` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动要求',
  `total` int NOT NULL COMMENT '报名人数',
  `active_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布社团',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id` ASC) USING BTREE,
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES ('1724987005218', '爱心志愿者', '去看望老人', '加学分', '穿戴整齐', 1, '2024-08-30 11:02:11', '1672148926602');
INSERT INTO `activities` VALUES ('1724987182108', '爱心志愿者', '帮助贫困地区小朋友', '加学分', '穿戴整齐', 1, '2024-08-30 11:05:37', '1642422100000');

-- ----------------------------
-- Table structure for apply_logs
-- ----------------------------
DROP TABLE IF EXISTS `apply_logs`;
CREATE TABLE `apply_logs`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `status` int NOT NULL COMMENT '处理状态',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请社团',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `apply_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `apply_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of apply_logs
-- ----------------------------
INSERT INTO `apply_logs` VALUES ('1672148640042', 1, '2022-12-27 21:44:00', '1642422100000', '1672148602348');
INSERT INTO `apply_logs` VALUES ('1724986854948', 2, '2024-08-30 11:00:54', '1672148926602', '1724986836909');
INSERT INTO `apply_logs` VALUES ('1724986865387', 1, '2024-08-30 11:01:05', '1642422100000', '1724986836909');
INSERT INTO `apply_logs` VALUES ('1724987732696', 1, '2024-08-30 11:15:32', '1642422100000', '1724987725770');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入团时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加入社团',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1642422100000', '2022-01-17 20:00:00', '1642422100000', '1642422100001');
INSERT INTO `members` VALUES ('1672148926606', '2022-12-27 21:48:46', '1672148926602', '1672148602348');
INSERT INTO `members` VALUES ('1672148941775', '2022-12-27 21:49:01', '1642422100000', '1672148602348');
INSERT INTO `members` VALUES ('1724987284519', '2024-08-30 11:08:04', '1642422100000', '1724986836909');
INSERT INTO `members` VALUES ('1724987752040', '2024-08-30 11:15:52', '1642422100000', '1724987725770');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `detail` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知详情',
  `create_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布社团',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('1724987232475', '请多参加社团活动', '有学分加', '2024-08-30', '1642422100000');
INSERT INTO `notices` VALUES ('1724987456778', '欢迎使用校园社团系统', '请同学们遵守校园纪律，合理安排时间做活动', '2024-08-30', NULL);

-- ----------------------------
-- Table structure for pay_logs
-- ----------------------------
DROP TABLE IF EXISTS `pay_logs`;
CREATE TABLE `pay_logs`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴费时间',
  `total` double NOT NULL COMMENT '缴纳费用',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费社团',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴费用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `pay_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '缴费记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_logs
-- ----------------------------
INSERT INTO `pay_logs` VALUES ('1724987263145', '2024-08-30 11:07:43', 200, '1642422100000', '1672148602348');
INSERT INTO `pay_logs` VALUES ('1724987310416', '2024-08-30 11:08:30', 300, '1642422100000', '1724986836909');
INSERT INTO `pay_logs` VALUES ('1724987768345', '2024-08-30 11:16:08', 500, '1642422100000', '1724987725770');

-- ----------------------------
-- Table structure for team_types
-- ----------------------------
DROP TABLE IF EXISTS `team_types`;
CREATE TABLE `team_types`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社团类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of team_types
-- ----------------------------
INSERT INTO `team_types` VALUES ('1642422100000', '科技创新', '2022-01-17 20:00:00');
INSERT INTO `team_types` VALUES ('1642422100001', '户外运动', '2022-01-17 20:00:00');
INSERT INTO `team_types` VALUES ('1642422100002', '语言文学', '2022-01-17 20:00:00');
INSERT INTO `team_types` VALUES ('1642422100003', '志愿服务', '2022-01-17 20:00:00');

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团名称',
  `create_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '建立时间',
  `total` int NOT NULL COMMENT '社团人数',
  `manager` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团团长',
  `type_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id` ASC) USING BTREE,
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `team_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社团信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('1642422100000', '网络攻防', '2022-01-17', 4, '1642422100001', '1642422100000');
INSERT INTO `teams` VALUES ('1672148926602', '星空漫画', '2022-12-27', 1, '1642422100001', '1642422100002');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `pass_word` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `age` int NULL DEFAULT NULL COMMENT '用户年龄',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `status` int NOT NULL COMMENT '信息状态',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `type` int NOT NULL COMMENT '用户身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1642422100000', 'admin', 'admin', '张三', '男', 45, '90989192', '武当十八号', 1, '2022-01-17 20:00:00', 0);
INSERT INTO `users` VALUES ('1642422100001', '123', '123', '李华', '男', 28, '90989193', '武当十九号', 1, '2022-01-17 20:00:00', 1);
INSERT INTO `users` VALUES ('1672148602348', '222', '123', '哈哈哈哈', '男', 12, '1111', 'dd', 1, '2022-12-27 21:43:22', 1);
INSERT INTO `users` VALUES ('1724986836909', 'zhangsan', '123456', '张三', '男', 18, '17035781384', '合肥市', 1, '2024-08-30 11:00:36', 2);
INSERT INTO `users` VALUES ('1724987725770', '12345', '12345', '山山', '女', 20, '17035781384', '合肥市', 1, '2024-08-30 11:15:25', 2);

SET FOREIGN_KEY_CHECKS = 1;
