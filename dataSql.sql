/*
 Navicat Premium Data Transfer

 Source Server         : 111.231.218.155
 Source Server Type    : MySQL
 Source Server Version : 50559
 Source Host           : 111.231.218.155:3306
 Source Schema         : CuitJavaEE

 Target Server Type    : MySQL
 Target Server Version : 50559
 File Encoding         : 65001

 Date: 15/07/2019 15:26:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `acid` int(11) NOT NULL AUTO_INCREMENT COMMENT '账目ID',
  `tid` int(11) NULL DEFAULT NULL COMMENT '类型ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `IEType` int(11) NULL DEFAULT NULL COMMENT '收支类型(0为收入，1为支出)',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  `amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '金额',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收支备注',
  `is_expose` int(11) NULL DEFAULT NULL COMMENT '是否公开',
  `is_avaliable` int(11) NULL DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`acid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 1, 1, 1, '2019-07-01 15:39:05', 200, '吃饭', 1, 1);
INSERT INTO `account` VALUES (2, 2, 1, 0, '2019-07-02 15:39:06', 2000, '工资', 1, 1);
INSERT INTO `account` VALUES (3, 3, 1, 1, '2019-07-03 15:39:07', 300, '购物', 1, 1);
INSERT INTO `account` VALUES (4, 4, 1, 0, '2019-07-04 15:39:08', 100, '兼职', 1, 1);
INSERT INTO `account` VALUES (5, 5, 1, 1, '2019-07-05 15:39:09', 50, '打车', 1, 1);
INSERT INTO `account` VALUES (6, 6, 1, 1, '2019-07-06 15:39:10', 100, '看电影', 1, 1);
INSERT INTO `account` VALUES (7, 7, 1, 1, '2019-07-07 15:39:11', 200, '缴话费', 1, 1);
INSERT INTO `account` VALUES (8, 8, 1, 1, '2019-07-08 15:40:18', 50, '游戏充值', 1, 1);
INSERT INTO `account` VALUES (9, 9, 1, 1, '2019-07-09 15:40:18', 300, '买内存条', 1, 1);
INSERT INTO `account` VALUES (10, 1, 2, 1, '2019-07-14 15:40:18', 200, '吃饭', 1, 1);
INSERT INTO `account` VALUES (11, 2, 2, 0, '2019-07-14 15:40:18', 2000, '工资', 1, 1);
INSERT INTO `account` VALUES (12, 3, 2, 1, '2019-07-14 15:40:18', 300, '购物', 1, 1);
INSERT INTO `account` VALUES (13, 4, 2, 0, '2019-07-14 15:40:18', 100, '兼职', 1, 1);
INSERT INTO `account` VALUES (14, 5, 2, 1, '2019-07-14 15:40:18', 50, '打车', 1, 1);
INSERT INTO `account` VALUES (15, 6, 2, 1, '2019-07-14 15:40:19', 100, '看电影', 1, 1);
INSERT INTO `account` VALUES (16, 7, 2, 1, '2019-07-14 15:40:19', 200, '缴话费', 1, 1);
INSERT INTO `account` VALUES (17, 8, 2, 1, '2019-07-14 15:40:19', 50, '游戏充值', 1, 1);
INSERT INTO `account` VALUES (18, 1, 3, 1, '2019-07-14 15:40:19', 200, '吃饭', 1, 1);
INSERT INTO `account` VALUES (19, 2, 3, 0, '2019-07-14 15:40:19', 2000, '工资', 1, 1);
INSERT INTO `account` VALUES (20, 3, 3, 1, '2019-07-14 15:40:19', 300, '购物', 1, 1);
INSERT INTO `account` VALUES (21, 4, 3, 0, '2019-07-14 15:40:19', 100, '兼职', 1, 1);
INSERT INTO `account` VALUES (22, 5, 3, 1, '2019-07-14 15:40:20', 50, '打车', 1, 1);
INSERT INTO `account` VALUES (23, 6, 3, 1, '2019-07-14 15:40:20', 100, '看电影', 1, 1);
INSERT INTO `account` VALUES (24, 7, 3, 1, '2019-07-14 15:40:20', 200, '缴话费', 1, 1);
INSERT INTO `account` VALUES (30, 9, 3, 1, '2019-07-15 13:58:22', 500, '买键盘', 1, 1);
INSERT INTO `account` VALUES (31, 10, 3, 0, '2019-07-15 13:59:33', 200, '中奖', 1, 1);
INSERT INTO `account` VALUES (32, 11, 3, 1, '2019-07-15 14:00:15', 150, '买鼠标', NULL, NULL);

-- ----------------------------
-- Table structure for account_type
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_type
-- ----------------------------
INSERT INTO `account_type` VALUES (1, '生活日用', '包括日用品，服装');
INSERT INTO `account_type` VALUES (2, '餐饮美食', '包括聚餐、日常买菜');
INSERT INTO `account_type` VALUES (3, '交通出行', '包括旅游车费、日常出行费');
INSERT INTO `account_type` VALUES (4, '娱乐', '包括电影、演出');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限说明',
  PRIMARY KEY (`auid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, '家长', '家长权限的用户');
INSERT INTO `authority` VALUES (2, '普通', '普通的家庭成员');

-- ----------------------------
-- Table structure for deposit
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit`  (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '存款目标ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `start_date` timestamp NULL DEFAULT NULL COMMENT '目标起始日期',
  `end_date` timestamp NULL DEFAULT NULL COMMENT '目标结束日期',
  `amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '目标金额',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_complete` int(11) NULL DEFAULT NULL COMMENT '目标状态(0进行中,1已完成,2未完成)',
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES (2, 1, '2018-08-24 00:00:00', '2019-08-30 00:00:00', 1000, '买车', 0);
INSERT INTO `deposit` VALUES (3, 1, '2019-07-15 10:43:19', '2019-07-18 10:43:42', 1500, '买游戏', 0);
INSERT INTO `deposit` VALUES (4, 1, '2019-07-15 10:48:23', '2019-07-18 10:48:27', 100, '买资料', 0);
INSERT INTO `deposit` VALUES (8, 1, '2019-07-08 08:00:00', '2019-07-17 08:00:00', 120, '吃火锅', 0);
INSERT INTO `deposit` VALUES (9, 1, '2019-07-15 08:00:00', '2019-07-18 08:00:00', 1000, '无', 0);
INSERT INTO `deposit` VALUES (10, 1, '2019-07-15 08:00:00', '2019-07-30 08:00:00', 2000, '买机票', 0);
INSERT INTO `deposit` VALUES (11, 0, '2019-07-15 08:00:00', '2019-09-30 08:00:00', 1000, '买房', 0);

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '家庭ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '家主ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭名称',
  `motto` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭宣言',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭图标',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_expose` int(11) NULL DEFAULT NULL COMMENT '是否公开',
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES (2, 13, '好家长', '我爱我家', 'default', '互联网', 1);
INSERT INTO `family` VALUES (3, 14, '幸福小家', '我要上小康', 'default', '四川成都', 1);
INSERT INTO `family` VALUES (4, 15, '好家庭', '我家有个大树', 'default', '我家', 1);
INSERT INTO `family` VALUES (5, 16, '1', '1', 'default', '1', 1);
INSERT INTO `family` VALUES (6, 17, '1', '1', 'default', '1', 1);
INSERT INTO `family` VALUES (7, 18, '帅气', '暂无', 'default', '为我', 1);

-- ----------------------------
-- Table structure for spending
-- ----------------------------
DROP TABLE IF EXISTS `spending`;
CREATE TABLE `spending`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '支出额度ID',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `start_date` timestamp NULL DEFAULT NULL COMMENT '额度起始日期',
  `end_date` timestamp NULL DEFAULT NULL COMMENT '额度结束日期',
  `amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '额度',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别',
  `occupation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `motto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人生目标',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '月收入',
  `role` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭角色',
  `auid` int(11) NULL DEFAULT NULL COMMENT '权限',
  `is_avaliable` int(11) NULL DEFAULT NULL COMMENT '是否可用',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加日期',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '田洋', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2019-07-12 00:00:00', 0, '学生', 'default', '17789562325', '我是田洋', 100000.00, '爸爸', 1, 1, '2019-07-14 11:51:16');
INSERT INTO `user` VALUES (3, '王大春', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2019-07-12 00:00:00', 0, '学生', 'default', '17789562325', '我是田洋', 100000.00, '儿子', 2, 1, '2019-07-14 11:51:19');
INSERT INTO `user` VALUES (4, '管理员', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2009-01-01 10:15:55', 0, '管理', 'default', '17608136008', '管理员管理全部', 100000.00, '管理', 1, 1, '2019-07-14 16:47:02');
INSERT INTO `user` VALUES (13, '超级管理员', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1996-05-02 08:00:00', 1, '学生', 'default', '17608136008', '先赚十个亿', 185623.00, '爸爸', 1, 1, '2019-07-14 16:09:51');
INSERT INTO `user` VALUES (14, '新家庭', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2019-07-18 08:00:00', 0, '医生', 'default', '16852213254', '赚钱', 10000000.00, '爸爸', 1, 1, '2019-07-14 16:15:49');
INSERT INTO `user` VALUES (15, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2019-07-10 08:00:00', 0, '老师', 'default', '17608136008', '我的目标是成为首富', 102456.00, '爸爸', 1, 1, '2019-07-15 09:34:26');
INSERT INTO `user` VALUES (17, '1', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '2019-07-10 08:00:00', 0, '1', 'default', '11111111111', '1', 1.00, '爸爸', 1, 1, '2019-07-15 11:28:10');
INSERT INTO `user` VALUES (18, 'jacky', '63640264849a87c90356129d99ea165e37aa5fabc1fea46906df1a7ca50db492', '2019-07-10 08:00:00', 0, '医生', 'default', '10543412721', '暂无', 100000.00, '父亲', 1, 1, '2019-07-15 14:15:58');

SET FOREIGN_KEY_CHECKS = 1;
