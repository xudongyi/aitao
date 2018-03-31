/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1(本地数据库)
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : aitao

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-03-31 08:55:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GOODS_NO` char(32) NOT NULL,
  `GOODS_NAME` varchar(100) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `SORT_NO` varchar(50) DEFAULT NULL,
  `MARKET_PRICE` double DEFAULT NULL,
  `TOTAL_COUNT` int(10) DEFAULT NULL,
  `SALSE_COUNT` int(10) DEFAULT NULL,
  `BRAND` varchar(255) DEFAULT NULL,
  `SHELF_TIME` datetime DEFAULT NULL,
  `GROSS_WEIGHT` int(10) NOT NULL,
  `NET_WEIGHT` int(10) NOT NULL,
  `IMG1` varchar(255) DEFAULT NULL,
  `IMG2` varchar(255) DEFAULT NULL,
  `IMG3` varchar(255) DEFAULT NULL,
  `IMG4` varchar(255) DEFAULT NULL,
  `CREATE_USER` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `VIRTUAL_SALES` int(10) DEFAULT NULL,
  `KEY_WORDS` varchar(255) DEFAULT NULL,
  `ON_SHELVE` int(10) DEFAULT NULL,
  `FINE` int(10) DEFAULT NULL,
  `NEW_GOODS` int(10) DEFAULT NULL,
  `HOT_SALES` int(10) DEFAULT NULL,
  `SELLER_NO` char(32) DEFAULT NULL,
  `GOOD_ORDER` int(10) DEFAULT NULL,
  `SHOP_SORT` varchar(50) DEFAULT NULL,
  `POPULAR_SALES` int(10) NOT NULL,
  `REC_SALES` int(10) NOT NULL,
  PRIMARY KEY (`GOODS_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2fdfb2947eca449492fe32cb86f80a5a', '北欧简约混搭四件套床单款 荷兰小马', '400', 'aebd186246954646a6566c8e6e1c3e73', '0', '100', '0', '品牌1', '2017-05-19 15:46:35', '0', '0', '201705/f2bb844c-2285-40f7-806e-0742a7060218.jpg', null, null, null, null, '2017-05-19 15:46:35', null, '2017-05-19 15:46:35', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('6819ebf84dff440eb80bbe2a0d9ca9ec', '莫代尔大提花蚕丝被100%桑蚕丝', '0', '30eb22238f784db9a0150eec5ffc6bce', '0', '100', '0', '品牌1', '2017-05-19 17:30:07', '0', '0', '201705/5a3ec824-1643-454f-95c1-385a009605c7.jpg', null, null, null, null, '2017-05-19 17:30:07', null, '2017-05-19 17:30:07', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('6905691162b5441b8478ec690ff82f48', '雅居纺 全棉宜家小清新 床单款仙人柱', '105', 'aebd186246954646a6566c8e6e1c3e73', '0', '399', '0', '品牌1', '2017-05-17 15:04:08', '0', '0', '201705/7771c9e5-a4d0-4f3c-97c5-c50c40dce90a.jpg', null, null, null, null, '2017-05-17 15:04:08', null, '2017-05-17 15:04:08', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('69e62fd1cddd4c21a361dab35c95d876', '北欧简约混搭四件套床单款 荷兰小马', '199', 'aebd186246954646a6566c8e6e1c3e73', '400', '100', '0', '品牌1', '2017-05-07 00:00:00', '3', '2', '201705/5d923d86-06a7-4e64-89f3-fc0455cd5eee.jpg', null, null, null, null, '2017-05-07 14:08:06', null, '2017-05-07 15:52:13', '1', '四件套', '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '1', '商城一', '0', '1');
INSERT INTO `goods` VALUES ('82f979372455460dba45ac42ab5edb52', '123', '123', 'aebd186246954646a6566c8e6e1c3e73', '123', '123', '0', '红豆', '2018-03-31 00:00:00', '123', '123', '201803/7feff135-397e-48fd-8422-fdbaa2bc2cbf.png', null, null, null, null, '2018-03-31 00:07:31', null, '2018-03-31 00:07:31', '123', '123', '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '123', '商城一', '0', '0');
INSERT INTO `goods` VALUES ('89a6cb44432f4241b59c34e11abae394', '2017新品 3D透气床垫【厚款】凉席可水洗 ', '100', '95a6aa4b43d749099856a9ae5e5ba769', '299', '100', '0', '品牌1', '2017-05-07 00:00:00', '2', '2', '201705/97680097-a642-4da3-ac95-3001e43b6e20.jpg', null, null, null, null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '0', '普通床垫', '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', '商城一', '0', '0');
INSERT INTO `goods` VALUES ('8dbde8746b2d4f87885ad5b54c3e3138', '静家居 工艺款简约宜家风四件套比水洗棉更舒服的双层纱黑白森林', '170', 'aebd186246954646a6566c8e6e1c3e73', '0', '398', '0', '品牌1', '2017-05-18 13:50:55', '0', '0', '201705/6085f2ca-4259-46d6-9481-b84bfc3f6399.jpg', null, null, null, null, '2017-05-18 13:50:56', null, '2017-05-18 13:50:56', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('981124baea7a4b17b99ba14ac110a036', '莫代尔大提花蚕丝被100%桑蚕丝', '1090', '30eb22238f784db9a0150eec5ffc6bce', '0', '100', '0', '品牌1', '2017-05-19 14:11:35', '0', '0', '201705/ac0abc2c-b139-42a6-8ebc-8be18ea2f65e.jpg', null, null, null, null, '2017-05-19 14:11:35', null, '2017-05-19 14:11:35', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('a784d8aae9c64bd782a252ab86d2823c', '莫代尔大提花蚕丝被100%桑蚕丝', '1090', '30eb22238f784db9a0150eec5ffc6bce', '0', '100', '0', '品牌1', '2017-05-19 14:21:22', '0', '0', '201705/f5e3a9ad-3846-4c98-b720-f9765b302e9e.jpg', null, null, null, null, '2017-05-19 14:21:22', null, '2017-05-19 14:21:22', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('ad7ea1b7a1ea4987812a44982807e7f9', '棉生活 2017新款色拼波点四件套床笠款圆点-黄', '105', 'aebd186246954646a6566c8e6e1c3e73', '0', '399', '0', '品牌1', '2017-05-19 17:26:01', '0', '0', '201705/10522f75-a18a-4d60-86a9-4cea4d234ac1.jpg', null, null, null, null, '2017-05-19 17:26:01', null, '2017-05-19 17:26:01', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('b0eaa34896354ea7aa73b9995d9c0c54', 'eee', '12', 'aebd186246954646a6566c8e6e1c3e73', '12', '24', '0', '红豆', '2017-05-09 00:00:00', '12', '1', '201705/4123bd60-0739-422b-acd1-605b334adadc.jpg', null, null, null, null, '2017-05-13 13:53:56', null, '2017-05-13 14:20:55', '12', 'eee', '0', '0', '0', '0', '04e8c21cbb6449899685c79fa188abd0', '1', '商城一', '0', '0');
INSERT INTO `goods` VALUES ('b5280b15e05a4ab48688b2d44c459e67', '北欧简约混搭四件套床单款 荷兰小马', '400', 'aebd186246954646a6566c8e6e1c3e73', '0', '100', '0', '品牌1', '2017-05-19 15:46:14', '0', '0', '201705/c8862efa-dae1-4d3f-aad4-744cc0a41b8c.jpg', null, null, null, null, '2017-05-19 15:46:14', null, '2017-05-19 15:46:14', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('bb27b338403642ef803c13890f8f63dc', '棉生活 2017新款色拼波点四件套床笠款圆点-黄', '10546', 'aebd186246954646a6566c8e6e1c3e73', '0', '399', '0', '品牌1', '2017-05-19 15:55:05', '0', '0', '201705/17b0c546-dfc6-4d73-b780-08ca32aaf70b.jpg', null, null, null, null, '2017-05-19 15:55:05', null, '2017-05-19 15:55:05', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('cba6a78c36a84acd83694f7d49cdc018', '棉生活 2017新款色拼波点四件套床笠款圆点-黄', '105462', 'aebd186246954646a6566c8e6e1c3e73', '0', '399', '0', '品牌1', '2017-05-19 08:33:46', '0', '0', '201705/f7498cb4-6e47-4633-9189-0eab11f06491.jpg', null, null, null, null, '2017-05-19 08:33:46', null, '2017-05-19 08:33:46', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('d9ff50bdee9840f9afcbfcdbf928b096', '蚕丝被一云上.腾冲 浅金', '150', '30eb22238f784db9a0150eec5ffc6bce', '590', '100', '0', '品牌1', '2017-05-07 00:00:00', '6', '5', '201705/17a2e3bd-97c2-4619-b2ad-3a3520eb1f4b.jpg', null, null, null, null, '2017-05-07 15:17:00', null, '2017-05-07 15:50:03', '0', '蚕丝被', '0', '0', '1', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', '商城一', '0', '0');
INSERT INTO `goods` VALUES ('da138698466645eaad5e882fd8ea40d0', '全棉13372斜纹活性印花四件套雅诺', '299', 'aebd186246954646a6566c8e6e1c3e73', '0', '100', '0', '品牌1', '2017-05-19 14:24:14', '0', '0', '201705/bed3072b-20a8-4e21-9fcb-e6b4b7376f66.jpg', null, null, null, null, '2017-05-19 14:24:14', null, '2017-05-19 14:24:14', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('e9499637c3274180bc9f65672c20b3ef', '免安装方顶蚊帐 清凉一夏', '99', '7c350e7d02544ceda8118b59d43d8083', '160', '100', '0', '品牌1', '2017-05-07 00:00:00', '1', '1', '201705/069c0601-f076-4bfa-b5ef-fd83d38d7fac.jpg', null, null, null, null, '2017-05-07 14:48:09', null, '2017-05-07 15:35:05', '0', '蚊帐', '0', '0', '0', '1', 'd359e8b250dd47cdbe4187e187f07e9b', '0', '商城一', '0', '0');
INSERT INTO `goods` VALUES ('efe9eff2ae714c178eeb42694b9ed8bc', '棉生活 2017新款色拼波点四件套床笠款圆点-黄', '10', 'aebd186246954646a6566c8e6e1c3e73', '0', '399', '0', '品牌1', '2017-05-19 08:40:16', '0', '0', '201705/09f6dd17-028e-4f10-98fb-c54a3318f2d4.jpg', null, null, null, null, '2017-05-19 08:40:17', null, '2017-05-19 08:40:17', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('fb79f650ad3e498fb0000300c7c522cc', '活 2017新款色拼波点四件套床笠款圆点-黄', '0', 'aebd186246954646a6566c8e6e1c3e73', '0', '399', '0', '品牌1', '2017-05-19 14:02:50', '0', '0', '201705/ad12c123-cbbb-45fb-bfc2-05d1f893a74c.jpg', null, null, null, null, '2017-05-19 14:02:50', null, '2017-05-19 14:02:50', '0', null, '0', '0', '0', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', null, '0', '0');
INSERT INTO `goods` VALUES ('fb9043f5abba407f9f8d6811ef6b51a9', '全棉13372斜纹活性印花四件套雅诺', '180', 'aebd186246954646a6566c8e6e1c3e73', '299', '100', '0', '品牌1', '2017-05-07 00:00:00', '3', '2', '201705/6965cf23-8b23-4261-83e5-0b07e92344c0.jpg', null, null, null, null, '2017-05-07 14:29:35', null, '2017-05-07 15:52:22', '0', '四件套', '0', '0', '1', '0', 'd359e8b250dd47cdbe4187e187f07e9b', '0', '商城一', '0', '1');

-- ----------------------------
-- Table structure for goods_attention_log
-- ----------------------------
DROP TABLE IF EXISTS `goods_attention_log`;
CREATE TABLE `goods_attention_log` (
  `ATTENTION_NO` char(32) NOT NULL,
  `USER_ID` char(32) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `ATTENTION_STATUS` int(10) DEFAULT NULL,
  `GOODS_NO` char(32) DEFAULT NULL,
  PRIMARY KEY (`ATTENTION_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_attention_log
-- ----------------------------
INSERT INTO `goods_attention_log` VALUES ('25a8f9f94f6c486895ff697575331fd8', '1153b92cafcf45ccb4011d9c05360e48', '徐冬益', '2017-05-07 14:36:00', '0', '69e62fd1cddd4c21a361dab35c95d876');
INSERT INTO `goods_attention_log` VALUES ('42ec2fc8d2d24909b1bf2fa845e3c6f0', '46b9d83aff9e4376bf20053431465afd', '徐冬益', '2017-05-13 15:12:08', '0', 'fa3e4adfe89047a9b3e49c1a3c3e612f');
INSERT INTO `goods_attention_log` VALUES ('4d7dc5cf2cf24db78431f644ce23abd8', '1153b92cafcf45ccb4011d9c05360e48', '徐冬益', '2017-05-07 14:36:02', '0', 'fb9043f5abba407f9f8d6811ef6b51a9');
INSERT INTO `goods_attention_log` VALUES ('67d2cc5d341e4f5d9815b35be752133a', '81d0c8adf85441d48601f13dd2587d08', 'fff', '2017-05-13 15:15:25', '0', '69e62fd1cddd4c21a361dab35c95d876');
INSERT INTO `goods_attention_log` VALUES ('ac2f0f6924e147fea2e8a870c1553bdb', '1153b92cafcf45ccb4011d9c05360e48', '徐冬益', '2017-05-15 19:44:56', '0', 'b0eaa34896354ea7aa73b9995d9c0c54');
INSERT INTO `goods_attention_log` VALUES ('b4c9a436a00b4f57a9d62cc96eae34d7', '81d0c8adf85441d48601f13dd2587d08', 'fff', '2017-05-13 15:14:59', '0', 'b0eaa34896354ea7aa73b9995d9c0c54');
INSERT INTO `goods_attention_log` VALUES ('f30dfc6bafe94d88bb9948f06b5c727f', '46b9d83aff9e4376bf20053431465afd', '徐冬益', '2017-05-13 15:10:31', '0', 'b0eaa34896354ea7aa73b9995d9c0c54');
INSERT INTO `goods_attention_log` VALUES ('f7137967fd66410086e82a0bed46fb4e', '81d0c8adf85441d48601f13dd2587d08', 'fff', '2017-05-13 15:14:46', '0', 'fa3e4adfe89047a9b3e49c1a3c3e612f');
INSERT INTO `goods_attention_log` VALUES ('fe423bffe0164c5dba169d91e6639bf6', '46b9d83aff9e4376bf20053431465afd', '徐冬益', '2017-05-13 15:11:50', '0', '69e62fd1cddd4c21a361dab35c95d876');

-- ----------------------------
-- Table structure for goods_comment_log
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment_log`;
CREATE TABLE `goods_comment_log` (
  `COMMENT_NO` char(32) NOT NULL,
  `USER_ID` char(32) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `COMMENT_TITLE` varchar(50) DEFAULT NULL,
  `COMMENT_CONTENT` varchar(500) DEFAULT NULL,
  `COMMENT_GRADE` int(10) DEFAULT NULL,
  `GOODS_NO` char(32) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_comment_log
-- ----------------------------
INSERT INTO `goods_comment_log` VALUES ('472662e9418b4ccaa32ab9d213441751', '1153b92cafcf45ccb4011d9c05360e48', 'admin', '2017-05-15 19:45:34', '评价', '非常好', '5', 'b0eaa34896354ea7aa73b9995d9c0c54');
INSERT INTO `goods_comment_log` VALUES ('c1238fc08aea42399306d6afd9f2c258', '1153b92cafcf45ccb4011d9c05360e48', 'admin', '2017-05-07 14:36:39', '评价', '非常好', '3', 'fb9043f5abba407f9f8d6811ef6b51a9');
INSERT INTO `goods_comment_log` VALUES ('d9d9470f30164f8496b63d55a227ad39', '1153b92cafcf45ccb4011d9c05360e48', 'admin', '2017-05-07 14:36:26', '评价', '蛮好的', '5', '69e62fd1cddd4c21a361dab35c95d876');

-- ----------------------------
-- Table structure for goods_file
-- ----------------------------
DROP TABLE IF EXISTS `goods_file`;
CREATE TABLE `goods_file` (
  `FILE_ID` char(32) NOT NULL,
  `GOODS_NO` char(32) DEFAULT NULL,
  `FILE_URL` varchar(255) DEFAULT NULL,
  `CREATE_USER` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `FILE_ORDER` int(10) NOT NULL,
  `FILE_TYPE` varchar(1) NOT NULL,
  PRIMARY KEY (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_file
-- ----------------------------
INSERT INTO `goods_file` VALUES ('0125c499b142409ab58d3dff1f1eaf2d', 'bb27b338403642ef803c13890f8f63dc', '201705/05eafb15-70b5-4d24-a1f8-d4d5fde56dab.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:05', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:05', '0', '1');
INSERT INTO `goods_file` VALUES ('0224b4f6eb4d4ca9b71bd2d01c8bb5ad', 'bb27b338403642ef803c13890f8f63dc', '201705/385ae770-99a3-483f-8d00-4680e850ad05.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', '8', '1');
INSERT INTO `goods_file` VALUES ('0339da55812a40888e996b3ba9412ed2', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/b956764c-74e3-4abb-9b62-ba04f6136200.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '1', '1');
INSERT INTO `goods_file` VALUES ('058aaddfb06444e194b25b052c7de825', '6905691162b5441b8478ec690ff82f48', '201705/d9d572f1-1ad4-439a-aa61-26d0e4bc1221.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:11', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:11', '7', '1');
INSERT INTO `goods_file` VALUES ('08c8343b21374e579543f60f84de5714', 'e9499637c3274180bc9f65672c20b3ef', '201705/6e9581b2-f055-45ab-b558-571540e50972.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '4', '1');
INSERT INTO `goods_file` VALUES ('0964456c3e9d487c9c0831cb8196a5fb', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/7200474b-df26-453d-8354-ddc347b60e06.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '0', '2');
INSERT INTO `goods_file` VALUES ('0a30ac2f62a24fe6ab181c2dd881cf8d', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/e0907511-f5b0-4eb1-b785-6793418766d6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('0d0ef06097364d42bed45c0936729e68', '2fdfb2947eca449492fe32cb86f80a5a', '201705/ec8d519d-d3d5-4cad-8539-5a284819b62f.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', '0', '2');
INSERT INTO `goods_file` VALUES ('0e9208605da64d3ab0a26fbd54eef77c', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/a13799ec-ea73-4eb1-a2b9-66182c3e5bd6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('1135d4de6685404b9d0db1e674e8b228', 'cba6a78c36a84acd83694f7d49cdc018', '201705/5a761072-d3df-4a00-a322-e7da6b839695.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '4', '1');
INSERT INTO `goods_file` VALUES ('11a4baa705ab4a0092ae8b87f70b4395', 'cba6a78c36a84acd83694f7d49cdc018', '201705/d717870c-a357-46cc-84a4-3092559e60cb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '8', '1');
INSERT INTO `goods_file` VALUES ('11a7e993b7bd4dcda391dffd766dba79', 'bb27b338403642ef803c13890f8f63dc', '201705/9144d03a-e787-48c6-98e5-bab156c8ab90.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', '2', '1');
INSERT INTO `goods_file` VALUES ('148f0df6e53b4726a1b12347259ee7a1', '82f979372455460dba45ac42ab5edb52', '201803/b9600ba6-49cb-4ed5-bf92-608ef53539ee.jpg', null, '2018-03-31 00:07:32', null, '2018-03-31 00:07:32', '2', '1');
INSERT INTO `goods_file` VALUES ('15a63b3f67ca46c28d5620f37addc767', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/60926e7d-f05d-4384-bab1-301e2bdf5010.gif', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '2', '2');
INSERT INTO `goods_file` VALUES ('15bb0892f3424552ba38116072716cea', 'a784d8aae9c64bd782a252ab86d2823c', '201705/aa68e93e-afd2-42e0-9f57-3a0daf5206f8.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '3', '1');
INSERT INTO `goods_file` VALUES ('16b16d1de18e432fb1ea12f86a423c6e', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/9dda71df-c0c7-4f8a-bf0e-f95fe5823844.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:17', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:17', '1', '1');
INSERT INTO `goods_file` VALUES ('18aecaa835d54380bbb4ee1dbc53e10b', 'fb79f650ad3e498fb0000300c7c522cc', '201705/d8b27596-2f56-4e1c-9958-db1c55037cf0.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '6', '1');
INSERT INTO `goods_file` VALUES ('1aa243d06f374e82b60a10dd3353c2cd', '6905691162b5441b8478ec690ff82f48', '201705/b71b1ef8-b355-41a4-8ba2-4567e6f5da28.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:12', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:12', '0', '2');
INSERT INTO `goods_file` VALUES ('1b53cafb22ea46419caffc4a3babe09a', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/98f824e6-2e25-4ff5-9ffe-c984adbe5046.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', '0', '2');
INSERT INTO `goods_file` VALUES ('1f0e15c29863433bacef3aa30555f2ee', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/4d286fc4-4996-465f-a521-44996705b8cf.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', '6', '1');
INSERT INTO `goods_file` VALUES ('1f19e93f107e4f3d99674bbb8c9f566e', 'fb79f650ad3e498fb0000300c7c522cc', '201705/5161a448-01d0-4c10-b79e-d1977eaded64.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '1', '1');
INSERT INTO `goods_file` VALUES ('21fca77febd649e3bb64a132bb136d62', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/c09b0fd2-da56-49b0-bbc0-6b6229f56744.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('2243f1eb77da442b9d7115ded3ecc9a9', 'bb27b338403642ef803c13890f8f63dc', '201705/cf60d1f7-73af-4986-a145-0fe7e9584f44.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', '4', '1');
INSERT INTO `goods_file` VALUES ('22662c6cbd8b4ad6addd629a1cc19762', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/14279ed4-e18c-4b18-b866-d5d990b02e2c.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('2634017dcbf0411d94da5095fc87375a', 'b0eaa34896354ea7aa73b9995d9c0c54', '201705/6047ef68-9314-4703-8eb0-797caa49054b.jpg', null, '2017-05-13 13:53:56', null, '2017-05-13 13:59:57', '1', '1');
INSERT INTO `goods_file` VALUES ('27a59c43e9224da7abc7f812e7f71342', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/aba6425e-a4ca-4b1e-a3fb-87d91131f775.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', '6', '1');
INSERT INTO `goods_file` VALUES ('2992028cd175486094b13a7d079ae8c6', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/077d3883-6427-43cb-a5b2-87b4f38ff585.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', '5', '1');
INSERT INTO `goods_file` VALUES ('2a920e49575f46bd90eb8e9b8e15add6', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/403da214-253b-4aa3-b14d-d3272e0c0d8e.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('2b334062eebf4dc1ad442f7fa36a1e21', '6905691162b5441b8478ec690ff82f48', '201705/766ea47b-06cb-4dfe-8d3f-d77ae056a2db.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:13', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:13', '0', '2');
INSERT INTO `goods_file` VALUES ('2f2e7ac330704788a129f40ec07efdad', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/80cd7e10-ff37-4530-89a8-a0d76f9e73d3.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '0', '2');
INSERT INTO `goods_file` VALUES ('2fbb5c64c4864624b20239b611439f17', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/83d2466c-56dc-4faa-af4e-7b2a01ab425a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '8', '1');
INSERT INTO `goods_file` VALUES ('341bfdd2aa074210bafd783a12644565', 'da138698466645eaad5e882fd8ea40d0', '201705/9f1e2298-6530-4a7a-b268-62d8ffd0fd18.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '4', '1');
INSERT INTO `goods_file` VALUES ('34491756d17e49758b99a54382c8d26f', '6905691162b5441b8478ec690ff82f48', '201705/323d4934-5259-4b75-a02c-c7e53a80fae7.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:10', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:10', '6', '1');
INSERT INTO `goods_file` VALUES ('369ccf2d82354008aa8519ae6330f8c1', 'bb27b338403642ef803c13890f8f63dc', '201705/647db1b3-61ac-4b65-b36a-f85c5b1563e8.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', '3', '1');
INSERT INTO `goods_file` VALUES ('36bcc2c6959e4153828d2fd86ee90b98', 'a784d8aae9c64bd782a252ab86d2823c', '201705/b4e3111e-ae62-415e-ac06-c4c706a55aad.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '0', '2');
INSERT INTO `goods_file` VALUES ('36d9d64862dd48ed8864fdc96314480c', 'a784d8aae9c64bd782a252ab86d2823c', '201705/beb4bdcc-d60c-4c5b-9dd6-eceaf4180c59.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '0', '2');
INSERT INTO `goods_file` VALUES ('3790460e1eff4177be940cd9b23d5c6a', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/84364949-fe8a-4d34-963c-8fa3a2656fec.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('390149c489924ce0a64b2ecd56e145b0', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/39f31674-70ca-4527-a172-81a19e52e131.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', '4', '1');
INSERT INTO `goods_file` VALUES ('3a0420d6024c444fade29711349b62a3', '89a6cb44432f4241b59c34e11abae394', '201705/a6ba66fc-f9ae-4419-9408-6fc29e5a662c.jpg', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '1', '1');
INSERT INTO `goods_file` VALUES ('3ad5515542784bcfbe7b5a9226f6623d', 'b5280b15e05a4ab48688b2d44c459e67', '201705/61cf9efc-aab6-46b3-b4fd-48e6e2256093.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', '2', '1');
INSERT INTO `goods_file` VALUES ('3bb5c8b6a159459aa1cb7ca5d91d6ce0', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/738c7a89-c7a5-4056-872a-43b5ef8cf6cb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '4', '1');
INSERT INTO `goods_file` VALUES ('3be08cce30684b4b83ef1cf65be51aa5', 'cba6a78c36a84acd83694f7d49cdc018', '201705/bd53a09a-0198-4713-acae-f1573ed3345e.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '1', '1');
INSERT INTO `goods_file` VALUES ('3d1f33f4ad004db59615e9b0b790c186', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/05a93254-61c5-4605-9eb1-3738f78814bf.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '0', '2');
INSERT INTO `goods_file` VALUES ('416d745b044247ca9102433ad27705ca', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/6c0ab1ef-0462-4668-bf71-d67439de5fcb.gif', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '3', '2');
INSERT INTO `goods_file` VALUES ('43c3f32a476849c6a40970766dce3abb', 'cba6a78c36a84acd83694f7d49cdc018', '201705/f7af274d-2381-49be-86a4-6fb52662b677.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:46', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:46', '0', '1');
INSERT INTO `goods_file` VALUES ('459f6574b83447f5904cd441f4f275f2', '2fdfb2947eca449492fe32cb86f80a5a', '201705/398d476d-369a-4bbc-9ce8-dab67ba0b044.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', '3', '1');
INSERT INTO `goods_file` VALUES ('479690fc434a4eb48419936b8be50a3e', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/96247ecc-67e9-40bb-b695-fc77f0b0973e.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', '3', '1');
INSERT INTO `goods_file` VALUES ('47ad4f0e4dc347f985239a2731430cfb', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/97c14028-9e11-4a2a-a5e4-733560b20f34.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('47d3d9594949447ea9bf952b11e2990f', '6905691162b5441b8478ec690ff82f48', '201705/4e7cfc07-b721-4baa-b529-3649dd9f7cd5.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:12', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:12', '0', '2');
INSERT INTO `goods_file` VALUES ('4e2f24118e2d436ca0c86f899deda4fc', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/de367bc7-e19e-4200-85ea-2fde03a9b3e9.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('517c722bf1c9402980616144ad343dda', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/1b91883e-347c-464b-8c6a-4d5d56452193.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', '5', '1');
INSERT INTO `goods_file` VALUES ('52246c18a30b4d588261c3c2290c3cdc', '89a6cb44432f4241b59c34e11abae394', '201705/7590a3ba-34d7-4661-bc96-d78477ee716a.gif', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '2', '2');
INSERT INTO `goods_file` VALUES ('5277e49b27934551b9b9e3beccaf7941', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/94385fdc-e36c-4019-a2a3-d37fa6862239.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('52a5fd39112d4435a7f248731b759ce8', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/02efac08-b18a-4032-9d3d-0bd8dfc0230d.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '0', '2');
INSERT INTO `goods_file` VALUES ('52f2bebf4e26475c80b0dcd306a32753', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/faf76b48-8abd-4a84-aad4-08965004b7c9.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('5594a7129f384e319c681babf6c50cb7', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/45565172-9df4-4563-81b1-968deb336c1c.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '7', '1');
INSERT INTO `goods_file` VALUES ('55e88fd098144b18bf9234eb7e8998ce', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/08db7830-d1c0-427d-ad44-eb33ef036dce.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '0', '1');
INSERT INTO `goods_file` VALUES ('56091fc3d70f4f35be8d636f7b4bfcd5', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/3e4b6147-166c-48c8-b472-3d293f3562c7.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:17', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:17', '0', '1');
INSERT INTO `goods_file` VALUES ('560d0ad50a6e49358b84682daa128bfa', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/2bbd40bb-edd6-4330-9612-b4cd733e0abb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', '8', '1');
INSERT INTO `goods_file` VALUES ('5766ce4bff174f47bb42ff04ebca1127', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/77508c8a-098f-4da8-93df-526649ea2e1e.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '6', '1');
INSERT INTO `goods_file` VALUES ('57e2956fb94641279c5869b8f343e707', 'fb79f650ad3e498fb0000300c7c522cc', '201705/3195306b-9078-44a2-8fa6-8a942c49709a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '2', '1');
INSERT INTO `goods_file` VALUES ('5b2e2f441bab452993bdfb7e3087376e', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/7b340752-b659-44ae-b402-b8b8b00b1582.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('5df2988a128d4467b94cf6fb14362d56', '6905691162b5441b8478ec690ff82f48', '201705/c26f694a-d39f-4bb6-a1bb-c04f77812c30.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:10', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:10', '5', '1');
INSERT INTO `goods_file` VALUES ('5eb5e43fa40c44db8bcff1587588d9ac', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/520f58d3-32df-4e44-ba94-32b06563d4f2.jpg', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '2', '1');
INSERT INTO `goods_file` VALUES ('5ec218eee41f47908d5eec243ae2f57e', '981124baea7a4b17b99ba14ac110a036', '201705/6f1d174e-982a-4884-b693-cf36d0fb48a6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '3', '1');
INSERT INTO `goods_file` VALUES ('6112386a1c164f319486b838a07a8b8d', 'cba6a78c36a84acd83694f7d49cdc018', '201705/3835dbc2-93d9-45a7-9e92-d38c88948f7c.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '3', '1');
INSERT INTO `goods_file` VALUES ('6195082d2adb4f498ea4e4d3cb66ae57', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/16bb5f1e-95bc-45e2-a1a7-093666ddbbcb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', '4', '1');
INSERT INTO `goods_file` VALUES ('63b78c35402a450a95cca21325f1b832', 'cba6a78c36a84acd83694f7d49cdc018', '201705/35505f89-6a6e-40bc-89b9-cc7d7e2e568b.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '0', '2');
INSERT INTO `goods_file` VALUES ('64a55c01b4b24c27b5fde7e6c4794ad3', '6905691162b5441b8478ec690ff82f48', '201705/893e886f-2f11-46bc-beee-5fef026a92b6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:09', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:09', '1', '1');
INSERT INTO `goods_file` VALUES ('64e629335fa64c498a6eabd6d91b4503', '981124baea7a4b17b99ba14ac110a036', '201705/1fd3b7a3-dd82-4d45-bf9b-e54ed0a58a79.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '0', '2');
INSERT INTO `goods_file` VALUES ('64ed082e17bf4b7e8262ce2782b76c9d', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/44495e29-9451-4520-9927-94999d5918e5.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('6a40569920a54b5aa87224c029a6b4fd', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/8377d005-9cea-49df-ba3e-3c48784409be.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('6a86fdd063de4ce99002129919ab2a8f', 'e9499637c3274180bc9f65672c20b3ef', '201705/9e84583e-d3a2-4cd1-b6ca-9a4ca3d64e0c.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '1', '1');
INSERT INTO `goods_file` VALUES ('6a9db17eb94f43b7b54491994adfcf74', '89a6cb44432f4241b59c34e11abae394', '201705/dc06c7d0-5f05-4805-87d5-1c2d9531a010.gif', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '3', '2');
INSERT INTO `goods_file` VALUES ('6cec9078d602477aaaa1254626a1379e', 'fb9043f5abba407f9f8d6811ef6b51a9', '201705/66ff4cea-bad5-4ac6-9aea-4726113c6e25.jpg', null, '2017-05-07 14:29:35', null, '2017-05-07 14:29:35', '2', '2');
INSERT INTO `goods_file` VALUES ('6e06648d04c1432182134a18b07471cd', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/f4b47ac3-18b0-49c8-9d4a-e5200215bc55.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('6ed2eae095604d1c86c67a75c83bc56e', 'b0eaa34896354ea7aa73b9995d9c0c54', '201705/bf9a4dfe-dfc0-46ba-a0d6-3dadb2eeb3d2.jpg', null, '2017-05-13 13:59:57', null, '2017-05-13 13:59:57', '1', '2');
INSERT INTO `goods_file` VALUES ('706234012a9a4e949f1a686c6a2f4e2d', 'fb9043f5abba407f9f8d6811ef6b51a9', '201705/f02f87d1-4521-4b13-8216-cf3c99e6e9cf.jpg', null, '2017-05-07 14:29:35', null, '2017-05-07 14:29:35', '3', '1');
INSERT INTO `goods_file` VALUES ('7076c6cbc0d44c76929bd80f1e3598e7', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/db8bcef8-9653-465e-be91-a9a5a6c81f58.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:18', '2', '1');
INSERT INTO `goods_file` VALUES ('70c36e27ff6e4ea9ab80d68409436eeb', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/f08e6503-02e7-4fd8-b27a-50a235cb5ef4.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:05', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:05', '0', '2');
INSERT INTO `goods_file` VALUES ('732d4fca677b44dfadc8effe04e0a354', '6905691162b5441b8478ec690ff82f48', '201705/7f0da0da-20cb-4789-b295-f554778fdc69.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:12', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:12', '0', '2');
INSERT INTO `goods_file` VALUES ('75d4e6f2a7d94a4bb676daad2792e6d6', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/07ad4eac-ff76-4960-876c-2f3ded32274f.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '4', '1');
INSERT INTO `goods_file` VALUES ('788abdf333f44054b443c9385624128f', '2fdfb2947eca449492fe32cb86f80a5a', '201705/7b33d71a-a089-459f-b1d3-b0c4d4438fad.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', '2', '1');
INSERT INTO `goods_file` VALUES ('790928b9c7514cb49b77ba07068c6fcc', 'fb79f650ad3e498fb0000300c7c522cc', '201705/d773a14c-fcd2-4200-b336-32b8dc2de172.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '0', '2');
INSERT INTO `goods_file` VALUES ('79e14a5bfd4c4e5eb7853ad0f6d2af2e', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/669b4d73-45f2-4fa3-ab3b-fbfe1268a9ec.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '3', '1');
INSERT INTO `goods_file` VALUES ('7b5bdd38682a49b7ac93b006135f7321', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/3640fa00-6f9d-4895-8a87-bafc8f9734cb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('7b7f4fa87e0b4f91a88c5aee74b36cce', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/38c863bc-3cf4-4d00-bf52-6f5615665627.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '0', '2');
INSERT INTO `goods_file` VALUES ('7bb6b13317c8491ca0cb6fb0cf03e2f0', 'a784d8aae9c64bd782a252ab86d2823c', '201705/bbe0b5f5-bbc1-48bb-8e18-40071bb8d2c2.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '1', '1');
INSERT INTO `goods_file` VALUES ('7bb6b91820394b3ab5b7b400ca48929f', '6905691162b5441b8478ec690ff82f48', '201705/81bba2f7-62f8-41c2-872c-76aab641603a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:13', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:13', '0', '2');
INSERT INTO `goods_file` VALUES ('7d0032e92bfd406385a0aa16434b6856', '6905691162b5441b8478ec690ff82f48', '201705/c143c72e-7d59-4d5e-8e44-ee5e52f99795.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:11', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:11', '0', '2');
INSERT INTO `goods_file` VALUES ('7dc178609e9c4abb8e280cc49d7f3db9', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/27e1c607-5c57-4b1a-84ae-19571b69f11a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:05', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:05', '0', '2');
INSERT INTO `goods_file` VALUES ('7f7b453154744938a9605d914fc18c3b', '6905691162b5441b8478ec690ff82f48', '201705/6d5ebd8c-6e25-4e18-87cd-48c7a3ff716b.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:09', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:09', '3', '1');
INSERT INTO `goods_file` VALUES ('7f99b24ac4234671a18e9880d985c0ca', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/cb5e7da1-61c4-4007-bf67-b5662f822ebb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '2', '1');
INSERT INTO `goods_file` VALUES ('814b1addc97f425786c1f2012a49d526', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/045e6902-9ce7-4f44-9c35-46d7c53a6762.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('822f32e645e643e1b7add266a314db79', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/bf6f1f5e-971c-43b9-af28-b5df728f9d7f.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '2', '1');
INSERT INTO `goods_file` VALUES ('88d9648e87044a37ab08b05fe117d527', 'fb9043f5abba407f9f8d6811ef6b51a9', '201705/d2d8d4c7-2e20-4f6c-8697-68ddb46f7860.jpg', null, '2017-05-07 14:29:35', null, '2017-05-07 14:29:35', '1', '2');
INSERT INTO `goods_file` VALUES ('894d2a27c21f4528a431a0c31b10faf9', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/216cf12a-2347-4346-ba70-dffb6a8b7ce6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('894ff868fd9a43cfb9c373820e5fb275', 'fb9043f5abba407f9f8d6811ef6b51a9', '201705/295110fd-204d-4eda-9ed8-e4a64bd8f1ec.jpg', null, '2017-05-07 14:29:35', null, '2017-05-07 14:29:35', '1', '1');
INSERT INTO `goods_file` VALUES ('89832866d95f419fac64df438ce47068', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/a95a8f88-0c4a-415e-8530-0b0a3de5b195.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('8b670e9a36ce4be98827a6894622814a', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/cf80fdb6-d47b-4e22-a552-67bf4d22116c.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '0', '2');
INSERT INTO `goods_file` VALUES ('90bb2b0b9b144288b25f1da4bd0d6563', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/3fe579ff-b341-4117-8a50-792d4cbb9018.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '0', '2');
INSERT INTO `goods_file` VALUES ('92aa685577ee4991ac244932c41f1074', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/e360a954-07d3-4c24-9365-773cd961c58c.gif', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '1', '2');
INSERT INTO `goods_file` VALUES ('9a095aeddb584518bc75787dd41513bd', '981124baea7a4b17b99ba14ac110a036', '201705/baf074ac-79b3-49fc-8765-89ac52300ae0.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '1', '1');
INSERT INTO `goods_file` VALUES ('9c4b3d4b07b543eeac8659c572361175', 'fb79f650ad3e498fb0000300c7c522cc', '201705/ad7fa5bb-8cc6-464f-9fc5-4d173b89915a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '8', '1');
INSERT INTO `goods_file` VALUES ('9d4437baaea54658ad274a6a89875488', 'da138698466645eaad5e882fd8ea40d0', '201705/3d07d49b-5b99-4ae2-bf2b-415ace75d3f6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '2', '1');
INSERT INTO `goods_file` VALUES ('9db9e29ccc024deb8f80e657d992f618', '6905691162b5441b8478ec690ff82f48', '201705/f1d9a3d3-2387-4608-af5e-d086997fc8e4.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:09', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:09', '2', '1');
INSERT INTO `goods_file` VALUES ('9e8bf681ad57466ebd9b75cb41d6f3bc', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/ade7c148-8a45-4ef3-a31b-76e6bb9d9ba8.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('a0dbfb4c677147988e352f8504f95eaf', 'b5280b15e05a4ab48688b2d44c459e67', '201705/111841ea-43cf-4749-a454-53e86afde7a8.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', '0', '1');
INSERT INTO `goods_file` VALUES ('a0f6c0336bce4ab69c9d4809ba2fff50', 'fb79f650ad3e498fb0000300c7c522cc', '201705/4a376ab1-3f4b-452d-9477-68211a04b52f.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '3', '1');
INSERT INTO `goods_file` VALUES ('a2946e2e83f04df58f2734497652f58b', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/b0014caf-ad4b-459b-9f8f-3c257c64b8ae.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '1', '1');
INSERT INTO `goods_file` VALUES ('a4d1e50fef584a0fa47c038130f9fe02', 'fb9043f5abba407f9f8d6811ef6b51a9', '201705/9750da95-91ae-4a78-913a-b506d1694d6a.jpg', null, '2017-05-07 14:29:35', null, '2017-05-07 14:29:35', '2', '1');
INSERT INTO `goods_file` VALUES ('a4dc41ad27544fc8819d25f4e7457c9b', 'fb79f650ad3e498fb0000300c7c522cc', '201705/6d56e73f-aa9c-464d-8dad-c043aa54948c.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '7', '1');
INSERT INTO `goods_file` VALUES ('a640da91afb1472a8ceb9d12473365c8', 'bb27b338403642ef803c13890f8f63dc', '201705/1b42ffdf-21de-41b8-a9ba-fed991411389.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', '7', '1');
INSERT INTO `goods_file` VALUES ('a6677350ab044fd6a569eaa29a23ad47', '2fdfb2947eca449492fe32cb86f80a5a', '201705/9adcebfd-84e8-4058-8a5f-16ac1ec11253.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', '1', '1');
INSERT INTO `goods_file` VALUES ('a6d7eb9b7d7743eca7ce556d443e2944', 'da138698466645eaad5e882fd8ea40d0', '201705/ee623679-66cb-474a-8013-5f8bbe721fcf.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '3', '1');
INSERT INTO `goods_file` VALUES ('a700b85c90994867a45280cf0b157c88', 'cba6a78c36a84acd83694f7d49cdc018', '201705/271821cf-06d0-4b56-ad94-37076af97733.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '5', '1');
INSERT INTO `goods_file` VALUES ('a704690162b8458783fbfd1f3e5576e1', 'bb27b338403642ef803c13890f8f63dc', '201705/e3bbe97d-3b9b-48aa-a828-878f6228c000.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', '1', '1');
INSERT INTO `goods_file` VALUES ('aa391fd754404dbaabd73a5ddd6b24a9', '69e62fd1cddd4c21a361dab35c95d876', '201705/96d482f7-6352-4381-9d0f-82d7bc4170a4.jpg', null, '2017-05-07 14:15:27', null, '2017-05-07 14:15:27', '1', '2');
INSERT INTO `goods_file` VALUES ('ac2582ed9d824482921e32dad6b3fc71', '69e62fd1cddd4c21a361dab35c95d876', '201705/81a43d69-6940-4fbf-abd2-7200bed8f945.jpg', null, '2017-05-07 14:15:27', null, '2017-05-07 14:15:27', '3', '1');
INSERT INTO `goods_file` VALUES ('ade07e9a423e49b1a72cd71faa028550', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/45a7cfb6-71ea-4780-9224-cdbd5e882ef8.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '8', '1');
INSERT INTO `goods_file` VALUES ('afd970468a2d40c5b3d043ec876a5b43', '69e62fd1cddd4c21a361dab35c95d876', '201705/515349ab-854e-4512-80da-ce24585f01f1.jpg', null, '2017-05-07 14:15:27', null, '2017-05-07 14:15:27', '4', '1');
INSERT INTO `goods_file` VALUES ('b07d1464713a4627bdbb707c6f67b6bd', '2fdfb2947eca449492fe32cb86f80a5a', '201705/9d311dc0-f864-4b05-8deb-eac27bb5069e.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', '0', '1');
INSERT INTO `goods_file` VALUES ('b0c08b0a4ef2447c9ceae07847cb5149', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/a91b5584-407b-4a47-aaf9-e2e5cdfdfc93.jpg', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '3', '1');
INSERT INTO `goods_file` VALUES ('b1c6fdf1b72644048989b6086884cc4a', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/f6341b58-b40a-4c4d-90d5-c5646902ee54.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:02', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:02', '1', '1');
INSERT INTO `goods_file` VALUES ('b1d993d741c745a382f0e4d5188ce485', 'a784d8aae9c64bd782a252ab86d2823c', '201705/0a7e6f60-cac7-4adc-b31d-481e74120955.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '0', '1');
INSERT INTO `goods_file` VALUES ('b3f44c975c1a4087b750408fbfdc1306', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/d39f0964-1f76-495d-ba56-0ce7b0463e0c.jpg', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '1', '1');
INSERT INTO `goods_file` VALUES ('b43a636d96b445cc9f010e2022136e0b', 'bb27b338403642ef803c13890f8f63dc', '201705/f4b4ff86-ed6d-4956-bebb-bfce62bb5928.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', '0', '2');
INSERT INTO `goods_file` VALUES ('b55e6bf1f8b444e2938bdf2c5ffc5f46', '981124baea7a4b17b99ba14ac110a036', '201705/70213427-2b74-41d6-a1e8-9518ea4a4539.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '4', '1');
INSERT INTO `goods_file` VALUES ('b5d096690a7549f9b46f7bd860d83ea5', 'b0eaa34896354ea7aa73b9995d9c0c54', '201705/76639601-02d9-4bf0-8cc3-0422e51dca86.jpg', null, '2017-05-13 13:59:57', null, '2017-05-13 13:59:57', '2', '2');
INSERT INTO `goods_file` VALUES ('b5ea201061234d36a4884d40a4404aa9', 'b5280b15e05a4ab48688b2d44c459e67', '201705/63af5eed-db3d-41ad-8368-9f021c15e23d.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', '3', '1');
INSERT INTO `goods_file` VALUES ('b71f575abc9b4a228439b24ea3668051', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/6465d175-f8f5-4c2d-8d79-295f5dbdfc82.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('b752107aae0f40d688e822a28cf4fa04', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/2f975fd8-4e8b-4c89-aeb9-cf737cebbc99.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('b80338ce3b424a129dd73bf0a1c74771', 'a784d8aae9c64bd782a252ab86d2823c', '201705/53149464-cc34-41cc-ac32-9a8b2e479a57.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '2', '1');
INSERT INTO `goods_file` VALUES ('b869abfeeb8e4eeab09f68cb6359266e', '82f979372455460dba45ac42ab5edb52', '201803/48988619-1c9d-47f2-a706-bc37d221ad90.jpg', null, '2018-03-31 00:07:32', null, '2018-03-31 00:07:32', '1', '1');
INSERT INTO `goods_file` VALUES ('b8ab9d15b0c042d0b35132dbc10716ee', 'fb9043f5abba407f9f8d6811ef6b51a9', '201705/85aba577-5ec0-4718-8e41-e1d22332d6a3.jpg', null, '2017-05-07 14:29:35', null, '2017-05-07 14:29:35', '4', '1');
INSERT INTO `goods_file` VALUES ('bdfd20a802ac4683855c41b0bda731b5', 'fb79f650ad3e498fb0000300c7c522cc', '201705/2043722b-93b6-4e41-aff6-058207b714fb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '5', '1');
INSERT INTO `goods_file` VALUES ('be32d4d12bfe4d80beb16cc76176f57e', 'a784d8aae9c64bd782a252ab86d2823c', '201705/d5daa068-73f0-4766-a208-7d69255d2300.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:21:22', '4', '1');
INSERT INTO `goods_file` VALUES ('bee6c017d458438591ffd79790ead8df', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/7af2a869-b370-42c3-b5ad-e32e43e592ce.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('bf670dff2d9d4b6687a78888eb2b82e4', 'b5280b15e05a4ab48688b2d44c459e67', '201705/6be242df-c30e-476e-858b-e3b177b1bc2a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', '1', '1');
INSERT INTO `goods_file` VALUES ('bf7cc2e1df9e43f3a3e2c117f4f3e798', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/c4b055f9-4b5a-4f29-a243-c3423339cf73.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '5', '1');
INSERT INTO `goods_file` VALUES ('c088b76dfa724ad8bfaad896988787f2', 'fb79f650ad3e498fb0000300c7c522cc', '201705/825b6ce4-4980-4228-b9e7-6cd817ea27b3.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '9', '1');
INSERT INTO `goods_file` VALUES ('c0e6474326a8475796f95ef1bca7dbb2', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/dad6df0c-c9c8-4cc4-bf38-a0a4c13c433b.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:56', '5', '1');
INSERT INTO `goods_file` VALUES ('c1b6ee0d443e491eabd1006ba3d80e1f', 'cba6a78c36a84acd83694f7d49cdc018', '201705/c50f8846-e57e-45dd-99ed-88f97541f8c4.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '6', '1');
INSERT INTO `goods_file` VALUES ('c351838220514a4ca1be0f122f31a5ff', 'cba6a78c36a84acd83694f7d49cdc018', '201705/398239b6-84e7-44db-a590-251cfda140fe.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '7', '1');
INSERT INTO `goods_file` VALUES ('c400c4efc7aa47629390a5deae0b6829', '6905691162b5441b8478ec690ff82f48', '201705/bb59aeec-7286-41de-909e-e0b203d33b55.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:11', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:11', '8', '1');
INSERT INTO `goods_file` VALUES ('c43e1d02693e4e34b5d8754241a4c6fe', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/8186ddbc-5799-4494-a9d7-6807a92243de.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:01', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:01', '0', '1');
INSERT INTO `goods_file` VALUES ('c4e5556bc1bb4ac4913a5d77de7566f0', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/971cee0a-e5e8-45f8-8f6a-248ca6e3b57a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:04', '0', '2');
INSERT INTO `goods_file` VALUES ('c6800da2a7cb4806a632696aa3b0717f', 'e9499637c3274180bc9f65672c20b3ef', '201705/cc1503ac-a489-4760-bc82-8ec92a90f2f7.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '2', '1');
INSERT INTO `goods_file` VALUES ('c69e21c2a7dc4ed3bd300fae0eb93b3e', '69e62fd1cddd4c21a361dab35c95d876', '201705/fefe8929-911e-4625-8c37-bdccf71291e2.jpg', null, '2017-05-07 14:15:27', null, '2017-05-07 14:15:27', '2', '1');
INSERT INTO `goods_file` VALUES ('c9805f8e456b45408d8a8de00df6aee0', '89a6cb44432f4241b59c34e11abae394', '201705/445e3a57-e3b6-4c2b-ad2b-e774df5ea205.jpg', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '4', '1');
INSERT INTO `goods_file` VALUES ('caca1b9c272b4fe988c7a98d9714da20', '82f979372455460dba45ac42ab5edb52', '201803/d1a8835d-b7c3-4eae-89d1-d914453a38b6.png', null, '2018-03-31 00:07:32', null, '2018-03-31 00:07:32', '4', '1');
INSERT INTO `goods_file` VALUES ('cad2e233f9a54b3bbc9abbd65a56670c', 'b5280b15e05a4ab48688b2d44c459e67', '201705/768cc33d-54c1-46ba-997f-9f4f9a2f3f37.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', '4', '1');
INSERT INTO `goods_file` VALUES ('ccba0bf5e15c4862bf765899a12241d5', 'bb27b338403642ef803c13890f8f63dc', '201705/a68b25ed-e9fc-41a3-8995-6df5dea1a844.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:06', '5', '1');
INSERT INTO `goods_file` VALUES ('cdce1631178e411f86dbb8d6d0c20810', '69e62fd1cddd4c21a361dab35c95d876', '201705/8147b76f-eaa0-477c-af03-cc263dd76ba2.jpg', null, '2017-05-07 14:13:45', null, '2017-05-07 14:15:27', '1', '1');
INSERT INTO `goods_file` VALUES ('cf49b15310fc49df84d91b381f7b4196', 'da138698466645eaad5e882fd8ea40d0', '201705/4373256b-b9eb-4992-9e5c-684a536852ab.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '0', '2');
INSERT INTO `goods_file` VALUES ('d0d4defe45f94772a9d606fef2fe8069', '89a6cb44432f4241b59c34e11abae394', '201705/e51d6a74-80af-40f3-ab9b-097564258a49.gif', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '1', '2');
INSERT INTO `goods_file` VALUES ('d295ab814e824e078a074c8ae796b747', '2fdfb2947eca449492fe32cb86f80a5a', '201705/28e8ac3c-2f58-4567-9189-35c311148641.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:35', '4', '1');
INSERT INTO `goods_file` VALUES ('d2c8b6e01aeb4b19a039655cdd30387a', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/3a1e1651-b9cd-46c3-9933-13c6aebcbb66.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:03', '7', '1');
INSERT INTO `goods_file` VALUES ('d4f70ba8a46a4815993917bb99132ceb', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/ecb9dd30-b459-490d-bc01-ebe8550806be.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:02', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:02', '2', '1');
INSERT INTO `goods_file` VALUES ('d5462062225e4f1093053a73cf3dceea', 'da138698466645eaad5e882fd8ea40d0', '201705/4aeeb0f0-ec10-4d6d-a4fb-74a8e4809632.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '1', '1');
INSERT INTO `goods_file` VALUES ('d8f4f6dc36374d9bb7dce60e18032bd0', 'fb79f650ad3e498fb0000300c7c522cc', '201705/c3b389a6-a068-40bf-a192-ad7f0886c569.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '0', '1');
INSERT INTO `goods_file` VALUES ('dde8470629db4f71af1b008ebe25f1ee', 'e9499637c3274180bc9f65672c20b3ef', '201705/143ce957-ff21-4967-94f6-6428ba23cb91.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '3', '2');
INSERT INTO `goods_file` VALUES ('df45d2729c174e62ada62ce27b878a37', 'fb79f650ad3e498fb0000300c7c522cc', '201705/d6a8d9df-a00e-4460-af5c-8ae44616f608.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '10', '1');
INSERT INTO `goods_file` VALUES ('e2b08cbad7f54114924cf639c668c809', '6905691162b5441b8478ec690ff82f48', '201705/5a499012-46f4-4a94-9b71-69323e4a2deb.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:08', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:08', '0', '1');
INSERT INTO `goods_file` VALUES ('e43dae46880744b98aa032f4f09973aa', '6905691162b5441b8478ec690ff82f48', '201705/eca628e0-94f7-4a70-af73-6733f9046d70.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:10', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:10', '4', '1');
INSERT INTO `goods_file` VALUES ('e4b555dc02e842d28808f7139fc8bf13', '89a6cb44432f4241b59c34e11abae394', '201705/e3cbff87-82f4-4fdd-8aa6-98f562cc7b73.jpg', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '3', '1');
INSERT INTO `goods_file` VALUES ('e5307be2cad54e4faa422225b9871b32', 'da138698466645eaad5e882fd8ea40d0', '201705/e5c50ae5-4cea-41c0-97ff-fe33d6d0d6c6.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '0', '1');
INSERT INTO `goods_file` VALUES ('e59b8bfc55ea43b19793b59c10eb9ebd', 'bb27b338403642ef803c13890f8f63dc', '201705/d0d3b828-05a9-41e0-91ce-3f6008163814.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:55:07', '6', '1');
INSERT INTO `goods_file` VALUES ('e69aeeddf1d748baab7da18978132dac', 'b5280b15e05a4ab48688b2d44c459e67', '201705/ebb794a3-c08e-4525-be31-79ba2acbabce.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 15:46:14', '0', '2');
INSERT INTO `goods_file` VALUES ('ebea4b4533004b31947bc46f6f5e967c', '8dbde8746b2d4f87885ad5b54c3e3138', '201705/cf8c6706-3aad-4cc8-91db-7a6b32cff765.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-18 13:50:57', '0', '2');
INSERT INTO `goods_file` VALUES ('ec77694b7c7e4356b2d30f46aabdde38', '6905691162b5441b8478ec690ff82f48', '201705/deaa8f54-0e9b-41a3-83fa-af10b36719dc.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:13', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-17 15:04:13', '0', '2');
INSERT INTO `goods_file` VALUES ('ecc9fb814f1b46968da5959fe9c6740b', 'e9499637c3274180bc9f65672c20b3ef', '201705/917faa69-f0be-4aa3-bec5-6f745603bd68.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '3', '1');
INSERT INTO `goods_file` VALUES ('ed14f23e12e44f85bd22908a15f48c0f', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/7973d32a-7096-4107-925b-986a5b1a09a1.gif', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '4', '2');
INSERT INTO `goods_file` VALUES ('ee473df723164659a66fe5522631d73b', 'da138698466645eaad5e882fd8ea40d0', '201705/ac19be7b-90e6-4f54-b5f2-f8f911fb629a.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:24:14', '0', '2');
INSERT INTO `goods_file` VALUES ('ef5dfe179b314a5da9c4a0a0e302ceed', 'efe9eff2ae714c178eeb42694b9ed8bc', '201705/45074362-e247-4af2-b35b-28fa847f71d7.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:40:19', '7', '1');
INSERT INTO `goods_file` VALUES ('efd0f038eb604fd3925e5c130e281c96', 'd9ff50bdee9840f9afcbfcdbf928b096', '201705/af07f9a8-947c-435c-b90f-fb8087823688.jpg', null, '2017-05-07 15:17:00', null, '2017-05-07 15:17:00', '4', '1');
INSERT INTO `goods_file` VALUES ('f039cd09f51c4d7c88d90ec2d464854e', 'ad7ea1b7a1ea4987812a44982807e7f9', '201705/6b230ed8-0e99-41f6-a912-388379016c46.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:02', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:26:02', '3', '1');
INSERT INTO `goods_file` VALUES ('f06bf4451f4c4c2693bb635625ef1529', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/c1da59d7-0020-4cfe-8b2e-f77a4e85e851.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '3', '1');
INSERT INTO `goods_file` VALUES ('f1825cd181f74d9da0c55246abd65b53', '981124baea7a4b17b99ba14ac110a036', '201705/7dda7cbc-ffc7-40d9-bf48-7a23a9e0c4d3.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '0', '1');
INSERT INTO `goods_file` VALUES ('f55568cc71c44452b9b264191cc05a9b', '981124baea7a4b17b99ba14ac110a036', '201705/deb5a89b-dccb-4016-bf4e-38b92816b739.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '0', '2');
INSERT INTO `goods_file` VALUES ('f64c8e1cc8154aaeb0ead7bc5e4ab89f', 'e9499637c3274180bc9f65672c20b3ef', '201705/80581deb-9898-4d4a-b7e7-d29eb54546dd.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '1', '2');
INSERT INTO `goods_file` VALUES ('f7810ab675404cc6a2c13d6ef0f124d1', '981124baea7a4b17b99ba14ac110a036', '201705/1686c6c5-5009-4f66-b3a0-1731758e7e22.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:11:35', '2', '1');
INSERT INTO `goods_file` VALUES ('f91bf774c4c245f8a6815e94ba8c731c', '6819ebf84dff440eb80bbe2a0d9ca9ec', '201705/0b7817c8-da1f-4687-b261-b04d8bfc65b5.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 17:30:07', '0', '1');
INSERT INTO `goods_file` VALUES ('fb9b8bc49d7741999df82f8fd2d38d6c', '89a6cb44432f4241b59c34e11abae394', '201705/28aac211-431e-4072-96e9-a9bcb5df867d.jpg', null, '2017-05-07 15:24:56', null, '2017-05-07 15:24:56', '2', '1');
INSERT INTO `goods_file` VALUES ('fbbd1adc439a4cf5939782173af76b21', 'fb79f650ad3e498fb0000300c7c522cc', '201705/44695525-7f50-491a-8615-5e145f6e98e2.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 14:02:50', '4', '1');
INSERT INTO `goods_file` VALUES ('fc461821148d4d7a82a43aa872368191', 'cba6a78c36a84acd83694f7d49cdc018', '201705/8b5cd4c9-3d38-4657-ad7d-00ea4ada0a38.jpg', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', 'd359e8b250dd47cdbe4187e187f07e9b', '2017-05-19 08:33:47', '2', '1');
INSERT INTO `goods_file` VALUES ('fec5e4705f9d4bf1b267e791939ece30', 'e9499637c3274180bc9f65672c20b3ef', '201705/153ee9eb-43d9-464e-8236-bda2c719ae0a.jpg', null, '2017-05-07 14:48:09', null, '2017-05-07 14:48:09', '2', '2');

-- ----------------------------
-- Table structure for goods_price
-- ----------------------------
DROP TABLE IF EXISTS `goods_price`;
CREATE TABLE `goods_price` (
  `GOODS_PRICE_NO` char(32) NOT NULL,
  `GOODS_NO` char(32) DEFAULT NULL,
  `PROPERTITY_NAME1` varchar(50) DEFAULT NULL,
  `PROPERTITY_VALUE1` varchar(255) DEFAULT NULL,
  `PROPERTITY_NAME2` varchar(50) DEFAULT NULL,
  `PROPERTITY_VALUE2` varchar(255) DEFAULT NULL,
  `PROPERTITY_NAME3` varchar(50) DEFAULT NULL,
  `PROPERTITY_VALUE3` varchar(255) DEFAULT NULL,
  `PROPERTITY_NAME4` varchar(50) DEFAULT NULL,
  `PROPERTITY_VALUE4` varchar(255) DEFAULT NULL,
  `PRICE` int(10) DEFAULT NULL,
  `SORT_ORDER` int(10) DEFAULT NULL,
  `TOTAL_COUNT` int(10) DEFAULT NULL,
  `SALSE_COUNT` int(10) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GOODS_PRICE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_price
-- ----------------------------
INSERT INTO `goods_price` VALUES ('0f779e2ad00e49d9a76e1359973760ef', 'ad7ea1b7a1ea4987812a44982807e7f9', '颜色', '圆点-黄', '尺寸', '1.8m（6英尺）床', null, null, null, null, '120', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('16dd7ef9f867439caf6207d67310f6e6', 'bb27b338403642ef803c13890f8f63dc', '颜色', '圆点-黄', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('1bc63ab0643d4776aaf9065709db8158', 'fb9043f5abba407f9f8d6811ef6b51a9', '尺寸', '1.2m(4英尺)床', null, null, null, null, null, null, '240', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('1ee4de1728784894a5c89f0b3b1afa9b', 'fb79f650ad3e498fb0000300c7c522cc', '颜色', '圆点-黄', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('2ea75560e59e4715b67c3ad3bed341d5', '6819ebf84dff440eb80bbe2a0d9ca9ec', '颜色', 'null', '尺寸', '1.2m(4英尺)床', null, null, null, null, '560', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('31e986fdc17647a494f817f20b9cd8f0', 'efe9eff2ae714c178eeb42694b9ed8bc', '颜色', '圆点-黄', '尺寸', '1.8m（6英尺）床', null, null, null, null, '120', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('35b0e5582d0a4141ac5f6045f33106f0', '6905691162b5441b8478ec690ff82f48', '颜色', '仙人柱', '尺寸', '1.8m（6英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('3a47fbf13bf14c06be22572ae535aeb8', 'cba6a78c36a84acd83694f7d49cdc018', '颜色', '圆点-黄', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('3a7838e7f37e4026863c2447103ac2fb', 'cba6a78c36a84acd83694f7d49cdc018', '颜色', '圆点-黄', '尺寸', '1.2m（4英尺）床', null, null, null, null, '105', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('41d010ad6b55450b8ed99895c350eeb8', 'bb27b338403642ef803c13890f8f63dc', '颜色', '圆点-黄', '尺寸', '1.5m（5英尺）床', null, null, null, null, '115', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('46f18a4a14584fd2bb566e766dab0db8', '981124baea7a4b17b99ba14ac110a036', '颜色', null, '尺寸', '1.2m(4英尺)床', null, null, null, null, '560', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('55c05a48612e42078098f02e6307d3b6', '981124baea7a4b17b99ba14ac110a036', '颜色', null, '尺寸', '1.0m(3.3英尺)床', null, null, null, null, '260', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('5a8d797f2f924e868d013365bacc63c7', 'bb27b338403642ef803c13890f8f63dc', '颜色', '圆点-黄', '尺寸', '1.8m（6英尺）床', null, null, null, null, '120', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('5d6581f80a60453ea8286aeeaaefc46c', 'da138698466645eaad5e882fd8ea40d0', '颜色', null, '尺寸', '1.2m(4英尺)床', null, null, null, null, '240', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('6225d5d1f08f46cfa59d863391e6ff7b', '69e62fd1cddd4c21a361dab35c95d876', '尺寸', '1.0m(3.3英尺)床', null, null, null, null, null, null, '199', '1', '0', '0', null);
INSERT INTO `goods_price` VALUES ('62f74b7b23a44ffd98a2a40f2c2e9b14', 'fb79f650ad3e498fb0000300c7c522cc', '颜色', '圆点-黄', '尺寸', '1.2m（4英尺）床', null, null, null, null, '105', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('65c3e529f282439bb6882491935e08a9', 'fb79f650ad3e498fb0000300c7c522cc', '颜色', '圆点-黄', '尺寸', '1.5m（5英尺）床', null, null, null, null, '115', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('6d82e8aba3254afabe8a8551e5771642', 'd9ff50bdee9840f9afcbfcdbf928b096', '尺寸', '1.0m(3.3英尺)床', null, null, null, null, null, null, '150', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('6ea92512653a4199b90fc1c4c90af7f3', '6819ebf84dff440eb80bbe2a0d9ca9ec', '颜色', 'null', '尺寸', '1.0m(3.3英尺)床', null, null, null, null, '260', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('7173582be14f4d59ab941abbcbf594a2', '8dbde8746b2d4f87885ad5b54c3e3138', '颜色', '黑白森林', '尺寸', '1.8m（6英尺）床', null, null, null, null, '200', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('74659f1f2db343aab9fd5e3fa9f23de1', 'a784d8aae9c64bd782a252ab86d2823c', '颜色', null, '尺寸', '1.0m(3.3英尺)床', null, null, null, null, '260', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('74a40f1be5a04c09aa61b40379d7ca9d', '6905691162b5441b8478ec690ff82f48', '颜色', '仙人柱', '尺寸', '1.5m（5英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('754b3ca854de45d9aa6fd43d04bff331', '6905691162b5441b8478ec690ff82f48', '颜色', '仙人柱', '尺寸', '1.2m（4英尺）床', null, null, null, null, '105', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('7717754f36754ad3a7201a188fb6e8e0', 'b5280b15e05a4ab48688b2d44c459e67', '颜色', null, '尺寸', '1.2m(4英尺)床', null, null, null, null, '299', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('7eb3ebbec8c34ea4a16129357cc34911', 'efe9eff2ae714c178eeb42694b9ed8bc', '颜色', '圆点-黄', '尺寸', '1.5m（5英尺）床', null, null, null, null, '115', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('83875ce8e30043aeab3c686e760821f3', '8dbde8746b2d4f87885ad5b54c3e3138', '颜色', '黑白森林', '尺寸', '1.2m（4英尺）床', null, null, null, null, '170', '0', '99', '0', null);
INSERT INTO `goods_price` VALUES ('89ad94c14dc149d39ce6989290e54011', 'e9499637c3274180bc9f65672c20b3ef', '颜色', '黄色', null, null, null, null, null, null, '105', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('8f9a52c224c44340aa212d1058ba5066', 'fb79f650ad3e498fb0000300c7c522cc', '颜色', '圆点-黄', '尺寸', '1.8m（6英尺）床', null, null, null, null, '120', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('91ecface9af34c0abacd620e7cde4276', '89a6cb44432f4241b59c34e11abae394', '尺寸', '1.0m(3.3英尺)床', null, null, null, null, null, null, '100', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('94d61fc6fb014be487122dee7a3d7dae', '8dbde8746b2d4f87885ad5b54c3e3138', '颜色', '黑白森林', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '220', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('9f92ab8e787c4e579d18975653a62006', 'cba6a78c36a84acd83694f7d49cdc018', '颜色', '圆点-黄', '尺寸', '1.8m（6英尺）床', null, null, null, null, '120', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('a9b40ce288b240d88c816f3b57a75738', 'a784d8aae9c64bd782a252ab86d2823c', '颜色', null, '尺寸', '1.2m(4英尺)床', null, null, null, null, '560', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('aa3cc95cfaeb4b7c981b1be1f3ae6dd6', '82f979372455460dba45ac42ab5edb52', '', '12', '', '2', '', '21', '', '23', '12', '1', '1', '1', null);
INSERT INTO `goods_price` VALUES ('b002bf5a344240228031ed65245bf609', 'ad7ea1b7a1ea4987812a44982807e7f9', '颜色', '圆点-黄', '尺寸', '1.2m（4英尺）床', null, null, null, null, '105', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('bc93fd5c43f54cf5bc0f98bb9c8dd9e3', 'ad7ea1b7a1ea4987812a44982807e7f9', '颜色', '圆点-黄', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('c3571b398d7747a18a0a6d900fb1c3f7', 'bb27b338403642ef803c13890f8f63dc', '颜色', '圆点-黄', '尺寸', '1.2m（4英尺）床', null, null, null, null, '105', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('c527804ae3624363ba5a515c7b4025ca', '6905691162b5441b8478ec690ff82f48', '颜色', '仙人柱', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '135', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('c83225eb1a154e50a23b4f3b4d317390', 'e9499637c3274180bc9f65672c20b3ef', '颜色', '红色', null, null, null, null, null, null, '99', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('c8c8f72f2be54ec6aaa478938844e0cb', '69e62fd1cddd4c21a361dab35c95d876', '尺寸', '1.2m(4英尺)床', null, null, null, null, null, null, '299', '2', '0', '0', null);
INSERT INTO `goods_price` VALUES ('cbc1aae97cd745819f6686c9a8131aed', 'efe9eff2ae714c178eeb42694b9ed8bc', '颜色', '圆点-黄', '尺寸', '1.2m（4英尺）床', null, null, null, null, '105', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('cfeee2c9fc5340dca84fc120bea65100', 'cba6a78c36a84acd83694f7d49cdc018', '颜色', '圆点-黄', '尺寸', '1.5m（5英尺）床', null, null, null, null, '115', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('d0a0301ed11644758920914323ff7a77', '8dbde8746b2d4f87885ad5b54c3e3138', '颜色', '黑白森林', '尺寸', '1.5m（5英尺）床', null, null, null, null, '200', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('d570083e087548cfa4b6440ceb494d14', 'ad7ea1b7a1ea4987812a44982807e7f9', '颜色', '圆点-黄', '尺寸', '1.5m（5英尺）床', null, null, null, null, '115', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('d57e03cd8c9e4b39b81f43b91f6d7f54', 'efe9eff2ae714c178eeb42694b9ed8bc', '颜色', '圆点-黄', '尺寸', '2.0m（6.6英尺）床', null, null, null, null, '125', '0', '100', '0', null);
INSERT INTO `goods_price` VALUES ('d8f22001654a4977b1194a8b055b1dbc', 'da138698466645eaad5e882fd8ea40d0', '颜色', null, '尺寸', '1.0m(3.3英尺)床', null, null, null, null, '180', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('dc34bb1899134770a51cbe45e505db23', '2fdfb2947eca449492fe32cb86f80a5a', '颜色', null, '尺寸', '1.2m(4英尺)床', null, null, null, null, '299', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('e28b2f10848a4b6183760369fcc9446f', 'b0eaa34896354ea7aa73b9995d9c0c54', '尺寸', '1.0m(3.3英尺)床', '颜色', '红色', null, null, null, null, '12', '1', '100', '0', null);
INSERT INTO `goods_price` VALUES ('e946ec5559fb462e91bd0d8d6abd6b09', 'fb9043f5abba407f9f8d6811ef6b51a9', '尺寸', '1.0m(3.3英尺)床', null, null, null, null, null, null, '180', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('eb5dbb101d0c41059358d4cbfa1634e0', '2fdfb2947eca449492fe32cb86f80a5a', '颜色', null, '尺寸', '1.0m(3.3英尺)床', null, null, null, null, '199', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('ec835af97d0b4d5a94d44c2d7b37a1c2', '89a6cb44432f4241b59c34e11abae394', '尺寸', '1.2m(4英尺)床', null, null, null, null, null, null, '185', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('f74fe93e70404f159a47c19bb4c9dd32', 'd9ff50bdee9840f9afcbfcdbf928b096', '尺寸', '1.2m(4英尺)床', null, null, null, null, null, null, '350', '0', '0', '0', null);
INSERT INTO `goods_price` VALUES ('fd1f70642d05474e95007a1c5b7ce06b', 'b5280b15e05a4ab48688b2d44c459e67', '颜色', null, '尺寸', '1.0m(3.3英尺)床', null, null, null, null, '199', '0', '0', '0', null);

-- ----------------------------
-- Table structure for goods_sort
-- ----------------------------
DROP TABLE IF EXISTS `goods_sort`;
CREATE TABLE `goods_sort` (
  `SORT_NO` char(32) NOT NULL,
  `SORT_CODE` varchar(50) DEFAULT NULL,
  `SORT_NAME` varchar(50) DEFAULT NULL,
  `SORT_ORDER` int(10) DEFAULT NULL,
  `ON_USE` int(10) DEFAULT NULL,
  `TB_CODE` varchar(50) DEFAULT NULL,
  `JD_CODE` varchar(50) DEFAULT NULL,
  `PARENT_NO` char(32) DEFAULT NULL,
  `SHOW_INDEX` int(10) DEFAULT NULL,
  PRIMARY KEY (`SORT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sort
-- ----------------------------
INSERT INTO `goods_sort` VALUES ('001260b9cd774600beec002859dcba4f', '50019378', '广告毛巾/礼品毛巾', '110', '1', '50019378', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('01f88ec7b3d24fc1b47d858159b0a018', '121364047', '婴童床单', '91', '1', '', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('0442f8dedeb24158ae44867feed580b8', '6', '居家日用', '6', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('064af37bfd564219b9b5401b7a7c69e4', '11', '户外用品', '11', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('07700714a88b41c98cfbde4dbe727cb8', '126046001', '羽绒/羽毛被', '32', '1', '126046001', '', '633d35b6f3324a6eacfd763c0b2bc0bd', '0');
INSERT INTO `goods_sort` VALUES ('0b4ec39b3a1b4fd296286b1a41faee92', '121380009', '床盖', '22', '1', '121380009', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('0f0771f6bbdc4f52b041c8944894f5eb', '121368009', '抱被', '101', '1', '121368009', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('0f11bf6ecaae47f3bb0f334cd60d5546', '126052001', '化纤被', '34', '1', '126052001', '', '633d35b6f3324a6eacfd763c0b2bc0bd', '0');
INSERT INTO `goods_sort` VALUES ('196a3f20a69c4d0ab536b50402f36170', '122970005', '电热毯', '52', '1', '122970005', '', '6cf602e283fa4387b49fdc944f4ea9ed', '0');
INSERT INTO `goods_sort` VALUES ('1fb46ecc25b84b438a4d2185e381019d', '12', '汽车用品/内饰品', '12', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('2a8bd484094445bfabbaa4230bec94b1', '50008248', '婴童/儿童三件套', '94', '1', '50008248', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('306432bcbabe48b3a941388303dde9f1', '121386009', '床幔', '23', '1', '121386009', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('30eb22238f784db9a0150eec5ffc6bce', '126050001', '蚕丝被', '31', '1', '126050001', '', '633d35b6f3324a6eacfd763c0b2bc0bd', '0');
INSERT INTO `goods_sort` VALUES ('36fe66cdc5c142b089e388ee9e1682db', '73', '地垫', '73', '1', '', '', '76d6bf8f6eb244ec874b9d661206920a', '0');
INSERT INTO `goods_sort` VALUES ('388ae280ec794429aab5c6bdb48506de', '63', '浴巾/浴衣', '63', '1', '', '', '0442f8dedeb24158ae44867feed580b8', '0');
INSERT INTO `goods_sort` VALUES ('3c1d7e44695b433092faaff3312a156f', '50000512', '婴童/儿童四件套', '91', '1', '50000512', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('3d52746083334421b9c91ad0420dfa19', '290903', '四件套/多件套', '106', '1', '290903', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('412794e9118b495283c89e9e4cf4e55a', '121458010', '床单', '14', '1', '121458010', '', 'fe41a33250364e33ba295054d6d59d30', '0');
INSERT INTO `goods_sort` VALUES ('47cd6d2bddee46989eccece2e6afb1c2', '74', '成品窗帘', '74', '1', '', '', '76d6bf8f6eb244ec874b9d661206920a', '0');
INSERT INTO `goods_sort` VALUES ('4b798336d2d14767ade13db4e31b9875', '50008565', '功能床垫', '42', '1', '50008565', '', '71abf97f91b64ac89c4c97fbbb1914ee', '0');
INSERT INTO `goods_sort` VALUES ('4c2d3af88bb34783a19e9fcc087e1a36', '50008093', '床罩', '104', '1', '50008093', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('4e2965f875334878a5d1cbfb721daf55', '121418011', '毯子', '98', '1', '121418011', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('54ec8e3c4ae44bc0b203b45878ec1994', '50008262', '床单', '103', '1', '50008262', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('57c074948891423796e8af8b0fd2c04e', '50008249', '婴童蚊帐', '97', '1', '50008249', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('5bb4f1cacfb0491ba62e87e9be90c99a', '8', '枕头/枕芯/保健枕/颈椎枕', '8', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('633d35b6f3324a6eacfd763c0b2bc0bd', '50010825', '被子', '3', '1', '50010825', '', '', '1');
INSERT INTO `goods_sort` VALUES ('658de72d07af4fb69684426cdc871505', '50008246', '凉席/竹席/藤席/草席/牛皮席', '21', '1', '50008246', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('69924ecde6324896b2a696bc60e92c3b', '121404045', '婴童被套', '93', '1', '121404045', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('6cf602e283fa4387b49fdc944f4ea9ed', '5', '毛毯', '5', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('6e458e62c256494da2e7a1677638ad21', '50022514', '睡袋', '111', '1', '50022514', '', '064af37bfd564219b9b5401b7a7c69e4', '0');
INSERT INTO `goods_sort` VALUES ('71abf97f91b64ac89c4c97fbbb1914ee', '4', '床垫/床褥/床护垫', '4', '1', '', '', '', '1');
INSERT INTO `goods_sort` VALUES ('74e738d765d1463f8f0e468e9a3335bd', '50008261', '靠垫', '105', '1', '50008261', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('764377408add45179b13ccb171abe850', '126054001', '棉花被', '35', '1', '126054001', '', '633d35b6f3324a6eacfd763c0b2bc0bd', '0');
INSERT INTO `goods_sort` VALUES ('76d6bf8f6eb244ec874b9d661206920a', '7', '居家布艺', '7', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('7a9d6ff3254446d68eb8a4ee4b37f5d4', '50019374', '凉席', '107', '1', '50019374', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('7c350e7d02544ceda8118b59d43d8083', '121452006', '蚊帐', '27', '1', '121452006', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('8035799376cf4296aa3a41bbbf6de863', '121414009', '床裙', '26', '1', '121414009', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('8e3a37dee7bb4698ad0645a82e461ed8', '50019372', '婴童睡袋/防踢被', '99', '1', '50019372', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('95a6aa4b43d749099856a9ae5e5ba769', '50008565', '普通床垫', '41', '1', '50008565', '', '71abf97f91b64ac89c4c97fbbb1914ee', '0');
INSERT INTO `goods_sort` VALUES ('963b0e01e68d497da6ba72c28268a850', '50008251', '婴童枕头/枕芯', '95', '1', '50008251', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('98c316e7397e4158ae718bb8b388535b', '121482007', '床罩', '25', '1', '121482007', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('9928b6aa173e4ed1a8a895815b2043a3', '50008264', '枕套', '101', '1', '50008264', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('9deea0e47e95409bb54861350eee0b3f', '126048001', '羊毛被/驼毛被', '33', '1', '126048001', '', '633d35b6f3324a6eacfd763c0b2bc0bd', '0');
INSERT INTO `goods_sort` VALUES ('a30a4d1cacdd4caabd264fb959f6b7ea', '50013810', '床品配件', '28', '1', '50013810', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('a34a6d7695514f07a03e2db0e0ba9c3e', '50008263', '被套', '102', '1', '50008263', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('ad62a7570e55499d9587a0c1baa21798', '64', '毛巾', '64', '1', '', '', '0442f8dedeb24158ae44867feed580b8', '0');
INSERT INTO `goods_sort` VALUES ('adf8bad510724939a768830922f1c1e5', '50002777', '药材枕', '83', '1', '50002777', '', '5bb4f1cacfb0491ba62e87e9be90c99a', '0');
INSERT INTO `goods_sort` VALUES ('aebd186246954646a6566c8e6e1c3e73', '50008779', '四件套/多件套', '11', '1', '50008779', '', 'fe41a33250364e33ba295054d6d59d30', '1');
INSERT INTO `goods_sort` VALUES ('b248dcb68fc54f39bad227d9832d34a9', '50001865', '被套', '12', '1', '50001865', '', 'fe41a33250364e33ba295054d6d59d30', '0');
INSERT INTO `goods_sort` VALUES ('b34cf0c2c5ee4553babb5d8de575d903', '10', '床品定制', '10', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('b402ef7c14b64ccd8a51811a70b9595d', '50019376', '桌布/桌旗', '109', '1', '50019376', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('b7c0c7654726472f8b8c465005038959', '50019373', '床垫', '108', '1', '50019373', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('bde93bcbd82643bf95e5e46f20a33ff7', '71', '餐桌布', '71', '1', '', '', '76d6bf8f6eb244ec874b9d661206920a', '0');
INSERT INTO `goods_sort` VALUES ('bdf3af8304834972b4af55d5a58348c3', '2', '床上用品', '2', '1', '', '', '', '1');
INSERT INTO `goods_sort` VALUES ('bf734fac536041ea820ae6289b34c61c', '50017193', '婴童凉席', '96', '1', '50017193', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('c299c6707cd748468a28c5159d6f6d64', '50017192', '婴童多件套', '102', '1', '50017192', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('c490c29e716048df95a3729a9cc7a5ca', '50002777', '普通枕头', '81', '1', '50002777', '', '5bb4f1cacfb0491ba62e87e9be90c99a', '0');
INSERT INTO `goods_sort` VALUES ('d0479299a0284841b0f53753d6886e8c', '121434010', '枕巾', '61', '1', '121434010', '', '0442f8dedeb24158ae44867feed580b8', '0');
INSERT INTO `goods_sort` VALUES ('d992822decbf481f9e397526686e7b58', '112', '帐篷', '112', '1', '', '', '064af37bfd564219b9b5401b7a7c69e4', '0');
INSERT INTO `goods_sort` VALUES ('daa636e3bbc04a19994f78c7682197a9', '62', '拖鞋', '62', '1', '', '', '0442f8dedeb24158ae44867feed580b8', '0');
INSERT INTO `goods_sort` VALUES ('dbbaf1920db541f0a215f3fdbb42cca6', '9', '婴童用品', '9', '1', '', '', '', '0');
INSERT INTO `goods_sort` VALUES ('de01c887c9e94859ab224ee01986136f', '121', '通用座套', '121', '1', '', '', '1fb46ecc25b84b438a4d2185e381019d', '0');
INSERT INTO `goods_sort` VALUES ('eaa63d71a2bb4e6bb5b43c3e112dcc42', '50002777', '保健枕', '82', '1', '50002777', '', '5bb4f1cacfb0491ba62e87e9be90c99a', '0');
INSERT INTO `goods_sort` VALUES ('ec8e47bae76140e8b0a75b6e4fcc54c8', '121416008', '枕套', '13', '1', '121416008', '', 'fe41a33250364e33ba295054d6d59d30', '0');
INSERT INTO `goods_sort` VALUES ('f0bd30f577f64094ba879e3d2cbaa1bc', '50008565', '榻榻米床垫', '43', '1', '50008565', '', '71abf97f91b64ac89c4c97fbbb1914ee', '0');
INSERT INTO `goods_sort` VALUES ('f77c6aeb44b04f9aa8991a1446ea50d0', '50019370', '被子/被芯', '106', '1', '50019370', '', 'b34cf0c2c5ee4553babb5d8de575d903', '0');
INSERT INTO `goods_sort` VALUES ('f9d1976134e2468da3d26c2620d1ea60', '50001871', '休闲毯/毛毯/绒毯', '51', '1', '50001871', '', '6cf602e283fa4387b49fdc944f4ea9ed', '0');
INSERT INTO `goods_sort` VALUES ('fabc9b7439c84466a73399d82006eb81', '121394007', '床笠', '24', '1', '121394007', '', 'bdf3af8304834972b4af55d5a58348c3', '0');
INSERT INTO `goods_sort` VALUES ('fd0ada6710ae471a94528305018af3c1', '72', '沙发/座椅垫', '72', '1', '', '', '76d6bf8f6eb244ec874b9d661206920a', '0');
INSERT INTO `goods_sort` VALUES ('fdf5184a28cb48c884780fa777b5bffc', '121462014', '被子', '100', '1', '121462014', '', 'dbbaf1920db541f0a215f3fdbb42cca6', '0');
INSERT INTO `goods_sort` VALUES ('fe41a33250364e33ba295054d6d59d30', '1', '床品套件', '1', '1', '', '', '', '1');

-- ----------------------------
-- Table structure for goods_sort_property
-- ----------------------------
DROP TABLE IF EXISTS `goods_sort_property`;
CREATE TABLE `goods_sort_property` (
  `SORT_PRO_NO` char(32) NOT NULL,
  `SORT_NO` char(32) DEFAULT NULL,
  `SORT_PRO_NAME` varchar(50) DEFAULT NULL,
  `SORT_PRO_VALUE` varchar(50) DEFAULT NULL,
  `SORT_ORDER` int(10) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SORT_PRO_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sort_property
-- ----------------------------
INSERT INTO `goods_sort_property` VALUES ('10d0a0d52633440c8392410b2e771c61', '0442f8dedeb24158ae44867feed580b8', '尺码', '31', '1', null);
INSERT INTO `goods_sort_property` VALUES ('198ab28af7414096bf710f6adf575716', 'dbbaf1920db541f0a215f3fdbb42cca6', '颜色', '黄色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('1f41adc4a9384ab8b9fe4c867d5611d3', 'b34cf0c2c5ee4553babb5d8de575d903', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('23b705cb6acd4032922ce927b344af17', 'dbbaf1920db541f0a215f3fdbb42cca6', '参考身高', '48cm', '3', '');
INSERT INTO `goods_sort_property` VALUES ('2f41adc4a9384ab8b9fe4c867d5611d0', '0442f8dedeb24158ae44867feed580b8', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('2f41adc4a9384ab8b9fe4c867d5611d3', '5bb4f1cacfb0491ba62e87e9be90c99a', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('2f41adc4a9384ab8b9fe4c867d5611d4', '76d6bf8f6eb244ec874b9d661206920a', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('2f41adc4a9384ab8b9fe4c867d5611d8', '71abf97f91b64ac89c4c97fbbb1914ee', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('2feae4e386554f2d96b2afbca8162d6b', 'b34cf0c2c5ee4553babb5d8de575d903', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('34e3add2c02d4db69ad2ea3665db4c13', '0442f8dedeb24158ae44867feed580b8', '尺码', '34', '4', null);
INSERT INTO `goods_sort_property` VALUES ('3e4f576ac7f54bf98d4dd9f6f8e50e48', '0442f8dedeb24158ae44867feed580b8', '适用对象', '儿童', '3', null);
INSERT INTO `goods_sort_property` VALUES ('3f41adc4a9384ab8b9fe4c867d5611d4', '064af37bfd564219b9b5401b7a7c69e4', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('3fba02f5be2a455496e7bd86e439f118', 'dbbaf1920db541f0a215f3fdbb42cca6', '参考身高', '52cm', '4', '');
INSERT INTO `goods_sort_property` VALUES ('434a307ec3fc41a1a03854b70a18c379', '0442f8dedeb24158ae44867feed580b8', '尺码', '33', '3', null);
INSERT INTO `goods_sort_property` VALUES ('4b7ebcfbc99445a2a9bdbf5970545d19', 'dbbaf1920db541f0a215f3fdbb42cca6', '参考身高', '59cm', '1', '');
INSERT INTO `goods_sort_property` VALUES ('4feae4e386554f2d96b2afbca8162d6c', '064af37bfd564219b9b5401b7a7c69e4', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af12', '76d6bf8f6eb244ec874b9d661206920a', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af17', '76d6bf8f6eb244ec874b9d661206920a', '图案', '植物花卉', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af22', '5bb4f1cacfb0491ba62e87e9be90c99a', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af27', '5bb4f1cacfb0491ba62e87e9be90c99a', '填充物', '棉花', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af9b', 'fe41a33250364e33ba295054d6d59d30', '颜色', '黑色', '3', null);
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af9c', 'bdf3af8304834972b4af55d5a58348c3', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af9d', '633d35b6f3324a6eacfd763c0b2bc0bd', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af9e', '71abf97f91b64ac89c4c97fbbb1914ee', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('53b705cb6acd4032922ce927b344af9f', '6cf602e283fa4387b49fdc944f4ea9ed', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('5b380770d0b04dc3914bf0709994e420', 'dbbaf1920db541f0a215f3fdbb42cca6', '参考身高', '66cm', '5', '');
INSERT INTO `goods_sort_property` VALUES ('5f41adc4a9384ab8b9fe4c867d5611d8', '6cf602e283fa4387b49fdc944f4ea9ed', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('63345482e20844a1943fe2aa351c168a', '0442f8dedeb24158ae44867feed580b8', '颜色', '绿色', '2', null);
INSERT INTO `goods_sort_property` VALUES ('64c3fa988eac4ebabce1088dd13be907', '0442f8dedeb24158ae44867feed580b8', '适用对象', '男', '1', null);
INSERT INTO `goods_sort_property` VALUES ('67285df69de14f29b05b003bc91397e9', 'aebd186246954646a6566c8e6e1c3e73', '品牌', '红豆', '1', null);
INSERT INTO `goods_sort_property` VALUES ('698ab28af7414096bf710f6adf575721', 'dbbaf1920db541f0a215f3fdbb42cca6', '参考身高', '73cm', '2', '');
INSERT INTO `goods_sort_property` VALUES ('6cfb500c3cec4654ab4ca8bf920ab6c1', '0442f8dedeb24158ae44867feed580b8', '颜色', '蓝色', '1', null);
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f113', '76d6bf8f6eb244ec874b9d661206920a', '尺寸', '1.0m(3.3英尺)床', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f118', '76d6bf8f6eb244ec874b9d661206920a', '图案', '草', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f123', '5bb4f1cacfb0491ba62e87e9be90c99a', '颜色', '蓝色', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f128', '5bb4f1cacfb0491ba62e87e9be90c99a', '填充物', '乳胶', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f1cc', 'fe41a33250364e33ba295054d6d59d30', '尺寸', '1.0m(3.3英尺)床', '4', null);
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f1cd', 'bdf3af8304834972b4af55d5a58348c3', '尺寸', '1.0m(3.3英尺)床', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f1ce', '633d35b6f3324a6eacfd763c0b2bc0bd', '尺寸', '1.0m(3.3英尺)床', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f1cf', '71abf97f91b64ac89c4c97fbbb1914ee', '尺寸', '1.0m(3.3英尺)床', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6fba02f5be2a455496e7bd86e439f1cg', '6cf602e283fa4387b49fdc944f4ea9ed', '尺寸', '1.0m(3.3英尺)床', '4', '');
INSERT INTO `goods_sort_property` VALUES ('6feae4e386554f2d96b2afbca8162d6d', '6cf602e283fa4387b49fdc944f4ea9ed', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('73b705cb6acd4032922ce927b344af22', 'dbbaf1920db541f0a215f3fdbb42cca6', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d14', '76d6bf8f6eb244ec874b9d661206920a', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d19', '76d6bf8f6eb244ec874b9d661206920a', '图案', '叶子', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d1e', 'bdf3af8304834972b4af55d5a58348c3', '颜色', '红色33333', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d1f', 'fe41a33250364e33ba295054d6d59d30', '颜色', '红色', '1', null);
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d1g', '633d35b6f3324a6eacfd763c0b2bc0bd', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d1h', '71abf97f91b64ac89c4c97fbbb1914ee', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d1i', '6cf602e283fa4387b49fdc944f4ea9ed', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d24', '5bb4f1cacfb0491ba62e87e9be90c99a', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7b7ebcfbc99445a2a9bdbf5970545d29', '5bb4f1cacfb0491ba62e87e9be90c99a', '填充物', '竹炭', '1', '');
INSERT INTO `goods_sort_property` VALUES ('7f687866b3cc4a33932a57c0ee281622', '0442f8dedeb24158ae44867feed580b8', '适用对象', '女', '2', null);
INSERT INTO `goods_sort_property` VALUES ('8fba02f5be2a455496e7bd86e439f123', 'dbbaf1920db541f0a215f3fdbb42cca6', '颜色', '蓝色', '4', '');
INSERT INTO `goods_sort_property` VALUES ('9b7ebcfbc99445a2a9bdbf5970545d24', 'dbbaf1920db541f0a215f3fdbb42cca6', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('a1b705cb6acd4032922ce927b344af22', 'b34cf0c2c5ee4553babb5d8de575d903', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('a2ba02f5be2a455496e7bd86e439f123', 'b34cf0c2c5ee4553babb5d8de575d903', '颜色', '蓝色', '4', '');
INSERT INTO `goods_sort_property` VALUES ('a37ebcfbc99445a2a9bdbf5970545d24', 'b34cf0c2c5ee4553babb5d8de575d903', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('a4380770d0b04dc3914bf0709994e425', 'b34cf0c2c5ee4553babb5d8de575d903', '颜色', '黄色', '5', '');
INSERT INTO `goods_sort_property` VALUES ('a58ab28af7414096bf710f6adf575726', 'b34cf0c2c5ee4553babb5d8de575d903', '颜色', '绿色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('a6b705cb6acd4032922ce927b344af22', '07700714a88b41c98cfbde4dbe727cb8', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('a7ba02f5be2a455496e7bd86e439f123', '07700714a88b41c98cfbde4dbe727cb8', '颜色', '蓝色', '4', '');
INSERT INTO `goods_sort_property` VALUES ('a87ebcfbc99445a2a9bdbf5970545d24', '07700714a88b41c98cfbde4dbe727cb8', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('a9380770d0b04dc3914bf0709994e425', '07700714a88b41c98cfbde4dbe727cb8', '颜色', '黄色', '5', '');
INSERT INTO `goods_sort_property` VALUES ('aa8ab28af7414096bf710f6adf575726', '07700714a88b41c98cfbde4dbe727cb8', '颜色', '绿色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e415', '76d6bf8f6eb244ec874b9d661206920a', '尺寸', '1.2m(4英尺)床', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e420', '76d6bf8f6eb244ec874b9d661206920a', '图案', '条纹', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e425', '5bb4f1cacfb0491ba62e87e9be90c99a', '颜色', '黄色', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e426', 'dbbaf1920db541f0a215f3fdbb42cca6', '颜色', '黄色', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e430', '5bb4f1cacfb0491ba62e87e9be90c99a', '适用人数', '2人', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e44f', 'fe41a33250364e33ba295054d6d59d30', '尺寸', '1.2m(4英尺)床', '5', null);
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e44g', 'bdf3af8304834972b4af55d5a58348c3', '尺寸', '1.2m(4英尺)床', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e44h', '633d35b6f3324a6eacfd763c0b2bc0bd', '尺寸', '1.2m(4英尺)床', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e44i', '71abf97f91b64ac89c4c97fbbb1914ee', '尺寸', '1.2m(4英尺)床', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ab380770d0b04dc3914bf0709994e44j', '6cf602e283fa4387b49fdc944f4ea9ed', '尺寸', '1.2m(4英尺)床', '5', '');
INSERT INTO `goods_sort_property` VALUES ('abb705cb6acd4032922ce927b344af22', '1fb46ecc25b84b438a4d2185e381019d', '颜色', '黑色', '3', '');
INSERT INTO `goods_sort_property` VALUES ('acba02f5be2a455496e7bd86e439f123', '1fb46ecc25b84b438a4d2185e381019d', '颜色', '蓝色', '4', '');
INSERT INTO `goods_sort_property` VALUES ('ad7ebcfbc99445a2a9bdbf5970545d24', '1fb46ecc25b84b438a4d2185e381019d', '颜色', '红色', '1', '');
INSERT INTO `goods_sort_property` VALUES ('ae380770d0b04dc3914bf0709994e425', '1fb46ecc25b84b438a4d2185e381019d', '颜色', '黄色', '5', '');
INSERT INTO `goods_sort_property` VALUES ('af8ab28af7414096bf710f6adf575726', '1fb46ecc25b84b438a4d2185e381019d', '颜色', '绿色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('afeae4e386554f2d96b2afbca8162d6b', 'bdf3af8304834972b4af55d5a58348c3', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('agb705cb6acd4032922ce927b344af22', '1fb46ecc25b84b438a4d2185e381019d', '表面材质', '51%~60%', '3', '');
INSERT INTO `goods_sort_property` VALUES ('ahba02f5be2a455496e7bd86e439f123', '1fb46ecc25b84b438a4d2185e381019d', '表面材质', '71%~80%', '4', '');
INSERT INTO `goods_sort_property` VALUES ('ai7ebcfbc99445a2a9bdbf5970545d24', '1fb46ecc25b84b438a4d2185e381019d', '表面材质', '81%~90%', '1', '');
INSERT INTO `goods_sort_property` VALUES ('aj380770d0b04dc3914bf0709994e425', '1fb46ecc25b84b438a4d2185e381019d', '表面材质', '91%~100%', '5', '');
INSERT INTO `goods_sort_property` VALUES ('ak8ab28af7414096bf710f6adf575726', '1fb46ecc25b84b438a4d2185e381019d', '表面材质', '100%', '2', '');
INSERT INTO `goods_sort_property` VALUES ('b98ab28af7414096bf710f6adf575726', 'dbbaf1920db541f0a215f3fdbb42cca6', '安全等级', 'A类', '2', '');
INSERT INTO `goods_sort_property` VALUES ('bf41adc4a9384ab8b9fe4c867d5611d4', 'bdf3af8304834972b4af55d5a58348c3', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('c3b705cb6acd4032922ce927b344af27', 'dbbaf1920db541f0a215f3fdbb42cca6', '安全等级', 'B类', '3', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575716', '76d6bf8f6eb244ec874b9d661206920a', '颜色', '黄色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575721', '76d6bf8f6eb244ec874b9d661206920a', '图案', '格子', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575726', '5bb4f1cacfb0491ba62e87e9be90c99a', '填充物', '大豆纤维', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575731', '5bb4f1cacfb0491ba62e87e9be90c99a', '适用人数', '单人', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575761', 'fe41a33250364e33ba295054d6d59d30', '颜色', '黄色', '2', null);
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575762', 'bdf3af8304834972b4af55d5a58348c3', '颜色', '黄色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575763', '633d35b6f3324a6eacfd763c0b2bc0bd', '颜色', '黄色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575764', '71abf97f91b64ac89c4c97fbbb1914ee', '颜色', '黄色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('c98ab28af7414096bf710f6adf575765', '6cf602e283fa4387b49fdc944f4ea9ed', '颜色', '黄色', '2', '');
INSERT INTO `goods_sort_property` VALUES ('cfeae4e386554f2d96b2afbca8162d6c', 'dbbaf1920db541f0a215f3fdbb42cca6', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('df41adc4a9384ab8b9fe4c867d5611d8', 'dbbaf1920db541f0a215f3fdbb42cca6', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('dfba02f5be2a455496e7bd86e439f128', 'dbbaf1920db541f0a215f3fdbb42cca6', '安全等级', 'C类', '4', '');
INSERT INTO `goods_sort_property` VALUES ('dfeae4e386554f2d96b2afbca8162d6b', '5bb4f1cacfb0491ba62e87e9be90c99a', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('dfeae4e386554f2d96b2afbca8162d6c', '76d6bf8f6eb244ec874b9d661206920a', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('dfeae4e386554f2d96b2afbca8162d6d', '71abf97f91b64ac89c4c97fbbb1914ee', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('dfeae4e386554f2d96b2afbca8162d6f', '0442f8dedeb24158ae44867feed580b8', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('efeae4e386554f2d96b2afbca8162d6d', '1fb46ecc25b84b438a4d2185e381019d', '品牌', '品牌1', '1', '201705/203b8456-96b2-45e0-8de6-684f165728d6.jpg');
INSERT INTO `goods_sort_property` VALUES ('f0941bb93f56466095285e4a4e5a83dc', '0442f8dedeb24158ae44867feed580b8', '尺码', '32', '2', null);
INSERT INTO `goods_sort_property` VALUES ('fb7ebcfbc99445a2a9bdbf5970545d29', 'dbbaf1920db541f0a215f3fdbb42cca6', '安全等级', 'D类', '1', '');
INSERT INTO `goods_sort_property` VALUES ('fc1ee62dae5146bc8fac6b7c785339df', 'aebd186246954646a6566c8e6e1c3e73', '品牌', '白豆', '2', null);
INSERT INTO `goods_sort_property` VALUES ('fcaba29ea16e47e59682d581c7523cf2', '0442f8dedeb24158ae44867feed580b8', '颜色', '黑色', '3', null);
INSERT INTO `goods_sort_property` VALUES ('ff41adc4a9384ab8b9fe4c867d5611d0', '1fb46ecc25b84b438a4d2185e381019d', '品牌', '品牌2', '2', '201705/ed176b28-8574-4e6f-8048-96e2ac26b00e.jpg');
INSERT INTO `goods_sort_property` VALUES ('gb380770d0b04dc3914bf0709994e430', 'dbbaf1920db541f0a215f3fdbb42cca6', '适用性别', '男', '5', '');
INSERT INTO `goods_sort_property` VALUES ('h98ab28af7414096bf710f6adf575731', 'dbbaf1920db541f0a215f3fdbb42cca6', '适用性别', '女', '2', '');

-- ----------------------------
-- Table structure for good_comment_log
-- ----------------------------
DROP TABLE IF EXISTS `good_comment_log`;
CREATE TABLE `good_comment_log` (
  `COMMENT_NO` char(32) NOT NULL,
  `USER_ID` char(32) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `COMMENT_TITLE` varchar(50) DEFAULT NULL,
  `COMMENT_CONTENT` varchar(500) DEFAULT NULL,
  `COMMENT_GRADE` int(10) DEFAULT NULL,
  `GOODS_NO` char(32) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_comment_log
-- ----------------------------

-- ----------------------------
-- Table structure for receive_address
-- ----------------------------
DROP TABLE IF EXISTS `receive_address`;
CREATE TABLE `receive_address` (
  `ADDRESS_NO` char(32) NOT NULL,
  `ADDRESS_NAME` varchar(50) DEFAULT NULL,
  `ADDRESS_CONTENT` varchar(250) DEFAULT NULL,
  `ADDRESS_ORDER` int(10) DEFAULT NULL,
  `RECEIVER` varchar(50) DEFAULT NULL,
  `TEL` varchar(20) DEFAULT NULL,
  `REMARK` varchar(250) DEFAULT NULL,
  `USER_ID` char(32) DEFAULT NULL,
  `CREATE_USER` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receive_address
-- ----------------------------
INSERT INTO `receive_address` VALUES ('138ebd0ed225483789e8e2c355c913b8', null, '11', '1', '11', '11', null, '6c71530345bb43a598f649683da9faaa', 'destiny', '2017-05-08 14:16:16', null, '2017-05-08 14:16:16');
INSERT INTO `receive_address` VALUES ('337a19ca809848aea5e3c96c4c1ac1c0', null, '南通开发区', '0', '赵书娴', '13270680926', null, '6653035560d94f69a1b04cc193a6779f', '赵书娴', '2017-05-15 16:18:12', null, '2017-05-15 16:18:14');
INSERT INTO `receive_address` VALUES ('419d346785664bcaa11925de175da259', null, 'eeeeeeeeeeeeeeee', '1', 'eeeeee', 'eeeeeeeeeee', null, '46b9d83aff9e4376bf20053431465afd', '徐冬益', '2017-05-13 14:55:19', null, '2017-05-13 14:55:19');
INSERT INTO `receive_address` VALUES ('a3e8d3adee0947108b3379797fdb1630', null, 'eee', '1', 'eee', 'eee', null, '46b9d83aff9e4376bf20053431465afd', '徐冬益', '2017-05-13 14:55:34', null, '2017-05-13 14:55:34');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `SELLER_NO` char(32) NOT NULL,
  `SELLER_NAME` varchar(50) DEFAULT NULL,
  `SELLER_GRADE` int(10) DEFAULT NULL,
  `SELLER_STATUS` int(10) DEFAULT NULL,
  `SELLER_SORT` varchar(50) DEFAULT NULL,
  `SELLER_CONTENT` varchar(500) DEFAULT NULL,
  `SELLER_AREA` varchar(50) DEFAULT NULL,
  `SELLER_ADDRESS` varchar(255) DEFAULT NULL,
  `REPRESENTATIVE` varchar(50) DEFAULT NULL,
  `TEL` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ID_CARD` varchar(50) DEFAULT NULL,
  `CHECKED` int(10) DEFAULT NULL,
  `ATTENTION_COUNT` int(10) DEFAULT NULL,
  `GOOD_COUNT` int(10) DEFAULT NULL,
  `BAD_COUNT` int(10) DEFAULT NULL,
  `CREATE_USER` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `SELLER_ORDER` int(10) DEFAULT NULL,
  `TEMPLET_NO` varchar(255) DEFAULT NULL,
  `MAIN_PAGE_URL` varchar(255) DEFAULT NULL,
  `SELLER_IMG` varchar(50) DEFAULT NULL,
  `STR_SELLER` int(10) DEFAULT NULL,
  `qq1` varchar(20) DEFAULT NULL,
  `qq2` varchar(20) DEFAULT NULL,
  `qq3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SELLER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('04e8c21cbb6449899685c79fa188abd0', '罗邦家纺', '1', '0', 'A', '', '南通开发区', '南通市开发区', '张三丰', '13814608011', '9110530@qq.com', '3333', '0', '0', '0', '0', null, '2017-05-13 13:47:17', null, '2017-05-13 13:57:39', '0', null, 'http://www.baidu.com', '201705/2af8eea2-22cd-46a0-ab8d-597e30209d48.jpg', '0', '9110530', '784816599', '');
INSERT INTO `seller` VALUES ('d359e8b250dd47cdbe4187e187f07e9b', '测试商家', '1', '0', 'A', '', '南通开发区', '江苏南通', '徐冬益', '18551308728', '1922448115@qq.com', '11111111', '0', '0', '0', '0', null, '2017-05-07 12:26:59', null, '2018-03-31 08:51:06', '0', null, 'http://www.baidu.com', '201705/0d5e1ab9-6d5b-456e-a347-c5b421d6570d.jpg', '1', '', '', '');

-- ----------------------------
-- Table structure for seller_attention_log
-- ----------------------------
DROP TABLE IF EXISTS `seller_attention_log`;
CREATE TABLE `seller_attention_log` (
  `ATTENTION_NO` char(32) NOT NULL,
  `USER_ID` char(32) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `ATTENTION_STATUS` int(10) DEFAULT NULL,
  `SELLER_NO` char(32) DEFAULT NULL,
  PRIMARY KEY (`ATTENTION_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller_attention_log
-- ----------------------------
INSERT INTO `seller_attention_log` VALUES ('01dd7e36f1bc466889bf07429ce10d80', '1153b92cafcf45ccb4011d9c05360e48', null, '2017-05-15 19:37:24', '0', 'd359e8b250dd47cdbe4187e187f07e9b');
INSERT INTO `seller_attention_log` VALUES ('e41a536321c84c9b9f8e0f2ff052a97d', '1153b92cafcf45ccb4011d9c05360e48', null, '2017-05-15 19:45:02', '0', '04e8c21cbb6449899685c79fa188abd0');

-- ----------------------------
-- Table structure for seller_comment_log
-- ----------------------------
DROP TABLE IF EXISTS `seller_comment_log`;
CREATE TABLE `seller_comment_log` (
  `COMMENT_NO` char(32) NOT NULL,
  `USER_ID` char(32) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `COMMENT_TITLE` varchar(50) DEFAULT NULL,
  `COMMENT_CONTENT` varchar(500) DEFAULT NULL,
  `COMMENT_GRADE` int(10) DEFAULT NULL,
  `SELLER_NO` char(32) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller_comment_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `DIC_ID` char(15) NOT NULL,
  `DIC_SORT` varchar(150) DEFAULT NULL,
  `DIC_CODE` varchar(150) DEFAULT NULL,
  `DIC_KEY` varchar(150) DEFAULT NULL,
  `DIC_NAME` varchar(150) DEFAULT NULL,
  `DIC_TEXT` varchar(150) DEFAULT NULL,
  `DIC_VALUE` varchar(150) DEFAULT NULL,
  `SEQORDER` int(10) DEFAULT NULL,
  `STATUS` int(10) DEFAULT NULL,
  `PARENTID` char(15) DEFAULT NULL,
  PRIMARY KEY (`DIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('DIC201702280001', 'sort', '', '', '', '所属区域', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201702280004', 'region', '', '', '', '南通开发区', '南通开发区', '0', '1', 'DIC201702280001');
INSERT INTO `sys_dic` VALUES ('DIC201702280005', 'sort', '', '', '', '商家分类', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201702280006', 'sellerType', '', '', '', '私营独资企业', 'A', '0', '1', 'DIC201702280005');
INSERT INTO `sys_dic` VALUES ('DIC201703010001', 'sort', '', '', '', '性别', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703010002', 'sex', '', '', '', '男', '1', '0', '1', 'DIC201703010001');
INSERT INTO `sys_dic` VALUES ('DIC201703010003', 'sex', '', '', '', '女', '0', '1', '1', 'DIC201703010001');
INSERT INTO `sys_dic` VALUES ('DIC201703010005', 'sort', '', '', '', '用户角色', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703010006', 'userRole', '', '', '', '普通用户', '0', '0', '1', 'DIC201703010005');
INSERT INTO `sys_dic` VALUES ('DIC201703010007', 'userRole', '', '', '', '商户', '1', '0', '1', 'DIC201703010005');
INSERT INTO `sys_dic` VALUES ('DIC201703010008', 'userRole', '', '', '', '管理员', '2', '0', '1', 'DIC201703010005');
INSERT INTO `sys_dic` VALUES ('DIC201703010009', 'sellerType', '', '', '', '合资企业', 'B', '0', '1', 'DIC201702280005');
INSERT INTO `sys_dic` VALUES ('DIC201703080001', 'sort', '', '', '', '品牌', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703080002', 'brand', '', '', '', '罗莱家纺', '罗莱家纺', '0', '1', 'DIC201703080001');
INSERT INTO `sys_dic` VALUES ('DIC201703080003', 'brand', '', '', '', '依恋', '依恋', '0', '1', 'DIC201703080001');
INSERT INTO `sys_dic` VALUES ('DIC201703080004', 'sort', '', '', '', '商品分类', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703080005', 'sortNo', '', '', '', '家纺', '1', '0', '1', 'DIC201703080004');
INSERT INTO `sys_dic` VALUES ('DIC201703080006', 'sortNo', '', '', '', '纺织', '2', '0', '1', 'DIC201703080004');
INSERT INTO `sys_dic` VALUES ('DIC201703080007', 'sort', '', '', '', '商品状态', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703080008', 'onShelve', '', '', '', '上架', '0', '0', '1', 'DIC201703080007');
INSERT INTO `sys_dic` VALUES ('DIC201703080009', 'onShelve', '', '', '', '下架', '1', '0', '1', 'DIC201703080007');
INSERT INTO `sys_dic` VALUES ('DIC201703080010', 'sort', '', '', '', '商城分类', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703080011', 'shopSort', '', '', '', '商城一', '商城一', '0', '1', 'DIC201703080010');
INSERT INTO `sys_dic` VALUES ('DIC201703080012', 'shopSort', '', '', '', '商城二', '商城二', '0', '1', 'DIC201703080010');
INSERT INTO `sys_dic` VALUES ('DIC201703110001', 'sort', '', '', '', '评论等级', '', '0', '1', 'DIC000100010001');
INSERT INTO `sys_dic` VALUES ('DIC201703110002', 'grade', '', '', '', '好评', '1', '0', '1', 'DIC201703110001');
INSERT INTO `sys_dic` VALUES ('DIC201703110003', 'grade', '', '', '', '差评', '2', '0', '1', 'DIC201703110001');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` char(32) NOT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `LOGIN_NAME` varchar(50) DEFAULT NULL,
  `NICK_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TEL` varchar(50) DEFAULT NULL,
  `TEL_CHECKED` int(10) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `USER_GRADE` varchar(20) DEFAULT NULL,
  `SEX` int(10) DEFAULT NULL,
  `AGE` int(10) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `ID_CARD` varchar(20) DEFAULT NULL,
  `USER_AREA` varchar(50) DEFAULT NULL,
  `USER_ADDRESS` varchar(255) DEFAULT NULL,
  `USER_STATUS` int(10) DEFAULT NULL,
  `SELLER_NO` char(32) DEFAULT NULL,
  `CREATE_USER` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `LOGIN_COUNT` int(10) DEFAULT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `USER_ROLER` int(10) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1153b92cafcf45ccb4011d9c05360e48', '徐冬益', 'xudongyi', null, '1922448115@qq.com', '18551308728', '0', '123456', null, '0', '0', null, null, null, null, '1', null, null, '2017-05-07 14:34:09', null, '2017-05-15 19:37:02', '5', '2017-05-15 19:37:02', '0');
INSERT INTO `user` VALUES ('18345496b3d14b31abce9c2653a7f024', '管理员', 'admin', '', '123@qq.com', '12345678', '12345678', '123456', '1', '1', '12', '2017-03-01 20:45:12', '320909876381721', '江苏南通', '南通开发区吉祥岛', '1', '18345496b3d14b31abce9c2653a7f023', 'admin', '2017-03-01 20:46:25', 'admin', '2017-03-01 20:46:32', '0', '2017-03-01 20:46:40', '2');
INSERT INTO `user` VALUES ('46b9d83aff9e4376bf20053431465afd', '徐冬益', 'test', null, '1922448115@qq.com', '18551308728', '0', '123456', null, '0', '0', null, null, null, null, '1', null, null, '2017-05-07 20:03:14', null, '2017-08-26 15:04:02', '6', '2017-08-26 15:04:02', '0');
INSERT INTO `user` VALUES ('55a1e5ed4af64473b7ec19468537ac75', '徐冬益', 'shop', null, '1922448115@qq.com', '18551308728', '0', '123456', null, '0', '0', null, null, null, null, '1', 'd359e8b250dd47cdbe4187e187f07e9b', null, '2017-05-07 12:26:59', null, '2017-05-13 15:10:43', '3', '2017-05-13 15:10:43', '1');
INSERT INTO `user` VALUES ('56b9388b421d4dd0a0ba19387e3afaae', '冯健', 'fgg047', null, '9110530@qq.com', '13814608011', '0', '811260', null, '0', '0', null, null, null, null, '1', '04e8c21cbb6449899685c79fa188abd0', null, '2017-05-13 13:47:17', null, '2017-05-13 13:47:17', '0', null, '1');
INSERT INTO `user` VALUES ('6653035560d94f69a1b04cc193a6779f', '赵书娴', 'zhaoshuxian', null, '332145073@qq.com', '13270680926', '0', '123qwe', null, '0', '0', null, null, null, null, '1', null, null, '2017-05-15 09:10:31', null, '2017-05-15 10:37:50', '3', '2017-05-15 10:37:50', '0');
INSERT INTO `user` VALUES ('73159c80d05b45ffb1798921f2f97031', '陈凯', 'yayazaixian', null, '299055979@qq.com', '', '0', 'yayazaixian', null, '0', '0', null, null, null, null, '1', null, null, '2017-05-13 13:24:24', null, '2017-05-13 13:24:45', '1', '2017-05-13 13:24:45', '0');
INSERT INTO `user` VALUES ('81d0c8adf85441d48601f13dd2587d08', 'fff', '123456', null, '9110503@qq.com', '13814608011', '0', '123456', null, '0', '0', null, null, null, null, '1', null, null, '2017-05-13 15:14:14', null, '2017-05-13 15:14:40', '1', '2017-05-13 15:14:40', '0');
