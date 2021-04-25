/*
 Navicat Premium Data Transfer

 Source Server         : txl
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : localhost:3306
 Source Schema         : txl

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 03/06/2019 17:00:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_fhdb
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb`  (
  `FHDB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for db_timingbackup
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup`  (
  `TIMINGBACKUP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOBNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', 2, '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', 2, '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for oa_companydepartmentpostuser
-- ----------------------------
DROP TABLE IF EXISTS `oa_companydepartmentpostuser`;
CREATE TABLE `oa_companydepartmentpostuser`  (
  `COMPANYDEPARTMENTPOSTUSER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `POST_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位id',
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `COMPANY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`COMPANYDEPARTMENTPOSTUSER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oa_companydepartmentpostuser
-- ----------------------------
INSERT INTO `oa_companydepartmentpostuser` VALUES ('186bdc70aa6d42c995471b2cdfc237c8', 'a9a288aefec441e98f75d980e2e88287', 'f18914224e0d498499c42912ffe0df2b', 'a9a288aefec441e98f75d980e2e88287', 'a9a288aefec441e98f75d980e2e88287');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('2351a89a97c44b7a88138710c6f4ce39', 'a9a288aefec441e98f75d980e2e88287', 'fceaaa6e95964b47948229786b38ca3e', 'a9a288aefec441e98f75d980e2e88287', 'a9a288aefec441e98f75d980e2e88287');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('5388041ec854469fa5c2af31cbedecd8', '871586433e87404d83983a14de6aa2d6', 'be9a2be62af440f9b72138231615a556', '0d868ad699284993abdd11b133f80447', '8a81f39c560c44a1957a969919b74967');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('58281a5af4b64ee9bda09b1441df92d3', 'a9a288aefec441e98f75d980e2e88287', 'bfc6451bf0dd478aa8299cb7577135fa', 'a9a288aefec441e98f75d980e2e88287', 'a9a288aefec441e98f75d980e2e88287');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('596f4b3946e741d5af43478420f38633', 'a9a288aefec441e98f75d980e2e88287', 'fbfe7b0eb30b4b43803837c3f7be4d32', 'a9a288aefec441e98f75d980e2e88287', 'a9a288aefec441e98f75d980e2e88287');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('79971c59b6d64b67b5fdb9a6a7f92e28', '2a4bcde33aec4a129fabf161dafdb5ce', '1d3693a84d794e0096323180eb276eba', '2a4bcde33aec4a129fabf161dafdb5ce', '2a4bcde33aec4a129fabf161dafdb5ce');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('94b7cc62b37b4aac9b716b77b7724261', 'a9a288aefec441e98f75d980e2e88287', 'f88de47fd34a486c964450a1b2cec5a9', 'a9a288aefec441e98f75d980e2e88287', 'a9a288aefec441e98f75d980e2e88287');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('b46192693b184629875e69bd8b89b176', 'fb8e2095e2b343da9d010848dca5f567', '4f7ca2410eb6471e9b5a7c8720f7c697', '0d868ad699284993abdd11b133f80447', '1bf10c7e725c4e8e8baf3d4cf3ed416c');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('bb3641031f1e482999dc8bf981f0b84b', '5cccdb7c432449d8b853c52880058140', '6eae878760304bb69f254dff8598e281', '5cccdb7c432449d8b853c52880058140', '0');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('dc60a5156fbb40ba808f5bfd0990c165', '5cccdb7c432449d8b853c52880058140', '5072fa2ee5fb42b1b5e9f98f4d3926e4', '5cccdb7c432449d8b853c52880058140', '0');
INSERT INTO `oa_companydepartmentpostuser` VALUES ('e48d29c4c2a4446aa1703d79720eea31', 'cbbc84eddde947ba8af7d509e430eb70', '941b752d9f92499fb8f52b2def5b8eb5', '5cccdb7c432449d8b853c52880058140', '5cccdb7c432449d8b853c52880058140');

-- ----------------------------
-- Table structure for oa_datajur
-- ----------------------------
DROP TABLE IF EXISTS `oa_datajur`;
CREATE TABLE `oa_datajur`  (
  `DATAJUR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`) USING BTREE,
  INDEX `FSTAFF`(`STAFF_ID`) USING BTREE,
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oa_datajur
-- ----------------------------
INSERT INTO `oa_datajur` VALUES ('9fd17463ffd7487ab90e683c76026655', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'fh\')', '9fd17463ffd7487ab90e683c76026655', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `oa_datajur` VALUES ('c9f05f925dfc485b9e352916612ab669', '(\'a0982dea52554225ab682cd4b421de47\',\'fh\')', 'c9f05f925dfc485b9e352916612ab669', '8f8b045470f342fdbc4c312ab881d62b');

-- ----------------------------
-- Table structure for oa_department
-- ----------------------------
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department`  (
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司、部门、职位',
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `FAX` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `PHONE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `WEBSITE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站',
  `INTRODUCE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `GRADE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `IS_VALUE` int(1) NOT NULL COMMENT '是否删除，0为未删除，1为删除',
  `IS_STATE` int(1) NULL DEFAULT NULL COMMENT '是否有效，0为无效，1为有效',
  PRIMARY KEY (`DEPARTMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `oa_department` VALUES ('00f5bce043804e2b9ddd944515201ead', '职员', 'zhiyuan', 'MG003003001', 'a6507386d57c4ebd9639a6afad0a202a', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:52:38', '2019-06-02 22:52:38', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('053154286b9048658085221e68950c1b', '部门经理', 'bumenjingli', 'MG002008001', 'a4de21889e8b420fbaf6ef2ff6140f4b', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:39:54', '2019-06-02 22:39:54', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('05f887ef6ab944b7aacabc9039aa6107', '风险管控部', 'fengxianguanlibu', 'MG002006', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:19:41', '2019-06-02 22:19:41', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('0d868ad699284993abdd11b133f80447', '发展投资管理公司', 'fazhantouziguanligongsi', 'MG002', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:35:39', '2019-06-02 21:35:39', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1060e1a6b2c643c4bf1b0a97de105af7', '扶贫开发投资管理有限责任公司', 'fupinkaifatouziguanliyouxianzerengongsi', 'MG003', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:39:02', '2019-06-02 21:39:02', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1591b12f290c413a99f35c1ad2af3470', '职员', 'zhiyuan', 'MG002008003', 'a4de21889e8b420fbaf6ef2ff6140f4b', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:40:32', '2019-06-02 22:40:32', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('16212a332cf04ddba5e7d3978e6af60c', '财务管理部', 'caiwuguanlibu', 'MG003004', '1060e1a6b2c643c4bf1b0a97de105af7', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:44:58', '2019-06-02 22:44:58', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1bf0bf3769164af8aff833a2fbd82704', '业务主管', 'yewuzhuguan', 'MG002007002', '1ccdc269ecac4b7381bb3276d1058f1a', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:39:14', '2019-06-02 22:39:14', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1bf10c7e725c4e8e8baf3d4cf3ed416c', '董事会/投资管理部', 'dongshihuitouziguanlibu', 'MG002002', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:17:20', '2019-06-02 22:17:20', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1c313d2e04b74532b8fcbab48e56d55d', '交通投资（集团）有限责任公司', 'jiaotongtouziyouxianzerengongsi', 'MG007', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:45:18', '2019-06-02 21:45:18', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1ccdc269ecac4b7381bb3276d1058f1a', '财务管理部', 'caiwuguanlibu', 'MG002007', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:21:20', '2019-06-02 22:21:20', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('1eabc67c159642c980f274e4e1383ef4', '职员', 'zhiyuan', 'MG002007003', '1ccdc269ecac4b7381bb3276d1058f1a', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:39:30', '2019-06-02 22:39:30', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('2351be17edc94a5a8ffe317203803341', '职员', 'zhiyuan', 'MG002003002', '5b36e5bb8b3847a3a6d8795688caddc4', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:35:31', '2019-06-02 22:35:31', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('27fda5a7ddcc454b8b191eabaf71edd4', '综合管理部', 'zongheguanlibu', 'MG003005', '1060e1a6b2c643c4bf1b0a97de105af7', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:45:18', '2019-06-02 22:45:18', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('28808d84a548404cab4230ddac863aca', '财务管理部', 'caiwuguanlibu', 'MG005002', '98f1708541574076a9fd97bb3b4dae47', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:06:18', '2019-06-02 23:06:18', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('2d941be1ec1d452dbe1b2734a4c64542', '业务主管', 'yewuzhuguan', 'MG002006002', '05f887ef6ab944b7aacabc9039aa6107', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:38:25', '2019-06-02 22:38:25', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('2f2e3013a3c74b1cbde9cde8e9c56bc6', '业务主管', 'yewuzhuguan', 'MG002004002', '714ef9753cd5464da509767adb10dcfc', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:36:21', '2019-06-02 22:36:21', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('344fda214e2447009a8662d17c66740f', '职员', 'zhiyuan', 'MG003004002', '16212a332cf04ddba5e7d3978e6af60c', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:53:40', '2019-06-02 22:53:40', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('367025994a41445eb59fff8ec99c0056', '经理', 'jingli', 'MG005005001', 'cd1f8a07eade4e05addadad6c675a7ab', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:10:45', '2019-06-02 23:10:45', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('3ab6ae129e014d16a58edfc1559ee339', '工程技术部', 'gongchengjishubu', 'MG005003', '98f1708541574076a9fd97bb3b4dae47', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:07:08', '2019-06-02 23:07:08', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('3c7c64ab00354ff88431dfbcbe0e3947', '职员', 'zhiyuan', 'MG002005003', 'cd4bfc00b6234be696be83324c6af58c', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:37:37', '2019-06-02 22:37:37', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('40ce476411014c6ab81fb47e46cf2f30', '副总经理', 'fuzongjingli', 'MG005001002', '6402c7fd0b4b48f18b309d22d480ea8d', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:09:05', '2019-06-02 23:09:05', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('438274c6f2214ac895e32130d1f4192e', '融资租赁有限责任公司', 'rongzizupinyouxianzerengongsi', 'MG011', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:49:54', '2019-06-02 21:49:54', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('44848ace0fb64b3882e6131ea012945e', '经理', 'jingli', 'MG005003001', '3ab6ae129e014d16a58edfc1559ee339', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:10:03', '2019-06-02 23:10:13', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('4d5033fbca0945269ee09ed0e13ce872', '运营部', 'yunyingbu', 'MG004001', '4e089aebc8a34e4ead60ae7286949ec3', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:03:53', '2019-06-02 23:03:53', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('4e089aebc8a34e4ead60ae7286949ec3', '国云数据有限责任公司', 'guoyunshujuyouxianzerengongsi', 'MG004', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:41:01', '2019-06-02 21:41:01', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('4fbec652e9e548c08ac148ee024d5a79', '副总经理', 'fuzongjingli', 'MG004001001', '4d5033fbca0945269ee09ed0e13ce872', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:04:32', '2019-06-02 23:04:32', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('546688405c6645769eff7955066edf8f', '部门经理', 'bumenjingli', 'MG002007001', '1ccdc269ecac4b7381bb3276d1058f1a', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:38:56', '2019-06-02 22:38:56', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('57f6f50adfe841bb8f03666835f758a2', '职员', 'zhiyuan', 'MG004001002', '4d5033fbca0945269ee09ed0e13ce872', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:04:52', '2019-06-02 23:04:52', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('5b36e5bb8b3847a3a6d8795688caddc4', '投资管理部', 'touziguanlibu', 'MG002003', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:17:44', '2019-06-02 22:17:44', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('6402c7fd0b4b48f18b309d22d480ea8d', '总经办', 'zongjingban', 'MG005001', '98f1708541574076a9fd97bb3b4dae47', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:06:02', '2019-06-02 23:06:02', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('645555ebb6ec483bbbfb3d7e4c4d6b79', '班子成员', 'banzichengyuan', 'MG003001', '1060e1a6b2c643c4bf1b0a97de105af7', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:42:58', '2019-06-02 22:42:58', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('657879f24f234ed5af311739ea208fee', '运达出租汽车有限责任公司', 'yundachuzuqicheyouxianzerengongsi', 'MG010', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:48:17', '2019-06-02 21:48:17', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('6691b63ec3e04350aa3626105247141f', '大数据投资有限责任公司', 'dashujutouziyouxianzerengongsi', 'MG014', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:53:17', '2019-06-02 21:53:17', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('6f45b3507c6743dc9ccb7d171030f265', '总经理', 'zongjingli', 'MG005001001', '6402c7fd0b4b48f18b309d22d480ea8d', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:08:43', '2019-06-02 23:08:43', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('7015b41f3bf04e919362a0cd94ee88a8', '铁路投资有限责任公司', 'tielutouziyouxianzerengongsi', 'MG008', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:46:25', '2019-06-02 21:46:25', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('714ef9753cd5464da509767adb10dcfc', '项目管理部', 'xiangmuguanlibu', 'MG002004', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:18:27', '2019-06-02 22:18:27', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('721c034cd7144b61bbeee3ef2e3dabfb', '副总经理', 'fuzongjingli', 'MG003001001', '645555ebb6ec483bbbfb3d7e4c4d6b79', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:51:40', '2019-06-02 22:51:40', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('74404d0af717457fb9c3734329337586', '副总经理兼财务总监', 'fuzongjinglijiancaiwuzongjian', 'MG002009001', '7c0c743466784aefa441140110bc23d5', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:41:07', '2019-06-02 22:41:07', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('7aca521ec76a4c4088dfa58bce2b073f', '资产管理有限责任公司', 'zichanguanliyouxianzerengongsi', 'MG013', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:51:27', '2019-06-02 21:51:27', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('7c0c743466784aefa441140110bc23d5', '外派通泰医疗公司', 'waipaitongtaiyiliaogongsi', 'MG002009', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:22:35', '2019-06-02 22:22:35', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('871586433e87404d83983a14de6aa2d6', '总经理', 'zongjingli', 'MG002001001', '8a81f39c560c44a1957a969919b74967', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:32:07', '2019-06-02 22:32:35', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('8a81f39c560c44a1957a969919b74967', '总经办', 'zongjingban', 'MG002001', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:16:08', '2019-06-02 22:16:08', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('8bb0b112cb534887827cc0bd3221dad7', '职员', 'zhiyuan', 'MG004002001', '93cb9faa94384eb99debb2446841c611', '', '', '', '', '', '', '', '', '', '', '', '', '2019-06-02 23:05:15', '2019-06-02 23:05:15', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('8e8b98ee39d74efe88027d1d6da8d95b', '总经理助理', 'zongjinglizhuli', 'MG002001003', '8a81f39c560c44a1957a969919b74967', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:33:03', '2019-06-02 22:33:03', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('93cb9faa94384eb99debb2446841c611', '财务部', 'caiwubu', 'MG004002', '4e089aebc8a34e4ead60ae7286949ec3', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:04:10', '2019-06-02 23:04:10', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('9843e6fd02994599889b5f78b701dd6e', '业务主管', 'yewuzhuguan', 'MG002005002', 'cd4bfc00b6234be696be83324c6af58c', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:37:13', '2019-06-02 22:37:13', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('98f1708541574076a9fd97bb3b4dae47', '交通基础设施建设有限责任公司', 'jiaotongjichusheshijiansheyouxianzerengongsi', 'MG005', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:42:14', '2019-06-02 21:42:14', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('a4de21889e8b420fbaf6ef2ff6140f4b', '综合管理部', 'zongheguanlibu', 'MG002008', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:22:02', '2019-06-02 22:22:02', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('a6507386d57c4ebd9639a6afad0a202a', '投融资管理部', 'tourongziguanlibu', 'MG003003', '1060e1a6b2c643c4bf1b0a97de105af7', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:43:45', '2019-06-02 22:43:45', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('b3a444394b4a49b2af2a7724b5eb4540', '副总经理', 'fuzongjingli', 'MG002001002', '8a81f39c560c44a1957a969919b74967', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:32:26', '2019-06-02 22:32:26', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('b7d3d81d93d4416abb9717890f1b78e4', '职员', 'zhiyuan', 'MG003002001', 'e87cef0e5bb946ff8cc680d3d4b008be', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:52:12', '2019-06-02 22:52:12', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('b98aaa0484654c10a332318397a13331', '经理', 'jingli', 'MG005002001', '28808d84a548404cab4230ddac863aca', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 23:09:36', '2019-06-02 23:09:36', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('bf886308eddd4ff1bc975d98cb9dc498', '资深职员', 'zishenzhiyuan', 'MG003004001', '16212a332cf04ddba5e7d3978e6af60c', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:53:05', '2019-06-02 22:53:05', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('c9bfec39d9c64db8a2492c978837e6a2', '部门经理', 'bumenjingli', 'MG002006001', '05f887ef6ab944b7aacabc9039aa6107', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:38:01', '2019-06-02 22:38:01', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('cd1f8a07eade4e05addadad6c675a7ab', '安质环保部', 'anzhihuanbaobu', 'MG005005', '98f1708541574076a9fd97bb3b4dae47', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:06:41', '2019-06-02 23:06:41', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('cd4bfc00b6234be696be83324c6af58c', '金融市场部', 'jingrongshichangbu', 'MG002005', '0d868ad699284993abdd11b133f80447', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:19:03', '2019-06-02 22:19:03', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('cf4bbc5122744de28f63bbff42977e23', '职员', 'zhiyuan', 'MG003005001', '27fda5a7ddcc454b8b191eabaf71edd4', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:54:08', '2019-06-02 22:55:03', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('d0d765e1d4834ee6b853e12f97a9deae', '部门经理', 'bumenjingli', 'MG002005001', 'cd4bfc00b6234be696be83324c6af58c', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:36:48', '2019-06-02 22:36:48', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('d529828c468b4c1b9280c6255d9fd263', '航空旅游投资（集团）有限公司', 'hangkonglvyoutouziyouxiangongsi', 'MG006', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:43:31', '2019-06-02 21:43:31', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('dcb96f7d0fa8462495502ddf21d51247', '油气投资股份有限公司', 'youqitouzigufenyouxiangongsi', 'MG012', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:50:45', '2019-06-02 21:50:45', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('e476ca9aa6cd4eba878864c7e6bf3840', '集团公司', 'jituangongsi', 'MG001', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:55:13', '2019-06-02 21:55:13', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('e87cef0e5bb946ff8cc680d3d4b008be', '项目管理部', 'xiangmuguanlibu', 'MG003002', '1060e1a6b2c643c4bf1b0a97de105af7', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 22:43:24', '2019-06-02 22:43:24', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('ecc614b1afe7481eaba4fcd1e4b47200', '业务主管', 'yewuzhuguan', 'MG002003001', '5b36e5bb8b3847a3a6d8795688caddc4', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:35:15', '2019-06-02 22:35:15', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('ecc6591f6682459b984c4d383dd7d691', '人事行政部', 'renshixingzhengbu', 'MG005004', '98f1708541574076a9fd97bb3b4dae47', '', '', '', '', '', 'DT001002', '', '', '', '', '', '', '2019-06-02 23:07:31', '2019-06-02 23:07:31', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('f33bdeafdef74395b2a209a9e2155cf5', '部门副经理', 'bumenfujingli', 'MG002004001', '714ef9753cd5464da509767adb10dcfc', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:35:59', '2019-06-02 22:35:59', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('f348e8aecafa4ab49f32e256635e9e73', '对外贸易发展有限责任公司', 'duiwaimaoyifazhanyouxianzerengongsi', 'MG009', '0', '', '', '', '', '', 'DT001001', '', '', '', '', '', '', '2019-06-02 21:47:15', '2019-06-02 21:47:15', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('fa7d63fa825d4373b3220a6c66b897b8', '部门副经理', 'bumenfujingli', 'MG002008002', 'a4de21889e8b420fbaf6ef2ff6140f4b', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:40:16', '2019-06-02 22:40:16', '1', 0, 0);
INSERT INTO `oa_department` VALUES ('fb8e2095e2b343da9d010848dca5f567', '董事会秘书兼部门经理', 'dongshihuimishujianbumenjingli', 'MG002002001', '1bf10c7e725c4e8e8baf3d4cf3ed416c', '', '', '', '', '', 'DT001003', '', '', '', '', '', '', '2019-06-02 22:33:54', '2019-06-02 22:33:54', '1', 0, 0);

-- ----------------------------
-- Table structure for oa_fhfile
-- ----------------------------
DROP TABLE IF EXISTS `oa_fhfile`;
CREATE TABLE `oa_fhfile`  (
  `FHFILE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oa_fhfile
-- ----------------------------
INSERT INTO `oa_fhfile` VALUES ('00a3a22cde5a4a87b935f69a07a095cd', 'ssdf', '2016060308062777776.txt', '2016-06-03 20:06:27', 's', 'admin', '0', '0.643');
INSERT INTO `oa_fhfile` VALUES ('10d0d0a30c5a4d1798f6abbb6a4eafb8', 'f1', '2016060211505730809.png', '2016-06-02 23:50:57', '21', 'lisi', '8f8b045470f342fdbc4c312ab881d62b', '522.43');
INSERT INTO `oa_fhfile` VALUES ('1d12e3f914cf493c9bde0cff3584cefb', 'w1', '2016060211500388907.png', '2016-06-02 23:50:03', 'w1', 'san', '5cccdb7c432449d8b853c52880058140', '6.389');

-- ----------------------------
-- Table structure for oa_staff
-- ----------------------------
DROP TABLE IF EXISTS `oa_staff`;
CREATE TABLE `oa_staff`  (
  `STAFF_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oa_staff
-- ----------------------------
INSERT INTO `oa_staff` VALUES ('9fd17463ffd7487ab90e683c76026655', 'www', 'www', 'ww', '5cccdb7c432449d8b853c52880058140', 'ww', 'ww', 'www', '男', '2016-04-27', 'ww', 'ww', '2016-05-03', 'ww', 'ww', '2016-04-25', 'ww', '未婚', '2016-05-09', 'ww', '2016-05-17', 'w', 'w', 'w', 'w', 'www', 2, '2016-05-23', '2016-05-16', 'w', 'san', 'www');
INSERT INTO `oa_staff` VALUES ('c9f05f925dfc485b9e352916612ab669', 'fw', 'y', 'y', '8f8b045470f342fdbc4c312ab881d62b', 'y', 'y', 'y', '男', '2016-06-08', 'y', 'y', '2016-06-03', 'y', 'y', '2016-05-31', 'y', '已婚', '2016-06-07', 'y', '2016-06-08', 'y', 'y', 'y', 'y', 'y', 4, '2016-06-21', '2016-06-21', 'y', 'lisi', 'y');

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SFID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `END_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `YEARS` int(10) NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', 2, '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('55d00299ec76448790e5f38da99b8ed6', 'dd', '698d51a19d8a121ce581499d7b701668', '1212', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '1', '1213', '213123', '213', '2016-03-30', '2016-03-31', 123, '1121', '213435345@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode`  (
  `CREATECODE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PACKAGENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限', 'single');
INSERT INTO `sys_createcode` VALUES ('043843a286f84549ad3fa71aac827f6f', 'system', 'FHlog', 'SYS_,fh,FHLOG', 'USERNAME,fh,String,fh,用户名,fh,是,fh,无,fh,100,fh,0Q313596790CZTIME,fh,Date,fh,操作时间,fh,否,fh,无,fh,32,fh,0Q313596790CONTENT,fh,String,fh,事件,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-10 21:10:16', '操作日志记录', 'single');
INSERT INTO `sys_createcode` VALUES ('0ee023606efb45b9a3baaa072e502161', 'information', 'FtestMx', 'FH_,fh,FTESTMX', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790', '2016-04-21 01:52:11', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('1be959583e82473b82f6e62087bd0d38', 'information', 'Attached', 'TB_,fh,ATTACHED', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790', '2016-04-21 17:07:59', '主表测试', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('221a01e985dc4cc6af2e9e577389c87e', 'fhoa', 'CompanyDepartmentPostUser', 'oa_,fh,COMPANYDEPARTMENTPOSTUSER', 'POST_ID,fh,String,fh,职位id,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,用户id,fh,是,fh,无,fh,100,fh,0Q313596790COMPANY_ID,fh,String,fh,公司id,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门id,fh,是,fh,无,fh,100,fh,0Q313596790', '2019-05-30 20:34:05', '公司职位用户关系表', 'single');
INSERT INTO `sys_createcode` VALUES ('3da8e8bd757c44148d89931a54d29c88', 'system', 'UserPhoto', 'SYS_,fh,USERPHOTO', 'USERNAME,fh,String,fh,用户名,fh,否,fh,无,fh,30,fh,0Q313596790PHOTO0,fh,String,fh,原图,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO1,fh,String,fh,头像1,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO2,fh,String,fh,头像2,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO3,fh,String,fh,头像3,fh,否,fh,无,fh,100,fh,0Q313596790', '2016-06-05 17:54:25', '用户头像', 'single');
INSERT INTO `sys_createcode` VALUES ('4173a8c56a504dd6b6213d2b9cd3e91b', 'information', 'AttachedMx', 'TB_,fh,ATTACHEDMX', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790', '2016-04-21 17:09:40', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('41e07fb03763434daef41cd99d0406c3', 'system', 'LogInImg', 'SYS_,fh,LOGINIMG', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790TYPE,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0Q313596790FORDER,fh,Integer,fh,排序,fh,是,fh,无,fh,3,fh,0Q313596790', '2016-06-03 17:53:22', '登录页面背景图片', 'single');
INSERT INTO `sys_createcode` VALUES ('49d985e081ed44e6b34ba1b8c5466e39', 'fhdb', 'TimingBackUp', 'DB_,fh,TIMINGBACKUP', 'JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-04-09 11:53:38', '定时备份', 'single');
INSERT INTO `sys_createcode` VALUES ('4def60c58aa148b7998270978660ef30', 'fhoa', 'Fhfile', 'OA_,fh,FHFILE', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790CTIME,fh,Date,fh,上传时间,fh,否,fh,无,fh,32,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,100,fh,0Q313596790USERNAME,fh,String,fh,长传者,fh,否,fh,无,fh,50,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,否,fh,无,fh,100,fh,0Q313596790FILESIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10,fh,0Q313596790', '2016-05-27 20:52:01', '文件管理', 'single');
INSERT INTO `sys_createcode` VALUES ('91af9fe509704fa68f6bca121359e3ec', 'fhoa', 'Staff', 'OA_,fh,STAFF', 'NAME,fh,String,fh,姓名,fh,是,fh,无,fh,50,fh,0Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50,fh,0Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门,fh,是,fh,无,fh,100,fh,0Q313596790FUNCTIONS,fh,String,fh,职责,fh,是,fh,无,fh,255,fh,0Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,20,fh,0Q313596790EMAIL,fh,String,fh,邮箱,fh,是,fh,无,fh,50,fh,0Q313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,10,fh,0Q313596790BIRTHDAY,fh,Date,fh,出生日期,fh,是,fh,无,fh,32,fh,0Q313596790NATION,fh,String,fh,民族,fh,是,fh,无,fh,10,fh,0Q313596790JOBTYPE,fh,String,fh,岗位类别,fh,是,fh,无,fh,30,fh,0Q313596790JOBJOINTIME,fh,Date,fh,参加工作时间,fh,是,fh,无,fh,32,fh,0Q313596790FADDRESS,fh,String,fh,籍贯,fh,是,fh,无,fh,100,fh,0Q313596790POLITICAL,fh,String,fh,政治面貌,fh,是,fh,无,fh,30,fh,0Q313596790PJOINTIME,fh,Date,fh,入团时间,fh,是,fh,无,fh,32,fh,0Q313596790SFID,fh,String,fh,身份证号,fh,是,fh,无,fh,20,fh,0Q313596790MARITAL,fh,String,fh,婚姻状况,fh,是,fh,无,fh,10,fh,0Q313596790DJOINTIME,fh,Date,fh,进本单位时间,fh,是,fh,无,fh,32,fh,0Q313596790POST,fh,String,fh,现岗位,fh,是,fh,无,fh,30,fh,0Q313596790POJOINTIME,fh,Date,fh,上岗时间,fh,是,fh,无,fh,32,fh,0Q313596790EDUCATION,fh,String,fh,学历,fh,是,fh,无,fh,10,fh,0Q313596790SCHOOL,fh,String,fh,毕业学校,fh,是,fh,无,fh,30,fh,0Q313596790MAJOR,fh,String,fh,专业,fh,是,fh,无,fh,30,fh,0Q313596790FTITLE,fh,String,fh,职称,fh,是,fh,无,fh,30,fh,0Q313596790CERTIFICATE,fh,String,fh,职业资格证,fh,是,fh,无,fh,30,fh,0Q313596790CONTRACTLENGTH,fh,Integer,fh,劳动合同时长,fh,是,fh,无,fh,2,fh,0Q313596790CSTARTTIME,fh,Date,fh,签订日期,fh,是,fh,无,fh,32,fh,0Q313596790CENDTIME,fh,Date,fh,终止日期,fh,是,fh,无,fh,32,fh,0Q313596790ADDRESS,fh,String,fh,现住址,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,绑定账号ID,fh,否,fh,无,fh,100,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-23 20:44:31', '员工管理', 'single');
INSERT INTO `sys_createcode` VALUES ('ae92803163ff44539e91711cfbe35411', 'fhoa', 'Datajur', 'OA_,fh,DATAJUR', 'DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,是,fh,无,fh,100,fh,0Q313596790', '2016-04-27 03:49:39', '数据权限表', 'single');
INSERT INTO `sys_createcode` VALUES ('bf35ab8b2d064bf7928a04bba5e5a6dd', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-03-27 21:39:45', '站内信', 'single');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构', 'tree');
INSERT INTO `sys_createcode` VALUES ('c937e21208914e5b8fb1202c685bbf2f', 'fhdb', 'Fhdb', 'DB_,fh,FHDB', 'USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790', '2016-03-30 13:46:54', '数据库管理', 'single');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理', 'single');
INSERT INTO `sys_createcode` VALUES ('ff6e6cdc87ba42579b033cf4925d4d70', 'dst', 'DataSource2', 'DS_,fh,DATASOURCE2', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-23 15:51:46', '第2数据源例子', 'single');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `DICTIONARIES_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('0193ffbfae1e49e0b7810546cada316a', '济南', 'JiNan', '0030301', 1, '10f46a521ea0471f8d71ee75ac3b5f3a', '济南', '');
INSERT INTO `sys_dictionaries` VALUES ('080cc89c556945b980df8b5109d42016', '组织机构类型', 'departmentType', 'DT001', 4, '0', '', '');
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', 1, 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', '');
INSERT INTO `sys_dictionaries` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'ShanDong', '00303', 3, 'be4a8c5182c744d28282a5345783a77f', '山东省', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', 1, 'be4a8c5182c744d28282a5345783a77f', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('36a982c3f2364a37b60e7acec73a18aa', '部门', 'department', 'DT001002', 2, '080cc89c556945b980df8b5109d42016', '', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', 1, '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', '');
INSERT INTO `sys_dictionaries` VALUES ('66f1ff79b13947da98525aff7380ef50', '高新区', 'gaoxinqu', '003030101', 1, '0193ffbfae1e49e0b7810546cada316a', '高新区', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', 1, 'fce20eb06d7b4b4d8f200eda623f725c', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', 1, '0', '分类', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', 3, '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('cf92011ee17b4f1ca0c6653da7a66d48', '公司', 'company', 'DT001001', 1, '080cc89c556945b980df8b5109d42016', '', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', 1, '8ea7c44af25f48b993a14f791c8d689f', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', 2, '8ea7c44af25f48b993a14f791c8d689f', '绿色', '');
INSERT INTO `sys_dictionaries` VALUES ('e7e1442cab2f4064bb5060804c5dd6be', '职位', 'post', 'DT001003', 3, '080cc89c556945b980df8b5109d42016', '', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', 2, 'be4a8c5182c744d28282a5345783a77f', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', 2, '0', '课程', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton`  (
  `FHBUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `sys_fhbutton` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog`  (
  `FHLOG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('006bfaa5bfed44999ad36cef6f1d300e', 'admin', '2019-05-31 14:27:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('03d83aa0949f47d9bed93880d3bd26bd', 'admin', '2019-05-30 21:34:26', '新增系统用户：000000');
INSERT INTO `sys_fhlog` VALUES ('051d5b692b62425e9612ab41fa22c6d4', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0661dd3d827f446d9335909cc82e2354', 'admin', '2019-05-30 14:58:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0769223aab134ef1ba412097c1d1cf0b', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('09129fb946874b998dcf6e9f78ddd2ee', 'admin', '2019-05-30 16:37:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0c50b9ba6f994c3abb10827e91323a89', 'admin', '2019-06-03 10:34:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('0c6a5a566de54cf6affa5a14df8ad904', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0cd2ded4626445b7892874f4f7d5db67', 'admin', '2019-05-30 17:55:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e16ff72f3414b25a010c5c0fd4ce3a6', 'admin', '2019-06-03 09:37:19', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('0e80b9ba63cd4c93a85fb0696795dbf7', 'admin', '2019-05-30 14:38:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1140df9b42ac45e59dd2f4e7b894e38c', 'admin', '2019-05-31 10:22:59', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('116c673d12be446d99136b30e003b685', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1261856d234e406eb63f8978852a50fd', 'san', '2016-06-06 03:09:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1455c03e9ba5455cb3cedc05aa0d12cc', 'admin', '2019-06-03 11:07:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('15c0e54bbe0f4e42a9a71648ce29fc78', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('15f1b7e8f5e744ceb0625f4c9ae5ea63', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('18f6eb11bf18434186b2e68b03329837', 'admin', '2019-06-03 09:37:56', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('19bbeddaae88461eaeda1f38bd37d1bb', 'admin', '2019-05-30 15:42:00', '修改角色菜单权限，角色ID为:3e98d146b7cc43e9952da535e0d5f6ae');
INSERT INTO `sys_fhlog` VALUES ('19d1e37ec415444394866c91d732436c', 'admin', '2019-06-02 23:13:54', '修改系统用户：2');
INSERT INTO `sys_fhlog` VALUES ('1ae9d7ca051a4db69ff59e6e77e4920a', 'admin', '2019-06-01 22:06:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c169635d5614936aebcc640cce91792', 'admin', '2019-06-03 09:11:27', '修改系统用户：2');
INSERT INTO `sys_fhlog` VALUES ('1cab3e56296641f1a995d3550208b22a', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1d5a02ec9a5a473da5d5798e821e900a', 'admin', '2019-05-30 20:14:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1d6ed3a33906457d9f189af8534acc95', 'admin', '2019-05-30 21:05:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1e687605666743268e840f114cd2a9cf', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2020bb022c5a4cc8a920c1cc1dd3a048', 'admin', '2019-06-01 21:49:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('21822a5a47964040a2c99b608f4476e5', 'admin', '2019-06-03 10:23:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('25740a9ff11f4386a7c1ca259ab1a2b7', 'admin', '2019-06-03 10:57:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27a58cd5ca7a4442a4b363927d4f4022', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('28fe13351725497883458aeee89f6bd8', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('295ba785385846af89c7d39bfb9ce254', 'admin', '2019-05-31 10:11:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('299a4677d9d844e1b4214a0c90bfa5ca', 'admin', '2019-05-31 10:12:03', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('2abc1752446146cebe885f513082e8ee', 'admin', '2019-05-30 15:41:26', '新增角色:通讯录用户');
INSERT INTO `sys_fhlog` VALUES ('2ad8c39dd09b4834950a796adcd55996', 'admin', '2019-06-03 09:42:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2c172118e10549408b5a008b01e146cf', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2c887d8f077e4447847d7933703a4cde', 'admin', '2019-05-31 11:26:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2d93b234047e4590aa411f5ed0021343', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2da1129080ba44d9aa05c4d0fe4123a1', 'admin', '2019-06-02 00:03:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2eba7f7c857d440b99744151e7525477', 'admin', '2019-05-31 16:17:49', '修改系统用户：88888');
INSERT INTO `sys_fhlog` VALUES ('3019c2e8c11f428e89b2635bdddd8fd4', '好的', '2019-05-30 15:16:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3320e4b3e413440e8d921e6dcdb265d0', 'admin', '2019-06-03 09:10:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35e037867cbe498b9ebe7a3e44db6c48', 'admin', '2019-05-31 10:17:31', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('38036952fa594826ad9f8e12ec254944', 'admin', '2019-06-02 23:13:07', '修改系统用户：2');
INSERT INTO `sys_fhlog` VALUES ('383e296feee6467ba4127998496c13d7', 'admin', '2019-05-30 15:42:38', '修改del_qx权限，角色ID为:3e98d146b7cc43e9952da535e0d5f6ae');
INSERT INTO `sys_fhlog` VALUES ('38526f521ffd45e9a73e43fa15a4aff4', 'admin', '2019-05-31 15:30:39', '修改系统用户：999990');
INSERT INTO `sys_fhlog` VALUES ('3901206829644b388a9c66cb6b93cd45', 'admin', '2019-05-31 09:44:51', '新增系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('390fe5ee7dff4b3dadd3a7fb5d3f1e0c', 'admin', '2019-05-31 10:19:00', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('391fd419747d4a6aa88ebe05a2582e34', '2', '2019-06-03 10:35:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3a1e57b619f44b7e9a1e70e7e45c37b2', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b96867e436b4bc097a5222d30a09bc0', 'admin', '2019-05-30 21:00:56', '新增系统用户：66666');
INSERT INTO `sys_fhlog` VALUES ('3e6f794115e24673ac458da811a0c318', 'admin', '2019-06-03 09:36:49', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('400c75eb671145fd8f76aa221e596021', 'admin', '2019-06-03 09:24:21', '新增系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('40b913a8f76247aaa27ee36b8a99ac80', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('421711689e9141898be894e51d882d2b', 'admin', '2019-06-03 10:58:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4321ec134e114f5aa2768aa3fcd18e48', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('448c78c42d5047bba81695aa6a5ebb5d', 'admin', '2019-05-30 16:41:10', '新增系统用户：test');
INSERT INTO `sys_fhlog` VALUES ('4497884b642d43239e0dfa266d0c4c6d', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('483b97744c844d9da7ac92191f92c8fc', 'admin', '2019-06-03 11:07:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('492a3550fb7e47939dd6d4f10144591f', 'admin', '2019-05-30 17:42:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49d8e0117351446689b5209281345a7f', 'admin', '2019-05-31 11:15:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49f6af66ea0d411b936b0e8308d23938', 'admin', '2019-05-31 10:16:08', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('4a529ec6af624b4a8b781fef89dcb15f', 'admin', '2019-05-31 12:11:12', '新增系统用户：999990');
INSERT INTO `sys_fhlog` VALUES ('4b4685f781a3480fbf2a9316275682a9', 'admin', '2019-05-31 09:47:44', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('4d4bc4984e154a8badaa3c3ed3dfce75', 'admin', '2019-06-03 09:23:19', '修改系统用户：2');
INSERT INTO `sys_fhlog` VALUES ('4dad36aacf784338b1972cfca4dad820', '2', '2019-06-03 16:51:17', '退出');
INSERT INTO `sys_fhlog` VALUES ('4e1ab05690624007a8a104cef23fdaba', 'admin', '2019-06-03 09:36:34', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('4e585fde0bd84ea6becd6ab8e257b001', 'admin', '2019-05-31 09:39:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4efc790fe4d448a3b53ddfc2adaa461b', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('51120d7ee8cc484b89f4b975b3073e40', 'admin', '2019-05-31 13:49:29', '修改系统用户：999990');
INSERT INTO `sys_fhlog` VALUES ('51abb59e1c3d41a082fa51f59ba618cd', 'admin', '2019-05-30 10:36:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5208c2187ac34cbe91543137cf72decd', 'admin', '2019-05-30 18:48:20', '新增系统用户：777');
INSERT INTO `sys_fhlog` VALUES ('5480c60683584990b6fdf039ab2b5687', 'admin', '2019-05-30 17:16:49', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('54adfa18e92f4d97af60fd70750d505d', '2', '2019-06-03 11:00:16', '退出');
INSERT INTO `sys_fhlog` VALUES ('54cf61160eb24c08b163e13f249df850', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('55b227a0f3994b72910a61c3dd903716', 'admin', '2019-05-31 16:17:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('562466be7dab4964ab1642158af4faa0', 'admin', '2019-06-03 09:25:04', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('56afd2893d10470b8f7f88cd035a0b09', 'admin', '2019-06-03 10:35:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('5823c50f271b4f2d86d7b31f5e0deeb4', 'admin', '2019-05-31 15:30:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5abe71e5a3284ed69b03a032788eb180', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5b14cf2e56b44683aa2ac1fd847f2f58', 'admin', '2019-05-30 17:16:12', '新增菜单部门职位关系');
INSERT INTO `sys_fhlog` VALUES ('5bd1b23cdb434bf09b43cc888e9038b6', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c341e2f8a8c43f899e1a7b072f2cb33', 'admin', '2019-05-30 20:32:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5db0e35e64654c2891ec86514e2fbe7f', 'san', '2016-06-06 02:28:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5eb260a80a514cfa8be7da339052dbb9', 'admin', '2019-06-03 10:43:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5f2e2624c1ca4471af0d22bc1c58d278', 'admin', '2019-05-30 17:16:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('614f7a2a673f45b2a351e7967e0acc85', 'admin', '2019-06-03 10:52:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63b8686d83e441d8849978ad4145649a', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('65448c8c78754fb6b1935c6bf957b023', 'admin', '2019-06-03 11:06:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('65c37959598b40f48744d696da22a78b', 'admin', '2019-06-02 23:12:39', '新增系统用户：2');
INSERT INTO `sys_fhlog` VALUES ('6767519001b94b6dad57a6ef9c0f1ea0', 'admin', '2019-05-31 10:27:37', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('69874d5a6b1249c584c13b2e1712ac20', 'admin', '2019-05-31 11:58:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6cfc9936d3c64792a23fd0e6876a3dd0', 'admin', '2019-05-30 17:38:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6d4d02c99d6b4baa9eee758949feab23', 'admin', '2019-05-30 21:07:11', '修改系统用户：66666');
INSERT INTO `sys_fhlog` VALUES ('6da5f54de8cb4d0f9138ace9c9241223', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6da7f1975ab449d0a2a4e26103b42c8b', 'admin', '2019-05-30 17:16:36', '新增菜单职位用户关系');
INSERT INTO `sys_fhlog` VALUES ('6e73342f266446d4925c26ac08a05f60', 'admin', '2019-05-30 11:44:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f466fa02560469f9670115b343db6a9', 'admin', '2019-06-03 09:22:14', '修改系统用户：2');
INSERT INTO `sys_fhlog` VALUES ('70f1e02744f24ce38d6d07eb9eaa8e88', 'admin', '2019-05-31 10:30:07', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('725c3af37ae84396b334cd81baeb3460', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('726fe3a108574a579046f7413c6a2738', 'admin', '2019-05-30 14:54:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72e8e230d4e14beebd10d3ab0429c081', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('756d4e4d4d7a44f5bc6f2601efd1131c', 'admin', '2019-05-31 11:24:10', '新增系统用户：77777');
INSERT INTO `sys_fhlog` VALUES ('772a0d56497c4af48a3d3206ce536dcb', 'admin', '2019-06-03 10:34:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a00db4b1fa641fca5ce1b34a1a4641c', 'admin', '2019-06-03 11:12:54', '退出');
INSERT INTO `sys_fhlog` VALUES ('7ae9b7016d4d48d3afecf0cf6b785034', 'admin', '2019-06-03 10:15:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7bddd9ff4c1541fb80b017f1c006bb86', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7bf680411f35448cbfcb50735eda7915', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7c59b52b7b0748dbb991dbc17c4470e7', 'admin', '2019-06-03 11:05:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7c844d6315a24e6fa53ba60f8389fee5', 'admin', '2019-05-31 11:32:44', '新增系统用户：88888');
INSERT INTO `sys_fhlog` VALUES ('7d6b705660764160a48f5d68eeb911fc', 'admin', '2019-06-03 15:50:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d93c110f3564aab8356fd1cf0db7463', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7e909616f40f4f47bdb1b1f4a52a727e', 'admin', '2019-06-01 23:09:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8038bd42133a465b9cef59d0debe2253', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('82465e304d2b409a9cac98cfd4df0337', 'admin', '2019-06-02 21:29:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('840b6472021f4032a1896a073769e317', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('847eeae80f7349ee9420617746aa5f40', 'admin', '2019-06-03 09:20:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('849fb1d3f2f540c3aa55a83af7eba101', 'admin', '2019-05-30 15:42:28', '修改add_qx权限，角色ID为:3e98d146b7cc43e9952da535e0d5f6ae');
INSERT INTO `sys_fhlog` VALUES ('852a8f7b0e3247a3ba8d41edb72a9d28', 'admin', '2016-06-06 02:28:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('87c7f863a2e64c98a314d7f3c584f3ac', 'admin', '2016-06-06 02:27:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('893982216eef4ab69ae3dd76722be792', 'admin', '2019-06-03 11:12:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('902f505b6e4c470da2e4e95b0b1da35c', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9030819487b74bc7be0168443acac341', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('905cadd055b847cb9dce295861a1dbf2', 'san', '2016-06-06 02:29:18', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('92e917ad7c9d4e3ca1e96ee7b93af9ac', 'admin', '2019-05-31 15:43:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9340dd3818da4c16a14470f3e1e548f3', 'admin', '2019-06-03 10:59:58', '退出');
INSERT INTO `sys_fhlog` VALUES ('98badcd0169f454b8dbd683fcbdf3606', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ad2c8a1667d45bb9aa7be7d178114eb', 'admin', '2019-05-30 20:52:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9d89acaae02f43808e4fe0550d2a4991', 'admin', '2019-06-03 09:42:16', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('9e7c77cc920443898386222b48436f82', 'admin', '2019-06-03 11:12:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('a1872f7c2da6482781cf8660ca292d58', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a214fef08a5347e39908b1b194f65a76', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a2ccdc29d3a44337a81f8dd4211b400f', 'admin', '2019-05-30 15:16:37', '退出');
INSERT INTO `sys_fhlog` VALUES ('a2da11db309c413bb88c1e31dd4bf9f4', 'admin', '2019-05-30 16:57:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2f3cdd3d5ed4362b7ab34b2c2632c03', 'admin', '2019-05-30 21:23:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a5c5244cb4a747c6b453fd07e0ca89aa', 'admin', '2019-06-02 00:07:15', '新增系统用户：1');
INSERT INTO `sys_fhlog` VALUES ('a6596cb67fe84eab90d84b47df9072b7', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a7fe106af14e4616aa024f0456ca8fb3', 'admin', '2019-05-30 21:31:44', '修改系统用户：111111');
INSERT INTO `sys_fhlog` VALUES ('a83b144700964903b08087c9c21cd5e6', 'admin', '2019-06-02 22:00:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9291fec3c52400bb7d48e4374645b05', 'admin', '2019-05-30 20:59:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9b2c34599fb458289bbb1bbbdc1cdfe', 'admin', '2019-05-31 11:23:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9b50b1a21b740d39b3f797f9951a8e5', 'admin', '2019-05-31 13:47:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ace3375c75354519bd3c7d8be629db90', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad0af32f66fb4c0d8654c473bb91bb38', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad1dc60ba6f84c9db9f2c757fb42b3d0', 'admin', '2019-06-03 11:02:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('af40e05a50124d9dbb3f31c5a54322d5', 'admin', '2019-06-01 15:48:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af4aee65e0f14c869db350c4bd4c1bf7', 'admin', '2016-06-06 00:15:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('b2017fe4da7c42fdad232be368c9f45e', 'admin', '2019-05-30 20:26:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b25773c7ba8945819b6898e1f33ae3ca', 'admin', '2019-05-30 21:31:33', '修改系统用户：111111');
INSERT INTO `sys_fhlog` VALUES ('b32af29ddd544b56b74ebd2f4ee7302a', '2', '2019-06-03 11:00:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b3826f11ef824c6faedbfb5f24d500a1', 'admin', '2019-05-31 10:27:19', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('b41d57c5162646f1a5ee0b6a9c42c398', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b4c81c682cee4495b18435e6a6ea5f86', 'admin', '2019-05-30 18:45:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b657d2fb75c942ed8bd39d0838274c21', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b818da977e994033a855df192710c2c4', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b8a7b6555ecc4f15a8ba72d401e807f3', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ba1c4f8d70d94e6cbcdb6141c2f2dd8b', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bbc0b8969ec8432cbb19312acc46fb53', 'admin', '2019-05-30 21:19:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbfeefebb4d943eb86abf52c3befe48d', 'admin', '2019-05-31 10:28:53', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('bc3fc049dbe24b32b2e966cf9f15499f', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc9e64b265e84f7682a79ef7cc5b73f9', 'admin', '2019-06-02 11:32:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bcada75a4f834461909e202ead11c561', '2', '2019-06-03 11:22:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bcfe6d294bd64ce3b3dd520ccee95c45', 'admin', '2019-06-03 09:36:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('be23a343daf8484ba8a9a9feeb490a38', 'admin', '2019-06-03 10:57:32', '退出');
INSERT INTO `sys_fhlog` VALUES ('be7942d96a2441e28860270794d28290', 'admin', '2019-06-03 11:13:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c00a3d55c39a45d78fb1a4ad6ff60a7d', 'admin', '2019-05-30 09:34:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c24f88af7638476e84481e65ffb3b7d3', 'san', '2016-06-06 02:29:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2bfdafa395e492f86f1b826d177ca3c', 'admin', '2019-05-30 15:17:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c304d4f9e3e048c1910450db3e42c574', 'admin', '2019-05-31 11:51:19', '修改系统用户：88888');
INSERT INTO `sys_fhlog` VALUES ('c3337ca88ef84feb98e67881de558edf', 'admin', '2019-05-30 14:42:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c38ff710da5a4da18663c7b3b4aaa505', 'admin', '2019-05-30 12:42:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c63a775051e64973b14124358cc2b2d7', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c7dbc61891bc45189261dbbcd51eeefe', 'admin', '2019-05-30 16:37:04', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c9559da191c5498dbe5bb9e79ac08ae2', 'admin', '2019-06-03 11:00:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cb711c7dfe604369a6fad7b2280e4179', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc660efc9af24844a21a9e1c21156d92', 'admin', '2019-06-01 15:48:46', '修改系统用户：999990');
INSERT INTO `sys_fhlog` VALUES ('ccc8989521a94103bde7047890ab6000', 'admin', '2019-05-30 21:22:07', '修改系统用户：66666');
INSERT INTO `sys_fhlog` VALUES ('cd7bce0bb0774fe3a620523fc1138893', 'admin', '2019-05-30 17:16:50', '退出');
INSERT INTO `sys_fhlog` VALUES ('cddb438a13cd4b40ab2c9799c0e1e595', 'admin', '2019-05-30 15:57:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ced22dfb2d404f4fb76800b8c5add56f', 'admin', '2019-05-31 11:01:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cf87495c751740ccaec950ae3883f2e8', 'admin', '2019-06-02 23:15:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('d03e516e54894ca8afa1a8a320a1eda2', 'admin', '2019-05-31 10:26:55', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('d2cf39cc48a44a4eb04c62bf37bd369d', 'admin', '2019-05-30 17:15:41', '新增菜单公司部门关系');
INSERT INTO `sys_fhlog` VALUES ('d2ec0d16a2c842b6ba6e05507beae56e', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d497bea832ce429abc9fbb2906f67189', 'admin', '2019-05-30 14:45:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d52d1d0a08f84e00a6faef480fa1f8d6', 'admin', '2019-05-31 10:25:59', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('d692fe35a64149238e6f2f8a3a861dbf', 'admin', '2019-05-30 13:37:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d6a24742bf654cf58a88257b233cefd2', 'admin', '2019-05-31 11:18:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d791ab3ce6884d5098518254d842990d', 'admin', '2019-05-31 10:29:52', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('d8a77c187321481da27bde2d414172b0', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d9165a93bf3b463e97125928b3bf9447', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('da9bd250d0f24ca68ec96bb925256eae', 'admin', '2019-06-03 09:42:19', '修改系统用户：qibatu');
INSERT INTO `sys_fhlog` VALUES ('dc51375c103b4636bdf7f74ca95f5e81', 'admin', '2019-05-31 10:23:54', '修改系统用户：0000000');
INSERT INTO `sys_fhlog` VALUES ('dd335e7f14b84b60ab42084f18dc5957', 'admin', '2019-06-03 11:22:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('dd5164aa062143e7a3542cd3b5b92e9e', 'admin', '2019-05-31 12:10:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('de9a62a2a3544aadbf63845bd6a1f6e1', 'admin', '2019-05-30 15:42:46', '修改edit_qx权限，角色ID为:3e98d146b7cc43e9952da535e0d5f6ae');
INSERT INTO `sys_fhlog` VALUES ('e178e5ca9246466199167142f570f07b', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e20b86d1d25c4eb0b8005be9ba114485', 'admin', '2019-05-30 18:52:55', '新增系统用户：99999');
INSERT INTO `sys_fhlog` VALUES ('e24e2fe2ca244a1b9073c22851b60f39', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e3a0b604d9cd4e86980fe876beba84f9', 'admin', '2019-05-31 14:01:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('e4dc4622f0fb4987866517642c67369d', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e50baa32fc724626afb102936bedbd77', 'admin', '2019-05-30 17:16:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e65d28aa151945d0a91db75583d4a190', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e6c62cd3103d4475af6056197dec16b4', 'admin', '2019-05-31 10:02:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7335e1f8fa245a68c1ef197b18acd75', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e7bf3ac392954e509e4c0341f4869a95', 'san', '2016-06-06 02:29:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('e959bb233f294ed1a6ba40327f094614', 'admin', '2019-06-01 21:52:46', '新增系统用户：666666');
INSERT INTO `sys_fhlog` VALUES ('ec66b8dd947f4a868e6122c000399cdb', 'admin', '2019-05-30 15:02:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('efca491ad2b441f5926b4230693184e3', 'admin', '2019-05-31 09:55:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f03b81ee89884715957153324f0c4f5b', '2', '2019-06-03 16:35:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1e5a135fb574af7a8787b16108d9da4', 'admin', '2019-05-30 17:16:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f343ecbe7e6248f688637a68542ba478', 'admin', '2019-05-30 21:25:58', '修改系统用户：111111');
INSERT INTO `sys_fhlog` VALUES ('f3c3fe4e9e354699a6e5450b8c8f5976', 'admin', '2019-05-30 17:14:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f3dd42bfc1014e3dacacbcb128e72b34', 'admin', '2019-05-31 11:06:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f46437f2f95a44499cec9411c4cda857', 'admin', '2019-05-31 14:02:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f53ddce891d04fbd962087eaa37f697c', '好的', '2019-05-30 15:16:52', '退出');
INSERT INTO `sys_fhlog` VALUES ('f54befb873ba4078b3314b9f30610544', 'admin', '2019-06-03 11:07:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f5a0d2fe833b445191c9c49853976b26', 'admin', '2019-05-30 17:15:41', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f644c21367f94086ace9b2da89508988', 'admin', '2019-05-30 15:16:32', '新增系统用户：好的');
INSERT INTO `sys_fhlog` VALUES ('f6b4c8e4d7724fa592db0b9b9df26e3a', 'admin', '2019-05-30 17:40:15', '新增系统用户：haode');
INSERT INTO `sys_fhlog` VALUES ('f8454892a3f54164b900e754029ed29f', 'admin', '2019-06-03 10:02:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f915df987ee54d5eadaa25c9a5b3a663', 'admin', '2019-06-03 10:58:06', '退出');
INSERT INTO `sys_fhlog` VALUES ('fa72f812740a47289123500cc1a1ab77', 'admin', '2019-05-30 15:42:52', '修改cha_qx权限，角色ID为:3e98d146b7cc43e9952da535e0d5f6ae');
INSERT INTO `sys_fhlog` VALUES ('fb248acf7dee4882ae1cc4e581269d4d', 'admin', '2019-05-31 14:27:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe00727a7383466fa007a33797c64dec', 'admin', '2019-05-30 21:24:19', '新增系统用户：111111');
INSERT INTO `sys_fhlog` VALUES ('fec4886f1971446aa28517109818251b', 'admin', '2019-05-30 17:16:36', '新增菜单null');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms`  (
  `FHSMS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg`  (
  `LOGINIMG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ORDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ICON` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_STATE` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', 1);
INSERT INTO `sys_menu` VALUES (2, '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', 1);
INSERT INTO `sys_menu` VALUES (3, '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', 1);
INSERT INTO `sys_menu` VALUES (4, '文件管理', 'fhfile/list.do', '59', '3', 'menu-icon fa fa-folder-open purple', '1', 1);
INSERT INTO `sys_menu` VALUES (6, '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', 1);
INSERT INTO `sys_menu` VALUES (7, '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', 1);
INSERT INTO `sys_menu` VALUES (8, '性能监控', 'druid/index.html', '9', '8', 'menu-icon fa fa-tachometer red', '1', 1);
INSERT INTO `sys_menu` VALUES (9, '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', 1);
INSERT INTO `sys_menu` VALUES (10, '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', 1);
INSERT INTO `sys_menu` VALUES (11, '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (12, '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', 1);
INSERT INTO `sys_menu` VALUES (14, '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', 1);
INSERT INTO `sys_menu` VALUES (15, '微信管理', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', 1);
INSERT INTO `sys_menu` VALUES (16, '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', 1);
INSERT INTO `sys_menu` VALUES (17, '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', 1);
INSERT INTO `sys_menu` VALUES (18, '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', 1);
INSERT INTO `sys_menu` VALUES (19, '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', 1);
INSERT INTO `sys_menu` VALUES (20, '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', 1);
INSERT INTO `sys_menu` VALUES (21, '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', 1);
INSERT INTO `sys_menu` VALUES (22, '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', 1);
INSERT INTO `sys_menu` VALUES (23, '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (24, '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (30, '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (31, '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (32, '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (33, '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (34, '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (35, '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (36, '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', 1);
INSERT INTO `sys_menu` VALUES (37, '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', 1);
INSERT INTO `sys_menu` VALUES (38, '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', 1);
INSERT INTO `sys_menu` VALUES (39, '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', 1);
INSERT INTO `sys_menu` VALUES (40, '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', 1);
INSERT INTO `sys_menu` VALUES (41, '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', 1);
INSERT INTO `sys_menu` VALUES (42, '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', 1);
INSERT INTO `sys_menu` VALUES (43, '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', 1);
INSERT INTO `sys_menu` VALUES (44, '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', 1);
INSERT INTO `sys_menu` VALUES (45, '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (46, '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (47, '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (48, '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', 1);
INSERT INTO `sys_menu` VALUES (50, '站内信', 'fhsms/list.do', '6', '3', 'menu-icon fa fa-envelope green', '1', 1);
INSERT INTO `sys_menu` VALUES (51, '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (52, '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', 1);
INSERT INTO `sys_menu` VALUES (53, '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (54, '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', 1);
INSERT INTO `sys_menu` VALUES (55, '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', 1);
INSERT INTO `sys_menu` VALUES (56, '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', 1);
INSERT INTO `sys_menu` VALUES (57, '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', 1);
INSERT INTO `sys_menu` VALUES (58, 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', 1);
INSERT INTO `sys_menu` VALUES (59, 'OA办公', '#', '0', '6', 'menu-icon fa fa-laptop pink', '2', 1);
INSERT INTO `sys_menu` VALUES (60, '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '59', '1', 'menu-icon fa fa-users green', '1', 1);
INSERT INTO `sys_menu` VALUES (61, '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', 1);
INSERT INTO `sys_menu` VALUES (62, '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', 1);
INSERT INTO `sys_menu` VALUES (63, '主附结构', 'attached/list.do', '6', '2', 'menu-icon fa fa-folder-open blue', '1', 1);
INSERT INTO `sys_menu` VALUES (64, '员工管理', 'staff/list.do', '59', '2', 'menu-icon fa fa-users blue', '1', 1);
INSERT INTO `sys_menu` VALUES (65, '多数据源', 'datasource2/list.do', '6', '4', 'menu-icon fa fa-folder-open-o purple', '1', 0);
INSERT INTO `sys_menu` VALUES (66, '下拉联动', 'linkage/view.do', '6', '5', 'menu-icon fa fa-exchange green', '1', 1);
INSERT INTO `sys_menu` VALUES (67, '公司部门关系', 'companydepartment/list.do', '59', '4', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (68, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (69, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (70, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (71, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (72, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (82, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (84, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (85, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (86, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (87, '部门职位关系', 'departmentpost/list.do', '59', '5', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (88, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (89, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (90, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (93, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (94, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (95, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (96, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (97, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (98, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (99, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (100, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (101, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (102, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (103, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (105, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (106, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, '职位用户关系', 'postuser/list.do', '59', '6', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (108, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (111, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (112, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (113, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (114, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (115, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (116, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (117, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (118, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (119, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (120, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (121, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (122, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (123, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (124, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (125, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
INSERT INTO `sys_menu` VALUES (126, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEL_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EDIT_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CHA_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '162259431572013421406340731887582', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '会员组', '', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3', '注册用户', '', '1', '', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '147573389638682795998', '1', '36892925196425486294', '36892925196425486294', '36892925196425486294', '36892925196425486294');
INSERT INTO `sys_role` VALUES ('3e98d146b7cc43e9952da535e0d5f6ae', '通讯录用户', '1729385555445153792', '1', '1729385555445153792', '1729385555445153792', '1729385555445153792', '1729385555445153792');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '73786413343844589510', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '73786413343844589510', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton`  (
  `RB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RB_ID`) USING BTREE,
  INDEX `角色表外键`(`ROLE_ID`) USING BTREE,
  INDEX `fbutton`(`BUTTON_ID`) USING BTREE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('469ffb4848ad49c389867d99560a4698', 'de9de2f006e145a29d52dfadda295353', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('4ee1e2bc03a64ef1bc578fcf2e2ea2c1', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('5669c8754b4d4e368365ed5065f9fc10', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('6cc655a1f9b746eea6af9df540f8e743', '3', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('74203935bfa34ce3b9b80e81f2a2bcfe', '68f8e4a39efe47c7bb869e9d15ab925d', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('81d31bc5bf02490a85ce496b6755ef26', '3', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('88f66a65ee1642bea7979e0e1050ac5f', '3', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('8e478e8615ee455e95671ba05a29e457', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('91958c938bfe4a5fb7b18c7c6a871848', '3264c8e83d0248bb9e3ea6195b4c0216', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('9c30cc6b58da480b83c8566f83f9f639', '3', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('a45f54074f634b698038455f204faf26', 'de9de2f006e145a29d52dfadda295353', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('cebf4460cdb64161aa158baae84962fa', 'de9de2f006e145a29d52dfadda295353', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('d51dc41918b040a78a021c9a43caf8d5', '68f8e4a39efe47c7bb869e9d15ab925d', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('d80abc961d594f75b65e90d5b7437aa9', '3', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f919c1f620634bdaa353a9f63194a2e0', '3', '3542adfbda73410c976e185ffe50ad06');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SKIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `FAX` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `SEX` int(1) NULL DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生年月',
  `ID_CARD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `HEAD_PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实头像',
  `JOB_STATE` int(1) NULL DEFAULT NULL COMMENT '在职状态，0，为不在职，1，为在职',
  `TEL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `WEIXIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现住址',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `POST_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位id',
  `COMPANY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `USERID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `IS_VALUE` int(1) NULL DEFAULT NULL COMMENT '是否删除，0为未删除，1为删除',
  `PINYIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音模糊搜索'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'FH', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2019-06-03 15:50:42', '127.0.0.1', '0', 'admin', 'default', 'QQ313596790@main.com', '001', '18788888888', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_user` VALUES ('be9a2be62af440f9b72138231615a556', '2', '12c6fc06c99a462375eeb3f43dfd832b08ca9e17', '2', '', '3e98d146b7cc43e9952da535e0d5f6ae', '2019-06-03 16:35:31', '127.0.0.1', '0', '', 'default', '', '2', '', '', '', 0, '2019-06-02', '', '../uploadFiles/userHeadImage/201906/2019060309231843257.png', 1, '', '', '', '8a81f39c560c44a1957a969919b74967', '871586433e87404d83983a14de6aa2d6', '0d868ad699284993abdd11b133f80447', '2019-06-02 23:12:39', '2019-06-03 09:23:18', '1', 0, '2');
INSERT INTO `sys_user` VALUES ('4f7ca2410eb6471e9b5a7c8720f7c697', 'qibatu', 'e3ce9d64428b55626953344e2c46d739095f0b3a', '奇巴图aaas', '', '3e98d146b7cc43e9952da535e0d5f6ae', '2019-06-03 16:38:31', '', '0', '', 'default', '', 'qibatu', '', '', '', 0, '', '', '../uploadFiles/userHeadImage/201906/2019060304373792597.jpg', 1, '', '', '', '1bf10c7e725c4e8e8baf3d4cf3ed416c', 'fb8e2095e2b343da9d010848dca5f567', '0d868ad699284993abdd11b133f80447', '2019-06-03 09:24:21', '2019-06-03 16:37:37', '4f7ca2410eb6471e9b5a7c8720f7c697', 0, 'QBTAAAS');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto`  (
  `USERPHOTO_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_attached
-- ----------------------------
DROP TABLE IF EXISTS `tb_attached`;
CREATE TABLE `tb_attached`  (
  `ATTACHED_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `PRICE` double(11, 2) NULL DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_attached
-- ----------------------------
INSERT INTO `tb_attached` VALUES ('60d05d8e7d9046a4893f8bdaa34d6488', 'eee', 'ee', 22.00, '2016-04-22 15:33:23');
INSERT INTO `tb_attached` VALUES ('d74b6f507e784607b8f85e31e3cfad22', 'AA', 'aaa', 222.00, '2016-04-17 18:20:41');

-- ----------------------------
-- Table structure for tb_attachedmx
-- ----------------------------
DROP TABLE IF EXISTS `tb_attachedmx`;
CREATE TABLE `tb_attachedmx`  (
  `ATTACHEDMX_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11, 2) NULL DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_attachedmx
-- ----------------------------
INSERT INTO `tb_attachedmx` VALUES ('04717d1a034c4e51aacd5e062a4c63bd', 'ddd', 'ddd', '2016-03-29', 111.00, 'd74b6f507e784607b8f85e31e3cfad22');
INSERT INTO `tb_attachedmx` VALUES ('7992c783fd0b476d90be363858a941ba', 'ddd', 'ddsds', '2016-04-06', 222.00, 'd74b6f507e784607b8f85e31e3cfad22');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures`  (
  `PICTURES_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command`  (
  `COMMAND_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', 1, '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', 1, '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', 2, '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', 1, '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', 1, '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg`  (
  `IMGMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', 1, '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg`  (
  `TEXTMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) NULL DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', 1, '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', 1, '关注回复');

SET FOREIGN_KEY_CHECKS = 1;
