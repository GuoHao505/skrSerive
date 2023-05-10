/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50731 (5.7.31-log)
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50731 (5.7.31-log)
 File Encoding         : 65001

 Date: 10/05/2023 15:29:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_backstock
-- ----------------------------
DROP TABLE IF EXISTS `t_backstock`;
CREATE TABLE `t_backstock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `create_time` bigint(20) NOT NULL COMMENT '申请退款时间',
  `update_time` bigint(20) NOT NULL COMMENT '操作时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '1.待处理，2.处理中，3.完成',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退货原因',
  `money` int(11) NOT NULL COMMENT '退款',
  `imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '凭证图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_backstock_order`(`order_id`) USING BTREE,
  CONSTRAINT `fk_backstock_order` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_backstock
-- ----------------------------

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `letter` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_name`(`name`) USING BTREE,
  INDEX `idx_letter`(`letter`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES (1, '安踏', 'https://img.fishfay.com/theme/images/logo/logo-anta-r-02.svg', 'a');
INSERT INTO `t_brand` VALUES (2, '李宁', 'https://www.lining.com/images/logo-lining-nav2.png', 'l');

-- ----------------------------
-- Table structure for t_brand_category
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_category`;
CREATE TABLE `t_brand_category`  (
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  PRIMARY KEY (`category_id`, `brand_id`) USING BTREE,
  INDEX `t_bc_brand`(`brand_id`) USING BTREE,
  CONSTRAINT `t_bc_brand` FOREIGN KEY (`brand_id`) REFERENCES `t_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_bc_category` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌和分类映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_brand_category
-- ----------------------------
INSERT INTO `t_brand_category` VALUES (139, 1);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `parent_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级分类名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排名指数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categoryName`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1792 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (139, '硫化鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (140, '板鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (141, '跑鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (142, '休闲鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (143, '综训鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (144, '沙滩凉鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (145, '篮球鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (146, '拖鞋', '鞋类', NULL);
INSERT INTO `t_category` VALUES (147, '休闲上衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (148, '短袖针织衫', '服饰', NULL);
INSERT INTO `t_category` VALUES (149, '中袖针织衫', '服饰', NULL);
INSERT INTO `t_category` VALUES (150, '梭织休闲长裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (151, '梭织运动长裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (152, '运动背心', '服饰', NULL);
INSERT INTO `t_category` VALUES (153, '运动BRA', '服饰', NULL);
INSERT INTO `t_category` VALUES (154, '针织短裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (155, '针织运动上衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (156, '单风衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (157, '梭织九分裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (158, '单茄克', '服饰', NULL);
INSERT INTO `t_category` VALUES (159, '连帽针织运动上衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (160, '针织九分裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (161, '针织运动长裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (162, '套头卫衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (163, '连帽卫衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (164, '梭织运动上衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (165, '梭织短裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (166, '连衣裙', '服饰', NULL);
INSERT INTO `t_category` VALUES (167, '半身裙', '服饰', NULL);
INSERT INTO `t_category` VALUES (168, '长羽绒服', '服饰', NULL);
INSERT INTO `t_category` VALUES (169, '中长单风衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (170, '梭织休闲九分裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (171, '梭织上衣', '服饰', NULL);
INSERT INTO `t_category` VALUES (172, '长袖针织衫', '服饰', NULL);
INSERT INTO `t_category` VALUES (173, '运动内裤', '配件', NULL);
INSERT INTO `t_category` VALUES (174, '篮球比赛套', '配件', NULL);
INSERT INTO `t_category` VALUES (175, '针织八分裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (176, '比赛短裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (177, '梭织五分裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (178, '双肩背包', '配件', NULL);
INSERT INTO `t_category` VALUES (179, '太阳帽', '配件', NULL);
INSERT INTO `t_category` VALUES (180, '篮球', '配件', NULL);
INSERT INTO `t_category` VALUES (182, '毛圈长袜', '配件', NULL);
INSERT INTO `t_category` VALUES (183, '胸包', '配件', NULL);
INSERT INTO `t_category` VALUES (184, '腰包', '配件', NULL);
INSERT INTO `t_category` VALUES (185, '平板船袜', '配件', NULL);
INSERT INTO `t_category` VALUES (186, '小挎包', '配件', NULL);
INSERT INTO `t_category` VALUES (187, '平板长袜', '配件', NULL);
INSERT INTO `t_category` VALUES (188, '渔夫帽', '配件', NULL);
INSERT INTO `t_category` VALUES (189, '护膝', '配件', NULL);
INSERT INTO `t_category` VALUES (190, '针织短袖衫', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (192, '针织连衣裙', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (194, '针织七分裤', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (196, '套头衫', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (198, '针织半身裙', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (201, '梭织七分裤', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (204, '丝光绒运动上衣', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (207, '运动裤两件套', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (210, '两件套上衣', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (212, '短袜', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (214, '针织裙裤', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (215, '滑雪棉风衣', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (218, '运动内裤组合装', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (219, '棒球帽', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (220, '连裤袜', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (221, '连帽套头卫衣', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (223, '羽绒服', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (224, '棉服', '儿童专区', NULL);
INSERT INTO `t_category` VALUES (225, '男短袖针织衫', '服饰', NULL);
INSERT INTO `t_category` VALUES (226, '女短袖针织衫', '服饰', NULL);
INSERT INTO `t_category` VALUES (227, '男针织五分裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (228, '女针织短裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (229, '女梭织运动长裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (230, '男针织运动长裤', '服饰', NULL);
INSERT INTO `t_category` VALUES (231, '男梭织五分裤', '服饰', NULL);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `create_time` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `last_update_time` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '最后修改时间',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_username`(`username`) USING BTREE,
  INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (34, 'zgh', '111', '472365411@qq.com', '111', '2023-04-10 09:45:36', '2023-04-10 10:23:42', '123', 'https://gd-hbimg.huaban.com/2162de6e8b7028cd1c1fd1db21e29ba5143942684014-ZSjScx_fw1200webp', 'admin');
INSERT INTO `t_customer` VALUES (38, 'zgh1', '11', '11', '11', '2023-04-10 11:53:12', NULL, '11', '11', NULL);

-- ----------------------------
-- Table structure for t_customer_address
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_address`;
CREATE TABLE `t_customer_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人名字',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `prime` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是默认地址1.为默认地址',
  `address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_cma_cm` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer_voucher
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_voucher`;
CREATE TABLE `t_customer_voucher`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `voucher_id` int(11) NOT NULL COMMENT '优惠券',
  PRIMARY KEY (`customer_id`, `voucher_id`) USING BTREE,
  INDEX `fk_cv_voucher`(`voucher_id`) USING BTREE,
  CONSTRAINT `fk_cv_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cv_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `t_voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户优惠券映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for t_delivery
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery`;
CREATE TABLE `t_delivery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `postid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递单号',
  `ecp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货的地址',
  `create_time` bigint(20) NOT NULL COMMENT '添加时间',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '该快递是否结束',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_order_id`(`order_id`) USING BTREE,
  INDEX `idx_postid`(`postid`) USING BTREE,
  INDEX `idx_address`(`address`) USING BTREE,
  INDEX `idx_ecp`(`ecp`) USING BTREE,
  INDEX `fk_dev_order`(`order_id`) USING BTREE,
  INDEX `is_delete`(`is_delete`) USING BTREE,
  CONSTRAINT `fk_dev_order` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺和分类映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for t_last_session
-- ----------------------------
DROP TABLE IF EXISTS `t_last_session`;
CREATE TABLE `t_last_session`  (
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `customer_id` int(11) NOT NULL COMMENT '用户id',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后一条消息',
  `create_time` bigint(20) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`store_id`, `customer_id`) USING BTREE,
  INDEX `fk_customer_ls`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_customer_ls` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_store_ls` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_last_session
-- ----------------------------

-- ----------------------------
-- Table structure for t_miaosha
-- ----------------------------
DROP TABLE IF EXISTS `t_miaosha`;
CREATE TABLE `t_miaosha`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spu_id` int(11) NOT NULL COMMENT '产品id',
  `star_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NOT NULL COMMENT '结束时间',
  `active_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '秒杀活动标题',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_spu_id`(`spu_id`) USING BTREE,
  CONSTRAINT `fk_miaosha_spu` FOREIGN KEY (`spu_id`) REFERENCES `t_spu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '产品秒杀表\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_miaosha
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单流水号',
  `store_id` int(11) NOT NULL COMMENT '商店id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `money` decimal(10, 2) NOT NULL COMMENT '总价格',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0待支付，1.代发货，2.已发货，3.已完成',
  `payment_type` tinyint(1) NULL DEFAULT 1 COMMENT '1.微信，2.支付宝',
  `postage` decimal(10, 2) NULL DEFAULT NULL COMMENT '邮费',
  `is_normal` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否为有效订单',
  `create_time` bigint(20) UNSIGNED ZEROFILL NOT NULL COMMENT '创建时间',
  `update_time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_code`(`code`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_store_id`(`store_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_normal`(`is_normal`) USING BTREE,
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_store` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 652 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `sku_id` int(11) NOT NULL COMMENT '商品id',
  `price` decimal(10, 2) NOT NULL COMMENT '原价格',
  `actual_price` decimal(10, 2) NOT NULL COMMENT '实际购买价格',
  `num` int(11) NOT NULL COMMENT '购物数量',
  PRIMARY KEY (`order_id`, `sku_id`) USING BTREE,
  INDEX `idx_sku`(`sku_id`) USING BTREE,
  INDEX `idx_order`(`order_id`) USING BTREE,
  CONSTRAINT `fk_detail_order` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_sku` FOREIGN KEY (`sku_id`) REFERENCES `t_sku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_rating
-- ----------------------------
DROP TABLE IF EXISTS `t_rating`;
CREATE TABLE `t_rating`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `sku_id` int(11) NOT NULL COMMENT '产品id',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '晒图',
  `rating` tinyint(4) NOT NULL COMMENT '评分',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家评论',
  `create_time` bigint(20) NOT NULL COMMENT '评价时间',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `parent_comment` int(11) NULL DEFAULT NULL COMMENT '父级评论',
  `customer_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_spu_id`(`sku_id`) USING BTREE,
  INDEX `idx_store_id`(`store_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_rating_store` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ration_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分，评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_rating
-- ----------------------------

-- ----------------------------
-- Table structure for t_session
-- ----------------------------
DROP TABLE IF EXISTS `t_session`;
CREATE TABLE `t_session`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息',
  `customer_id` int(11) NOT NULL COMMENT '用户id',
  `store_id` int(11) NOT NULL COMMENT '商铺id',
  `client` tinyint(1) NOT NULL DEFAULT 1 COMMENT '该消息是否为用户消息1.是用户 0.是商家',
  `create_time` bigint(20) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_store_id`(`store_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `fk__session_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_session_store` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会话消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_session
-- ----------------------------

-- ----------------------------
-- Table structure for t_shopcar
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcar`;
CREATE TABLE `t_shopcar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NOT NULL COMMENT '用户id',
  `sku_id` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL COMMENT '商品',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `fk_shopcar_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shopcar_sku` FOREIGN KEY (`sku_id`) REFERENCES `t_sku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1626 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for t_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_sku`;
CREATE TABLE `t_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `spu_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `imgs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品图片',
  `price` decimal(10, 2) NOT NULL COMMENT '产品价格',
  `param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品参数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '添加时间',
  `last_update_time` bigint(20) NULL DEFAULT NULL COMMENT '最后更改时间',
  `stock` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品库存',
  `desc_pc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '电脑端商品详情',
  `desc_app` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端详情',
  `sale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销量',
  `special_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_spu_id`(`spu_id`) USING BTREE,
  INDEX `t_sku_sale`(`sale`) USING BTREE,
  INDEX `t_sku_sprice`(`special_price`) USING BTREE,
  FULLTEXT INDEX `param`(`param`),
  FULLTEXT INDEX `title`(`title`),
  CONSTRAINT `t_sku_sprice` FOREIGN KEY (`special_price`) REFERENCES `t_spu` (`special_price`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_sku_spu_id` FOREIGN KEY (`spu_id`) REFERENCES `t_spu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_sku
-- ----------------------------

-- ----------------------------
-- Table structure for t_spec_group
-- ----------------------------
DROP TABLE IF EXISTS `t_spec_group`;
CREATE TABLE `t_spec_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品类名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_spec_group
-- ----------------------------
INSERT INTO `t_spec_group` VALUES (110, '中袖针织衫');
INSERT INTO `t_spec_group` VALUES (108, '休闲上衣');
INSERT INTO `t_spec_group` VALUES (102, '休闲鞋');
INSERT INTO `t_spec_group` VALUES (107, '拖鞋');
INSERT INTO `t_spec_group` VALUES (105, '板鞋');
INSERT INTO `t_spec_group` VALUES (104, '沙滩凉鞋');
INSERT INTO `t_spec_group` VALUES (109, '短袖针织衫');
INSERT INTO `t_spec_group` VALUES (100, '硫化鞋');
INSERT INTO `t_spec_group` VALUES (106, '篮球鞋');
INSERT INTO `t_spec_group` VALUES (103, '综训鞋');
INSERT INTO `t_spec_group` VALUES (101, '跑鞋');

-- ----------------------------
-- Table structure for t_spec_param
-- ----------------------------
DROP TABLE IF EXISTS `t_spec_param`;
CREATE TABLE `t_spec_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名称',
  `unit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `spg_id` int(11) NOT NULL COMMENT '品类编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_spg_id`(`spg_id`) USING BTREE,
  CONSTRAINT `fK_spp_spg` FOREIGN KEY (`spg_id`) REFERENCES `t_spec_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品类参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_spec_param
-- ----------------------------

-- ----------------------------
-- Table structure for t_spu
-- ----------------------------
DROP TABLE IF EXISTS `t_spu`;
CREATE TABLE `t_spu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `spg_id` int(11) NOT NULL COMMENT '品类id',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品图片',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `price` decimal(10, 2) NOT NULL COMMENT '产品价格',
  `special_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品优惠多少价格',
  `is_special` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是优惠商品还是秒杀商品1.优惠商品2.秒杀商品',
  `sales` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '销量',
  `verifyIndex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '除id之外的唯一值,用于查询',
  `stocks` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '商品库存',
  `views` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '访问量',
  `pays` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '支付量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_brand_id`(`brand_id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE,
  INDEX `idx_spg_id`(`spg_id`) USING BTREE,
  INDEX `idx_store`(`store_id`) USING BTREE,
  INDEX `sale`(`sales`) USING BTREE,
  INDEX `special_price`(`special_price`) USING BTREE,
  FULLTEXT INDEX `qu_title`(`title`),
  CONSTRAINT `fk_spu_category` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_spu_spg` FOREIGN KEY (`spg_id`) REFERENCES `t_spec_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_spu_store` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_spu
-- ----------------------------
INSERT INTO `t_spu` VALUES (1, '安踏可口可乐联名款女帆布鞋', 'Prof.', 1, 139, 102, 'https://img.fishfay.com/shopgoods/1/122028656/zt-122028656.jpg', 37, 788.47, 512.65, 95, 104, 'dKIrDCUVgc', 228, 25, 83, '2023-02-22 18:10:25', '2023-02-22 22:43:45');
INSERT INTO `t_spu` VALUES (2, '安踏女鞋星标系列星峦跑鞋', 'Prof.', 1, 141, 108, 'https://img.fishfay.com/shopgoods/4/122035518A/zt-122035518A.jpg', 92, 540.02, 163.23, 81, 107, 'wGRHfO3yLS', 68, 178, 11, '2023-04-14 21:15:48', '2023-04-02 07:04:54');
INSERT INTO `t_spu` VALUES (3, '安踏女鞋板鞋', 'Mrs.', 1, 140, 104, 'https://img.fishfay.com/shopgoods/4/122038046/zt-122038046/a592d4e6272ec490c804314118dba0b2.jpg', 18, 622.29, 671.07, 15, 199, 'zTl9i2EaXH', 23, 138, 11, '2023-03-27 05:51:35', '2023-03-12 20:43:20');
INSERT INTO `t_spu` VALUES (4, '安踏女鞋跑鞋', 'Ms.', 1, 141, 102, 'https://img.fishfay.com/shopgoods/4/122035576/zt-122035576/fdb3b8b5e91224a84ada800cf848487a.jpg', 84, 435.98, 972.56, 24, 113, 'tQ5rhMJYwT', 150, 155, 8, '2023-04-26 12:51:27', '2023-05-07 05:18:01');
INSERT INTO `t_spu` VALUES (5, '安踏女鞋休闲鞋老爹鞋', 'Mr.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/4/122038884/zt-122038884/70755ed46082192607eef697f756a5ef.jpg', 51, 181.58, 318.96, 123, 251, 'U9U1YBF0So', 88, 166, 153, '2023-04-06 15:03:14', '2023-04-03 04:30:36');
INSERT INTO `t_spu` VALUES (6, '安踏女鞋休闲鞋', 'Ms.', 1, 142, 108, 'https://img.fishfay.com/shopgoods/4/122038859/zt-122038859/3aa1e3fbf33c9038b4c1a4612fe12f49.jpg', 25, 10.82, 15.82, 127, 34, '1xHyf7C0ZM', 57, 254, 215, '2023-05-05 04:23:50', '2023-04-18 02:14:06');
INSERT INTO `t_spu` VALUES (7, '安踏女鞋综训鞋老爹鞋', 'Mrs.', 1, 143, 105, 'https://img.fishfay.com/shopgoods/4/122037766R/zt-122037766R/bbf4e1a9a1d1271e79311a250d61b5ca.jpg', 83, 146.45, 856.16, 58, 163, 'TneXjTMaOG', 137, 7, 104, '2023-04-10 12:00:22', '2023-01-21 11:36:40');
INSERT INTO `t_spu` VALUES (8, '安踏女鞋舒弹Edge跑鞋', 'Mrs.', 1, 141, 103, 'https://img.fishfay.com/shopgoods/4/122035589/zt-122035589/f5f2bf9ec264915cbb23f1bdbcab3745.jpg', 22, 333.40, 69.12, 75, 170, 'cQLhVMb5ga', 203, 135, 189, '2023-03-06 20:25:04', '2023-03-27 08:50:41');
INSERT INTO `t_spu` VALUES (9, '安踏女鞋硫化鞋休闲鞋', 'Prof.', 1, 139, 104, 'https://img.fishfay.com/shopgoods/1/122028613/zt-122028613/1d2eaea6577ae367c563a5a6e07ab5f4.jpg', 82, 635.73, 250.51, 91, 92, 'iKgi7ydwSB', 125, 200, 74, '2023-03-24 00:44:57', '2023-02-27 15:03:54');
INSERT INTO `t_spu` VALUES (10, '安踏女鞋bubble泡泡跑鞋', 'Ms.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/1/122025520/zt-122025520/ad845bbae2c29ebeab75a87efa070a85.jpg', 54, 179.35, 932.91, 25, 158, '91x2LxLIEP', 47, 16, 182, '2023-04-02 08:48:41', '2023-01-03 11:49:08');
INSERT INTO `t_spu` VALUES (11, '安踏女鞋氢跑二代跑鞋', 'Miss.', 1, 141, 109, 'https://img.fishfay.com/shopgoods/1/122025540/zt-122025540/0550bccd25454b081035a1109f076c67.jpg', 30, 98.82, 751.21, 13, 118, 'lqxQLCclD2', 253, 69, 50, '2023-03-22 06:15:21', '2023-03-13 18:14:26');
INSERT INTO `t_spu` VALUES (12, '安踏女鞋千禧冰河休闲鞋', 'Mr.', 1, 142, 101, 'https://img.fishfay.com/shopgoods/1/122028899/zt-122028899/b0fef3c07385ee4782acce93f0036a90.jpg', 48, 108.97, 48.89, 4, 36, '9pIDqgPuHN', 241, 242, 55, '2023-04-24 16:55:46', '2023-04-16 00:25:20');
INSERT INTO `t_spu` VALUES (13, '安踏女鞋休闲鞋', 'Prof.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/1/122028882/zt-122028882/6c91a7981c4b275db7553450d304aeb4.jpg', 101, 70.60, 781.95, 75, 92, 'LSHJnMmjr5', 197, 177, 194, '2023-02-25 05:40:53', '2023-01-28 19:12:22');
INSERT INTO `t_spu` VALUES (14, '安踏女鞋行者老爹鞋休闲鞋', 'Ms.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/1/122028889/zt-122028889/7df3070cd98e37ef5802fd70ab6c91d1.jpg', 27, 821.66, 699.28, 108, 21, 'iriopkV2dc', 60, 36, 127, '2023-04-26 16:02:58', '2023-03-16 14:52:52');
INSERT INTO `t_spu` VALUES (15, '安踏女鞋综训鞋', 'Mrs.', 1, 143, 104, 'https://img.fishfay.com/shopgoods/1/122027718/zt-122027718/876dffaca8b1fcd1d91f63858b024450.jpg', 63, 76.14, 778.35, 56, 127, 'GJ2SguR5E0', 95, 89, 45, '2023-04-25 10:38:37', '2023-04-15 18:20:53');
INSERT INTO `t_spu` VALUES (16, '安踏女鞋新霸道系列板鞋休闲鞋', 'Prof.', 1, 140, 102, 'https://img.fishfay.com/shopgoods/1/122028086/zt-122028086/6e2d85a7bd66e10f7a9b7a328de923e1.jpg', 12, 146.76, 295.28, 61, 146, 'b3oInQZGhS', 211, 192, 170, '2023-04-04 02:07:37', '2023-05-09 16:24:45');
INSERT INTO `t_spu` VALUES (17, '【凉拖】安踏女鞋凉鞋沙滩鞋', 'Ms.', 1, 144, 104, 'https://img.fishfay.com/shopgoods/1/122038523/zt-122038523/76a603c3d9286d7b4578e4b6fb73207c.jpg', 79, 703.43, 865.00, 41, 74, 'dHscLhVUeh', 41, 193, 207, '2023-02-22 02:27:54', '2023-01-16 22:57:24');
INSERT INTO `t_spu` VALUES (18, '女鞋跑鞋运动鞋', 'Mrs.', 1, 141, 109, 'https://img.fishfay.com/shopgoods/1/92715521/zt-92715521/3c1322fee6f4df11aefce340dd1bf2ee.jpg', 51, 765.60, 938.43, 25, 112, '1XSkZXfaOJ', 36, 251, 115, '2023-03-25 11:49:05', '2023-02-15 06:00:23');
INSERT INTO `t_spu` VALUES (19, '安踏女鞋跑鞋2021新款', 'Mrs.', 1, 141, 109, 'https://img.fishfay.com/shopgoods/4/122115586S/zt-122115586S/38c65c18133bdc0f99bd9e815d3061c4.jpg', 84, 850.45, 216.97, 5, 119, '6mR16oCf8q', 44, 118, 214, '2023-02-11 23:55:35', '2023-02-05 10:59:59');
INSERT INTO `t_spu` VALUES (20, '安踏女鞋不羁休闲鞋2021新款', 'Mr.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/1/122128867/zt-122128867/0862f039a7cf079cfca35d0ea17565be.jpg', 12, 309.29, 402.13, 70, 112, 'SH2q6vlo4p', 104, 96, 210, '2023-04-07 19:09:45', '2023-03-22 12:20:52');
INSERT INTO `t_spu` VALUES (21, '安踏女鞋板鞋小白鞋2021新款', 'Ms.', 1, 140, 104, 'https://img.fishfay.com/shopgoods/4/122118065/zt-122118065/18d911365d469315dcead2b752b968bb.jpg', 64, 978.63, 17.84, 114, 5, 'v3dDS49Tn9', 127, 62, 16, '2023-03-29 20:49:13', '2023-04-17 12:48:22');
INSERT INTO `t_spu` VALUES (22, '安踏女鞋板鞋小白鞋2021新款', 'Ms.', 1, 140, 108, 'https://img.fishfay.com/shopgoods/4/122118060/zt-122118060/a193ecf0d7e349e96119e91738001e1f.jpg', 50, 488.11, 766.99, 7, 56, 'HqrFI26gaX', 67, 166, 192, '2023-03-13 20:32:19', '2023-01-28 15:54:04');
INSERT INTO `t_spu` VALUES (23, '安踏女鞋跑鞋2021新款', 'Miss.', 1, 141, 110, 'https://img.fishfay.com/shopgoods/4/122115577/zt-122115577/c7ae42a88326f001320eef573aca0983.jpg', 55, 281.11, 120.54, 64, 129, 'xNI6BcytqP', 160, 197, 147, '2023-04-20 16:30:47', '2023-02-18 20:29:24');
INSERT INTO `t_spu` VALUES (24, '安踏女鞋天行板鞋老爹鞋2021新款', 'Miss.', 1, 140, 110, 'https://img.fishfay.com/shopgoods/4/122118041/zt-122118041/2e9cc3fe8e5246440548bbc5cba4115b.jpg', 34, 750.35, 358.43, 127, 147, 'C7o3840KSG', 219, 229, 236, '2023-04-02 18:01:17', '2023-05-05 15:11:17');
INSERT INTO `t_spu` VALUES (25, '安踏女鞋拒绝平庸休闲鞋2021新款', 'Mr.', 1, 142, 103, 'https://img.fishfay.com/shopgoods/4/122118809/zt-122118809/8537dbdd3620f8d651a44143a71d82de.jpg', 44, 589.57, 584.30, 57, 166, '1OawwClIGs', 128, 217, 26, '2023-04-01 16:12:13', '2023-04-07 09:41:59');
INSERT INTO `t_spu` VALUES (26, '安踏女鞋板鞋2021新款', 'Mr.', 1, 140, 103, 'https://img.fishfay.com/shopgoods/4/122118083/zt-122118083/36aee41fa67431d43f1bd20a0a447b77.jpg', 73, 61.39, 12.23, 53, 192, 'xzJiAeMi0A', 63, 24, 81, '2023-04-25 18:32:17', '2023-02-28 12:44:23');
INSERT INTO `t_spu` VALUES (27, '安踏女鞋弹力胶跑鞋2021新款', 'Mr.', 1, 141, 108, 'https://img.fishfay.com/shopgoods/1/122115501/zt-122115501/569242250dbd4dafcde1c01e714abf49.jpg', 67, 251.19, 208.48, 59, 201, 'aM5mWiwUZn', 218, 120, 88, '2023-03-29 15:36:33', '2023-04-04 16:13:58');
INSERT INTO `t_spu` VALUES (28, '安踏女鞋休闲鞋', 'Prof.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/4/122038832/zt-122038832/b7286fb36d784ea9686d407807d2ca27.jpg', 83, 580.37, 343.38, 42, 36, 'Mwe1C3dUmP', 22, 121, 88, '2023-02-16 22:54:01', '2023-05-04 17:18:58');
INSERT INTO `t_spu` VALUES (29, '安踏女鞋板鞋小白鞋', 'Mrs.', 1, 140, 107, 'https://img.fishfay.com/shopgoods/4/122038062/zt-122038062/bba4f7523d1d3d03718fd8c3f011811a.jpg', 74, 681.35, 524.27, 30, 41, 'rdsDx1zi5n', 239, 42, 247, '2023-03-06 00:29:02', '2023-05-03 03:15:58');
INSERT INTO `t_spu` VALUES (30, '安踏女鞋柔软柱科技跑鞋2021新款', 'Mr.', 1, 141, 105, 'https://img.fishfay.com/shopgoods/4/122115582/zt-122115582/bce79f5a4a7ba20ec28159f6d71cfd1e.jpg', 3, 464.07, 882.90, 78, 184, '17fpWsi7nM', 254, 180, 255, '2023-03-28 00:28:26', '2023-01-13 09:14:47');
INSERT INTO `t_spu` VALUES (31, '安踏女鞋跑鞋2021新款', 'Prof.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/4/122115520/zt-122115520/502e9d857b05c5ee12232614eaaf67a5.jpg', 79, 196.03, 648.09, 84, 246, 'SRNTahU1mX', 163, 51, 36, '2023-04-20 21:03:56', '2023-02-11 03:39:46');
INSERT INTO `t_spu` VALUES (32, '安踏女鞋休闲鞋2021新款', 'Prof.', 1, 142, 105, 'https://img.fishfay.com/shopgoods/4/122118845/zt-122118845/7b5bd225f9ebd55b410471db103c4431.jpg', 37, 791.13, 665.53, 114, 126, 'X9Bk8gOoY8', 200, 71, 209, '2023-03-15 10:52:30', '2023-01-17 04:51:04');
INSERT INTO `t_spu` VALUES (33, '安踏女鞋板鞋小白鞋2021新款', 'Ms.', 1, 140, 102, 'https://img.fishfay.com/shopgoods/4/122118066/zt-122118066/65ab30919019bb48fee002f1fd87099a.jpg', 78, 810.97, 839.75, 57, 181, 'FJk8esa4zU', 161, 206, 62, '2023-02-05 15:34:56', '2023-04-19 17:44:34');
INSERT INTO `t_spu` VALUES (34, '安踏女鞋MIX裂变休闲鞋2021新款', 'Prof.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/1/122118812/zt-122118812/13a23d55991d6038567a6e10f3f66507.jpg', 60, 40.43, 303.94, 54, 31, 'zHZXe4iN2x', 248, 244, 145, '2023-02-07 03:13:55', '2023-02-05 18:57:40');
INSERT INTO `t_spu` VALUES (35, '安踏女鞋跑鞋', 'Ms.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/1/122045571/zt-122045571/3a3ee8f4b0848a863b2f4b85ab08681c.jpg', 45, 32.40, 965.32, 93, 58, 'd9v5NE8cCQ', 131, 189, 108, '2023-04-10 19:52:42', '2023-02-27 03:43:08');
INSERT INTO `t_spu` VALUES (36, '安踏女鞋创1.0大数据跑鞋2021新款', 'Mrs.', 1, 141, 102, 'https://img.fishfay.com/shopgoods/1/122115586/zt-122115586/5714aa603a428ac08d58fb67de57cdb5.jpg', 22, 948.65, 195.94, 53, 63, '6MzdTwe5Zy', 225, 161, 89, '2023-03-05 06:58:41', '2023-05-03 18:25:02');
INSERT INTO `t_spu` VALUES (37, '安踏女鞋海灵复古休闲鞋老爹鞋', 'Miss.', 1, 142, 103, 'https://img.fishfay.com/shopgoods/4/122048813S/zt-122048813S/78bef1535356fe4be99199c88b8f6c10.jpg', 58, 287.99, 288.83, 122, 241, 'a9dX0fZEQK', 16, 158, 65, '2023-03-08 11:54:35', '2023-05-09 21:13:50');
INSERT INTO `t_spu` VALUES (38, '安踏女鞋跑鞋', 'Prof.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/1/122025570/zt-122025570/d036bb90d8ef29ba833b2d8727c1e6b1.jpg', 71, 506.84, 714.01, 72, 160, 'MO3NPTRWDt', 124, 46, 180, '2023-02-14 01:37:48', '2023-04-27 03:55:55');
INSERT INTO `t_spu` VALUES (39, '安踏女鞋霸道系列高帮板鞋', 'Mrs.', 1, 140, 106, 'https://img.fishfay.com/shopgoods/4/122048080/zt-122048080/ccbe084075bda202cfe760e5653d2c6b.jpg', 22, 592.71, 500.07, 103, 46, 'JsXtmRBCH3', 106, 83, 229, '2023-03-15 22:01:08', '2023-01-10 22:14:56');
INSERT INTO `t_spu` VALUES (40, '安踏女鞋跑鞋', 'Ms.', 1, 141, 107, 'https://img.fishfay.com/shopgoods/4/122035579/zt-122035579/adcf544f788e9000d1ff843f27a52c5f.jpg', 96, 729.79, 400.34, 104, 67, 'vpz8ZBcK72', 22, 129, 170, '2023-02-05 13:26:03', '2023-03-12 14:56:21');
INSERT INTO `t_spu` VALUES (41, '安踏女鞋bubble泡泡越野跑鞋', 'Miss.', 1, 141, 110, 'https://img.fishfay.com/shopgoods/4/122045520/zt-122045520/5963c33e1222bd228ec45c07d214f22b.jpg', 67, 824.09, 273.24, 18, 13, '8GOidq6E2n', 68, 154, 69, '2023-02-10 20:48:55', '2023-04-25 05:31:04');
INSERT INTO `t_spu` VALUES (42, '安踏女鞋霸道威峰板鞋', 'Miss.', 1, 140, 101, 'https://img.fishfay.com/shopgoods/4/122048081/zt-122048081/f6067392d3cd4bc5c2fc22976b69ed4b.jpg', 62, 60.40, 85.93, 11, 203, 'WkGVqniXZT', 105, 36, 120, '2023-03-27 22:38:46', '2023-05-01 12:23:17');
INSERT INTO `t_spu` VALUES (43, '安踏女鞋硫化鞋帆布鞋小白鞋', 'Mrs.', 1, 139, 109, 'https://img.fishfay.com/shopgoods/4/122038661/zt-122038661/6eac32a7b16b823ab06dac2a4b91f618.jpg', 70, 423.46, 502.97, 91, 165, 'n9EVzrXmc1', 98, 186, 242, '2023-02-16 03:41:55', '2023-04-03 03:55:20');
INSERT INTO `t_spu` VALUES (44, '安踏女鞋板鞋小白鞋', 'Miss.', 1, 140, 102, 'https://img.fishfay.com/shopgoods/4/122038063/zt-122038063/7d79fb4dafc3622c9bacb08a5af8c39d.jpg', 85, 456.08, 528.27, 93, 10, 'nJ0vuFTVv9', 221, 194, 224, '2023-05-01 15:15:39', '2023-02-10 20:43:02');
INSERT INTO `t_spu` VALUES (45, '安踏女鞋拒绝平庸高帮休闲鞋', 'Mrs.', 1, 142, 104, 'https://img.fishfay.com/shopgoods/4/122048808/zt-122048808/fd92ee3048328fb3af450ab9c5a1c12b.jpg', 10, 485.77, 737.85, 6, 55, 'dCeG8jEJBB', 225, 81, 73, '2023-02-05 16:03:51', '2023-01-31 07:25:40');
INSERT INTO `t_spu` VALUES (46, '安踏女鞋火箭跑鞋edge2.0跑鞋', 'Prof.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/4/122045587/zt-122045587/d710ff719ab664ec4a63525c441f7781.jpg', 84, 611.65, 21.42, 84, 167, 'gQK9jjRBRS', 190, 124, 55, '2023-04-08 13:19:58', '2023-03-16 23:49:35');
INSERT INTO `t_spu` VALUES (47, '安踏男鞋跑鞋', 'Miss.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/1/112025590/zt-112025590/682b2e3ff56c11464e07ffbdc321c14e.jpg', 87, 402.35, 270.63, 121, 174, '8jyCGMLVQK', 224, 206, 132, '2023-04-09 01:58:47', '2023-02-28 06:31:46');
INSERT INTO `t_spu` VALUES (48, '安踏男鞋跑鞋', 'Mr.', 1, 141, 106, 'https://img.fishfay.com/shopgoods/1/112025591/zt-112025591/a22a8de871b73145fd29c0207ef9a3e1.jpg', 60, 307.91, 648.47, 72, 177, 'NvQvRaOtQ1', 192, 230, 171, '2023-04-15 08:00:19', '2023-04-06 07:45:07');
INSERT INTO `t_spu` VALUES (49, '安踏男鞋KT汤普森水花2代篮球鞋kt', 'Mr.', 1, 145, 110, 'https://img.fishfay.com/shopgoods/1/112021602/zt-112021602/2a497d4a8d19cec604dbbeb23b4b2191.jpg', 68, 191.51, 649.43, 121, 52, 'vTck9xKKUg', 118, 9, 243, '2023-03-27 04:02:03', '2023-02-01 14:24:03');
INSERT INTO `t_spu` VALUES (50, '安踏男鞋A-Flashfoam虫洞科技跑鞋', 'Miss.', 1, 141, 107, 'https://img.fishfay.com/shopgoods/1/112025598/zt-112025598/388f6e74f787cfa5afd78ce3fac59e45.jpg', 43, 76.98, 811.42, 72, 105, 'TEYNtb6rxy', 12, 74, 183, '2023-03-17 01:39:57', '2023-02-19 14:08:04');
INSERT INTO `t_spu` VALUES (51, '安踏轻骑兵5代篮球鞋', 'Mr.', 1, 145, 103, 'https://img.fishfay.com/shopgoods/1/112021608/zt-112021608/4b0bd9db4f515fb5f283cb53c79c58c7.jpg', 45, 899.20, 931.95, 33, 181, 'eglrfR7Nm3', 219, 21, 190, '2023-02-04 11:24:04', '2023-02-05 21:51:54');
INSERT INTO `t_spu` VALUES (52, '安踏可口可乐雪碧联名款男鞋综训鞋', 'Prof.', 1, 143, 109, 'https://img.fishfay.com/shopgoods/1/112027785/zt-112027785/de88cbcbb27bf4f6761673ff60b963a0.jpg', 56, 249.33, 730.30, 70, 194, 'HfRcaa1kIe', 148, 59, 200, '2023-03-04 20:23:36', '2023-02-02 15:43:29');
INSERT INTO `t_spu` VALUES (53, '安踏霸道男鞋威峰休闲老爹鞋', 'Mr.', 1, 140, 106, 'https://img.fishfay.com/shopgoods/1/112028085/zt-112028085/69ed7d54a16b4fe7b25c641b0ae3dc43.jpg', 45, 43.13, 949.54, 126, 60, 'URgBQSnflN', 97, 168, 129, '2023-02-13 01:32:36', '2023-03-22 21:04:29');
INSERT INTO `t_spu` VALUES (54, '安踏男鞋海沃德GH1篮球鞋', 'Ms.', 1, 145, 105, 'https://img.fishfay.com/shopgoods/1/112021103/zt-112021103/7f54a7f40ac5ddd03a3460f8f02abb28.jpg', 29, 640.25, 261.85, 80, 240, '3hReZwIbEA', 241, 53, 165, '2023-04-24 23:28:13', '2023-01-14 00:50:39');
INSERT INTO `t_spu` VALUES (55, '安踏男款轻狂系列实战篮球鞋', 'Prof.', 1, 145, 100, 'https://img.fishfay.com/shopgoods/1/112021609/zt-112021609/c9702d4890c1bb9ebd8aa2635f960351.jpg', 76, 185.21, 961.86, 83, 204, 'pO1KaV8X4X', 196, 202, 196, '2023-04-25 23:45:55', '2023-03-30 15:11:20');
INSERT INTO `t_spu` VALUES (56, '安踏男鞋行者休闲鞋老爹鞋', 'Mr.', 1, 142, 108, 'https://img.fishfay.com/shopgoods/1/112028889/zt-112028889/3a8c4a6c06e790d460df74e2774874bb.jpg', 36, 66.63, 874.78, 68, 40, 'nHMfjlzJ2p', 15, 114, 243, '2023-02-11 06:59:16', '2023-04-02 18:26:41');
INSERT INTO `t_spu` VALUES (57, '安踏男鞋魔方拒绝平庸休闲鞋', 'Mrs.', 1, 142, 105, 'https://img.fishfay.com/shopgoods/1/112028888/zt-112028888/a8a8636e4c45346d7aee957546f17e31.jpg', 60, 924.79, 152.26, 29, 245, 'ljWjLN3JgM', 138, 33, 166, '2023-04-12 22:32:33', '2023-05-06 23:25:51');
INSERT INTO `t_spu` VALUES (58, '安踏男鞋霸道系列板鞋休闲鞋', 'Miss.', 1, 140, 101, 'https://img.fishfay.com/shopgoods/1/112028086/zt-112028086/ec7cdbea086078449fd78c7d990be903.jpg', 35, 503.45, 232.35, 76, 231, 'UDndQTENav', 226, 209, 114, '2023-02-19 09:49:55', '2023-01-04 01:48:14');
INSERT INTO `t_spu` VALUES (59, '安踏男鞋板鞋休闲鞋小白鞋', 'Prof.', 1, 140, 100, 'https://img.fishfay.com/shopgoods/1/112018064/zt-112018064/a12a18bf07c10c9efb7749be7a1bbd2e.jpg', 77, 447.05, 401.75, 109, 80, 'yp4xLFKcHM', 38, 59, 83, '2023-02-02 04:17:59', '2023-05-04 22:00:33');
INSERT INTO `t_spu` VALUES (60, '安踏雀翎千禧男款休闲鞋', 'Mr.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/1/112028890/zt-112028890/31c5d2116d5318e23b8e84e25cb35c78.jpg', 100, 301.76, 91.59, 24, 57, 'MPGrYWXDcL', 79, 73, 34, '2023-03-31 20:10:15', '2023-03-08 01:56:19');
INSERT INTO `t_spu` VALUES (61, '【凉拖】安踏男鞋凉鞋沙滩鞋', 'Mr.', 1, 144, 108, 'https://img.fishfay.com/shopgoods/1/112038508/zt-112038508/cbbc6c70480762640dfe86d03f448138.jpg', 15, 665.20, 702.74, 78, 31, '6XPeGwsmfe', 211, 42, 228, '2023-04-22 04:33:43', '2023-05-03 19:44:58');
INSERT INTO `t_spu` VALUES (62, '安踏男鞋氢跑二代跑鞋', 'Miss.', 1, 141, 102, 'https://img.fishfay.com/shopgoods/1/112025540/zt-112025540/3a4e165ef9e513125f097ca226b930d4.jpg', 69, 316.89, 665.44, 64, 80, 'mArFaAgix6', 64, 134, 72, '2023-04-17 03:40:12', '2023-01-17 10:01:57');
INSERT INTO `t_spu` VALUES (63, '安踏男鞋炙热休闲鞋老爹鞋', 'Mr.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/1/912018842/zt-912018842/fa1530d01de84b8133d2eeb2fd4e748d.jpg', 27, 676.39, 147.80, 89, 7, 'AsiaMQP6iJ', 56, 220, 70, '2023-03-17 07:11:38', '2023-04-10 06:43:25');
INSERT INTO `t_spu` VALUES (64, '安踏男鞋跑鞋', 'Prof.', 1, 141, 107, 'https://img.fishfay.com/shopgoods/4/912015520/zt-912015520/916a5e66874e825f6b25aab29ad4e08d.jpg', 78, 871.30, 115.12, 73, 137, '8WVTbNEUzI', 149, 9, 9, '2023-04-26 05:25:53', '2023-04-17 02:36:35');
INSERT INTO `t_spu` VALUES (65, '安踏男鞋厚底板鞋', 'Mrs.', 1, 140, 102, 'https://img.fishfay.com/shopgoods/4/112038063/zt-112038063/734b3e2e10af4c982e687926cc391a9c.jpg', 12, 178.68, 475.71, 58, 37, 'qeB31HEJpu', 236, 216, 12, '2023-04-15 11:45:46', '2023-04-12 16:48:51');
INSERT INTO `t_spu` VALUES (66, '安踏男鞋轻质健步跑跑鞋', 'Prof.', 1, 141, 109, 'https://img.fishfay.com/shopgoods/4/112045580/zt-112045580/89e334422bc40dc1d136674b07baf602.jpg', 77, 642.12, 389.65, 64, 16, 'ggqG6J61aM', 44, 65, 165, '2023-02-18 08:30:46', '2023-02-11 14:38:37');
INSERT INTO `t_spu` VALUES (67, '安踏男鞋星标系列国旗星岚跑鞋', 'Miss.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/4/112035528A/zt-112035528A.jpg', 59, 665.87, 392.51, 119, 188, 'bQKvkaHmLz', 157, 24, 234, '2023-04-10 10:34:06', '2023-02-19 13:39:46');
INSERT INTO `t_spu` VALUES (68, '安踏男鞋可口可乐联名霸道板鞋', 'Prof.', 1, 140, 106, 'https://img.fishfay.com/shopgoods/4/112038085S/zt-112038085S/763e613fff32df931f992409fa24c96b.jpg', 32, 295.95, 348.53, 2, 53, '4Mhmo9c3rn', 91, 16, 131, '2023-04-25 14:45:50', '2023-04-08 01:32:28');
INSERT INTO `t_spu` VALUES (69, '安踏男鞋星标系列国旗星峦跑鞋', 'Prof.', 1, 141, 109, 'https://img.fishfay.com/shopgoods/4/112035518A/zt-112035518A.jpg', 46, 702.96, 906.52, 4, 245, 'bvawwJuIVU', 123, 26, 192, '2023-02-18 10:36:32', '2023-05-03 23:43:16');
INSERT INTO `t_spu` VALUES (70, '安踏男鞋板鞋', 'Miss.', 1, 140, 103, 'https://img.fishfay.com/shopgoods/4/112038046/zt-112038046/a95924eddef8ed65446afe1c4e8425fd.jpg', 81, 185.17, 856.85, 2, 139, 'E1IadziB1v', 69, 186, 154, '2023-02-03 01:10:52', '2023-04-23 03:36:48');
INSERT INTO `t_spu` VALUES (71, '安踏男鞋跑鞋', 'Mr.', 1, 141, 105, 'https://img.fishfay.com/shopgoods/4/112035565/zt-112035565/b449e63b0c08027d42d9260cc4931e99.jpg', 39, 263.10, 480.02, 102, 71, 'JaYXAiCjLa', 130, 44, 4, '2023-02-03 04:04:57', '2023-01-30 02:00:11');
INSERT INTO `t_spu` VALUES (72, '安踏男鞋星标系列星岳篮球鞋', 'Mrs.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/4/112031818A/zt-112031818A.jpg', 54, 593.29, 171.68, 62, 201, 'v4mnh7pYyG', 71, 65, 109, '2023-03-02 14:57:58', '2023-04-06 01:09:51');
INSERT INTO `t_spu` VALUES (73, '安踏男鞋a-jelly弹力胶跑鞋', 'Mr.', 1, 141, 100, 'https://img.fishfay.com/shopgoods/4/112035501/zt-112035501/d9bd5c174116a4fd1fad036e61bee7b8.jpg', 78, 199.68, 110.16, 55, 120, 'M3OkHT7uzx', 136, 28, 102, '2023-03-10 21:20:23', '2023-01-09 05:13:16');
INSERT INTO `t_spu` VALUES (74, '安踏男鞋星标系列星岳篮球鞋', 'Mrs.', 1, 145, 109, 'https://img.fishfay.com/shopgoods/4/112031818AA/zt-112031818AA.jpg', 61, 188.69, 689.58, 45, 75, 'L4jQZf8xlN', 17, 8, 134, '2023-02-26 12:12:36', '2023-04-21 13:34:19');
INSERT INTO `t_spu` VALUES (75, '安踏男鞋要疯4热浪2篮球鞋', 'Prof.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/4/112031105/zt-112031105/896a34dbeb9aa5d8d6d46a29a7f37507.jpg', 69, 568.36, 766.84, 25, 98, 'CtUUt208XH', 242, 142, 39, '2023-05-07 08:21:10', '2023-03-23 16:33:21');
INSERT INTO `t_spu` VALUES (76, '安踏男鞋汤普森KT5LOW低帮版篮球鞋kt', 'Prof.', 1, 145, 101, 'https://img.fishfay.com/shopgoods/4/112031102/zt-112031102/ae476588d34832b26d628a8b8cddc62d.jpg', 23, 185.81, 940.33, 91, 155, 'lDHP94elk5', 244, 189, 116, '2023-02-27 22:59:35', '2023-01-13 10:00:21');
INSERT INTO `t_spu` VALUES (77, '安踏男鞋Edge舒弹网纱跑鞋', 'Mrs.', 1, 141, 108, 'https://img.fishfay.com/shopgoods/4/112035585/zt-112035585/ddcd7be17aae4c6b2e3bf61ad81d4377.jpg', 22, 401.58, 360.63, 2, 229, 'LXIyqomaiY', 80, 18, 205, '2023-02-25 23:43:58', '2023-04-15 08:17:26');
INSERT INTO `t_spu` VALUES (78, '安踏男鞋休闲鞋', 'Ms.', 1, 142, 106, 'https://img.fishfay.com/shopgoods/4/112038859/zt-112038859/8c6cfef8b1a8d410f8d8204743dc2f11.jpg', 16, 594.29, 884.35, 126, 69, 'jFNexqfVwG', 248, 133, 24, '2023-02-14 09:33:56', '2023-01-17 22:05:26');
INSERT INTO `t_spu` VALUES (79, '安踏男鞋休闲鞋老爹鞋', 'Mr.', 1, 142, 106, 'https://img.fishfay.com/shopgoods/4/112038832/zt-112038832/af8434a7e734f98ad49c450c46257a94.jpg', 60, 304.85, 36.79, 112, 28, 'sfvw2Wry1L', 118, 245, 110, '2023-04-01 01:40:25', '2023-03-21 11:03:19');
INSERT INTO `t_spu` VALUES (80, '安踏男鞋汤普森KT5篮球鞋kt', 'Ms.', 1, 145, 102, 'https://img.fishfay.com/shopgoods/4/112031101/zt-112031101/2d8e8dfa715e6c72a12e9d52e15fc109.jpg', 67, 191.63, 742.99, 48, 244, 'YGYzd8nxe0', 13, 231, 175, '2023-02-17 19:14:58', '2023-01-05 15:40:15');
INSERT INTO `t_spu` VALUES (81, '安踏男鞋A-SHOCK要疯4进击2篮球鞋', 'Ms.', 1, 145, 101, 'https://img.fishfay.com/shopgoods/4/112031107/zt-112031107/7f7590ca5739b088410e64d268ad53ff.jpg', 18, 854.78, 109.17, 118, 249, 'pbqKpJQzim', 248, 152, 176, '2023-03-26 15:09:31', '2023-02-04 09:06:09');
INSERT INTO `t_spu` VALUES (82, '安踏男鞋霸道2.0休闲鞋板鞋', 'Mrs.', 1, 140, 104, 'https://img.fishfay.com/shopgoods/4/112038081/zt-112038081/fc1c58b5b2c61383dc1a57cd8a584c07.jpg', 95, 612.80, 355.56, 20, 35, 'JIs3FfNxXL', 19, 56, 194, '2023-04-28 00:53:53', '2023-04-10 00:07:20');
INSERT INTO `t_spu` VALUES (83, '安踏男鞋A-SHOCK实战篮球鞋', 'Mrs.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/4/112031605/zt-112031605/599096dbf497c5a8e9bd45a1f0d79b8c.jpg', 63, 966.08, 759.49, 65, 254, 'nTv5prfwMj', 41, 181, 214, '2023-02-09 02:55:35', '2023-01-29 18:27:31');
INSERT INTO `t_spu` VALUES (84, '安踏男鞋海沃德GH1篮球鞋', 'Mr.', 1, 145, 106, 'https://img.fishfay.com/shopgoods/4/112031103/zt-112031103/0484d26583de437f2bc0b7474f8b6796.jpg', 34, 869.69, 532.36, 120, 94, 'ZVnNoeTU4n', 18, 138, 60, '2023-02-24 14:39:42', '2023-04-14 11:53:06');
INSERT INTO `t_spu` VALUES (85, '安踏男鞋要疯系列沙滩拖鞋', 'Miss.', 1, 146, 108, 'https://img.fishfay.com/shopgoods/4/112031806/zt-112031806/998b1887b1d28b7bd5eb0aeb79832054.jpg', 54, 407.42, 256.54, 63, 106, '0ZBcTN4zat', 60, 29, 29, '2023-04-01 21:49:38', '2023-04-02 12:42:15');
INSERT INTO `t_spu` VALUES (86, '安踏男鞋不羁休闲鞋', 'Prof.', 1, 142, 107, 'https://img.fishfay.com/shopgoods/4/112038842/zt-112038842/42bb0238d3e4d0a51338dfdc51b5ff87.jpg', 53, 259.08, 760.32, 54, 250, 'oPt8yQTIKn', 136, 17, 154, '2023-05-09 01:35:53', '2023-04-12 05:43:17');
INSERT INTO `t_spu` VALUES (87, '安踏男鞋汤普森KT5高帮篮球鞋kt', 'Mr.', 1, 145, 102, 'https://img.fishfay.com/shopgoods/1/112011101/zt-112011101/c531060e54d98bbbab2f554c5c95172f.jpg', 89, 230.62, 859.10, 113, 57, '0eSKGr6REK', 24, 105, 130, '2023-04-09 06:55:25', '2023-01-14 02:18:55');
INSERT INTO `t_spu` VALUES (88, '安踏男鞋舒弹Edge跑鞋', 'Ms.', 1, 141, 100, 'https://img.fishfay.com/shopgoods/4/112035589/zt-112035589/31796e786e0a583bfe19f1a975b670f1.jpg', 64, 440.31, 398.30, 64, 245, '7sUcPgPyWs', 28, 65, 127, '2023-03-19 15:31:42', '2023-03-06 15:46:44');
INSERT INTO `t_spu` VALUES (89, '安踏男鞋KT5高帮篮球鞋汤普森kt5', 'Mrs.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/1/112021101/zt-112021101/74f332fb39efdf854286528b6b8689f0.jpg', 76, 366.94, 530.34, 1, 69, 'wWvKg0YTBd', 37, 134, 39, '2023-03-14 07:42:10', '2023-04-22 21:30:55');
INSERT INTO `t_spu` VALUES (90, '安踏冰河千禧鞋男鞋休闲鞋', 'Prof.', 1, 142, 110, 'https://img.fishfay.com/shopgoods/1/112028899/zt-112028899/ba3ebaacd612a9ff0887f3a12028255d.jpg', 42, 447.82, 627.06, 97, 136, '0pL6tIDdal', 249, 175, 175, '2023-02-28 22:13:02', '2023-03-21 07:43:39');
INSERT INTO `t_spu` VALUES (91, '安踏男鞋休闲鞋板鞋', 'Prof.', 1, 140, 102, 'https://img.fishfay.com/shopgoods/1/112028062/zt-112028062/2dbdf7691dfcce10ec31fa9b1afaacd5.jpg', 15, 271.20, 381.70, 122, 91, 'p8a8E8ZwEF', 121, 190, 198, '2023-02-02 12:00:35', '2023-03-20 03:26:50');
INSERT INTO `t_spu` VALUES (92, '安踏男鞋休闲鞋板鞋', 'Miss.', 1, 140, 108, 'https://img.fishfay.com/shopgoods/1/112028061/zt-112028061/45d33f0afb0e4f030df63f77561e6f78.jpg', 75, 8.75, 473.02, 71, 75, 'dT5dDwtzYZ', 130, 177, 236, '2023-02-15 18:52:09', '2023-03-11 20:35:12');
INSERT INTO `t_spu` VALUES (93, '安踏男鞋跑鞋', 'Ms.', 1, 141, 105, 'https://img.fishfay.com/shopgoods/1/112045571/zt-112045571/2228ba6805bad69c5938c2922332de58.jpg', 83, 39.36, 500.12, 34, 205, 'p4VzX0mPLB', 171, 191, 123, '2023-04-08 04:25:48', '2023-03-01 08:50:48');
INSERT INTO `t_spu` VALUES (94, '安踏男鞋巢鞋 x SALEHE休闲鞋2021新款', 'Miss.', 1, 142, 103, 'https://img.fishfay.com/shopgoods/4/112118820/zt-112118820/a66f4f3227747cab36edda5ffbff777d.jpg', 71, 7.64, 940.66, 4, 144, 'B5KhXeC98G', 151, 219, 125, '2023-05-03 14:47:18', '2023-02-24 03:25:23');
INSERT INTO `t_spu` VALUES (95, '安踏男鞋低帮实战篮球鞋', 'Mr.', 1, 145, 103, 'https://img.fishfay.com/shopgoods/1/112041610/zt-112041610/79ca93247b78b667ba57ddb7631acf65.jpg', 61, 973.26, 807.05, 79, 26, 'PwnjbRa3p5', 54, 122, 92, '2023-05-01 03:28:13', '2023-05-10 14:07:04');
INSERT INTO `t_spu` VALUES (96, '安踏男鞋板鞋小白鞋', 'Prof.', 1, 140, 107, 'https://img.fishfay.com/shopgoods/1/112038061/zt-112038061/bc74d275488c23b866d230f7ab0bab2f.jpg', 68, 805.28, 693.62, 91, 200, 'EHRoriUEAH', 22, 71, 58, '2023-03-09 18:48:21', '2023-04-18 17:24:01');
INSERT INTO `t_spu` VALUES (97, '安踏男鞋跑鞋', 'Mrs.', 1, 141, 100, 'https://img.fishfay.com/shopgoods/1/112035570/zt-112035570/312cfa1f568f4b79f5d8b992bf061951.jpg', 11, 329.48, 419.86, 57, 156, 'qZQp3EEsbb', 241, 28, 201, '2023-05-07 19:25:31', '2023-01-01 03:49:00');
INSERT INTO `t_spu` VALUES (98, '安踏男鞋免系带旋钮跑鞋', 'Miss.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/1/112035523/zt-112035523/05451a1075959592633548afaa97a566.jpg', 95, 322.65, 775.32, 41, 248, 'BCOTrRxgp3', 216, 59, 201, '2023-02-18 04:22:13', '2023-03-10 12:45:01');
INSERT INTO `t_spu` VALUES (99, '安踏男鞋UFO2天体3篮球鞋2021新款', 'Prof.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/4/112111602/zt-112111602/7c9f736f85fd534b1404fbd761a32c69.jpg', 58, 761.83, 717.88, 107, 24, 'VguaJZ0Bfv', 14, 196, 61, '2023-02-04 06:55:44', '2023-01-29 18:41:05');
INSERT INTO `t_spu` VALUES (100, '安踏男鞋创1.0大数据跑鞋2021新款', 'Ms.', 1, 141, 106, 'https://img.fishfay.com/shopgoods/1/112115586/zt-112115586/64bb8482b9caa2be1c28c9cae0ec18dc.jpg', 84, 408.84, 93.84, 91, 152, 'jXVZNmgcCT', 84, 74, 69, '2023-02-25 12:32:07', '2023-03-19 09:34:06');
INSERT INTO `t_spu` VALUES (101, '安踏男鞋汤普森KT6破坏版毒液漫威联名款篮球鞋kt6', 'Ms.', 1, 145, 104, 'https://img.fishfay.com/shopgoods/4/112041102/zt-112041102/1edde4209e9eaaca2617a41602fbddd9.jpg', 89, 530.92, 100.57, 114, 177, '30tkga2hyl', 36, 30, 36, '2023-04-09 11:32:16', '2023-01-26 13:44:18');
INSERT INTO `t_spu` VALUES (102, '安踏男鞋休闲鞋', 'Mrs.', 1, 142, 105, 'https://img.fishfay.com/shopgoods/4/112048841/zt-112048841/436d7c954f40b0e53af002592dd5dd15.jpg', 72, 28.06, 630.70, 77, 116, 'AYVfTv9O6K', 54, 85, 150, '2023-03-19 22:09:38', '2023-02-10 16:29:20');
INSERT INTO `t_spu` VALUES (103, '安踏男鞋速战4水泥克星高帮篮球鞋', 'Mrs.', 1, 145, 103, 'https://img.fishfay.com/shopgoods/4/112041605/zt-112041605/c2584f497b2eb9ffa5026aa5f50ffe1f.jpg', 48, 288.61, 285.01, 78, 131, 'dofIp7y1bg', 239, 110, 251, '2023-04-26 21:57:28', '2023-02-21 09:56:00');
INSERT INTO `t_spu` VALUES (104, '安踏男鞋海沃德1代GH1篮球鞋', 'Ms.', 1, 145, 101, 'https://img.fishfay.com/shopgoods/4/112041103/zt-112041103/4bf96fdd03ac014a5397207ec11a2aab.jpg', 99, 342.66, 519.74, 104, 29, '3wd5yHw3aK', 214, 156, 162, '2023-04-04 00:19:57', '2023-03-21 00:08:57');
INSERT INTO `t_spu` VALUES (105, '安踏男鞋edge舒弹越野跑鞋', 'Mrs.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/4/112045528/zt-112045528/e30b6eb0eadb20ec19b6c3f11514b5f1.jpg', 70, 759.46, 527.96, 15, 208, 'gEYHxpCrxn', 64, 34, 117, '2023-03-28 14:38:41', '2023-05-02 21:11:04');
INSERT INTO `t_spu` VALUES (106, '安踏男鞋先进球员实战篮球鞋', 'Ms.', 1, 145, 103, 'https://img.fishfay.com/shopgoods/4/112031608S/zt-112031608S/693313dcc675027f8a77d583532af0f8.jpg', 88, 196.66, 229.61, 127, 235, 'vYXzVtfIeB', 97, 54, 113, '2023-02-28 03:57:49', '2023-04-01 14:53:06');
INSERT INTO `t_spu` VALUES (107, '安踏男鞋跑鞋', 'Mrs.', 1, 141, 105, 'https://img.fishfay.com/shopgoods/1/112025570/zt-112025570/debff48e784f8c601a5db41ce2f1283e.jpg', 17, 47.44, 598.38, 25, 107, 'M4hIpvVGyy', 220, 207, 26, '2023-02-08 08:56:32', '2023-01-06 21:38:14');
INSERT INTO `t_spu` VALUES (108, '安踏男鞋硫化鞋小白鞋', 'Prof.', 1, 139, 106, 'https://img.fishfay.com/shopgoods/4/112038661/zt-112038661/ab6c46b9f9786ae422adb88361de55c8.jpg', 73, 210.28, 945.70, 105, 150, 'QfRivtRnmF', 165, 174, 72, '2023-04-01 07:01:07', '2023-02-02 17:16:19');
INSERT INTO `t_spu` VALUES (109, '安踏男鞋速决水泥克星篮球鞋', 'Mr.', 1, 145, 102, 'https://img.fishfay.com/shopgoods/4/112041612/zt-112041612/2f834e5ab3ee9a0ec509de7d1e109fb1.jpg', 89, 302.73, 789.56, 32, 99, 'fenwfSmdjZ', 74, 139, 224, '2023-03-18 11:40:49', '2023-01-12 02:50:53');
INSERT INTO `t_spu` VALUES (110, '安踏男鞋板鞋小白鞋', 'Mrs.', 1, 140, 109, 'https://img.fishfay.com/shopgoods/4/112038060/zt-112038060/51b27acd69690195414f3d104f8fa43a.jpg', 32, 393.62, 269.82, 127, 244, 'hmI7CmcRP2', 150, 208, 79, '2023-02-10 03:56:32', '2023-04-10 00:02:11');
INSERT INTO `t_spu` VALUES (111, '安踏男鞋逆刃篮球鞋', 'Ms.', 1, 145, 107, 'https://img.fishfay.com/shopgoods/4/112041606/zt-112041606/3ce14ae855b8a8f9adacfc053f77c929.jpg', 81, 779.21, 536.87, 43, 108, 'SPtXheWGCQ', 181, 85, 200, '2023-03-26 19:08:36', '2023-04-12 16:21:44');
INSERT INTO `t_spu` VALUES (112, '安踏男鞋休闲鞋老爹鞋', 'Ms.', 1, 142, 105, 'https://img.fishfay.com/shopgoods/4/112038883/zt-112038883/0667496a38e3d53838474b0bcda37d29.jpg', 70, 347.40, 656.75, 119, 70, 'SopEePTENK', 75, 248, 160, '2023-04-17 09:04:22', '2023-05-07 05:45:16');
INSERT INTO `t_spu` VALUES (113, '安踏男鞋霸道系列高帮板鞋', 'Mr.', 1, 140, 100, 'https://img.fishfay.com/shopgoods/4/112048080/zt-112048080/9f934ccb4bb0223cf2c3feb06c1839e7.jpg', 4, 547.27, 72.48, 16, 220, 'gHo83GoYE3', 215, 36, 191, '2023-03-07 11:57:00', '2023-04-17 02:50:55');
INSERT INTO `t_spu` VALUES (114, '安踏男鞋弹力胶跑鞋', 'Mr.', 1, 141, 103, 'https://img.fishfay.com/shopgoods/4/112045501/zt-112045501/810ed1ca117271f9e1d18b054c0c3758.jpg', 39, 996.72, 72.95, 91, 226, 'W42XCh7Xcb', 147, 191, 102, '2023-04-21 15:47:22', '2023-01-15 08:43:31');
INSERT INTO `t_spu` VALUES (115, '安踏男鞋拒绝平庸系列高帮休闲鞋', 'Mr.', 1, 142, 108, 'https://img.fishfay.com/shopgoods/4/112048808/zt-112048808/ce1168005ccc33232587a20b6b712ad1.jpg', 49, 459.93, 414.06, 82, 49, 'NZiKGBInH5', 140, 219, 128, '2023-02-27 07:20:35', '2023-02-25 08:18:27');
INSERT INTO `t_spu` VALUES (116, '安踏男鞋bubble泡泡越野跑鞋', 'Ms.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/4/112045520/zt-112045520/ffb3426941af59d0ab37c7b8eabdc582.jpg', 3, 528.74, 115.15, 70, 139, '55yulZrDmx', 141, 232, 222, '2023-04-02 15:57:31', '2023-05-10 00:45:16');
INSERT INTO `t_spu` VALUES (117, '安踏男鞋汤普森KT6高山流水篮球鞋kt系列', 'Mr.', 1, 145, 110, 'https://img.fishfay.com/shopgoods/4/112041101/zt-112041101/618c1632f914e0a102a46df09c476f9a.jpg', 75, 745.05, 796.11, 120, 144, 'Ow2BJmfo0l', 11, 88, 217, '2023-03-27 16:18:08', '2023-03-27 00:09:52');
INSERT INTO `t_spu` VALUES (118, '安踏男鞋火箭跑鞋edge2.0跑鞋', 'Miss.', 1, 141, 100, 'https://img.fishfay.com/shopgoods/4/112045587/zt-112045587/b0638aa4f4ce823c740e471b8c7081df.jpg', 98, 264.29, 888.72, 97, 140, 'EAJFYpITOX', 73, 243, 95, '2023-04-20 15:17:05', '2023-01-23 06:00:09');
INSERT INTO `t_spu` VALUES (119, '安踏男鞋霸道威峰板鞋', 'Mr.', 1, 140, 103, 'https://img.fishfay.com/shopgoods/4/112048081/zt-112048081/d72cbd757635ae0dad2d6042509296ae.jpg', 58, 44.71, 333.19, 38, 141, 'gXUGYaYYNA', 230, 5, 184, '2023-03-24 23:30:39', '2023-01-17 14:48:20');
INSERT INTO `t_spu` VALUES (120, '安踏男鞋A-SHOCK科技跑鞋', 'Ms.', 1, 141, 106, 'https://img.fishfay.com/shopgoods/4/112035555/zt-112035555/2bb0c671a68331620c313486c7b1dde6.jpg', 42, 664.07, 561.81, 107, 215, 'pyVjBQHpUd', 217, 212, 114, '2023-04-30 00:58:43', '2023-01-22 13:01:40');
INSERT INTO `t_spu` VALUES (121, '安踏男鞋星标系列千仞休闲鞋国旗2021新款', 'Ms.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/4/112048880A/zt-112048880A/7a726455cd3a2d453038750bed851976.jpg', 64, 366.27, 774.33, 5, 120, 'Lm5pEEgfJN', 193, 12, 238, '2023-02-05 01:03:49', '2023-02-07 06:37:45');
INSERT INTO `t_spu` VALUES (122, '安踏男鞋休闲鞋板鞋', 'Mr.', 1, 140, 103, 'https://img.fishfay.com/shopgoods/1/112028061/zt-112028061/45d33f0afb0e4f030df63f77561e6f78.jpg', 27, 617.52, 737.54, 29, 191, 'NIJL7sz2zQ', 153, 3, 109, '2023-02-15 19:06:59', '2023-04-07 23:10:04');
INSERT INTO `t_spu` VALUES (123, '安踏男鞋氢跑鞋3代2021新款', 'Ms.', 1, 141, 108, 'https://img.fishfay.com/shopgoods/1/112125570/zt-112125570/c962f525529df8246f88713b3d55dcc1.jpg', 79, 393.72, 926.78, 63, 130, 'wUAKOqG06t', 38, 110, 140, '2023-02-11 18:31:34', '2023-01-11 17:53:44');
INSERT INTO `t_spu` VALUES (124, '水墨网球鞋男款', 'Ms.', 1, 143, 102, 'https://img.fishfay.com/shopgoods/21/112047760/zt-112047760/7e7f992c204ebd5aad1c9fc22345fc4e.jpg', 49, 609.40, 858.27, 9, 161, 'KD7cBQGxlM', 244, 41, 22, '2023-02-28 14:42:10', '2023-04-07 20:18:34');
INSERT INTO `t_spu` VALUES (125, '安踏男鞋跑鞋2021新款', 'Ms.', 1, 141, 106, 'https://img.fishfay.com/shopgoods/4/112115586S/zt-112115586S/2dbb72b6bab977712c96d57a6bbaf42c.jpg', 81, 656.86, 228.35, 61, 98, 'jrzTa28csD', 120, 168, 67, '2023-02-24 14:38:32', '2023-03-01 02:35:38');
INSERT INTO `t_spu` VALUES (126, '安踏男鞋星标系列星峦全掌碳板专业跑鞋国旗2021新款', 'Prof.', 1, 141, 109, 'https://img.fishfay.com/shopgoods/1/112045518A/zt-112045518A/271874f14078cde6b0b7338052d06440.jpg', 58, 161.56, 804.84, 81, 160, '2WzFCKYTJK', 25, 177, 48, '2023-03-14 02:33:09', '2023-03-22 09:28:46');
INSERT INTO `t_spu` VALUES (127, '安踏男鞋星标系列国旗星岳篮球鞋2021新款', 'Miss.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/4/112041818A/zt-112041818A/3d66b88d0d6845900497929ac456ab31.jpg', 97, 28.32, 465.02, 83, 156, 'OYMG3xS50W', 51, 114, 221, '2023-05-04 06:44:58', '2023-04-20 17:00:42');
INSERT INTO `t_spu` VALUES (128, '安踏男鞋星标系列国旗游心休闲鞋2021新款', 'Prof.', 1, 142, 104, 'https://img.fishfay.com/shopgoods/4/112048818A/zt-112048818A/5f1fa3a0005d843b3c5ab2fa6edc385e.jpg', 52, 372.02, 852.73, 34, 253, 'GD76lhFaca', 205, 100, 218, '2023-02-20 13:23:31', '2023-04-15 14:50:35');
INSERT INTO `t_spu` VALUES (129, '安踏男鞋星标系列星流休闲鞋国旗2021新款', 'Miss.', 1, 142, 104, 'https://img.fishfay.com/shopgoods/4/112048868A/zt-112048868A/bcc29939853f61837599cc2e19a0baca.jpg', 10, 576.63, 269.62, 105, 29, '00bCqve6ej', 134, 134, 49, '2023-02-03 20:39:28', '2023-02-12 12:42:53');
INSERT INTO `t_spu` VALUES (130, '安踏男鞋篮球鞋2021鞋款', 'Prof.', 1, 145, 103, 'https://img.fishfay.com/shopgoods/4/112111806/zt-112111806/2556c21ae113637590f1b661a7f34996.jpg', 22, 285.20, 242.95, 27, 62, 'G4wn2ys49A', 205, 174, 20, '2023-02-23 08:14:02', '2023-01-05 07:24:16');
INSERT INTO `t_spu` VALUES (131, '安踏男鞋板鞋2021新款', 'Mr.', 1, 140, 110, 'https://img.fishfay.com/shopgoods/1/112118086/zt-112118086/d73526b9ad8e979c2461a2bed6f2c979.jpg', 13, 480.94, 899.80, 95, 226, 'xIoNZnntlt', 250, 115, 141, '2023-02-28 03:29:33', '2023-02-22 05:27:34');
INSERT INTO `t_spu` VALUES (132, '安踏男鞋板鞋小白鞋', 'Mrs.', 1, 140, 105, 'https://img.fishfay.com/shopgoods/4/112118065/zt-112118065/e7a32f5a8a14f31977fe3713b8e31724.jpg', 32, 547.09, 428.31, 102, 80, 'ZQkCozODtT', 194, 37, 67, '2023-04-10 18:13:39', '2023-01-25 08:46:04');
INSERT INTO `t_spu` VALUES (133, '安踏男鞋板鞋2021新款', 'Ms.', 1, 140, 107, 'https://img.fishfay.com/shopgoods/4/112118083/zt-112118083/c213863709c1bb43f50cf55c82322c97.jpg', 88, 141.60, 245.10, 36, 95, 'tMjbYF7g7p', 127, 211, 253, '2023-03-10 21:59:40', '2023-03-12 21:39:01');
INSERT INTO `t_spu` VALUES (134, '安踏男鞋跑鞋2021新款', 'Ms.', 1, 141, 107, 'https://img.fishfay.com/shopgoods/4/112115579/zt-112115579/e9727a2c972425829714f6ca86a452b7.jpg', 11, 105.56, 944.77, 119, 125, 'VgAfSjamgg', 244, 179, 4, '2023-05-01 13:53:58', '2023-03-14 18:17:06');
INSERT INTO `t_spu` VALUES (135, '安踏男鞋跑鞋2021新款', 'Miss.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/4/112115577/zt-112115577/9de032dc519b1ee83782765345c84c88.jpg', 94, 963.92, 610.69, 94, 128, '5e86ywiCmj', 104, 122, 202, '2023-03-05 12:51:37', '2023-01-13 04:25:52');
INSERT INTO `t_spu` VALUES (136, '安踏男鞋弹力胶跑鞋2021新款', 'Mrs.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/4/112115501/zt-112115501/e798174dcc2d95b9282d7a4b75edff72.jpg', 85, 2.35, 264.73, 74, 114, 'nW7nxDmtaF', 195, 202, 15, '2023-02-27 06:40:21', '2023-02-20 00:21:52');
INSERT INTO `t_spu` VALUES (137, '安踏男鞋休闲鞋', 'Ms.', 1, 142, 100, 'https://img.fishfay.com/shopgoods/4/112048860/zt-112048860/8bf4c7a730ba14e10f625de6e302f369.jpg', 62, 991.26, 464.12, 72, 40, 'rORdUXyeOR', 209, 145, 30, '2023-02-22 21:29:14', '2023-04-29 19:37:01');
INSERT INTO `t_spu` VALUES (138, '安踏男鞋跑鞋', 'Miss.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/4/112045522/zt-112045522/aecfe497d9f27e9debf92a7286dbe449.jpg', 19, 214.41, 109.00, 55, 235, '64LKMD5Vsh', 249, 25, 94, '2023-02-24 02:57:36', '2023-03-02 06:12:13');
INSERT INTO `t_spu` VALUES (139, '安踏男鞋天行板鞋老爹鞋2021新款', 'Prof.', 1, 140, 101, 'https://img.fishfay.com/shopgoods/4/112118041/zt-112118041/d555682ef72f89f94d0a2f673d0d5fc4.jpg', 73, 57.74, 871.29, 48, 155, 'eoyM0oOT2s', 186, 123, 204, '2023-03-29 08:45:33', '2023-01-17 02:32:51');
INSERT INTO `t_spu` VALUES (140, '安踏男鞋MIX裂变休闲鞋2021新款', 'Ms.', 1, 142, 105, 'https://img.fishfay.com/shopgoods/1/112118812/zt-112118812/435ef501389428f8e3bc509c1d96bf73.jpg', 44, 412.71, 736.59, 99, 255, 'aIDBl7snoa', 58, 46, 120, '2023-03-27 11:49:06', '2023-01-08 13:23:09');
INSERT INTO `t_spu` VALUES (141, '安踏男鞋跑鞋2021新款', 'Miss.', 1, 141, 105, 'https://img.fishfay.com/shopgoods/4/112115582/zt-112115582/b46a6d141b83c46a2dd5b94d4c57d101.jpg', 97, 236.40, 292.36, 34, 172, 'RSLlLwMRt3', 44, 142, 37, '2023-05-05 06:23:33', '2023-02-05 09:41:25');
INSERT INTO `t_spu` VALUES (142, '安踏男鞋板鞋2021新款', 'Miss.', 1, 140, 103, 'https://img.fishfay.com/shopgoods/4/112118066/zt-112118066/eb4df450088de57d73f4b1aadad79fee.jpg', 71, 2.23, 945.31, 47, 123, 'XC70cC5vq7', 170, 39, 57, '2023-04-13 04:28:51', '2023-05-07 06:12:30');
INSERT INTO `t_spu` VALUES (143, '安踏男鞋休闲鞋2021新款', 'Ms.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/4/112118845/zt-112118845/367d18b2084ddcc818d3585d794fc401.jpg', 45, 850.46, 375.84, 108, 209, 'N78BpbEVjY', 105, 212, 88, '2023-04-01 02:58:42', '2023-04-15 06:08:35');
INSERT INTO `t_spu` VALUES (144, '安踏男鞋篮球鞋2021新款', 'Mr.', 1, 145, 108, 'https://img.fishfay.com/shopgoods/4/112111609/zt-112111609/1bc7bb347963d97c2be0fba69e8133e5.jpg', 66, 795.72, 891.21, 48, 92, 'NZAYL3dhF6', 185, 151, 168, '2023-04-21 07:37:08', '2023-04-02 12:09:38');
INSERT INTO `t_spu` VALUES (145, '安踏男鞋毒刺跑鞋2021新款', 'Prof.', 1, 141, 107, 'https://img.fishfay.com/shopgoods/4/112115520/zt-112115520/fc015d58aed08095da0495ecde811a9d.jpg', 6, 67.26, 735.26, 39, 19, 'sy7yGKkcER', 89, 102, 253, '2023-03-12 09:49:36', '2023-02-07 01:47:52');
INSERT INTO `t_spu` VALUES (146, '安踏男鞋汤普森KT6篮球鞋2021新款kt6', 'Prof.', 1, 145, 107, 'https://img.fishfay.com/shopgoods/21/112111101/zt-112111101/61c473f037c7b37c45d9acde66da869a.jpg', 44, 705.11, 8.03, 39, 20, 'GP3L4AEQpS', 139, 140, 21, '2023-04-30 23:21:24', '2023-04-08 21:07:10');
INSERT INTO `t_spu` VALUES (147, '安踏男鞋跑鞋', 'Prof.', 1, 141, 102, 'https://img.fishfay.com/shopgoods/1/112035557/zt-112035557/fd58d96351d4703f6faf515f86c54717.jpg', 92, 284.25, 477.03, 119, 28, 'CRet6bSc2X', 161, 152, 103, '2023-04-28 23:25:04', '2023-02-27 11:35:57');
INSERT INTO `t_spu` VALUES (148, '安踏男鞋休闲鞋', 'Prof.', 1, 142, 106, 'https://img.fishfay.com/shopgoods/1/112038861/zt-112038861/f3ad8cbd7d2aeadc519cbf62a57970b1.jpg', 77, 412.35, 396.05, 55, 109, 'HoHhs8FZSe', 48, 144, 23, '2023-04-12 05:02:05', '2023-03-21 06:43:12');
INSERT INTO `t_spu` VALUES (149, '安踏男鞋跑鞋', 'Prof.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/1/112035518/zt-112035518/a8efc0a9fe00019a3291cdac460316ee.jpg', 95, 369.99, 698.92, 107, 54, '1Yjqsyu0ao', 19, 200, 44, '2023-02-02 08:39:16', '2023-03-18 01:19:04');
INSERT INTO `t_spu` VALUES (150, '冬奥特许商品国旗款国旗青年短款连帽卫衣-女款', 'Ms.', 1, 147, 106, 'https://img.fishfay.com/shopgoods/1/162030701/zt-162030701.jpg', 38, 173.22, 155.28, 97, 183, 'uOFOUEswCJ', 24, 146, 93, '2023-04-29 22:26:01', '2023-05-07 22:44:22');
INSERT INTO `t_spu` VALUES (151, '安踏女服星标系列短袖短T恤短t', 'Mr.', 1, 148, 101, 'https://img.fishfay.com/shopgoods/4/162030103/zt-162030103.jpg', 50, 775.94, 332.23, 120, 33, '6rYuEFJ2bd', 194, 195, 73, '2023-04-28 11:05:02', '2023-02-11 20:03:36');
INSERT INTO `t_spu` VALUES (152, '安踏女服星标系列国旗中袖半袖短T恤短t', 'Ms.', 1, 149, 102, 'https://img.fishfay.com/shopgoods/4/162030704/zt-162030704.jpg', 91, 408.18, 250.53, 123, 121, 'z4fNaIJtGI', 137, 105, 182, '2023-02-12 01:28:06', '2023-04-07 18:22:02');
INSERT INTO `t_spu` VALUES (158, '安踏女服短袖短T短t', 'Mrs.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/1/162027113/zt-162027113/56cd9625fb88e57b1072d778ece99d5c.jpg', 91, 113.59, 114.44, 116, 236, '0F37tuiIDd', 59, 170, 227, '2023-03-30 04:10:39', '2023-03-11 17:34:44');
INSERT INTO `t_spu` VALUES (160, '安踏女服短袖短T短t', 'Miss.', 1, 148, 103, 'https://img.fishfay.com/shopgoods/1/162028122/zt-162028122/4faabd6abe9be6d54566bcb3823ec66b.jpg', 40, 640.92, 186.07, 111, 74, 'lNU9ZWfqJE', 232, 66, 11, '2023-04-27 17:28:35', '2023-04-07 21:23:17');
INSERT INTO `t_spu` VALUES (163, '安踏女服短袖短T恤', 'Ms.', 1, 148, 101, 'https://img.fishfay.com/shopgoods/1/162027117/zt-162027117/2808110f601aef1587708180616c15cb.jpg', 15, 614.02, 490.05, 93, 131, 'GsJYjOXcB3', 167, 131, 154, '2023-03-13 05:17:10', '2023-03-26 23:55:56');
INSERT INTO `t_spu` VALUES (166, '安踏女服短袖短T恤', 'Prof.', 1, 148, 105, 'https://img.fishfay.com/shopgoods/1/162028127/zt-162028127/e00f63034fad30ded425e103205bf2f9.jpg', 82, 792.30, 384.38, 80, 217, 'BjppD5TiJ5', 192, 21, 34, '2023-03-24 11:49:25', '2023-02-10 03:09:20');
INSERT INTO `t_spu` VALUES (202, '安踏女服短袖短T恤2021新款短t', 'Ms.', 1, 148, 106, 'https://img.fishfay.com/shopgoods/4/162128132/zt-162128132/9f20e71a93959068e0827ccdedc5ebf3.jpg', 88, 145.51, 153.49, 25, 202, 'PAdl8f6Nte', 46, 147, 76, '2023-04-01 07:23:05', '2023-01-25 10:12:14');
INSERT INTO `t_spu` VALUES (204, '安踏女服短袖短T恤2021新款短t', 'Mrs.', 1, 148, 106, 'https://img.fishfay.com/shopgoods/4/162128134/zt-162128134/063aa0b6b58bc9eacf07c715c6215f7b.jpg', 72, 182.37, 390.92, 65, 33, 'TvmbtVwm8i', 138, 243, 47, '2023-04-12 00:49:57', '2023-01-18 23:40:01');
INSERT INTO `t_spu` VALUES (207, '安踏女服短袖短T恤2021新款短t', 'Ms.', 1, 148, 104, 'https://img.fishfay.com/shopgoods/4/162128126/zt-162128126/7cb69a2e7c9d67c4c7757bf860012dc6.jpg', 64, 78.02, 850.62, 2, 249, 'wCI12R5f9P', 93, 159, 215, '2023-03-07 03:02:52', '2023-02-19 00:23:07');
INSERT INTO `t_spu` VALUES (210, '安踏女服短袖短T恤2021新款短t', 'Mrs.', 1, 148, 100, 'https://img.fishfay.com/shopgoods/4/162128137/zt-162128137/d060622e9950ca94a38f8e8f50658480.jpg', 86, 11.85, 514.82, 123, 183, 'qFVoweRgp1', 219, 142, 49, '2023-02-06 06:34:08', '2023-04-21 22:36:06');
INSERT INTO `t_spu` VALUES (211, '安踏女服短袖短T恤2021新款短t', 'Ms.', 1, 148, 104, 'https://img.fishfay.com/shopgoods/4/162128129/zt-162128129/bc86e1d2eb9395d6507535a8a69f1bae.jpg', 97, 480.52, 369.01, 30, 208, '9QeutlKi3i', 188, 202, 222, '2023-03-29 15:23:38', '2023-01-14 06:59:59');
INSERT INTO `t_spu` VALUES (214, '安踏女服短袖短T恤2021新款短t', 'Miss.', 1, 148, 105, 'https://img.fishfay.com/shopgoods/4/162128114/zt-162128114/697f642d29b34570b2a84da04a6ba85b.jpg', 91, 510.31, 603.83, 62, 144, 'JRo6EScap1', 112, 76, 165, '2023-02-08 03:27:29', '2023-02-04 00:30:38');
INSERT INTO `t_spu` VALUES (215, '安踏女服短袖短T恤2021新款短t', 'Miss.', 1, 148, 105, 'https://img.fishfay.com/shopgoods/4/162128115/zt-162128115/0de61f038e877e32bcf49ee05ab11911.jpg', 26, 876.26, 600.39, 103, 48, 'WkAJDebNKU', 208, 44, 210, '2023-04-09 21:24:31', '2023-02-26 09:17:48');
INSERT INTO `t_spu` VALUES (216, '安踏女服短袖短T恤2021新款短t', 'Mr.', 1, 148, 108, 'https://img.fishfay.com/shopgoods/4/162128138/zt-162128138/327d706a11a17e48d842b8d78a76d166.jpg', 24, 122.81, 756.05, 114, 80, 'mMH8CkeRWY', 8, 214, 30, '2023-05-05 03:14:27', '2023-03-14 02:39:12');
INSERT INTO `t_spu` VALUES (217, '安踏女服短袖短T恤2021新款短t', 'Mrs.', 1, 148, 106, 'https://img.fishfay.com/shopgoods/4/162128112/zt-162128112/6dc4d4d94e521131b5ac9bcdfdfe1030.jpg', 74, 930.54, 715.40, 87, 114, 'fL5xMOpiFQ', 77, 122, 91, '2023-03-18 16:19:45', '2023-03-26 00:19:55');
INSERT INTO `t_spu` VALUES (222, '安踏女服短袖短T恤2021新款短t', 'Mr.', 1, 148, 105, 'https://img.fishfay.com/shopgoods/4/162117110/zt-162117110/6a22a1dce04169b1bd58aa618eebe79d.jpg', 10, 238.31, 653.20, 51, 58, 'Mhl1OG4B61', 171, 96, 173, '2023-05-10 14:08:23', '2023-03-28 19:34:15');
INSERT INTO `t_spu` VALUES (260, '安踏男服短袖短T短t', 'Miss.', 1, 148, 100, 'https://img.fishfay.com/shopgoods/1/152027166/zt-152027166/2e1083858e3ab351add84d220f723241.jpg', 65, 585.64, 464.68, 124, 37, 'nEdLp35vpv', 192, 131, 134, '2023-04-13 05:48:46', '2023-02-27 21:08:58');
INSERT INTO `t_spu` VALUES (261, '安踏男服短袖短T短t', 'Mr.', 1, 148, 108, 'https://img.fishfay.com/shopgoods/1/152027171/zt-152027171/8a4fec3a54c25b8fa72e7e062324ac17.jpg', 29, 979.21, 108.29, 21, 87, '9aAmJbS8Nw', 51, 236, 8, '2023-05-03 18:53:51', '2023-01-22 16:13:33');
INSERT INTO `t_spu` VALUES (262, '安踏男服短袖短T短t', 'Miss.', 1, 148, 105, 'https://img.fishfay.com/shopgoods/1/152021117/zt-152021117/6137d2a2e065db4045219c5e8e806faa.jpg', 46, 286.47, 534.06, 31, 228, 'XUEmuvysgr', 91, 176, 46, '2023-03-06 18:45:59', '2023-03-10 20:03:45');
INSERT INTO `t_spu` VALUES (263, '安踏男服短袖短T短t', 'Miss.', 1, 148, 104, 'https://img.fishfay.com/shopgoods/1/152021125/zt-152021125/cc12fcbf38451c46a0fac79a872fe4f8.jpg', 9, 274.76, 298.53, 81, 134, 'zvcNn7wBiE', 84, 2, 122, '2023-02-18 13:44:34', '2023-04-13 17:31:20');
INSERT INTO `t_spu` VALUES (264, '安踏男服短袖短T短t', 'Mr.', 1, 148, 104, 'https://img.fishfay.com/shopgoods/1/152021128/zt-152021128/08d7ff781570bb472753b38086f2a0af.jpg', 20, 235.96, 748.63, 6, 113, '7Kfo9t9LIj', 78, 124, 71, '2023-03-03 04:02:30', '2023-03-25 10:00:37');
INSERT INTO `t_spu` VALUES (268, '安踏男服中国系列短袖短T恤', 'Mrs.', 1, 148, 106, 'https://img.fishfay.com/shopgoods/1/152027169/zt-152027169/6ed14407f0cfa962f487d9bf3235486d.jpg', 100, 765.08, 44.24, 100, 182, '6gLQj1B096', 207, 214, 230, '2023-02-02 14:37:31', '2023-03-23 07:55:47');
INSERT INTO `t_spu` VALUES (269, '安踏男服短袖短T恤', 'Mr.', 1, 148, 107, 'https://img.fishfay.com/shopgoods/1/152028113/zt-152028113/137b0a3477569b9751e2edcf8547b67b.jpg', 63, 116.43, 972.22, 68, 32, 'yO7JgHcqRn', 239, 183, 140, '2023-03-20 19:24:11', '2023-02-07 21:39:19');
INSERT INTO `t_spu` VALUES (270, '安踏男服要疯短袖短T恤', 'Mr.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/1/152021167/zt-152021167/3db6bd19f47e75b5cacc8d8e0ed57c68.jpg', 101, 234.43, 762.69, 25, 136, 'wJis02GlGE', 48, 75, 147, '2023-03-19 01:49:08', '2023-03-08 01:16:42');
INSERT INTO `t_spu` VALUES (271, '安踏男服KT汤普森Rocco短袖短T恤kt', 'Miss.', 1, 148, 108, 'https://img.fishfay.com/shopgoods/1/152021108/zt-152021108/feb8cc5722f88a931b80f7432daa7a71.jpg', 97, 384.86, 801.02, 87, 83, 'eQPhu6YNHL', 94, 231, 77, '2023-03-04 08:48:49', '2023-01-23 06:56:12');
INSERT INTO `t_spu` VALUES (274, '安踏男服KT汤普森Rocco短袖短T恤kt', 'Prof.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/1/152021154/zt-152021154/144434ebe306b552f4728fc7a64bf25f.jpg', 53, 591.41, 923.14, 70, 8, 'qF6ykZOUrd', 52, 19, 29, '2023-02-13 06:47:55', '2023-03-09 08:34:45');
INSERT INTO `t_spu` VALUES (275, '安踏男服KT汤普森Rocco短袖短T恤kt', 'Mrs.', 1, 148, 108, 'https://img.fishfay.com/shopgoods/1/152021109/zt-152021109/1f764fa460695580f7ff41384bc35ead.jpg', 33, 568.50, 764.76, 108, 149, '3zOMJXcOMP', 25, 33, 248, '2023-04-16 21:35:35', '2023-04-09 22:58:15');
INSERT INTO `t_spu` VALUES (276, '安踏男服短袖短T恤', 'Ms.', 1, 148, 100, 'https://img.fishfay.com/shopgoods/1/152028111/zt-152028111/a96e285e97eecd28965939f47389aaca.jpg', 38, 371.84, 267.73, 10, 228, '8Crc6gvYXr', 224, 127, 47, '2023-03-03 08:18:39', '2023-01-22 18:52:24');
INSERT INTO `t_spu` VALUES (278, '安踏男服短袖短T恤', 'Prof.', 1, 148, 106, 'https://img.fishfay.com/shopgoods/1/152028140/zt-152028140/1a76e846c121ecfc1436c34a15cacf82.jpg', 94, 180.05, 21.52, 4, 24, 'CGuxHLTlGn', 111, 87, 36, '2023-03-06 12:06:33', '2023-04-26 22:13:33');
INSERT INTO `t_spu` VALUES (279, '安踏男服短袖短T恤', 'Mr.', 1, 148, 101, 'https://img.fishfay.com/shopgoods/1/152028130/zt-152028130/cd2cdb4e6a9046ff441595658459b3b7.jpg', 97, 663.01, 351.06, 23, 231, 'mHxNQ9fYdO', 228, 174, 156, '2023-04-03 08:43:20', '2023-01-03 23:03:53');
INSERT INTO `t_spu` VALUES (280, '安踏男服短袖短T恤', 'Ms.', 1, 148, 105, 'https://img.fishfay.com/shopgoods/1/152028128/zt-152028128/1bf08ecae747c68aa60dedbd195f8722.jpg', 45, 635.01, 397.90, 13, 104, '9L1cAfZTsv', 93, 240, 38, '2023-03-16 17:40:38', '2023-03-30 10:49:34');
INSERT INTO `t_spu` VALUES (281, '安踏男服海沃德GH短袖短T恤', 'Mrs.', 1, 148, 103, 'https://img.fishfay.com/shopgoods/1/152021121/zt-152021121/d36b80102612ec660b78257018b336f9.jpg', 45, 853.24, 972.25, 125, 9, 'o7tnTXIjCm', 207, 88, 167, '2023-02-22 17:38:52', '2023-03-19 02:52:16');
INSERT INTO `t_spu` VALUES (283, '安踏男服短T短袖T恤', 'Prof.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/1/95017106/zt-95017106/6a9826d359fb5bf65a8fbe769a8ee784.jpg', 93, 61.94, 660.87, 104, 60, 'zkzTWSQOCZ', 205, 97, 150, '2023-02-11 12:47:03', '2023-05-06 18:22:06');
INSERT INTO `t_spu` VALUES (285, '安踏男服短袖图案T恤短袖t恤', 'Ms.', 1, 148, 108, 'https://img.fishfay.com/shopgoods/1/95928149/zt-95928149/355743b6011fb12f73a5fba1daa3addc.jpg', 88, 294.86, 459.09, 34, 212, 'hPS24A6DuR', 173, 151, 250, '2023-03-25 17:56:22', '2023-01-24 18:05:14');
INSERT INTO `t_spu` VALUES (294, '冬奥特许商品国旗款国旗青年基础款短袖针织衫', 'Ms.', 1, 148, 103, 'https://img.fishfay.com/shopgoods/1/152030102/zt-152030102.jpg', 56, 851.65, 973.22, 119, 197, 'OaJdbCqZTc', 125, 250, 202, '2023-02-12 13:19:58', '2023-03-17 01:24:09');
INSERT INTO `t_spu` VALUES (300, '安踏男服星标系列国旗短袖短T恤', 'Ms.', 1, 148, 107, 'https://img.fishfay.com/shopgoods/4/152030111/zt-152030111.jpg', 73, 140.79, 321.66, 110, 216, 'gtxi9Nu9Vu', 43, 205, 118, '2023-04-20 18:57:54', '2023-02-20 15:40:41');
INSERT INTO `t_spu` VALUES (301, '安踏男服KT汤普森短袖短T新kt短t', 'Prof.', 1, 148, 103, 'https://img.fishfay.com/shopgoods/4/152031143/zt-152031143/57e758258a18d906002043ed8daaf56d.jpg', 28, 758.82, 43.63, 23, 217, '8CpnBErEFr', 30, 242, 126, '2023-03-02 12:13:50', '2023-02-07 23:17:04');
INSERT INTO `t_spu` VALUES (302, '安踏男服天地共存系列短袖短T短t', 'Prof.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/1/152021135R/zt-152021135R/99d73cbfec980d298b95fa39a290776f.jpg', 44, 475.02, 693.33, 39, 104, 'yLdCylNe0Y', 253, 67, 101, '2023-02-15 02:37:43', '2023-03-24 11:01:49');
INSERT INTO `t_spu` VALUES (303, '安踏男服要疯系列短袖短T短t', 'Ms.', 1, 148, 101, 'https://img.fishfay.com/shopgoods/4/152031129/zt-152031129/4bc2148b2a35238eb46cfc6d4d63669c.jpg', 2, 655.40, 264.07, 52, 146, 'TbD5JW5Z5D', 87, 203, 8, '2023-05-02 06:57:26', '2023-04-01 11:18:50');
INSERT INTO `t_spu` VALUES (304, '安踏男服汤普森KT系列短袖短Tkt短t', 'Mrs.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/1/152021102/zt-152021102/b2e6f33972dcfe1c461e0bebe4ea49b8.jpg', 66, 904.01, 233.75, 27, 13, 'la5OKJRiiV', 186, 237, 232, '2023-03-15 01:50:25', '2023-03-14 13:02:20');
INSERT INTO `t_spu` VALUES (305, '安踏男服要疯系列短袖短T短t', 'Mr.', 1, 148, 102, 'https://img.fishfay.com/shopgoods/4/152031127/zt-152031127/8a6f5416ba03588e1db7f10137b87d5e.jpg', 65, 874.14, 0.04, 96, 129, 'p50AV8CBJv', 195, 13, 113, '2023-02-28 06:38:11', '2023-01-25 01:30:36');
INSERT INTO `t_spu` VALUES (306, '安踏男服海沃德系列短袖短T恤短t', 'Miss.', 1, 148, 108, 'https://img.fishfay.com/shopgoods/4/152031118/zt-152031118/793224d4b6f299f4f6d0bc417c677991.jpg', 64, 112.04, 300.20, 21, 49, 'BOkkNCUFdZ', 180, 89, 131, '2023-03-04 09:37:22', '2023-03-01 14:13:18');
INSERT INTO `t_spu` VALUES (312, '安踏男服短袖短T短t', 'Mr.', 1, 148, 101, 'https://img.fishfay.com/shopgoods/1/152028155/zt-152028155/472978f5989f218df68c14c52c750f98.jpg', 89, 550.42, 219.74, 28, 143, 'grltyZXWz9', 110, 190, 7, '2023-04-05 04:48:44', '2023-03-04 11:56:49');
INSERT INTO `t_spu` VALUES (364, '安踏儿童男中大童跑鞋2021新款', 'Prof.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/17/312125516/zt-312125516/3d63a8aac36fffc6d4eb74f32a94baa1.jpg', 59, 819.85, 150.78, 109, 211, 'IgX8M5bf2J', 205, 80, 36, '2023-04-08 08:49:20', '2023-02-13 08:49:01');
INSERT INTO `t_spu` VALUES (367, '安踏儿童男中大童跑鞋2021新款', 'Mr.', 1, 141, 105, 'https://img.fishfay.com/shopgoods/17/312125592/zt-312125592/782ba61d9da5f746d8bdc5b8b7991497.jpg', 21, 292.03, 876.55, 98, 81, '5Vbo53V72e', 166, 61, 38, '2023-04-13 02:00:56', '2023-05-06 21:59:39');
INSERT INTO `t_spu` VALUES (370, '安踏儿童男中大童跑鞋2021新款', 'Prof.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/17/312125599/zt-312125599/d903ef03ac53da9a9d8a598bc7522266.jpg', 20, 551.30, 342.42, 6, 232, 'SJT1GjXSVW', 37, 155, 33, '2023-02-21 13:11:22', '2023-02-12 08:55:39');
INSERT INTO `t_spu` VALUES (373, '安踏儿童男女小童休闲鞋2021新款', 'Miss.', 1, 142, 105, 'https://img.fishfay.com/shopgoods/17/332129941/zt-332129941/3296c5874706ca0098bbd3906f75e0fa.jpg', 48, 415.35, 130.90, 96, 6, 'RYiaWJnjec', 197, 104, 212, '2023-04-10 07:02:17', '2023-02-03 06:25:31');
INSERT INTO `t_spu` VALUES (376, '安踏儿童男女小童沙滩凉鞋2021新款', 'Miss.', 1, 144, 108, 'https://img.fishfay.com/shopgoods/17/332129943/zt-332129943/b4b6890885b4ad6190e968a4ddc4d4d7.jpg', 56, 348.19, 850.07, 102, 82, 'VVprPnj0Kq', 86, 210, 202, '2023-04-21 04:02:57', '2023-01-02 19:34:03');
INSERT INTO `t_spu` VALUES (378, '安踏儿童男女小童跑鞋2021新款', 'Mrs.', 1, 141, 104, 'https://img.fishfay.com/shopgoods/17/332129973/zt-332129973/9588702a07e195d78ce7ff279cc282ff.jpg', 96, 903.47, 742.95, 41, 9, 'h0pW8uILlo', 84, 124, 28, '2023-04-14 01:14:10', '2023-04-08 09:19:23');
INSERT INTO `t_spu` VALUES (380, '安踏儿童男女小童休闲鞋2021新款', 'Prof.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/17/332129987/zt-332129987/f7459a7f811923b1c837731df54bad3f.jpg', 15, 798.36, 70.11, 29, 168, 'XgxR7Zz5hP', 183, 170, 52, '2023-03-16 11:27:52', '2023-03-01 09:05:12');
INSERT INTO `t_spu` VALUES (382, '安踏儿童男女婴童跑鞋2021新款', 'Prof.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/17/332120032/zt-332120032/29a6be0ba07cbdd43b74a1eeb45f6862.jpg', 72, 543.33, 93.14, 38, 234, '4dy5lWLipi', 189, 170, 246, '2023-04-04 16:43:56', '2023-02-23 08:37:20');
INSERT INTO `t_spu` VALUES (384, '安踏儿童男女婴童跑鞋2021新款', 'Mrs.', 1, 141, 106, 'https://img.fishfay.com/shopgoods/17/332120016/zt-332120016/2f9ec7c51ae5c2e5019c612703395c82.jpg', 9, 521.69, 41.38, 21, 109, 'D3TJjLkhnC', 104, 79, 151, '2023-04-18 21:09:38', '2023-02-13 06:16:16');
INSERT INTO `t_spu` VALUES (403, '安踏儿童男小童跑鞋', 'Miss.', 1, 141, 107, 'https://img.fishfay.com/shopgoods/21/332119953/zt-332119953/f7c156f85b4ee5adf6e2c0f56ac2739d.jpg', 58, 788.10, 714.97, 62, 80, 'p5SLn3bfnM', 55, 13, 249, '2023-03-23 16:50:40', '2023-02-05 04:33:32');
INSERT INTO `t_spu` VALUES (404, '安踏儿童女小童运动跑鞋', 'Ms.', 1, 141, 110, 'https://img.fishfay.com/shopgoods/21/332119961/zt-332119961/815fa3405c0cb47cb97f45f95ebd3242.jpg', 38, 905.10, 762.80, 95, 166, 'YNv2J1zYDc', 218, 59, 148, '2023-02-02 02:14:59', '2023-01-29 16:38:54');
INSERT INTO `t_spu` VALUES (405, '安踏儿童男女小童20年新款运动跑步训练鞋', 'Mrs.', 1, 141, 102, 'https://img.fishfay.com/shopgoods/17/332039936/zt-332039936.jpg', 82, 164.29, 872.07, 66, 15, 'RanES1Iy8U', 112, 252, 186, '2023-02-22 03:15:07', '2023-01-24 11:54:47');
INSERT INTO `t_spu` VALUES (406, '安踏儿童女中大童休闲鞋', 'Ms.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/21/322118878/zt-322118878/8860ea502fb5aa80628c7f0b44ff5a31.jpg', 35, 683.42, 337.96, 123, 1, 'Rn2fCIJWm3', 37, 249, 31, '2023-03-01 22:01:31', '2023-02-08 03:02:03');
INSERT INTO `t_spu` VALUES (407, '安踏儿童男小童休闲鞋', 'Ms.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/21/332049912/zt-332049912/176606864f12cbd76e70a1b442fdab4c.jpg', 9, 150.63, 946.43, 66, 107, 'uGQtepNCW5', 72, 32, 209, '2023-02-13 18:09:32', '2023-01-02 12:20:08');
INSERT INTO `t_spu` VALUES (408, '安踏儿童男小童运动跑鞋', 'Ms.', 1, 141, 101, 'https://img.fishfay.com/shopgoods/21/332119911/zt-332119911/3afe8a30628d77bd0b9f11909e0a1944.jpg', 69, 525.29, 301.34, 10, 170, 'HP8wTe1eDp', 16, 112, 137, '2023-04-02 16:29:03', '2023-05-02 21:57:43');
INSERT INTO `t_spu` VALUES (409, '安踏儿童男小童运动跑鞋', 'Prof.', 1, 141, 100, 'https://img.fishfay.com/shopgoods/21/332119912/zt-332119912/e247c623f85fbd97145c7468c8d54721.jpg', 24, 323.66, 929.73, 54, 126, 'lJ76JiziNk', 218, 91, 192, '2023-04-12 03:50:40', '2023-02-23 15:25:10');
INSERT INTO `t_spu` VALUES (410, '安踏儿童小童男女同款时尚休闲板鞋', 'Miss.', 1, 140, 100, 'https://img.fishfay.com/shopgoods/21/332119931/zt-332119931/98b5b203fa88f1119d21ca446d709dd3.jpg', 66, 534.74, 512.08, 28, 15, '7hUmS4EbGJ', 45, 180, 97, '2023-03-08 13:33:43', '2023-01-24 14:23:36');
INSERT INTO `t_spu` VALUES (411, '安踏儿童男小童', 'Ms.', 1, 142, 108, 'https://img.fishfay.com/shopgoods/17/332029972/zt-332029972/407a5f41e1f335eae08062a425b0e67e.jpg', 94, 458.73, 710.77, 108, 254, '4xczi6TCsK', 151, 120, 224, '2023-02-26 16:29:46', '2023-05-04 11:41:32');
INSERT INTO `t_spu` VALUES (412, '安踏儿童女中大童运动户外跑步鞋子', 'Prof.', 1, 141, 106, 'https://img.fishfay.com/shopgoods/17/322035586/zt-322035586.jpg', 19, 340.40, 473.41, 122, 72, 'itxXkanQSo', 253, 79, 243, '2023-03-07 04:58:38', '2023-03-15 12:00:20');
INSERT INTO `t_spu` VALUES (413, '安踏儿童女小童秋季新款时尚休闲鞋', 'Ms.', 1, 142, 102, 'https://img.fishfay.com/shopgoods/17/322039926/zt-322039926.jpg', 50, 637.00, 471.77, 87, 111, 'MS7EwvmSBS', 169, 212, 111, '2023-02-25 06:32:35', '2023-05-01 19:22:44');
INSERT INTO `t_spu` VALUES (414, '安踏儿童男中大童跑鞋', 'Miss.', 1, 141, 102, 'https://img.fishfay.com/shopgoods/21/312115501/zt-312115501/42fa1c9d23f7f8c48d622a781f77302a.jpg', 60, 542.61, 513.23, 110, 78, 'ydRntP2xO0', 7, 177, 141, '2023-03-12 11:11:14', '2023-01-27 04:48:16');
INSERT INTO `t_spu` VALUES (415, '安踏儿童男中大童休闲鞋', 'Miss.', 1, 142, 109, 'https://img.fishfay.com/shopgoods/21/312118876/zt-312118876/74d516be721168d02afff4570df93fda.jpg', 10, 585.63, 376.42, 18, 31, 'E5V23p4bm1', 155, 87, 31, '2023-03-25 20:35:36', '2023-04-08 21:19:49');
INSERT INTO `t_spu` VALUES (416, '安踏儿童男中大童霸道休闲鞋', 'Miss.', 1, 142, 106, 'https://img.fishfay.com/shopgoods/21/312118878/zt-312118878/d0ea2d0b534cff20b01e22f5f9064591.jpg', 75, 739.67, 388.85, 115, 3, 'Tkcqu10Mzi', 144, 246, 28, '2023-04-24 05:03:20', '2023-03-30 19:13:40');
INSERT INTO `t_spu` VALUES (417, '安踏儿童女中大童板鞋', 'Prof.', 1, 140, 108, 'https://img.fishfay.com/shopgoods/21/322118002/zt-322118002/197d574a1d2b178939c66574a724d75a.jpg', 99, 344.58, 824.13, 113, 123, 'tjknYyuakR', 88, 231, 17, '2023-03-03 11:04:32', '2023-02-15 19:34:28');
INSERT INTO `t_spu` VALUES (418, '安踏儿童女中大童生活休闲鞋', 'Mr.', 1, 142, 101, 'https://img.fishfay.com/shopgoods/21/322118801/zt-322118801/a30c0997eab63fc4175d1bca8937e3f0.jpg', 93, 585.48, 267.49, 100, 49, '1ZkP1J82O4', 193, 171, 178, '2023-02-03 04:23:31', '2023-01-11 07:15:04');
INSERT INTO `t_spu` VALUES (503, '安踏儿童女大童沙滩凉鞋2021新款', 'Prof.', 1, 144, 101, 'https://img.fishfay.com/shopgoods/17/322126967/zt-322126967/dadb9b8b04ca84df7b3c32b280fde087.jpg', 58, 377.54, 713.04, 80, 226, 'Wsgh4bY3bc', 132, 185, 62, '2023-04-24 23:31:28', '2023-01-02 06:27:36');
INSERT INTO `t_spu` VALUES (504, '安踏儿童女中大童休闲鞋2021新款', 'Prof.', 1, 142, 100, 'https://img.fishfay.com/shopgoods/17/322128877/zt-322128877/56b387b83bb9594b4766a28944cee456.jpg', 96, 149.05, 982.40, 5, 32, 'vGvR7G3SQN', 116, 197, 23, '2023-02-05 13:45:34', '2023-05-06 04:01:52');
INSERT INTO `t_spu` VALUES (505, '安踏儿童男小童沙滩凉鞋包头凉鞋2021新款', 'Ms.', 1, 144, 109, 'https://img.fishfay.com/shopgoods/17/332129961/zt-332129961/2a139bffff2825affed51e201f3745d2.jpg', 76, 917.13, 437.41, 1, 57, '8Vz8svMqmf', 206, 128, 54, '2023-03-27 08:56:13', '2023-04-07 02:01:37');
INSERT INTO `t_spu` VALUES (508, '安踏儿童男小童沙滩凉鞋2021新款', 'Ms.', 1, 144, 108, 'https://img.fishfay.com/shopgoods/17/332129962/zt-332129962/ff1628b532bdabbc9dea842977052ce1.jpg', 32, 339.70, 436.49, 69, 81, 'xK0gnOYkgS', 23, 153, 34, '2023-02-25 22:45:48', '2023-01-09 14:35:53');
INSERT INTO `t_spu` VALUES (509, '安踏儿童女中大童2037新款休闲鞋', 'Prof.', 1, 142, 108, 'https://img.fishfay.com/shopgoods/17/322028958/zt-322028958/7c64ef9a0de6b1c2119977f378b885d0.jpg', 8, 119.92, 312.49, 74, 88, 'qLCYRQ3qey', 171, 129, 41, '2023-02-22 13:12:49', '2023-04-22 00:11:31');
INSERT INTO `t_spu` VALUES (511, '安踏儿童男童中大童冬奥特许商品国旗款短袖短T恤', 'Miss.', 1, 148, 106, 'https://img.fishfay.com/shopgoods/1/A35037101/zt-A35037101/2ce08f87405cdf2abb9fc8e83765efc1.jpg', 9, 517.53, 887.52, 16, 121, '7uNN80ewgC', 32, 162, 238, '2023-03-17 15:54:09', '2023-04-17 18:48:23');
INSERT INTO `t_spu` VALUES (531, '安踏男鞋行云流水汤普森KT6-LOW篮球鞋2021新款kt6', 'Mr.', 1, 145, 103, 'https://img.fishfay.com/shopgoods/1/112121102/zt-112121102/97260d43370087d3a697cbf7d2bd2cbf.jpg', 24, 494.01, 843.22, 18, 116, '8XLL1tWvt5', 14, 58, 92, '2023-05-06 07:24:19', '2023-03-19 10:31:25');
INSERT INTO `t_spu` VALUES (532, '安踏男鞋史努比联名沙滩拖鞋2021新款', 'Mr.', 1, 146, 108, 'https://img.fishfay.com/shopgoods/1/912126993/zt-912126993/0b7ac3be53d1181a26816cfc1bf475dc.jpg', 101, 83.87, 957.23, 111, 231, 'R41ENgYylj', 194, 75, 87, '2023-02-05 07:14:10', '2023-02-07 10:42:36');
INSERT INTO `t_spu` VALUES (533, '安踏女鞋史努比联名沙滩拖鞋2021新款', 'Prof.', 1, 146, 107, 'https://img.fishfay.com/shopgoods/1/922126993/zt-922126993/787a08a1527ff8266c0b2b098e9a6dc5.jpg', 88, 849.96, 305.90, 36, 60, 'FdsnXCfX8W', 89, 201, 165, '2023-04-03 20:53:34', '2023-02-13 08:29:01');
INSERT INTO `t_spu` VALUES (548, '李宁休闲外套2021春季新款', 'Prof.', 2, 147, 109, 'http://localhost:3000/uploads/file-1619487331732.jpg', 22, 187.93, 49.83, 119, 147, 'XBhQyS7Zqy', 238, 102, 242, '2023-04-11 09:52:57', '2023-01-20 07:44:58');

-- ----------------------------
-- Table structure for t_store
-- ----------------------------
DROP TABLE IF EXISTS `t_store`;
CREATE TABLE `t_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺图片',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名字',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商铺地址',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商店登录密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺logo',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家电话',
  `region` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家所在区域',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营者名字',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺介绍',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺表\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_store
-- ----------------------------
INSERT INTO `t_store` VALUES (2, 'Qiu Jiehong', '869 Hanover St', 'seR1F6e8Fw', 'zfQHSzY6FY', 'WilWwKXW7j', 'United Kingdom', 'Qiu Jiehong', 'M49POAoits', '2021-04-03 16:47:24', '2013-06-25 05:51:05');
INSERT INTO `t_store` VALUES (3, 'Shimizu Momoka', '160 Figueroa Street', 'yXGPmH8Nvy', 'GaUJSiG5zt', 'gMoNXHge6k', 'United States', 'Shimizu Momoka', 'kbbCJnlEdf', '2021-11-18 02:50:51', '2001-04-24 01:51:59');
INSERT INTO `t_store` VALUES (4, 'Gladys Olson', '5-4-8 Kikusui 3 Jo, Shiroishi Ward,', 'bSUBZQh7cQ', 'AMAzrEQQhp', 'veef9hvCf2', 'Japan', 'Gladys Olson', 'YLeoG95bDh', '2008-07-04 15:07:17', '2013-06-19 09:20:21');
INSERT INTO `t_store` VALUES (5, 'Randy Tran', '674 Wall Street', 'H8VMtKoNcA', 'nXLtLvv70x', 'FlLd8jw5R2', 'United States', 'Randy Tran', 'Jb1DfF8eBu', '2007-03-25 07:45:28', '2015-10-12 03:49:08');
INSERT INTO `t_store` VALUES (6, 'Ellen Walker', '720 Lefeng 6th Rd', 'gAdvcD8vAJ', 'PToNiWJecn', 'MQfKRhb7ov', 'China', 'Ellen Walker', 'IWrdN9G3qo', '2002-04-14 21:53:32', '2013-03-26 15:17:41');
INSERT INTO `t_store` VALUES (7, 'Dai Zitao', '190 Pollen Street', 'uQPwVnW39B', 'zANb4Nla28', '8wAIfddpCy', 'United Kingdom', 'Dai Zitao', 'LdSqebaHbM', '2011-10-18 11:57:10', '2010-07-23 04:20:54');
INSERT INTO `t_store` VALUES (8, 'Cao Yuning', '695 New Street', 'RD4ZN6UdtR', '1JryjrTXGU', 'SSuxD8vSnZ', 'United Kingdom', 'Cao Yuning', 'LopjPulZQw', '2006-05-29 09:20:46', '2007-04-13 22:37:59');
INSERT INTO `t_store` VALUES (9, 'Hashimoto Ren', '228 Xiaoping E Rd, Baiyun ', '2gdtyRsBf5', 'uCapEirKEA', 'UaRuSSEHw9', 'China', 'Hashimoto Ren', 'RTfvhwnxfz', '2008-04-09 12:57:26', '2003-08-07 06:10:04');
INSERT INTO `t_store` VALUES (10, 'Watanabe Nanami', '281 49/50 Strand, Charing Cross', '5aHDl7ysx9', 'bZyxihCJ4X', 'VV8wqNJHLE', 'United Kingdom', 'Watanabe Nanami', 'kXHcxygdUy', '2019-07-02 16:30:32', '2010-03-03 03:38:27');
INSERT INTO `t_store` VALUES (11, 'Ono Sakura', '1 1-1 Honjocho, Yamatokoriyama', 'wSHsgq8NCk', 'FTlpEQfZGi', 'UdnvXzPbvz', 'Japan', 'Ono Sakura', 'xjrxWNWaRn', '2008-10-31 02:52:17', '2010-10-12 20:14:51');
INSERT INTO `t_store` VALUES (12, 'Kaneko Riku', '743 Tangyuan Street 5th Alley, Airport Road, Baiyun', 'UezyoYqmPw', 'uyGxzcm45w', '5hKlgvWGr1', 'China', 'Kaneko Riku', 'mdiuJkG5yb', '2008-08-01 06:16:20', '2010-11-04 06:42:46');
INSERT INTO `t_store` VALUES (13, 'Tian Jiehong', '5-19-18 Shinei 4 Jo, Kiyota Ward', 'DwBZFecXoe', 'wI6rx3fmqd', 'oyODNvPyiv', 'Japan', 'Tian Jiehong', 'CxeG0lcSxZ', '2002-02-07 14:08:25', '2014-03-31 21:03:14');
INSERT INTO `t_store` VALUES (14, 'Fujii Airi', '697 Mosley St', '24cQkXhYP1', 'p0Avf0yAKK', '3dqFhMma3t', 'United Kingdom', 'Fujii Airi', 'r2w0RyZGAK', '2017-04-16 08:06:42', '2007-06-04 16:29:25');
INSERT INTO `t_store` VALUES (15, 'Takahashi Airi', '834 Flatbush Ave', 'O87vWK783P', 'PDN3CFJ3Cw', 'gJdN7pEsGd', 'United States', 'Takahashi Airi', '1bWuuqKpUG', '2011-06-29 01:58:30', '2009-01-16 02:59:57');
INSERT INTO `t_store` VALUES (16, 'Ti Siu Wai', '2-1-17 Kaminopporo 1 Jo, Atsubetsu Ward', '2bejBfLB1Z', 'ZQEUgwSZJg', 'jBlyRG7vXq', 'Japan', 'Ti Siu Wai', 'BS9WOdXUG5', '2010-04-30 11:30:07', '2013-02-23 02:07:07');
INSERT INTO `t_store` VALUES (17, 'Wan Ka Man', '799 Zhongshan 5th Rd, Zimaling Shangquan', 'hyu6P9XbZi', 'NiTR6zTbEx', 'HanEbBcmAu', 'China', 'Wan Ka Man', 'a4AzHEYIkS', '2016-11-11 14:57:15', '2015-10-05 02:34:14');
INSERT INTO `t_store` VALUES (18, 'Yan Lu', '5 1-1 Honjocho, Yamatokoriyama', 'NM14dmYlXR', '8ANvn3ou9p', 'doZ2ggbZyq', 'Japan', 'Yan Lu', 'jFbF5xvBqV', '2013-01-20 07:08:58', '2013-09-03 22:34:35');
INSERT INTO `t_store` VALUES (19, 'Kam On Kay', '744 39 William IV St, Charing Cross', 'PqTvO9c4RF', '57XJi2HepR', 'JS7LhjTxrG', 'United Kingdom', 'Kam On Kay', 'uSwyO9ckIU', '2007-05-22 16:55:47', '2008-11-03 05:29:41');
INSERT INTO `t_store` VALUES (20, 'Xiao Yunxi', '733 Lark Street', 'UpaDuvdNbH', 'aPIQ6FkGrU', 'vPOpqx4ddZ', 'United States', 'Xiao Yunxi', 'K8B3yiBPGG', '2014-02-08 17:59:01', '2010-04-02 23:01:41');
INSERT INTO `t_store` VALUES (21, 'Yao Lu', '735 Fifth Avenue', 'iforFwAkpA', '61quAaRKcM', 'zbuz3txATe', 'United States', 'Yao Lu', 'DifQRg9ApY', '2005-11-05 10:40:37', '2010-01-30 01:16:11');
INSERT INTO `t_store` VALUES (22, 'Zhou Anqi', '855 W Ring Rd, Buji Town, Longgang', 'qVfVOWvxj2', 'MPPYv8lmYC', 'mGI4fm8Ga8', 'China', 'Zhou Anqi', '05p5YECKq9', '2012-10-26 14:17:21', '2013-01-04 06:35:18');
INSERT INTO `t_store` VALUES (23, 'To Kwok Kuen', '526 Bank Street', 'jibL7x97ZH', 'JzMRK0TJxg', '8RxR3wdihI', 'United States', 'To Kwok Kuen', '58MgGUHNhY', '2012-03-30 02:08:11', '2003-07-31 04:51:18');
INSERT INTO `t_store` VALUES (24, 'Wu Yunxi', '545 Sackville St', 'iW3aYEnPOH', 'o2EcELB9Li', 'e9nZgLzeCs', 'United Kingdom', 'Wu Yunxi', '3JUKycIwH6', '2017-08-04 02:15:47', '2018-08-12 16:08:09');
INSERT INTO `t_store` VALUES (25, 'Joanne Black', '3-27-11 Higashitanabe, Higashisumiyoshi Ward', '3D0NXD1AaE', 'ZqlD6WoEZs', 'dI2YT43Ps1', 'Japan', 'Joanne Black', 'FV6IECmUry', '2006-03-08 06:20:35', '2012-12-02 10:27:24');
INSERT INTO `t_store` VALUES (26, 'Ying Wing Sze', '941 West Market Street', 'm7vQTR2gxY', 'EavUqVhsYK', 'KZZQdxu0Q1', 'United States', 'Ying Wing Sze', 'dsRbWBJeig', '2005-02-18 18:32:10', '2004-08-10 23:09:04');
INSERT INTO `t_store` VALUES (27, 'Theresa Stevens', '646 North Michigan Ave', 'FXcZcqq4lC', 'p2QL95uUQQ', 'dE4zKIzlHk', 'United States', 'Theresa Stevens', 'coHlrjOwsQ', '2019-06-24 10:52:39', '2009-12-06 17:36:03');
INSERT INTO `t_store` VALUES (28, 'Kam Ka Man', '408 Pedway', 'XqY8capN29', '6l2JJ8bsDl', 'WzJ4ZPWJGG', 'United States', 'Kam Ka Man', 'NesBCreHop', '2016-07-01 18:18:09', '2002-06-11 14:57:30');
INSERT INTO `t_store` VALUES (29, 'Nakamori Rin', '2-1-3 Kaminopporo 1 Jo, Atsubetsu Ward', 'bFxjpTXyjP', 'xD7go8BQeI', '1k5gkmApsc', 'Japan', 'Nakamori Rin', 'mMpS3rtPCq', '2023-01-18 07:22:43', '2008-04-04 12:36:20');
INSERT INTO `t_store` VALUES (30, 'Chiang Wing Kuen', '192 North Michigan Ave', 'CfsAFDvA9z', 'ycvcgFMvSL', 'DUgjDjfxqa', 'United States', 'Chiang Wing Kuen', 'WKJosbQYbb', '2012-03-12 11:54:14', '2011-05-17 18:16:37');
INSERT INTO `t_store` VALUES (31, 'Lam Wing Fat', '569 East Cooke Road', '6LFSyna5Zd', 'RwALqYBhO6', '4NbQiTJfdV', 'United States', 'Lam Wing Fat', 'VwdUiyE3qY', '2002-11-16 14:54:31', '2015-03-09 01:15:01');
INSERT INTO `t_store` VALUES (32, 'Kwong Hui Mei', '540 Park End St', '4QSVSiJNU2', 'Zzw8OUEpx5', 'rsTdpzdKax', 'United Kingdom', 'Kwong Hui Mei', '0c6ENIWkau', '2017-07-28 19:45:18', '2011-11-12 04:53:12');
INSERT INTO `t_store` VALUES (33, 'Wei Anqi', '594 FuXingMenNei Street, XiCheng District', 'xsyOkUliYA', 'lQzJPT6GgZ', '6yCY42JCwM', 'China', 'Wei Anqi', 'jWQLrUEVOY', '2011-01-29 17:01:28', '2003-05-31 12:33:46');
INSERT INTO `t_store` VALUES (34, 'Murata Ayato', '712 4th Section  Renmin South Road, Jinjiang District', 'Xz3XArRIzt', 'BhzHfsPdbq', 'BFYhAzKDzA', 'China', 'Murata Ayato', 'KuatZwIazS', '2003-10-25 02:54:45', '2004-09-28 06:29:53');
INSERT INTO `t_store` VALUES (35, 'Watanabe Hana', '373 Whitehouse Lane, Huntingdon Rd', 'DgxKbcLQBT', 'UNqkqKdhPT', 'QcIfLUvFtw', 'United Kingdom', 'Watanabe Hana', 'AjwEU29dfQ', '2010-08-28 03:17:44', '2013-02-22 09:25:17');
INSERT INTO `t_store` VALUES (36, 'Lai Fat', '960 West Chang\'an Avenue, Xicheng District', 'brB61g6tjk', 'ulUi4uA5xX', 'D1cn9hg4HO', 'China', 'Lai Fat', 'aEVNEDLJJk', '2010-10-11 21:51:29', '2000-06-30 11:37:37');
INSERT INTO `t_store` VALUES (37, 'Chang Siu Wai', '15 W Ring Rd, Buji Town, Longgang', 'HLKyTibkBH', 'gtZRmBdaAt', 'wRD6vRIbzU', 'China', 'Chang Siu Wai', 'zdm86lv7tU', '2006-03-27 07:33:52', '2021-12-26 06:43:33');
INSERT INTO `t_store` VALUES (38, 'Jin Xiaoming', '702 Abingdon Rd, Cumnor', 'VWG8WgPIll', 'rKaHJ3UXVR', 'Gf6s2A0zqF', 'United Kingdom', 'Jin Xiaoming', 'j7I1k6UL2m', '2021-10-28 00:54:30', '2009-09-25 20:34:55');
INSERT INTO `t_store` VALUES (39, 'Fred Thompson', '8 Tianhe Road, Tianhe District', 'r8mqHKMILF', 'c6eCwni0gu', '4X5JCh40kJ', 'China', 'Fred Thompson', '0bb4X8XQZV', '2015-09-20 19:46:07', '2005-03-12 18:24:59');
INSERT INTO `t_store` VALUES (40, 'Ruth Romero', '414 Zhongshan 5th Rd, Zimaling Shangquan', 'y7ZpqQLaEq', 'EJ3HuAHw2H', 'z2vIUT99iD', 'China', 'Ruth Romero', 'lLzaEjhr1l', '2004-11-28 18:42:08', '2002-10-10 18:55:01');
INSERT INTO `t_store` VALUES (41, 'Mui Lik Sun', '569 Wyngate Dr', 'nBkXvggAmn', 'LG4iJm3bw3', 'P1Bh7z2fdy', 'United Kingdom', 'Mui Lik Sun', 'NIVPsY481n', '2004-09-30 00:55:58', '2003-02-09 10:37:42');
INSERT INTO `t_store` VALUES (42, 'Endo Miu', '370 Spring Gardens', 'glRMumIlND', 'XQb0xDooMU', 'TCxWj0p0SL', 'United Kingdom', 'Endo Miu', 'PYIXbvSJDC', '2000-08-29 14:52:35', '2020-12-26 13:02:53');
INSERT INTO `t_store` VALUES (43, 'To Cho Yee', '625 Trafalgar Square, Charing Cross', 'rBjsGfmj9q', 'E5zRKoaOoz', '98vyceJFJU', 'United Kingdom', 'To Cho Yee', 'nEst6zGijz', '2017-10-22 21:11:11', '2011-05-29 01:50:08');
INSERT INTO `t_store` VALUES (44, 'Shibata Ayato', '822 Pedway', 'MdA1ZIz3Is', 'ycNm0rH5nr', 'fRtezlkjsw', 'United States', 'Shibata Ayato', 'DGUrfff2jO', '2009-02-12 19:36:11', '2010-11-22 04:08:58');
INSERT INTO `t_store` VALUES (45, 'Heung Kwok Yin', '460 Nostrand Ave', 'xUJtivmxWs', 'p44vBQSre9', 'KMk9Ai5e0n', 'United States', 'Heung Kwok Yin', 'xA5xuex3Kp', '2007-05-30 23:30:04', '2022-10-09 15:17:00');
INSERT INTO `t_store` VALUES (46, 'Ota Hina', '3-9-19 Gakuenminami', 'BdFjNZWgpZ', 'poj5vLZijT', '7vXIfDaQ4F', 'Japan', 'Ota Hina', 'cjhL6IF6gi', '2008-05-07 06:52:09', '2003-05-27 15:00:51');
INSERT INTO `t_store` VALUES (47, 'Ronald Harris', '1-6-14, Marunouchi, Chiyoda-ku', 'RkzVQtit6R', 'RKIVr4Pykk', '1oR9gdpbLG', 'Japan', 'Ronald Harris', 'fiUmX1sR09', '2014-03-12 20:12:31', '2012-01-03 05:02:53');
INSERT INTO `t_store` VALUES (48, 'Masuda Aoi', '4-9-20 Kamihigashi, Hirano Ward', 'HTNGTCrYQI', 'Q4Y8Iho3x2', '2NiirMnAvO', 'Japan', 'Masuda Aoi', 'XaMBbxgQtV', '2018-03-27 03:34:30', '2008-08-15 09:15:43');
INSERT INTO `t_store` VALUES (49, 'To Kwok Wing', '306 Huanqu South Street 2nd Alley', '1rD5dy2nOp', 'xq5DIwCyJL', 'eXGxIvqRil', 'China', 'To Kwok Wing', 'LP05OVKtVF', '2008-01-20 16:47:22', '2018-06-03 07:02:25');
INSERT INTO `t_store` VALUES (50, 'Lok Ching Wan', '13 3-803 Kusunokiajima, Kita Ward', '5bMTVUzyPu', 'A931hkHwI3', 'nqeWtxDx9O', 'Japan', 'Lok Ching Wan', 'lCG3Bj1u7W', '2018-08-09 18:56:53', '2018-08-21 07:08:45');
INSERT INTO `t_store` VALUES (51, 'Su Shihan', '646 Lodge Ln, Toxteth', '1hmGmIOufk', 'HuEhRNycmu', 'qekf1KI6Ab', 'United Kingdom', 'Su Shihan', 'erg3EtVgl7', '2018-11-22 04:55:10', '2015-08-17 01:14:40');
INSERT INTO `t_store` VALUES (52, 'Jiang Zhennan', '768 Regent Street', 'NvCNJNSeXk', 'OZExNgfPk5', '6ubpru1EGu', 'United Kingdom', 'Jiang Zhennan', 'zoxWa2kzxj', '2013-01-05 17:28:49', '2019-04-10 22:20:51');
INSERT INTO `t_store` VALUES (53, 'Ku Chun Yu', '411 3rd Section Hongxing Road, Jinjiang District', 'CPFWyVpNks', '4hXKr8nsxW', 'RddWLXG4j0', 'China', 'Ku Chun Yu', 'sX0CJHxKSb', '2012-12-28 23:52:04', '2006-09-26 03:45:16');
INSERT INTO `t_store` VALUES (54, 'Sheila Mitchell', '135 3rd Section Hongxing Road, Jinjiang District', 'XL2hbO2m2P', 'wFPZTunLOK', '86YfbQ28o0', 'China', 'Sheila Mitchell', 'vrv14izOuo', '2008-12-28 16:30:37', '2020-12-25 21:07:26');
INSERT INTO `t_store` VALUES (55, 'Christopher Gardner', '589 68 Qinghe Middle St, Haidian District', 'fHudZlQTkg', 'lWtxXKZKVc', '68Wjt02K8B', 'China', 'Christopher Gardner', 'Jt0N6UkTWb', '2021-01-25 07:45:55', '2002-09-10 21:36:30');
INSERT INTO `t_store` VALUES (56, 'Lo Wai Yee', '89 Canal Street', 'wpZBtVVfIN', 'f6dOSbdyKH', '9jjJcmUIc1', 'United States', 'Lo Wai Yee', 'w9UGVx41BA', '2009-10-08 16:03:58', '2009-02-23 05:08:06');
INSERT INTO `t_store` VALUES (57, 'Mui Tin Lok', '315 Regent Street', 'EK9auXgqRU', 'kZULxp9nO4', 'jPvKdFnqvh', 'United Kingdom', 'Mui Tin Lok', 'Y4yRqlXcpG', '2017-12-04 17:13:21', '2005-11-17 21:53:21');
INSERT INTO `t_store` VALUES (58, 'Taniguchi Miu', '485 The Pavilion, Lammas Field, Driftway', 'D1BPtyl9f7', 'L08J1BsrQN', 'Gh4mePWsOs', 'United Kingdom', 'Taniguchi Miu', '26N7zkl5UO', '2021-09-13 01:57:56', '2002-08-31 04:32:43');
INSERT INTO `t_store` VALUES (59, 'Iwasaki Kenta', '332 Silver St, Newnham', 'zOmMoMIE0s', '6DU608IFhI', 'UIOXXtOqHj', 'United Kingdom', 'Iwasaki Kenta', '0VQelxFGr1', '2018-10-14 22:17:39', '2022-02-08 00:54:55');
INSERT INTO `t_store` VALUES (60, 'Lei Lan', '5-2-11 Higashi Gotanda, Shinagawa-ku ', 'afhJm8i0eq', 'to4EfC3zFf', 'EEdn5qZP0G', 'Japan', 'Lei Lan', '0imyOah5Pc', '2022-10-28 10:31:43', '2023-04-18 20:32:20');
INSERT INTO `t_store` VALUES (61, 'Yuen Ka Ling', '11 4-20 Kawagishicho, Mizuho Ward', '6n7i0AXTuo', '58fvoj45Cy', 'eeRObOR4Pw', 'Japan', 'Yuen Ka Ling', '1rchMqqNat', '2015-10-25 20:42:59', '2007-02-13 17:37:08');
INSERT INTO `t_store` VALUES (62, 'Travis Palmer', '2-1-17 Kaminopporo 1 Jo, Atsubetsu Ward', 'xxDo7dvs0g', 'RU7ULqRbiu', '6k1jbT9b9n', 'Japan', 'Travis Palmer', '6OH5HtC9tA', '2006-02-17 04:32:48', '2018-03-27 17:53:44');
INSERT INTO `t_store` VALUES (63, 'Lu Lu', '581 Hongqiao Rd., Xu Hui District', '2jiAIO24NP', 'Lbz3Qo6k8M', 'G28uRpmXcM', 'China', 'Lu Lu', 'X7oBUFvcxs', '2002-08-21 15:45:30', '2014-10-13 01:04:32');
INSERT INTO `t_store` VALUES (64, 'Cheung Wing Fat', '383 68 Qinghe Middle St, Haidian District', 'xr9gLUEqz7', '8r4Tu7HHPe', 'aKNFx3xPWl', 'China', 'Cheung Wing Fat', 'X3uAONnbjH', '2002-06-27 10:17:28', '2009-10-31 22:51:23');
INSERT INTO `t_store` VALUES (65, 'Shimizu Kazuma', '5-2-11 Kikusui 3 Jo, Shiroishi Ward', 'hkEsx9bZMb', 'hIx5nxGPJk', 'R5oIIC7VAn', 'Japan', 'Shimizu Kazuma', '2ecR9d0aV5', '2007-10-23 20:51:47', '2022-06-24 20:24:38');
INSERT INTO `t_store` VALUES (66, 'Chow Ka Ming', '444 State Street', 'tVZojkFkJg', 'mhv1r3Nq9i', 'K7Hk9iCogs', 'United States', 'Chow Ka Ming', 'EaIR0Y96xb', '2018-08-14 04:20:04', '2022-10-01 07:23:20');
INSERT INTO `t_store` VALUES (67, 'Tin Sau Man', '141 Pollen Street', 'o8UFnx4Irn', 'MwCzHUV3DS', 'PllBAAuw8l', 'United Kingdom', 'Tin Sau Man', 'j99w7aIGUy', '2012-10-16 11:04:29', '2020-01-09 02:25:24');
INSERT INTO `t_store` VALUES (68, 'Tse Ming', '862 Broadway', 'NyPGIsWWkk', 'BTVBymfh6C', '34pOvOwRRa', 'United States', 'Tse Ming', 'NIjOHcjVs8', '2007-11-26 12:09:05', '2003-05-04 03:50:21');
INSERT INTO `t_store` VALUES (69, 'Yan Zhiyuan', '349 Canal Street', '9Ja2NP2gLp', 'chYS3GmyEH', 'tZKOx3qrYg', 'United States', 'Yan Zhiyuan', 'qDrDGFu0TI', '2018-06-29 01:51:40', '2004-01-10 17:37:48');
INSERT INTO `t_store` VALUES (70, 'Terry Watson', '99 Central Avenue', 'zv01m4SJPN', 'vDNoAh4CtG', 'm5myKoNedl', 'United States', 'Terry Watson', 'YFZRcIMlCh', '2018-02-15 16:31:33', '2002-07-10 22:06:59');
INSERT INTO `t_store` VALUES (71, 'Mao Rui', '819 New Street', 'HFvi8Kuva6', 'J1AwwoSerc', 'zw3fBAbrf2', 'United Kingdom', 'Mao Rui', 'jnpFpE94wd', '2007-04-08 01:04:14', '2003-03-12 00:27:50');
INSERT INTO `t_store` VALUES (72, 'Tang Wing Sze', '309 Ridgewood Road', 'OoeMy3Q7kJ', '4O82VKzPFq', 'OvbT7AQnwu', 'United States', 'Tang Wing Sze', 'tnUY3nFU0y', '2000-06-12 01:28:31', '2008-10-12 13:18:28');
INSERT INTO `t_store` VALUES (73, 'Ishikawa Yuito', '243 Maddox Street', 'uWtLomCSGV', 'lFRSsO0WqG', 'xaXpawDFrV', 'United Kingdom', 'Ishikawa Yuito', 'UGdlI3zjfY', '2022-06-10 05:55:04', '2010-12-19 02:59:31');
INSERT INTO `t_store` VALUES (74, 'Fung Tin Wing', '4 4-20 Kawagishicho, Mizuho Ward', 'FUCHeupwys', 'NKQZLjGFy2', 'Rf3cpGc4WY', 'Japan', 'Fung Tin Wing', 'Y5I7by91z1', '2021-01-29 03:42:42', '2019-09-25 01:48:24');
INSERT INTO `t_store` VALUES (75, 'Tamura Kaito', '222 Figueroa Street', 'eYtCpEWnQV', 'JoZHMPn8ud', 'etUDwV0vKE', 'United States', 'Tamura Kaito', '7x41i1zbyC', '2001-03-11 23:37:04', '2008-07-28 01:01:29');
INSERT INTO `t_store` VALUES (76, 'He Shihan', '581 Shanhu Rd', 'ZTak66fNmo', '4hxKuKBwE1', 'Fda4UZRBOe', 'China', 'He Shihan', 'RKQIkz67oX', '2014-09-22 05:07:07', '2008-06-08 21:11:58');
INSERT INTO `t_store` VALUES (77, 'Edith West', '2-3-8 Yoyogi, Shibuya-ku', 'WUcyYIxX6u', 'GpmWZHrw0c', '4xFTky6bvx', 'Japan', 'Edith West', 'nsr1w9LXkx', '2006-05-28 05:13:56', '2014-05-27 08:52:36');
INSERT INTO `t_store` VALUES (78, 'Tanaka Kasumi', '246 Bank Street', 'A3WbLqvVp6', '1r9Or0ltrX', 'iBRkgjXIic', 'United States', 'Tanaka Kasumi', '2zvp6Sx0OP', '2004-02-12 13:02:50', '2022-12-17 16:24:08');
INSERT INTO `t_store` VALUES (79, 'Yuen Tsz Ching', '334 Elms Rd, Botley', 'oSY2JGibFC', 'iDrQithuCX', 'bPEKxrBLrS', 'United Kingdom', 'Yuen Tsz Ching', 'euhg5T9CE0', '2001-04-22 17:08:45', '2018-04-28 22:23:26');
INSERT INTO `t_store` VALUES (80, 'Fukuda Mai', '155 Whitehouse Lane, Huntingdon Rd', 'jpGdLFCqGh', 'nvq7XCnK5J', 'tcKPrQsqXE', 'United Kingdom', 'Fukuda Mai', 'vgKXE2sSUF', '2000-09-05 09:50:02', '2009-08-30 01:14:27');
INSERT INTO `t_store` VALUES (81, 'Chiba Yamato', '803 Central Avenue', 'uj670Z7Upn', 'JjDmIvd5pg', 'XCXx3BMDS2', 'United States', 'Chiba Yamato', 'l90f4qRMGN', '2016-10-27 06:33:04', '2014-11-25 05:56:36');
INSERT INTO `t_store` VALUES (82, 'Cho Ka Ming', '3-15-3 Ginza, Chuo-ku', 'LK1eObQkWu', 'INCkWGzOhD', 'J41YiVgbM9', 'Japan', 'Cho Ka Ming', 'iV82i5SkIz', '2015-05-17 07:01:15', '2003-03-09 15:33:19');
INSERT INTO `t_store` VALUES (83, 'Nakajima Kazuma', '304 Huaxia St, Jinghua Shangquan', '1Kyb6i16aX', 'Xstp7JR8Ve', 'gZCpjJwnPG', 'China', 'Nakajima Kazuma', 'Zc5kLKdVIS', '2017-01-07 21:45:48', '2008-11-08 13:34:02');
INSERT INTO `t_store` VALUES (84, 'Irene Harrison', '57 Maddox Street', 'FWGsimGshj', 'oCxWyY5lFo', 'gHTwAoYPYe', 'United Kingdom', 'Irene Harrison', 'KfJWG7RRSW', '2006-09-11 02:37:53', '2009-06-04 21:17:27');
INSERT INTO `t_store` VALUES (85, 'Ito Ayato', '118 Wyngate Dr', 'a1iP50A3Z7', '18yFxO0A1f', 'Q4nw3yM13S', 'United Kingdom', 'Ito Ayato', 'rRzaNyRgMV', '2002-08-19 02:18:24', '2022-10-10 18:22:11');
INSERT INTO `t_store` VALUES (86, 'Lau Kwok Wing', '1-6-6, Marunouchi, Chiyoda-ku', '9aykTROOFK', '1COnRR0t9K', '3jmEZlcfgY', 'Japan', 'Lau Kwok Wing', 'VyEBq1vwxk', '2021-07-04 13:03:38', '2017-08-11 03:16:28');
INSERT INTO `t_store` VALUES (87, 'Nishimura Akina', '977 3rd Section Hongxing Road, Jinjiang District', 'U2l93KyQIa', 'cdTiNRerwA', 'qHzlBYva2H', 'China', 'Nishimura Akina', 'J4UqiyW7i6', '2004-07-12 03:14:09', '2007-04-15 17:36:33');
INSERT INTO `t_store` VALUES (88, 'Yung Hui Mei', '924 Lefeng 6th Rd', 'HL6tV3LUSA', 'jjfgg2BlqA', 'W7aUgF2nUH', 'China', 'Yung Hui Mei', 'tTASZvuMiR', '2021-08-05 13:28:37', '2019-09-12 09:32:50');
INSERT INTO `t_store` VALUES (89, 'Yuan Yunxi', '32 Park End St', 'tYLRrukTiz', 'EqPToa60fN', '9hliNjah0r', 'United Kingdom', 'Yuan Yunxi', '2aaFKIxhtM', '2016-06-04 09:46:46', '2022-08-18 21:18:59');
INSERT INTO `t_store` VALUES (90, 'Steven Powell', '343 39 William IV St, Charing Cross', 'V6s8nzRwY1', 'qkwyYHSDJg', 'dBZ3LpJZMl', 'United Kingdom', 'Steven Powell', '9BUZCboNI5', '2019-07-08 14:37:48', '2006-12-18 04:29:05');
INSERT INTO `t_store` VALUES (91, 'Xue Ziyi', '292 Ridgewood Road', '6AVuzFJrZM', 'nR4LmTSC4P', 'BZbEmIhqVs', 'United States', 'Xue Ziyi', 'TBakDuB6Vw', '2004-01-10 03:06:51', '2013-12-05 22:02:06');
INSERT INTO `t_store` VALUES (92, 'Brian Freeman', '394 Binchuan Rd, Minhang District', '0YUlLaOFxm', 'AmELneJ1FJ', '7nNM42SO3c', 'China', 'Brian Freeman', '4AnaTifJd0', '2016-01-08 14:21:39', '2017-05-31 07:49:21');
INSERT INTO `t_store` VALUES (93, 'Russell Romero', '943 East Cooke Road', 'rfAfIuYhFm', 'mZuCTSVjQD', 'w8SBeuDICo', 'United States', 'Russell Romero', 'yOIDqhIWre', '2017-08-09 03:15:30', '2019-12-26 01:56:52');
INSERT INTO `t_store` VALUES (94, 'Koo Ka Man', '175 Maddox Street', 'ZZFhQHHETP', 'vl829WfVpd', 'rLTE0dEn6J', 'United Kingdom', 'Koo Ka Man', 'QYJbZQ7TKR', '2004-01-21 15:13:00', '2002-08-31 14:10:50');
INSERT INTO `t_store` VALUES (95, 'Okamoto Kasumi', '2-1-20 Kaminopporo 1 Jo, Atsubetsu Ward', 'zu38ElPHTp', 'XXHs3N5zJg', '4XgCGETUBA', 'Japan', 'Okamoto Kasumi', 'JOcnGikU6n', '2000-10-25 03:58:34', '2001-10-26 17:16:34');
INSERT INTO `t_store` VALUES (96, 'Suzuki Yuito', '2 4-20 Kawagishicho, Mizuho Ward', '50DLyGLLhV', 'V4dvBIsbT6', 'a21WM6ovHj', 'Japan', 'Suzuki Yuito', 'MF0FRmgZHG', '2001-07-11 14:12:00', '2008-12-22 06:01:49');
INSERT INTO `t_store` VALUES (97, 'Zheng Lan', '134 Wooster Street', 'yCTZSrbftY', 'SRe871T4wQ', 'GyR7YEyUz6', 'United States', 'Zheng Lan', 'uzB8NNgIGE', '2021-02-24 06:04:56', '2008-06-17 02:01:25');
INSERT INTO `t_store` VALUES (98, 'Douglas Coleman', '303 Lower Temple Street', 'j1bglqQbSv', 'p47s0pmieE', 'c21khuKrsz', 'United Kingdom', 'Douglas Coleman', 'WhkUbynOzA', '2021-04-24 04:42:06', '2016-10-18 15:25:03');
INSERT INTO `t_store` VALUES (99, 'Ding Zhennan', '462 Columbia St', 'x32FpKRDBg', 'tXsDL2loX0', 'DNdfzc14f2', 'United States', 'Ding Zhennan', 'OWFCUolIKz', '2007-09-19 05:30:37', '2006-07-29 00:12:57');
INSERT INTO `t_store` VALUES (100, 'Christopher Parker', '2-1-13 Kaminopporo 1 Jo, Atsubetsu Ward', 'BRGK9sKmRG', 'mbJA0AwaJM', 'Tf4RJP1MOl', 'Japan', 'Christopher Parker', 'sjDjR66z04', '2003-10-05 08:15:19', '2012-04-04 07:15:10');
INSERT INTO `t_store` VALUES (101, 'Gary Sanchez', '514 Shennan E Rd, Cai Wu Wei, Luohu District', 'OsF7nFN9sQ', 'c1xr1BdMMl', 'NDRGh4dUu1', 'China', 'Gary Sanchez', 'M8kUHY1PEc', '2001-09-26 22:29:40', '2014-02-25 10:07:27');

-- ----------------------------
-- Table structure for t_store_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_store_brand`;
CREATE TABLE `t_store_brand`  (
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `store_id` int(11) NOT NULL COMMENT '商店id',
  PRIMARY KEY (`brand_id`, `store_id`) USING BTREE,
  INDEX `fk_store`(`store_id`) USING BTREE,
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `t_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_store` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商店和品牌映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_store_brand
-- ----------------------------

-- ----------------------------
-- Table structure for t_store_category
-- ----------------------------
DROP TABLE IF EXISTS `t_store_category`;
CREATE TABLE `t_store_category`  (
  `store_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`store_id`, `category_id`) USING BTREE,
  INDEX `fk_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sotre1` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺和类型映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_store_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_swiper
-- ----------------------------
DROP TABLE IF EXISTS `t_swiper`;
CREATE TABLE `t_swiper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spu_id` int(11) NULL DEFAULT NULL COMMENT '商品表id',
  `spg_id` int(11) NULL DEFAULT NULL COMMENT '品类表id',
  `swiperImg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_swiper_spu_id`(`spu_id`) USING BTREE,
  INDEX `t_swiper_spg_id`(`spg_id`) USING BTREE,
  CONSTRAINT `t_swiper_spg_id` FOREIGN KEY (`spg_id`) REFERENCES `t_spec_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_swiper_spu_id` FOREIGN KEY (`spu_id`) REFERENCES `t_spu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_swiper
-- ----------------------------
INSERT INTO `t_swiper` VALUES (2, NULL, 105, 'http://anta-cn-web.obs.myhwclouds.com/anta-cn-web/descente/2021/04/12/32ec18c7f25df29141aa35968696f5c5.jpg', '{\"name\":\"板鞋\",\"series\":\"霸道\"}');
INSERT INTO `t_swiper` VALUES (3, NULL, NULL, 'http://anta-cn-web.obs.myhwclouds.com/anta-cn-web/descente/2021/03/11/2ce63f438ec5541d11c43f3f5b1f5d79.jpg', '{\"name\":\"--\",\"series\":\"史努比联名\"}');
INSERT INTO `t_swiper` VALUES (4, NULL, 102, 'http://anta-cn-web.obs.myhwclouds.com/anta-cn-web/descente/2021/03/11/ae819043ef32027068ce411ea0d3c8e8.jpg', '{\"name\":\"休闲鞋\",\"series\":\"千禧\"}');

-- ----------------------------
-- Table structure for t_voucher
-- ----------------------------
DROP TABLE IF EXISTS `t_voucher`;
CREATE TABLE `t_voucher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deno` int(11) NOT NULL COMMENT '优惠券的面额',
  `condition` int(11) NOT NULL COMMENT '优惠券满多少可以使用',
  `start_time` bigint(20) NOT NULL COMMENT '优惠开始的时间',
  `end_time` bigint(20) NOT NULL COMMENT '优惠券结束时间',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `spu_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_store_id`(`store_id`) USING BTREE,
  INDEX `idx_spu_id`(`spu_id`) USING BTREE,
  CONSTRAINT `fk_voucher_spu` FOREIGN KEY (`spu_id`) REFERENCES `t_spu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voucher_store` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_voucher
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
