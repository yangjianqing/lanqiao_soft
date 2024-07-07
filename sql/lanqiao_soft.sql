/*
Navicat MySQL Data Transfer

Source Server         : windows本地数据库
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : lanqiao_soft

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2024-07-07 14:51:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('2', 'lq_mer_type', '商家类型表', null, null, 'LqMerType', 'crud', 'cn.lanqiao.merchant', 'merchant', 'merType', '商家类型管理', 'lanqiao', '0', '/', '{\"parentMenuId\":\"2015\"}', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:34:25', null);
INSERT INTO `gen_table` VALUES ('3', 'lq_merchant', '商家表', null, null, 'LqMerchant', 'crud', 'cn.lanqiao.merchant', 'merchant', 'merchant', '商家信息管理', 'lanqiao', '0', '/', '{\"parentMenuId\":2015}', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01', null);
INSERT INTO `gen_table` VALUES ('4', 'lq_product', '商品表', null, null, 'LqProduct', 'crud', 'cn.lanqiao.merchant', 'merchant', 'product', '商品', 'yangjianqing', '0', '/', '{\"parentMenuId\":\"2015\"}', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15', null);
INSERT INTO `gen_table` VALUES ('5', 'lq_product_type', '商品类型表', '', '', 'LqProductType', 'crud', 'cn.lanqiao.merchant', 'merchant', 'productType', '商品类型', 'lanqiao', '0', '/', '{\"parentMenuId\":\"2015\"}', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47', null);
INSERT INTO `gen_table` VALUES ('6', 'lq_order_items', '订单商品表', null, null, 'LqOrderItems', 'crud', 'cn.lanqiao.order', 'order', 'items', '订单商品', 'yangjianqing', '0', '/', '{\"parentMenuId\":\"2040\"}', 'admin', '2024-06-14 14:51:06', '', '2024-06-17 08:47:39', null);
INSERT INTO `gen_table` VALUES ('7', 'lq_orders', '订单表', null, null, 'LqOrders', 'crud', 'cn.lanqiao.order', 'order', 'order', '外卖订单管理', 'yangjianqing', '0', '/', '{\"parentMenuId\":\"2040\"}', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14', null);
INSERT INTO `gen_table` VALUES ('8', 'lq_users', '外卖平台的用户表', null, null, 'LqUsers', 'crud', 'cn.lanqiao.order', 'order', 'users', '外卖用户', 'yang', '0', '/', '{\"parentMenuId\":2040}', 'admin', '2024-06-25 08:37:40', '', '2024-06-25 08:39:56', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('13', '2', 'type_id', 'ID', 'bigint', 'Long', 'typeId', '1', '1', null, null, null, '1', null, 'EQ', 'input', null, '1', 'admin', '2024-05-23 10:55:06', null, '2024-05-24 08:34:25');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'type_name', '类型', 'varchar(255)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2024-05-23 10:55:06', null, '2024-05-24 08:34:25');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'type_disc', '类型描述', 'varchar(255)', 'String', 'typeDisc', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'textarea', '', '3', 'admin', '2024-05-23 10:55:06', null, '2024-05-24 08:34:25');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', null, '4', 'admin', '2024-05-23 10:55:06', null, '2024-05-24 08:34:25');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', null, 'EQ', 'datetime', null, '5', 'admin', '2024-05-23 10:55:06', null, '2024-05-24 08:34:25');
INSERT INTO `gen_table_column` VALUES ('18', '3', 'mer_id', 'Id', 'bigint', 'Long', 'merId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('19', '3', 'mer_name', '名称', 'varchar(255)', 'String', 'merName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('20', '3', 'mer_logo', 'logo', 'varchar(255)', 'String', 'merLogo', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '3', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('21', '3', 'mer_notice', '公告', 'varchar(255)', 'String', 'merNotice', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '4', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('22', '3', 'mer_min_price', '起送费', 'double', 'Long', 'merMinPrice', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '5', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('23', '3', 'mer_start_time', '开始营业时间', 'time', 'Date', 'merStartTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('24', '3', 'mer_end_time', '结束营业时间', 'time', 'Date', 'merEndTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('25', '3', 'mer_type', '商家类型', 'int', 'Long', 'merType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'mer_address', '商家地址', 'varchar(255)', 'String', 'merAddress', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '9', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'lon', '经度', 'decimal(10,8)', 'BigDecimal', 'lon', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '10', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('28', '3', 'lat', '纬度', 'decimal(10,8)', 'BigDecimal', 'lat', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('29', '3', 'mer_phone', '联系方式', 'varchar(20)', 'String', 'merPhone', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '12', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('30', '3', 'mer_business', '营业执照', 'varchar(255)', 'String', 'merBusiness', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '13', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('31', '3', 'mer_hygienic', '卫生许可', 'varchar(255)', 'String', 'merHygienic', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '14', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('32', '3', 'mer_card', '身份证', 'varchar(255)', 'String', 'merCard', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '15', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('33', '3', 'mer_bank_card', '银行卡', 'varchar(255)', 'String', 'merBankCard', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '16', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('34', '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '17', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('35', '3', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '18', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 08:43:01');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'pro_id', 'ID', 'bigint', 'Long', 'proId', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'pro_baling_charge', '打包费', 'double(10,2)', 'BigDecimal', 'proBalingCharge', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '2', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'pro_name', '商品名', 'varchar(255)', 'String', 'proName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('39', '4', 'pro_disc', '描述', 'varchar(255)', 'String', 'proDisc', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '4', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('40', '4', 'pro_create_time', '创建时间', 'datetime', 'Date', 'proCreateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('41', '4', 'pro_update_time', '修改时间', 'datetime', 'Date', 'proUpdateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('42', '4', 'type_id', '类型', 'bigint', 'Long', 'typeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('43', '4', 'pro_price', '价格', 'double(10,2)', 'BigDecimal', 'proPrice', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '8', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('44', '4', 'pro_original_price', '原价', 'double(10,2)', 'BigDecimal', 'proOriginalPrice', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('45', '4', 'pro_picture', '图片', 'varchar(255)', 'String', 'proPicture', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', '10', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('46', '4', 'pro_inventory', '库存', 'bigint', 'Long', 'proInventory', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('47', '4', 'bat_name', '主料', 'varchar(255)', 'String', 'batName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '12', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('48', '4', 'pro_taste', '口味', 'varchar(10)', 'String', 'proTaste', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'merchant_taste', '13', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('49', '4', 'pro_units', '单位', 'varchar(50)', 'String', 'proUnits', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '14', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('50', '4', 'pro_speci', '规格', 'int', 'Long', 'proSpeci', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '15', 'admin', '2024-05-23 10:55:06', '', '2024-05-24 16:59:15');
INSERT INTO `gen_table_column` VALUES ('51', '5', 'type_id', 'Id', 'bigint', 'Long', 'typeId', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47');
INSERT INTO `gen_table_column` VALUES ('52', '5', 'type_name', '类型', 'varchar(255)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47');
INSERT INTO `gen_table_column` VALUES ('53', '5', 'type_disc', '类型描述', 'varchar(255)', 'String', 'typeDisc', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47');
INSERT INTO `gen_table_column` VALUES ('54', '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '4', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47');
INSERT INTO `gen_table_column` VALUES ('55', '5', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47');
INSERT INTO `gen_table_column` VALUES ('56', '5', 'mer_id', '商家id(外键)', 'bigint', 'Long', 'merId', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '6', 'admin', '2024-05-23 10:55:06', '', '2024-05-30 10:42:47');
INSERT INTO `gen_table_column` VALUES ('57', '2', 'type_icon', '类型图标', 'varchar(255)', 'String', 'typeIcon', '0', '0', null, '1', '1', '1', '1', 'EQ', 'imageUpload', '', '6', '', '2024-05-23 11:39:39', '', '2024-05-24 08:34:25');
INSERT INTO `gen_table_column` VALUES ('58', '6', 'order_item_id', '订单商品编号', 'int', 'Long', 'orderItemId', '1', '1', null, '1', null, '1', null, 'EQ', 'input', '', '1', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:47:39');
INSERT INTO `gen_table_column` VALUES ('59', '6', 'order_id', '订单编号', 'int', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '2', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:47:39');
INSERT INTO `gen_table_column` VALUES ('60', '6', 'product_id', '商品id', 'int', 'Long', 'productId', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '3', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:47:39');
INSERT INTO `gen_table_column` VALUES ('61', '6', 'quantity', '商品数量', 'int', 'Long', 'quantity', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '4', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:47:39');
INSERT INTO `gen_table_column` VALUES ('62', '6', 'unit_price', '商品单价', 'decimal(10,2)', 'BigDecimal', 'unitPrice', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '5', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:47:39');
INSERT INTO `gen_table_column` VALUES ('63', '7', 'order_id', '订单号', 'int', 'Long', 'orderId', '1', '1', null, '1', '1', '1', '1', 'EQ', 'input', '', '1', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('64', '7', 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('65', '7', 'restaurant_id', '餐厅id', 'int', 'Long', 'restaurantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('66', '7', 'order_date', '下单时间', 'timestamp', 'Date', 'orderDate', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '4', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('67', '7', 'delivery_address', '送货地址', 'text', 'String', 'deliveryAddress', '0', '0', '1', '1', '1', '1', null, 'EQ', 'textarea', '', '5', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('68', '7', 'total_amount', '总金额', 'decimal(10,2)', 'BigDecimal', 'totalAmount', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', '6', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('69', '7', 'order_status', '订单状态', 'varchar(50)', 'String', 'orderStatus', '0', '0', '1', '1', '1', '1', null, 'EQ', 'select', 'order_status', '7', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('70', '7', 'payment_method', '支付方式', 'varchar(50)', 'String', 'paymentMethod', '0', '0', '1', '1', '1', '1', null, 'EQ', 'select', 'payment_method', '8', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('71', '7', 'delivery_fee', '配送费', 'decimal(10,2)', 'BigDecimal', 'deliveryFee', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('72', '7', 'delivery_time', '配送时间', 'timestamp', 'Date', 'deliveryTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '10', 'admin', '2024-06-14 14:51:07', '', '2024-06-17 08:49:14');
INSERT INTO `gen_table_column` VALUES ('73', '8', 'user_id', 'ID', 'int', 'Long', 'userId', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('74', '8', 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('75', '8', 'password', '用户密码', 'varchar(255)', 'String', 'password', '0', '0', '1', null, null, '1', null, 'EQ', 'input', '', '3', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('76', '8', 'phone_number', '电话号码', 'varchar(15)', 'String', 'phoneNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('77', '8', 'full_name', '用户的全名', 'varchar(100)', 'String', 'fullName', '0', '0', null, '1', '1', '1', null, 'LIKE', 'input', '', '5', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('78', '8', 'address', '收货地址', 'text', 'String', 'address', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '6', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('79', '8', 'city', '城市', 'varchar(50)', 'String', 'city', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '7', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('80', '8', 'state', '州/省', 'varchar(50)', 'String', 'state', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '8', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('81', '8', 'country', '国家', 'varchar(50)', 'String', 'country', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('82', '8', 'registration_date', '注册时间', 'timestamp', 'Date', 'registrationDate', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '10', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('83', '8', 'last_login_date', '上次登录', 'timestamp', 'Date', 'lastLoginDate', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '11', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');
INSERT INTO `gen_table_column` VALUES ('84', '8', 'is_active', '是否活跃', 'tinyint(1)', 'Integer', 'isActive', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '12', 'admin', '2024-06-25 08:37:41', '', '2024-06-25 08:39:56');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-10 16:42:20', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-10 16:42:20', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-10 16:42:20', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-10 16:42:20', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-10 16:42:21', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '蓝桥学院', '0', '张志勇', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 16:42:09', 'admin', '2024-07-07 11:07:28');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '泸职校区', '1', '袁兵', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 16:42:10', 'admin', '2024-07-07 11:11:44');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-05-10 16:42:10', '', null);
INSERT INTO `sys_dept` VALUES ('200', '100', '0,100', '洛职校区', '2', '毛东宇', '13154875475', null, '0', '0', 'admin', '2024-07-07 11:12:30', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-10 16:42:19', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-10 16:42:19', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-10 16:42:19', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-10 16:42:19', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:19', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-10 16:42:19', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:19', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-10 16:42:19', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:19', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-10 16:42:19', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-10 16:42:19', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-10 16:42:20', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-10 16:42:20', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-10 16:42:20', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-10 16:42:20', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '不辣', '1', 'merchant_taste', null, 'info', 'N', '0', 'admin', '2024-05-24 16:48:30', 'admin', '2024-05-24 16:49:06', null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '中辣', '3', 'merchant_taste', null, 'warning', 'N', '0', 'admin', '2024-05-24 16:48:45', 'admin', '2024-05-24 16:49:43', null);
INSERT INTO `sys_dict_data` VALUES ('102', '0', '微辣', '2', 'merchant_taste', null, 'success', 'N', '0', 'admin', '2024-05-24 16:49:18', 'admin', '2024-05-24 16:49:38', null);
INSERT INTO `sys_dict_data` VALUES ('103', '0', '特辣', '4', 'merchant_taste', null, 'danger', 'N', '0', 'admin', '2024-05-24 16:49:31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '1', '微信', '1', 'payment_method', null, 'warning', 'N', '0', 'admin', '2024-06-17 08:41:57', 'admin', '2024-06-17 08:42:51', null);
INSERT INTO `sys_dict_data` VALUES ('105', '0', '支付宝', '2', 'payment_method', null, 'primary', 'N', '0', 'admin', '2024-06-17 08:42:09', 'admin', '2024-06-17 08:42:44', null);
INSERT INTO `sys_dict_data` VALUES ('106', '0', '未支付', '1', 'order_status', null, 'primary', 'N', '0', 'admin', '2024-06-17 08:43:45', 'admin', '2024-06-17 08:44:17', null);
INSERT INTO `sys_dict_data` VALUES ('107', '0', '已取消', '2', 'order_status', null, 'warning', 'N', '0', 'admin', '2024-06-17 08:44:02', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-10 16:42:19', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-10 16:42:19', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-10 16:42:19', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2024-05-10 16:42:19', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2024-05-10 16:42:19', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-10 16:42:19', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-10 16:42:19', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-10 16:42:19', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-10 16:42:19', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2024-05-10 16:42:19', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '口味', 'merchant_taste', '0', 'admin', '2024-05-24 16:48:00', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('101', '支付方式', 'payment_method', '0', 'admin', '2024-06-17 08:41:31', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('102', '订单状态', 'order_status', '0', 'admin', '2024-06-17 08:43:15', '', null, null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-10 16:42:21', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-10 16:42:21', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-10 16:42:21', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-10 16:49:39');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-10 18:02:32');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:22:32');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-11 08:42:45');
INSERT INTO `sys_logininfor` VALUES ('104', 'c45182', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:42:59');
INSERT INTO `sys_logininfor` VALUES ('105', 'c45182', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-11 08:44:48');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:44:52');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-11 08:45:13');
INSERT INTO `sys_logininfor` VALUES ('108', 'c45182', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:45:21');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-11 08:46:19');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:46:23');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 15:09:29');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-11 17:26:42');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 17:26:48');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-14 10:39:22');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-14 10:52:16');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-14 10:52:23');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 14:45:26');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 15:36:11');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 16:41:16');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 18:00:45');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 19:10:03');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-21 10:24:18');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-21 11:10:29');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-23 10:51:09');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-23 15:35:32');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-23 15:54:12');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-05-24 08:26:50');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 08:26:55');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-24 09:42:20');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 09:42:25');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:06:10');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-24 14:46:52');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 14:46:56');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 15:40:49');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 17:25:56');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 11:12:06');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 16:32:34');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 13:27:28');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 14:08:36');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-29 14:53:07');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 14:53:10');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 15:53:18');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 17:00:10');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 19:32:28');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-30 10:21:19');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-31 09:30:41');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 10:27:42');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 08:13:37');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-12 14:28:48');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-12 14:28:53');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 14:28:59');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 14:48:57');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 08:19:38');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 10:02:02');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 08:37:13');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 11:05:10');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 13:05:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2060 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2024-05-10 16:42:11', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '1', '1', '', 'monitor', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:09:59', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2024-05-10 16:42:11', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-10 16:42:11', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-10 16:42:11', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-10 16:42:11', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '校区管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:16:06', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-10 16:42:11', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-10 16:42:11', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '1', '1', 'system:config:list', 'edit', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:07:15', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '1', '1', 'system:notice:list', 'message', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:07:09', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2024-05-10 16:42:11', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '1', '1', 'monitor:online:list', 'online', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:06:21', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '1', '1', 'monitor:job:list', 'job', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:06:28', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:06:34', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '1', '1', 'monitor:server:list', 'server', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 13:06:39', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '1', '1', 'monitor:cache:list', 'redis', 'admin', '2024-05-10 16:42:12', 'admin', '2024-07-07 13:06:45', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '1', '1', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-10 16:42:12', 'admin', '2024-07-07 13:06:50', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-05-10 16:42:12', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-10 16:42:12', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-10 16:42:12', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-10 16:42:12', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-10 16:42:12', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-10 16:42:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-10 16:42:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-10 16:42:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2059', '业务管理', '0', '3', 'unsiness', null, null, '1', '0', 'M', '0', '0', '', 'date', 'admin', '2024-07-07 13:47:30', 'admin', '2024-07-07 13:47:50', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-10 16:42:21', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-10 16:42:21', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '部门管理', '2', 'cn.lanqiao.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:09\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"蓝桥\",\"email\":\"ry@qq.com\",\"leader\":\"张志勇\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:33:27');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2024-05-11 08:35:42');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2024-05-11 08:35:47');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"前端功能管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:37:29');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:37:48');
INSERT INTO `sys_oper_log` VALUES ('105', '用户管理', '1', 'cn.lanqiao.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"c45182\",\"params\":{},\"postIds\":[4],\"roleIds\":[2],\"status\":\"0\",\"userId\":100,\"userName\":\"c45182\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:40:38');
INSERT INTO `sys_oper_log` VALUES ('106', '角色管理', '1', 'cn.lanqiao.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,104,105,1000,1007,1012,1016,1020,1025,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"运维人员\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:42:25');
INSERT INTO `sys_oper_log` VALUES ('107', '用户管理', '2', 'cn.lanqiao.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 08:40:37\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"c45182\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"c45182\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:42:37');
INSERT INTO `sys_oper_log` VALUES ('108', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-11 08:42:25\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,104,105,2,1000,1007,1012,1016,1020,1025,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,113,114],\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"运维人员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 08:45:07');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"蓝桥官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://www.lanqiao.cn\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:04:11');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '6', 'cn.lanqiao.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"t_product\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:12:32');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"product\",\"className\":\"TProduct\",\"columns\":[{\"capJavaField\":\"Productid\",\"columnComment\":\"商品id\",\"columnId\":1,\"columnName\":\"productId\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"productid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExpressLimit\",\"columnComment\":\"起送\",\"columnId\":2,\"columnName\":\"expressLimit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"expressLimit\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ExpressPrice\",\"columnComment\":\"基础运费\",\"columnId\":3,\"columnName\":\"expressPrice\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"expressPrice\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PoductImgUrl\",\"columnComment\":\"图片\",\"columnId\":4,\"columnName\":\"poductImgUrl\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"poductImgUrl\",\"javaType\":\"String\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:18:37');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"product\",\"className\":\"TProduct\",\"columns\":[{\"capJavaField\":\"Productid\",\"columnComment\":\"商品id\",\"columnId\":1,\"columnName\":\"productId\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"productid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:18:37\",\"usableColumn\":false},{\"capJavaField\":\"ExpressLimit\",\"columnComment\":\"起送\",\"columnId\":2,\"columnName\":\"expressLimit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"expressLimit\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:18:37\",\"usableColumn\":false},{\"capJavaField\":\"ExpressPrice\",\"columnComment\":\"基础运费\",\"columnId\":3,\"columnName\":\"expressPrice\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"expressPrice\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:18:37\",\"usableColumn\":false},{\"capJavaField\":\"PoductImgUrl\",\"columnComment\":\"图片\",\"columnId\":4,\"columnName\":\"poductImgUrl\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:23:29');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"product\",\"className\":\"TProduct\",\"columns\":[{\"capJavaField\":\"Productid\",\"columnComment\":\"商品id\",\"columnId\":1,\"columnName\":\"productId\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"productid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:23:28\",\"usableColumn\":false},{\"capJavaField\":\"ExpressLimit\",\"columnComment\":\"起送\",\"columnId\":2,\"columnName\":\"expressLimit\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"expressLimit\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:23:28\",\"usableColumn\":false},{\"capJavaField\":\"ExpressPrice\",\"columnComment\":\"基础运费\",\"columnId\":3,\"columnName\":\"expressPrice\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"expressPrice\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:23:29\",\"usableColumn\":false},{\"capJavaField\":\"PoductImgUrl\",\"columnComment\":\"图片\",\"columnId\":4,\"columnName\":\"poductImgUrl\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 09:12:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:24:25');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-05-11 09:24:29');
INSERT INTO `sys_oper_log` VALUES ('115', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":52,\"expressPrice\":52,\"oldprice\":2.0,\"params\":{},\"poductImgUrl\":\"/profile/upload/2024/05/11/无标题_20240511093910A001.png\",\"price\":1.5,\"productName\":\"娃哈哈矿泉水\",\"productid\":1,\"sales\":545412,\"stock\":15424554,\"unit\":\"瓶\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:39:20');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/product/index\",\"createTime\":\"2024-05-11 09:34:20\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"product\",\"perms\":\"system:product:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:40:14');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/product/index\",\"createTime\":\"2024-05-11 09:34:20\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"product\",\"perms\":\"system:product:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-11 09:40:40');
INSERT INTO `sys_oper_log` VALUES ('118', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":20,\"expressPrice\":10,\"oldprice\":11.0,\"params\":{},\"poductImgUrl\":\"1111111111111111\",\"price\":11.0,\"productName\":\"娃哈哈\",\"productid\":36,\"sales\":12,\"stock\":12,\"unit\":\"瓶\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:50:16');
INSERT INTO `sys_oper_log` VALUES ('119', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":20,\"expressPrice\":10,\"oldprice\":11.0,\"params\":{},\"poductImgUrl\":\"1111111111111111\",\"price\":11.0,\"productName\":\"娃哈哈\",\"productid\":37,\"sales\":12,\"stock\":12,\"unit\":\"瓶\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:51:02');
INSERT INTO `sys_oper_log` VALUES ('120', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":20,\"expressPrice\":10,\"oldprice\":11.0,\"params\":{},\"poductImgUrl\":\"1111111111111111\",\"price\":11.0,\"productName\":\"娃哈哈\",\"productid\":38,\"sales\":12,\"stock\":12,\"unit\":\"瓶\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:51:04');
INSERT INTO `sys_oper_log` VALUES ('121', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":20,\"expressPrice\":22,\"oldprice\":22.0,\"params\":{},\"poductImgUrl\":\"22\",\"price\":22.0,\"productName\":\"22\",\"productid\":39,\"sales\":22,\"stock\":22,\"unit\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:55:13');
INSERT INTO `sys_oper_log` VALUES ('122', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":1,\"expressPrice\":1,\"oldprice\":1.0,\"params\":{},\"poductImgUrl\":\"1\",\"price\":1.0,\"productName\":\"1\",\"productid\":40,\"sales\":1,\"stock\":1,\"unit\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:56:08');
INSERT INTO `sys_oper_log` VALUES ('123', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":1,\"expressPrice\":1,\"oldprice\":1.0,\"params\":{},\"poductImgUrl\":\"1\",\"price\":1.0,\"productName\":\"1\",\"productid\":41,\"sales\":1,\"stock\":1,\"unit\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:58:11');
INSERT INTO `sys_oper_log` VALUES ('124', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":1,\"expressPrice\":1,\"params\":{},\"poductImgUrl\":\"1\",\"productName\":\"1\",\"productid\":42}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:58:41');
INSERT INTO `sys_oper_log` VALUES ('125', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":1,\"expressPrice\":1,\"params\":{},\"productid\":43}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 16:58:48');
INSERT INTO `sys_oper_log` VALUES ('126', '商品管理', '2', 'cn.lanqiao.web.controller.system.TProductController.edit()', 'PUT', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":20,\"expressPrice\":7,\"oldprice\":2.0,\"params\":{},\"poductImgUrl\":\"/profile/upload/2024/05/11/无标题_20240511093910A001.png\",\"price\":1.0,\"productName\":\"娃哈哈矿泉水\",\"productid\":1,\"sales\":545412,\"stock\":15424554,\"unit\":\"瓶\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 19:13:34');
INSERT INTO `sys_oper_log` VALUES ('127', '商品管理', '2', 'cn.lanqiao.web.controller.system.TProductController.edit()', 'PUT', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":20,\"expressPrice\":7,\"oldprice\":2.0,\"params\":{},\"poductImgUrl\":\"/profile/upload/2024/05/11/无标题_20240511093910A001.png\",\"price\":1.0,\"productName\":\"娃哈哈\",\"productid\":1,\"sales\":545412,\"stock\":15424554,\"unit\":\"瓶\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 19:13:44');
INSERT INTO `sys_oper_log` VALUES ('128', '字典类型', '9', 'cn.lanqiao.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 19:31:02');
INSERT INTO `sys_oper_log` VALUES ('129', '字典类型', '9', 'cn.lanqiao.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-15 19:51:52');
INSERT INTO `sys_oper_log` VALUES ('130', '商品管理', '1', 'cn.lanqiao.web.controller.system.TProductController.add()', 'POST', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":1,\"expressPrice\":1,\"params\":{},\"poductImgUrl\":\"1\",\"productid\":44}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:24:53');
INSERT INTO `sys_oper_log` VALUES ('131', '商品管理', '2', 'cn.lanqiao.web.controller.system.TProductController.edit()', 'PUT', '1', 'admin', null, '/system/product', '127.0.0.1', '内网IP', '{\"expressLimit\":1,\"expressPrice\":1,\"oldprice\":1.0,\"params\":{},\"poductImgUrl\":\"1\",\"price\":1.0,\"productName\":\"1\",\"productid\":41,\"sales\":1,\"stock\":1,\"unit\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:25:02');
INSERT INTO `sys_oper_log` VALUES ('132', '商品管理', '3', 'cn.lanqiao.web.controller.system.TProductController.remove()', 'DELETE', '1', 'admin', null, '/system/product/1', '127.0.0.1', '内网IP', '{productids=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:39:01');
INSERT INTO `sys_oper_log` VALUES ('133', '商品管理', '3', 'cn.lanqiao.web.controller.system.TProductController.remove()', 'DELETE', '1', 'admin', null, '/system/product/44', '127.0.0.1', '内网IP', '{productids=44}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:40:50');
INSERT INTO `sys_oper_log` VALUES ('134', '商品管理', '3', 'cn.lanqiao.web.controller.system.TProductController.remove()', 'DELETE', '1', 'admin', null, '/system/product/43', '127.0.0.1', '内网IP', '{productids=43}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:41:53');
INSERT INTO `sys_oper_log` VALUES ('135', '商品管理', '3', 'cn.lanqiao.web.controller.system.TProductController.remove()', 'DELETE', '1', 'admin', null, '/system/product/42', '127.0.0.1', '内网IP', '{productids=42}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:41:56');
INSERT INTO `sys_oper_log` VALUES ('136', '商品管理', '3', 'cn.lanqiao.web.controller.system.TProductController.remove()', 'DELETE', '1', 'admin', null, '/system/product/41', '127.0.0.1', '内网IP', '{productids=41}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 10:41:59');
INSERT INTO `sys_oper_log` VALUES ('137', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"merchant\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:18:52');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/product/index\",\"createTime\":\"2024-05-11 09:34:20\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"product\",\"perms\":\"system:product:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:19:48');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-05-11 09:34:20\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"product\",\"perms\":\"system:product:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:25:04');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/product/index\",\"createTime\":\"2024-05-11 09:34:20\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"product\",\"perms\":\"system:product:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:25:33');
INSERT INTO `sys_oper_log` VALUES ('141', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-11 08:42:25\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,104,105,2,1000,1007,1012,1016,1020,1025,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,113,114,2006,2001,2002,2003,2004,2005],\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"运维人员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:35:57');
INSERT INTO `sys_oper_log` VALUES ('142', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2024-05-21 11:36:25');
INSERT INTO `sys_oper_log` VALUES ('143', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-11 08:42:25\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,104,105,2,1000,1007,1012,1016,1020,1025,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,113,114],\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"运维人员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:36:55');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2024-05-21 11:37:07');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:15');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:17');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:20');
INSERT INTO `sys_oper_log` VALUES ('148', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:22');
INSERT INTO `sys_oper_log` VALUES ('149', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:25');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:27');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2024-05-21 11:37:40');
INSERT INTO `sys_oper_log` VALUES ('152', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-10 16:42:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:51');
INSERT INTO `sys_oper_log` VALUES ('153', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-11 08:42:25\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,104,105,2,1000,1007,1012,1016,1020,1025,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,113,114],\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"运维人员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:37:55');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-21 11:38:02');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"merchant\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 10:53:42');
INSERT INTO `sys_oper_log` VALUES ('156', '代码生成', '3', 'cn.lanqiao.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 10:54:55');
INSERT INTO `sys_oper_log` VALUES ('157', '代码生成', '6', 'cn.lanqiao.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lq_merchant,lq_product_type,lq_mer_type,lq_product\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 10:55:06');
INSERT INTO `sys_oper_log` VALUES ('158', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merType\",\"className\":\"LqMerType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"主键、自动增长\",\"columnId\":13,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":14,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":15,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":fals', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 10:59:03');
INSERT INTO `sys_oper_log` VALUES ('159', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-05-23 10:59:24');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"download\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品类型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"merchant/merType/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:07:32');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-23 11:07:32\",\"icon\":\"download\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"商品类型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"merchant/merType/index\",\"perms\":\"merchant:merType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:08:03');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:08:22');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/merType/index\",\"createTime\":\"2024-05-23 11:08:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"商家类型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"merType\",\"perms\":\"merchant:merType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:09:12');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/merType/index\",\"createTime\":\"2024-05-23 11:08:37\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"商家类型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"merType\",\"perms\":\"merchant:merType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:09:29');
INSERT INTO `sys_oper_log` VALUES ('165', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:09:43.719+08:00\",\"params\":{},\"typeDisc\":\"qwe\",\"typeId\":1,\"typeName\":\"qwe\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:09:43');
INSERT INTO `sys_oper_log` VALUES ('166', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:17:11.219+08:00\",\"params\":{},\"typeId\":2,\"typeName\":\"火锅\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:17:11');
INSERT INTO `sys_oper_log` VALUES ('167', '商家类型管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.edit()', 'PUT', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23 11:09:44\",\"params\":{},\"typeDisc\":\"qwe\",\"typeId\":1,\"typeName\":\"中餐\",\"updateTime\":\"2024-05-23T11:17:30.537+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:17:30');
INSERT INTO `sys_oper_log` VALUES ('168', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:18:10.828+08:00\",\"params\":{},\"typeId\":3,\"typeName\":\"甜品\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:18:10');
INSERT INTO `sys_oper_log` VALUES ('169', '商家类型管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.edit()', 'PUT', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23 11:09:44\",\"params\":{},\"typeDisc\":\"\",\"typeId\":1,\"typeName\":\"中餐\",\"updateTime\":\"2024-05-23T11:18:20.252+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:18:20');
INSERT INTO `sys_oper_log` VALUES ('170', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:18:29.51+08:00\",\"params\":{},\"typeId\":4,\"typeName\":\"干锅\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:18:29');
INSERT INTO `sys_oper_log` VALUES ('171', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:19:29.883+08:00\",\"params\":{},\"typeId\":5,\"typeName\":\"日料\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:19:29');
INSERT INTO `sys_oper_log` VALUES ('172', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:19:44.553+08:00\",\"params\":{},\"typeId\":6,\"typeName\":\"自助餐\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:19:44');
INSERT INTO `sys_oper_log` VALUES ('173', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23T11:19:56.668+08:00\",\"params\":{},\"typeId\":7,\"typeName\":\"烧烤\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:19:56');
INSERT INTO `sys_oper_log` VALUES ('174', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/lq_mer_type', '127.0.0.1', '内网IP', '{tableName=lq_mer_type}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:39:39');
INSERT INTO `sys_oper_log` VALUES ('175', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merType\",\"className\":\"LqMerType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"ID\",\"columnId\":13,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:39:39\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":14,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:39:39\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":15,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:39:39\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"li', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:40:40');
INSERT INTO `sys_oper_log` VALUES ('176', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merType\",\"className\":\"LqMerType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"ID\",\"columnId\":13,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:40:39\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":14,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:40:39\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":15,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:40:39\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"li', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 11:43:26');
INSERT INTO `sys_oper_log` VALUES ('177', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"productType\",\"className\":\"LqProductType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"主键、自动增长\",\"columnId\":51,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":52,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":53,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":54,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 15:37:10');
INSERT INTO `sys_oper_log` VALUES ('178', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"菜单管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"merchant\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 15:47:26');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-23 15:47:26\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"merchant\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 15:47:44');
INSERT INTO `sys_oper_log` VALUES ('180', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merType\",\"className\":\"LqMerType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"ID\",\"columnId\":13,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:43:26\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":14,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:43:26\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":15,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 11:43:26\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"li', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-23 15:55:27');
INSERT INTO `sys_oper_log` VALUES ('181', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-05-23 15:55:30');
INSERT INTO `sys_oper_log` VALUES ('182', '商家类型管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.edit()', 'PUT', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23 11:09:44\",\"params\":{},\"typeDisc\":\"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据\",\"typeId\":1,\"typeName\":\"中餐\",\"updateTime\":\"2024-05-24T08:30:00.497+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 08:30:00');
INSERT INTO `sys_oper_log` VALUES ('183', '商家类型管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.edit()', 'PUT', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-23 11:09:44\",\"params\":{},\"typeDisc\":\"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据\",\"typeIcon\":\"/profile/upload/2024/05/24/唯物论_20240524083032A001.png\",\"typeId\":1,\"typeName\":\"中餐\",\"updateTime\":\"2024-05-24T08:30:33.989+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 08:30:34');
INSERT INTO `sys_oper_log` VALUES ('184', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merType\",\"className\":\"LqMerType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"ID\",\"columnId\":13,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 15:55:27\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":14,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 15:55:27\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":15,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateTime\":\"2024-05-23 15:55:27\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 08:34:25');
INSERT INTO `sys_oper_log` VALUES ('185', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merchant\",\"className\":\"LqMerchant\",\"columns\":[{\"capJavaField\":\"MerId\",\"columnComment\":\"Id\",\"columnId\":18,\"columnName\":\"mer_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"merId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MerName\",\"columnComment\":\"名称\",\"columnId\":19,\"columnName\":\"mer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"merName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MerLogo\",\"columnComment\":\"logo\",\"columnId\":20,\"columnName\":\"mer_logo\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"merLogo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MerNotice\",\"columnComment\":\"公告\",\"columnId\":21,\"columnName\":\"mer_notice\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"merNotice\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 08:41:48');
INSERT INTO `sys_oper_log` VALUES ('186', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"merchant\",\"className\":\"LqMerchant\",\"columns\":[{\"capJavaField\":\"MerId\",\"columnComment\":\"Id\",\"columnId\":18,\"columnName\":\"mer_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"merId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 08:41:48\",\"usableColumn\":false},{\"capJavaField\":\"MerName\",\"columnComment\":\"名称\",\"columnId\":19,\"columnName\":\"mer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"merName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 08:41:48\",\"usableColumn\":false},{\"capJavaField\":\"MerLogo\",\"columnComment\":\"logo\",\"columnId\":20,\"columnName\":\"mer_logo\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"merLogo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 08:41:48\",\"usableColumn\":false},{\"capJavaField\":\"MerNotice\",\"columnComment\":\"公告\",\"columnId\":21,\"columnName\":\"mer_notice\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 08:43:01');
INSERT INTO `sys_oper_log` VALUES ('187', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-05-24 08:43:05');
INSERT INTO `sys_oper_log` VALUES ('188', '商家信息管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerchantController.add()', 'POST', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24T08:53:02.075+08:00\",\"merAddress\":\"泸职院1食堂\",\"merBankCard\":\"5421254554887454\",\"merBusiness\":\"/profile/upload/2024/05/24/无标题_20240524085240A002.png\",\"merCard\":\"515245112545\",\"merHygienic\":\"/profile/upload/2024/05/24/唯物论_20240524085250A003.png\",\"merId\":1,\"merLogo\":\"/profile/upload/2024/05/24/无标题_20240524085141A001.png\",\"merMinPrice\":15,\"merName\":\"泸职卤肉饭\",\"merNotice\":\"中午有新菜品供应\",\"merPhone\":\"13254587547\",\"merType\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 08:53:02');
INSERT INTO `sys_oper_log` VALUES ('189', '商家类型管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerTypeController.add()', 'POST', '1', 'admin', null, '/merchant/merType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24T10:14:38.928+08:00\",\"params\":{},\"typeDisc\":\"炸鸡\",\"typeId\":8,\"typeName\":\"炸鸡\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 10:14:39');
INSERT INTO `sys_oper_log` VALUES ('190', '商家信息管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerchantController.edit()', 'PUT', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24 08:53:02\",\"merAddress\":\"泸职院1食堂\",\"merBankCard\":\"5421254554887454\",\"merBusiness\":\"/profile/upload/2024/05/24/无标题_20240524085240A002.png\",\"merCard\":\"515245112545\",\"merHygienic\":\"/profile/upload/2024/05/24/唯物论_20240524085250A003.png\",\"merId\":1,\"merLogo\":\"/profile/upload/2024/05/24/无标题_20240524085141A001.png\",\"merMinPrice\":15,\"merName\":\"泸职卤肉饭\",\"merNotice\":\"中午有新菜品供应\",\"merPhone\":\"13254587547\",\"merType\":4,\"params\":{},\"updateTime\":\"2024-05-24T10:17:37.283+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 10:17:37');
INSERT INTO `sys_oper_log` VALUES ('191', '商家信息管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerchantController.add()', 'POST', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24T11:07:07.291+08:00\",\"merId\":2,\"merName\":\"老成都川菜馆\",\"merType\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 11:07:07');
INSERT INTO `sys_oper_log` VALUES ('192', '商家信息管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerchantController.add()', 'POST', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24T11:07:24.111+08:00\",\"merId\":3,\"merName\":\"知了火锅\",\"merType\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 11:07:24');
INSERT INTO `sys_oper_log` VALUES ('193', '商家信息管理', '1', 'cn.lanqiao.web.controller.merchant.LqMerchantController.add()', 'POST', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24T11:07:57.14+08:00\",\"merId\":4,\"merName\":\"成都但但面\",\"merType\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 11:07:57');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/merType/index\",\"createTime\":\"2024-05-24 08:27:29\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"商家类型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"merType\",\"perms\":\"merchant:merType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:11:57');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/merchant/index\",\"createTime\":\"2024-05-24 08:48:31\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"商家信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"merchant\",\"perms\":\"merchant:merchant:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:12:04');
INSERT INTO `sys_oper_log` VALUES ('196', '字典类型', '1', 'cn.lanqiao.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"口味\",\"dictType\":\"merchant_taste\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:48:00');
INSERT INTO `sys_oper_log` VALUES ('197', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"微辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:48:30');
INSERT INTO `sys_oper_log` VALUES ('198', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"中辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:48:45');
INSERT INTO `sys_oper_log` VALUES ('199', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-24 16:48:30\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"不辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:49:06');
INSERT INTO `sys_oper_log` VALUES ('200', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-24 16:48:45\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"中辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:49:10');
INSERT INTO `sys_oper_log` VALUES ('201', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"微辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"2\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:49:19');
INSERT INTO `sys_oper_log` VALUES ('202', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"特辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"4\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:49:31');
INSERT INTO `sys_oper_log` VALUES ('203', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-24 16:49:18\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"微辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:49:38');
INSERT INTO `sys_oper_log` VALUES ('204', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-24 16:48:45\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"中辣\",\"dictSort\":0,\"dictType\":\"merchant_taste\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:49:43');
INSERT INTO `sys_oper_log` VALUES ('205', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lqProduct\",\"className\":\"LqProduct\",\"columns\":[{\"capJavaField\":\"ProId\",\"columnComment\":\"ID\",\"columnId\":36,\"columnName\":\"pro_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"proId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProBalingCharge\",\"columnComment\":\"打包费\",\"columnId\":37,\"columnName\":\"pro_baling_charge\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"proBalingCharge\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProName\",\"columnComment\":\"商品名\",\"columnId\":38,\"columnName\":\"pro_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"proName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProDisc\",\"columnComment\":\"描述\",\"columnId\":39,\"columnName\":\"pro_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"proDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:53:22');
INSERT INTO `sys_oper_log` VALUES ('206', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-05-24 16:53:43');
INSERT INTO `sys_oper_log` VALUES ('207', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lqProduct\",\"className\":\"LqProduct\",\"columns\":[{\"capJavaField\":\"ProId\",\"columnComment\":\"ID\",\"columnId\":36,\"columnName\":\"pro_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"proId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 16:53:21\",\"usableColumn\":false},{\"capJavaField\":\"ProBalingCharge\",\"columnComment\":\"打包费\",\"columnId\":37,\"columnName\":\"pro_baling_charge\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"proBalingCharge\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 16:53:21\",\"usableColumn\":false},{\"capJavaField\":\"ProName\",\"columnComment\":\"商品名\",\"columnId\":38,\"columnName\":\"pro_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"proName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 16:53:21\",\"usableColumn\":false},{\"capJavaField\":\"ProDisc\",\"columnComment\":\"描述\",\"columnId\":39,\"columnName\":\"pro_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:58:23');
INSERT INTO `sys_oper_log` VALUES ('208', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"product\",\"className\":\"LqProduct\",\"columns\":[{\"capJavaField\":\"ProId\",\"columnComment\":\"ID\",\"columnId\":36,\"columnName\":\"pro_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"proId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 16:58:23\",\"usableColumn\":false},{\"capJavaField\":\"ProBalingCharge\",\"columnComment\":\"打包费\",\"columnId\":37,\"columnName\":\"pro_baling_charge\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"proBalingCharge\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 16:58:23\",\"usableColumn\":false},{\"capJavaField\":\"ProName\",\"columnComment\":\"商品名\",\"columnId\":38,\"columnName\":\"pro_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"proName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-05-24 16:58:23\",\"usableColumn\":false},{\"capJavaField\":\"ProDisc\",\"columnComment\":\"描述\",\"columnId\":39,\"columnName\":\"pro_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:59:16');
INSERT INTO `sys_oper_log` VALUES ('209', '商品', '1', 'cn.lanqiao.web.controller.merchant.LqProductController.add()', 'POST', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":1,\"proDisc\":\"1\",\"proId\":1,\"proInventory\":34,\"proName\":\"1\",\"proOriginalPrice\":1,\"proPrice\":1,\"proTaste\":\"2\",\"typeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-24 16:59:48');
INSERT INTO `sys_oper_log` VALUES ('210', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2024-05-28 11:28:51');
INSERT INTO `sys_oper_log` VALUES ('211', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2033', '127.0.0.1', '内网IP', '{menuId=2033}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-28 11:29:19');
INSERT INTO `sys_oper_log` VALUES ('212', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-28 11:29:22');
INSERT INTO `sys_oper_log` VALUES ('213', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2031', '127.0.0.1', '内网IP', '{menuId=2031}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-28 11:29:25');
INSERT INTO `sys_oper_log` VALUES ('214', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-28 11:29:28');
INSERT INTO `sys_oper_log` VALUES ('215', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-28 11:29:30');
INSERT INTO `sys_oper_log` VALUES ('216', '菜单管理', '3', 'cn.lanqiao.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-28 11:29:33');
INSERT INTO `sys_oper_log` VALUES ('217', '商家信息管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerchantController.edit()', 'PUT', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24 08:53:02\",\"lqMerType\":{\"createTime\":\"2024-05-24 08:53:02\",\"params\":{},\"updateTime\":\"2024-05-24 10:17:37\"},\"merAddress\":\"泸职院1食堂\",\"merBankCard\":\"5421254554887454\",\"merBusiness\":\"/profile/upload/2024/05/24/无标题_20240524085240A002.png\",\"merCard\":\"515245112545\",\"merHygienic\":\"/profile/upload/2024/05/24/唯物论_20240524085250A003.png\",\"merId\":1,\"merLogo\":\"/profile/upload/2024/05/29/OIP-C (1)_20240529140903A001.jpg\",\"merMinPrice\":15,\"merName\":\"泸职卤肉饭\",\"merNotice\":\"中午有新菜品供应\",\"merPhone\":\"13254587547\",\"merType\":4,\"params\":{},\"updateTime\":\"2024-05-29T14:09:06.452+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 14:09:06');
INSERT INTO `sys_oper_log` VALUES ('218', '商家信息管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerchantController.edit()', 'PUT', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24 11:07:07\",\"lqMerType\":{\"createTime\":\"2024-05-24 11:07:07\",\"params\":{},\"updateTime\":\"2024-05-24 11:07:07\"},\"merId\":2,\"merLogo\":\"/profile/upload/2024/05/29/21239328_115824073107_2_20240529140913A002.jpg\",\"merName\":\"老成都川菜馆\",\"merType\":1,\"params\":{},\"updateTime\":\"2024-05-29T14:09:14.819+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 14:09:14');
INSERT INTO `sys_oper_log` VALUES ('219', '商家信息管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerchantController.edit()', 'PUT', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24 11:07:24\",\"lqMerType\":{\"createTime\":\"2024-05-24 11:07:24\",\"params\":{},\"updateTime\":\"2024-05-24 11:07:24\"},\"merId\":3,\"merLogo\":\"/profile/upload/2024/05/29/11283626_085737131102_2_20240529140922A003.jpg\",\"merName\":\"知了火锅\",\"merType\":2,\"params\":{},\"updateTime\":\"2024-05-29T14:09:24.366+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 14:09:24');
INSERT INTO `sys_oper_log` VALUES ('220', '商家信息管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerchantController.edit()', 'PUT', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24 11:07:57\",\"lqMerType\":{\"createTime\":\"2024-05-24 11:07:57\",\"params\":{},\"updateTime\":\"2024-05-24 11:07:57\"},\"merId\":4,\"merLogo\":\"/profile/upload/2024/05/29/OIP-C_20240529140930A004.jpg\",\"merName\":\"成都但但面\",\"merType\":1,\"params\":{},\"updateTime\":\"2024-05-29T14:09:32.025+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 14:09:32');
INSERT INTO `sys_oper_log` VALUES ('221', '商品', '2', 'cn.lanqiao.web.controller.merchant.LqProductController.edit()', 'PUT', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":1,\"proCreateTime\":\"2024-05-24 16:59:48\",\"proDisc\":\"1\",\"proId\":1,\"proInventory\":34,\"proName\":\"米饭\",\"proOriginalPrice\":1,\"proPrice\":2,\"proTaste\":\"2\",\"proUpdateTime\":\"2024-05-24 16:59:48\",\"typeId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 16:01:35');
INSERT INTO `sys_oper_log` VALUES ('222', '商品', '1', 'cn.lanqiao.web.controller.merchant.LqProductController.add()', 'POST', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":1,\"proId\":2,\"proInventory\":10,\"proName\":\"鱼香肉丝\",\"proPrice\":25,\"typeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 16:01:55');
INSERT INTO `sys_oper_log` VALUES ('223', '商品', '1', 'cn.lanqiao.web.controller.merchant.LqProductController.add()', 'POST', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":2,\"proId\":3,\"proInventory\":10,\"proName\":\"小白菜豆腐汤\",\"proPrice\":15,\"typeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-29 16:02:15');
INSERT INTO `sys_oper_log` VALUES ('224', '商家信息管理', '5', 'cn.lanqiao.web.controller.merchant.LqMerchantController.export()', 'POST', '1', 'admin', null, '/merchant/merchant/export', '127.0.0.1', '内网IP', '{\"params\":{}}', null, '0', null, '2024-05-29 17:02:04');
INSERT INTO `sys_oper_log` VALUES ('225', '商家信息管理', '2', 'cn.lanqiao.web.controller.merchant.LqMerchantController.edit()', 'PUT', '1', 'admin', null, '/merchant/merchant', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-24 08:53:02\",\"lqMerType\":{\"createTime\":\"2024-05-24 08:53:02\",\"params\":{},\"updateTime\":\"2024-05-29 14:09:06\"},\"merAddress\":\"泸职院1食堂\",\"merBankCard\":\"5421254554887454\",\"merBusiness\":\"/profile/upload/2024/05/24/无标题_20240524085240A002.png\",\"merCard\":\"515245112545\",\"merHygienic\":\"/profile/upload/2024/05/24/唯物论_20240524085250A003.png\",\"merId\":1,\"merLogo\":\"/profile/upload/2024/05/29/OIP-C (1)_20240529140903A001.jpg\",\"merMinPrice\":15,\"merName\":\"泸职卤肉饭\",\"merNotice\":\"中午有新菜品供应\",\"merPhone\":\"13254587547\",\"merType\":1,\"params\":{},\"updateTime\":\"2024-05-30T10:38:49.155+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 10:38:49');
INSERT INTO `sys_oper_log` VALUES ('226', '商品', '3', 'cn.lanqiao.web.controller.merchant.LqProductController.remove()', 'DELETE', '1', 'admin', null, '/merchant/lqProduct/5', '127.0.0.1', '内网IP', '{proIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 10:39:19');
INSERT INTO `sys_oper_log` VALUES ('227', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"productType\",\"className\":\"LqProductType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"Id\",\"columnId\":51,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-05-23 15:37:10\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":52,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-05-23 15:37:10\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":53,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-05-23 15:37:10\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":54,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 10:41:45');
INSERT INTO `sys_oper_log` VALUES ('228', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"productType\",\"className\":\"LqProductType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"Id\",\"columnId\":51,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-05-30 10:41:45\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型\",\"columnId\":52,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-05-30 10:41:45\",\"usableColumn\":false},{\"capJavaField\":\"TypeDisc\",\"columnComment\":\"类型描述\",\"columnId\":53,\"columnName\":\"type_disc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeDisc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-05-30 10:41:45\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":54,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 10:55:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 10:42:47');
INSERT INTO `sys_oper_log` VALUES ('229', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-05-30 10:42:50');
INSERT INTO `sys_oper_log` VALUES ('230', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T10:48:05.101+08:00\",\"params\":{},\"typeDisc\":\"2\",\"typeName\":\"1\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\merchant\\LqProductTypeMapper.xml]\r\n### The error may involve cn.lanqiao.merchant.mapper.LqProductTypeMapper.insertLqProductType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_product_type          ( type_name,             type_disc,             create_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\n; Field \'mer_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value', '2024-05-30 10:48:05');
INSERT INTO `sys_oper_log` VALUES ('231', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T10:48:14.904+08:00\",\"params\":{},\"typeDisc\":\"2\",\"typeName\":\"1\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\merchant\\LqProductTypeMapper.xml]\r\n### The error may involve cn.lanqiao.merchant.mapper.LqProductTypeMapper.insertLqProductType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_product_type          ( type_name,             type_disc,             create_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\n; Field \'mer_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value', '2024-05-30 10:48:14');
INSERT INTO `sys_oper_log` VALUES ('232', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/productType/index\",\"createTime\":\"2024-05-30 10:45:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"商品类型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"productType\",\"perms\":\"merchant:productType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 11:12:15');
INSERT INTO `sys_oper_log` VALUES ('233', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T11:17:29.255+08:00\",\"params\":{},\"typeDisc\":\"店长推荐很好吃\",\"typeName\":\"招牌套餐\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\merchant\\LqProductTypeMapper.xml]\r\n### The error may involve cn.lanqiao.merchant.mapper.LqProductTypeMapper.insertLqProductType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_product_type          ( type_name,             type_disc,             create_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\n; Field \'mer_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value', '2024-05-30 11:17:29');
INSERT INTO `sys_oper_log` VALUES ('234', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T11:20:05.471+08:00\",\"params\":{},\"typeDisc\":\"吃的人最多\",\"typeName\":\"招牌套餐\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\merchant\\LqProductTypeMapper.xml]\r\n### The error may involve cn.lanqiao.merchant.mapper.LqProductTypeMapper.insertLqProductType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_product_type          ( type_name,             type_disc,             create_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\n; Field \'mer_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value', '2024-05-30 11:20:05');
INSERT INTO `sys_oper_log` VALUES ('235', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T11:20:15.742+08:00\",\"params\":{},\"typeDisc\":\"吃的人最多\",\"typeName\":\"招牌套餐\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\merchant\\LqProductTypeMapper.xml]\r\n### The error may involve cn.lanqiao.merchant.mapper.LqProductTypeMapper.insertLqProductType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_product_type          ( type_name,             type_disc,             create_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value\n; Field \'mer_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mer_id\' doesn\'t have a default value', '2024-05-30 11:20:15');
INSERT INTO `sys_oper_log` VALUES ('236', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T11:27:18.986+08:00\",\"merId\":1,\"params\":{},\"typeId\":1,\"typeName\":\"招牌套餐\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 11:27:19');
INSERT INTO `sys_oper_log` VALUES ('237', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30T11:27:39.451+08:00\",\"merId\":1,\"params\":{},\"typeId\":2,\"typeName\":\"人气套餐\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 11:27:39');
INSERT INTO `sys_oper_log` VALUES ('238', '商品类型', '2', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.edit()', 'PUT', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-30 11:27:39\",\"merId\":1,\"params\":{},\"typeId\":2,\"typeName\":\"必点商品\",\"updateTime\":\"2024-05-30T11:27:59.48+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 11:27:59');
INSERT INTO `sys_oper_log` VALUES ('239', '商品', '1', 'cn.lanqiao.web.controller.merchant.LqProductController.add()', 'POST', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"batName\":\"豆花\",\"params\":{},\"proBalingCharge\":1,\"proId\":1,\"proInventory\":10,\"proName\":\"豆花套饭\",\"proOriginalPrice\":20,\"proPicture\":\"/profile/upload/2024/05/30/21239328_115824073107_2_20240530112940A001.jpg\",\"proPrice\":15,\"proSpeci\":500,\"proTaste\":\"3\",\"proUnits\":\"克\",\"typeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-30 11:30:16');
INSERT INTO `sys_oper_log` VALUES ('240', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-31T09:42:48.605+08:00\",\"merId\":3,\"params\":{},\"typeDisc\":\"火锅锅底\",\"typeId\":3,\"typeName\":\"必点商品\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-31 09:42:48');
INSERT INTO `sys_oper_log` VALUES ('241', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-31T09:47:53.123+08:00\",\"merId\":1,\"params\":{},\"typeId\":4,\"typeName\":\"店长推荐\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-31 09:47:53');
INSERT INTO `sys_oper_log` VALUES ('242', '商品', '1', 'cn.lanqiao.web.controller.merchant.LqProductController.add()', 'POST', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":1,\"proId\":2,\"proInventory\":20,\"proName\":\"招牌荤豆花\",\"proPrice\":50,\"proTaste\":\"4\",\"typeId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-05-31 09:48:38');
INSERT INTO `sys_oper_log` VALUES ('243', '商品类型', '1', 'cn.lanqiao.web.controller.merchant.LqProductTypeController.add()', 'POST', '1', 'admin', null, '/merchant/productType', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-12T08:15:17.449+08:00\",\"merId\":2,\"params\":{},\"typeId\":5,\"typeName\":\"招牌套餐\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-12 08:15:17');
INSERT INTO `sys_oper_log` VALUES ('244', '商品', '1', 'cn.lanqiao.web.controller.merchant.LqProductController.add()', 'POST', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":5,\"proId\":4,\"proInventory\":10,\"proName\":\"酸菜豆花\",\"proOriginalPrice\":30,\"proPicture\":\"/profile/upload/2024/06/12/21239328_115824073107_2_20240612150238A002.jpg\",\"proPrice\":15,\"typeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-12 15:02:41');
INSERT INTO `sys_oper_log` VALUES ('245', '商品', '2', 'cn.lanqiao.web.controller.merchant.LqProductController.edit()', 'PUT', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proCreateTime\":\"2024-06-11 11:24:41\",\"proId\":3,\"proInventory\":0,\"proName\":\"单人豆花\",\"proPicture\":\"/profile/upload/2024/06/12/11283626_085737131102_2_20240612150255A003.jpg\",\"proPrice\":8,\"proUpdateTime\":\"2024-06-11 11:24:41\",\"typeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-12 15:02:57');
INSERT INTO `sys_oper_log` VALUES ('246', '商品', '2', 'cn.lanqiao.web.controller.merchant.LqProductController.edit()', 'PUT', '1', 'admin', null, '/merchant/lqProduct', '127.0.0.1', '内网IP', '{\"params\":{},\"proBalingCharge\":1,\"proCreateTime\":\"2024-06-11 11:24:41\",\"proId\":3,\"proInventory\":0,\"proName\":\"单人豆花\",\"proPicture\":\"/profile/upload/2024/06/12/11283626_085737131102_2_20240612150255A003.jpg\",\"proPrice\":8,\"proUpdateTime\":\"2024-06-11 11:24:41\",\"typeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-12 15:03:03');
INSERT INTO `sys_oper_log` VALUES ('247', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-14 14:50:32');
INSERT INTO `sys_oper_log` VALUES ('248', '代码生成', '6', 'cn.lanqiao.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lq_order_items,lq_orders\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-14 14:51:07');
INSERT INTO `sys_oper_log` VALUES ('249', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"LqOrders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单的唯一标识符，自动递增\",\"columnId\":63,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户的唯一标识符，外键关联到用户表\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RestaurantId\",\"columnComment\":\"餐厅的唯一标识符\",\"columnId\":65,\"columnName\":\"restaurant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"订单的创建时间，默认为当前时间\",\"columnId\":66,\"columnName\":\"order_date\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaF', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:28:21');
INSERT INTO `sys_oper_log` VALUES ('250', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"LqOrders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":63,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:28:21\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:28:21\",\"usableColumn\":false},{\"capJavaField\":\"RestaurantId\",\"columnComment\":\"餐厅id\",\"columnId\":65,\"columnName\":\"restaurant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:28:21\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"下单时间\",\"columnId\":66,\"columnName\":\"order_date\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:38:58');
INSERT INTO `sys_oper_log` VALUES ('251', '字典类型', '1', 'cn.lanqiao.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"支付方式\",\"dictType\":\"payment_method\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:41:31');
INSERT INTO `sys_oper_log` VALUES ('252', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"在线支付\",\"dictSort\":1,\"dictType\":\"payment_method\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:41:57');
INSERT INTO `sys_oper_log` VALUES ('253', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"线下支付\",\"dictSort\":0,\"dictType\":\"payment_method\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:42:09');
INSERT INTO `sys_oper_log` VALUES ('254', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-17 08:41:57\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"在线支付\",\"dictSort\":1,\"dictType\":\"payment_method\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:42:17');
INSERT INTO `sys_oper_log` VALUES ('255', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-17 08:42:09\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"支付宝\",\"dictSort\":0,\"dictType\":\"payment_method\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:42:44');
INSERT INTO `sys_oper_log` VALUES ('256', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-17 08:41:57\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"微信\",\"dictSort\":1,\"dictType\":\"payment_method\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:42:51');
INSERT INTO `sys_oper_log` VALUES ('257', '字典类型', '1', 'cn.lanqiao.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"dictType\":\"order_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:43:15');
INSERT INTO `sys_oper_log` VALUES ('258', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"未支付\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:43:45');
INSERT INTO `sys_oper_log` VALUES ('259', '字典数据', '1', 'cn.lanqiao.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已取消\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:44:02');
INSERT INTO `sys_oper_log` VALUES ('260', '字典数据', '2', 'cn.lanqiao.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-17 08:43:45\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"未支付\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:44:17');
INSERT INTO `sys_oper_log` VALUES ('261', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"LqOrders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":63,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:38:57\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:38:57\",\"usableColumn\":false},{\"capJavaField\":\"RestaurantId\",\"columnComment\":\"餐厅id\",\"columnId\":65,\"columnName\":\"restaurant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:38:57\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"下单时间\",\"columnId\":66,\"columnName\":\"order_date\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:45:05');
INSERT INTO `sys_oper_log` VALUES ('262', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"items\",\"className\":\"LqOrderItems\",\"columns\":[{\"capJavaField\":\"OrderItemId\",\"columnComment\":\"订单项的唯一标识符，自动递增\",\"columnId\":58,\"columnName\":\"order_item_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderItemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单的唯一标识符，外键关联到订单表\",\"columnId\":59,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品的唯一标识符\",\"columnId\":60,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"商品的数量\",\"columnId\":61,\"columnName\":\"quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:45:30');
INSERT INTO `sys_oper_log` VALUES ('263', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"items\",\"className\":\"LqOrderItems\",\"columns\":[{\"capJavaField\":\"OrderItemId\",\"columnComment\":\"订单商品编号\",\"columnId\":58,\"columnName\":\"order_item_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderItemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:45:30\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单编号\",\"columnId\":59,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:45:30\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品id\",\"columnId\":60,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:45:30\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"商品数量\",\"columnId\":61,\"columnName\":\"quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:47:25');
INSERT INTO `sys_oper_log` VALUES ('264', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"items\",\"className\":\"LqOrderItems\",\"columns\":[{\"capJavaField\":\"OrderItemId\",\"columnComment\":\"订单商品编号\",\"columnId\":58,\"columnName\":\"order_item_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"orderItemId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:47:25\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单编号\",\"columnId\":59,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:47:25\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品id\",\"columnId\":60,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:47:25\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"商品数量\",\"columnId\":61,\"columnName\":\"quantity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:47:39');
INSERT INTO `sys_oper_log` VALUES ('265', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"LqOrders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":63,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:45:05\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:45:05\",\"usableColumn\":false},{\"capJavaField\":\"RestaurantId\",\"columnComment\":\"餐厅id\",\"columnId\":65,\"columnName\":\"restaurant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:45:05\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"下单时间\",\"columnId\":66,\"columnName\":\"order_date\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:47:48');
INSERT INTO `sys_oper_log` VALUES ('266', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"LqOrders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":63,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:47:48\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:47:48\",\"usableColumn\":false},{\"capJavaField\":\"RestaurantId\",\"columnComment\":\"餐厅id\",\"columnId\":65,\"columnName\":\"restaurant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:47:48\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"下单时间\",\"columnId\":66,\"columnName\":\"order_date\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:48:24');
INSERT INTO `sys_oper_log` VALUES ('267', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"LqOrders\",\"columns\":[{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":63,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:48:24\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":64,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:48:24\",\"usableColumn\":false},{\"capJavaField\":\"RestaurantId\",\"columnComment\":\"餐厅id\",\"columnId\":65,\"columnName\":\"restaurant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-17 08:48:24\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"下单时间\",\"columnId\":66,\"columnName\":\"order_date\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:49:14');
INSERT INTO `sys_oper_log` VALUES ('268', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-06-17 08:49:19');
INSERT INTO `sys_oper_log` VALUES ('269', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-06-17 08:49:20');
INSERT INTO `sys_oper_log` VALUES ('270', '外卖订单管理', '1', 'cn.lanqiao.web.controller.order.LqOrdersController.add()', 'POST', '1', 'admin', null, '/order/order', '127.0.0.1', '内网IP', '{\"deliveryAddress\":\"龙建书院\",\"deliveryFee\":15,\"deliveryTime\":\"2024-07-30 00:00:00\",\"orderDate\":\"2024-06-19 00:00:00\",\"orderId\":1,\"orderStatus\":\"1\",\"params\":{},\"paymentMethod\":\"2\",\"restaurantId\":1,\"totalAmount\":30,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:58:20');
INSERT INTO `sys_oper_log` VALUES ('271', '订单商品', '1', 'cn.lanqiao.web.controller.order.LqOrderItemsController.add()', 'POST', '1', 'admin', null, '/order/items', '127.0.0.1', '内网IP', '{\"orderId\":1,\"orderItemId\":1,\"params\":{},\"productId\":1,\"quantity\":4,\"unitPrice\":5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:58:56');
INSERT INTO `sys_oper_log` VALUES ('272', '订单商品', '1', 'cn.lanqiao.web.controller.order.LqOrderItemsController.add()', 'POST', '1', 'admin', null, '/order/items', '127.0.0.1', '内网IP', '{\"orderId\":1,\"orderItemId\":2,\"params\":{},\"productId\":2,\"quantity\":1,\"unitPrice\":10}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:59:14');
INSERT INTO `sys_oper_log` VALUES ('273', '订单商品', '1', 'cn.lanqiao.web.controller.order.LqOrderItemsController.add()', 'POST', '1', 'admin', null, '/order/items', '127.0.0.1', '内网IP', '{\"orderId\":1,\"orderItemId\":3,\"params\":{},\"productId\":3,\"quantity\":4,\"unitPrice\":5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 08:59:29');
INSERT INTO `sys_oper_log` VALUES ('274', '外卖订单管理', '2', 'cn.lanqiao.web.controller.order.LqOrdersController.edit()', 'PUT', '1', 'admin', null, '/order/order', '127.0.0.1', '内网IP', '{\"deliveryAddress\":\"龙建书院\",\"deliveryFee\":15,\"deliveryTime\":\"2024-07-30 00:00:00\",\"orderDate\":\"2024-06-19 00:00:00\",\"orderId\":1,\"orderStatus\":\"1\",\"params\":{},\"paymentMethod\":\"2\",\"restaurantId\":1,\"totalAmount\":65,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 09:00:52');
INSERT INTO `sys_oper_log` VALUES ('275', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"order/items/index\",\"createTime\":\"2024-06-17 08:54:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"订单商品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2040,\"path\":\"items\",\"perms\":\"order:items:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-17 09:23:05');
INSERT INTO `sys_oper_log` VALUES ('276', '代码生成', '6', 'cn.lanqiao.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lq_users\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-25 08:37:41');
INSERT INTO `sys_oper_log` VALUES ('277', '代码生成', '2', 'cn.lanqiao.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"LqUsers\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"ID\",\"columnId\":73,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-25 08:37:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":74,\"columnName\":\"username\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-25 08:37:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"用户密码\",\"columnId\":75,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-25 08:37:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"电话号码\",\"columnId\":76,\"columnName\":\"phone_number\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-25 08:37:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-25 08:39:56');
INSERT INTO `sys_oper_log` VALUES ('278', '代码生成', '8', 'cn.lanqiao.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2024-06-25 08:40:00');
INSERT INTO `sys_oper_log` VALUES ('279', '外卖用户', '1', 'cn.lanqiao.web.controller.order.LqUsersController.add()', 'POST', '1', 'admin', null, '/order/users', '127.0.0.1', '内网IP', '{\"address\":\"泸州职业技术学院\",\"city\":\"泸州市\",\"country\":\"中国\",\"fullName\":\"测试\",\"params\":{},\"phoneNumber\":\"13158612981\",\"state\":\"四川省\",\"username\":\"c45182\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'password\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\order\\LqUsersMapper.xml]\r\n### The error may involve cn.lanqiao.order.mapper.LqUsersMapper.insertLqUsers-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_users          ( username,                          phone_number,             full_name,             address,             city,             state,             country )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'password\' doesn\'t have a default value\n; Field \'password\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-06-25 08:45:50');
INSERT INTO `sys_oper_log` VALUES ('280', '外卖用户', '1', 'cn.lanqiao.web.controller.order.LqUsersController.add()', 'POST', '1', 'admin', null, '/order/users', '127.0.0.1', '内网IP', '{\"address\":\"泸州职业技术学院\",\"city\":\"泸州市\",\"country\":\"中国\",\"fullName\":\"测试\",\"params\":{},\"phoneNumber\":\"13158612981\",\"state\":\"四川省\",\"username\":\"c45182\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'password\' doesn\'t have a default value\r\n### The error may exist in file [D:\\老杨\\24年资料\\vue课件\\实战项目\\项目源代码\\LanQiao\\lanqiao-system\\target\\classes\\mapper\\order\\LqUsersMapper.xml]\r\n### The error may involve cn.lanqiao.order.mapper.LqUsersMapper.insertLqUsers-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lq_users          ( username,                          phone_number,             full_name,             address,             city,             state,             country )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'password\' doesn\'t have a default value\n; Field \'password\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'password\' doesn\'t have a default value', '2024-06-25 08:45:54');
INSERT INTO `sys_oper_log` VALUES ('281', '外卖用户', '1', 'cn.lanqiao.web.controller.order.LqUsersController.add()', 'POST', '1', 'admin', null, '/order/users', '127.0.0.1', '内网IP', '{\"address\":\"泸州职业技术学院\",\"city\":\"泸州市\",\"country\":\"中国\",\"fullName\":\"测试\",\"params\":{},\"phoneNumber\":\"13158612981\",\"state\":\"四川省\",\"userId\":1,\"username\":\"c45182\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-06-25 08:46:27');
INSERT INTO `sys_oper_log` VALUES ('282', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-10 16:42:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"老师\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:06:59');
INSERT INTO `sys_oper_log` VALUES ('283', '部门管理', '2', 'cn.lanqiao.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:09\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"蓝桥学院\",\"email\":\"ry@qq.com\",\"leader\":\"张志勇\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:28');
INSERT INTO `sys_oper_log` VALUES ('284', '部门管理', '2', 'cn.lanqiao.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:10\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"泸州职业技术学院\",\"email\":\"ry@qq.com\",\"leader\":\"袁兵\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:45');
INSERT INTO `sys_oper_log` VALUES ('285', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:49');
INSERT INTO `sys_oper_log` VALUES ('286', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:51');
INSERT INTO `sys_oper_log` VALUES ('287', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:53');
INSERT INTO `sys_oper_log` VALUES ('288', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:56');
INSERT INTO `sys_oper_log` VALUES ('289', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:07:58');
INSERT INTO `sys_oper_log` VALUES ('290', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2024-07-07 11:08:40');
INSERT INTO `sys_oper_log` VALUES ('291', '用户管理', '2', 'cn.lanqiao.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 08:40:37\",\"delFlag\":\"0\",\"deptId\":101,\"email\":\"\",\"loginDate\":\"2024-05-11 08:45:22\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"c45182\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"运维人员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"c45182\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:09:18');
INSERT INTO `sys_oper_log` VALUES ('292', '用户管理', '2', 'cn.lanqiao.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":101,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-05-10 16:42:10\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"老师\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:09:27');
INSERT INTO `sys_oper_log` VALUES ('293', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:09:51');
INSERT INTO `sys_oper_log` VALUES ('294', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:09:53');
INSERT INTO `sys_oper_log` VALUES ('295', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2024-07-07 11:09:57');
INSERT INTO `sys_oper_log` VALUES ('296', '部门管理', '3', 'cn.lanqiao.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:11:31');
INSERT INTO `sys_oper_log` VALUES ('297', '部门管理', '2', 'cn.lanqiao.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:10\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"泸职校区\",\"email\":\"ry@qq.com\",\"leader\":\"袁兵\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:11:44');
INSERT INTO `sys_oper_log` VALUES ('298', '部门管理', '1', 'cn.lanqiao.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"洛职校区\",\"leader\":\"毛东宇\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"phone\":\"13154875475\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:12:30');
INSERT INTO `sys_oper_log` VALUES ('299', '岗位管理', '2', 'cn.lanqiao.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:10\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"校区经理\",\"postSort\":\"1\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:13:11');
INSERT INTO `sys_oper_log` VALUES ('300', '岗位管理', '2', 'cn.lanqiao.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:10\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"教学主任\",\"postSort\":\"2\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:13:23');
INSERT INTO `sys_oper_log` VALUES ('301', '岗位管理', '3', 'cn.lanqiao.web.controller.system.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/system/post/3', '127.0.0.1', '内网IP', '{postIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:13:40');
INSERT INTO `sys_oper_log` VALUES ('302', '岗位管理', '2', 'cn.lanqiao.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-10 16:42:10\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":4,\"postName\":\"讲师\",\"postSort\":\"4\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:13:54');
INSERT INTO `sys_oper_log` VALUES ('303', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-10 16:42:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通人员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:14:15');
INSERT INTO `sys_oper_log` VALUES ('304', '角色管理', '2', 'cn.lanqiao.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-11 08:42:25\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,104,105,2,1000,1007,1012,1016,1020,1025,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,113,114],\"params\":{},\"roleId\":100,\"roleKey\":\"yunwei\",\"roleName\":\"管理人员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 11:14:26');
INSERT INTO `sys_oper_log` VALUES ('305', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-14 14:50:32\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:01');
INSERT INTO `sys_oper_log` VALUES ('306', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-23 15:47:26\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"merchant\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:10');
INSERT INTO `sys_oper_log` VALUES ('307', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"在线用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:21');
INSERT INTO `sys_oper_log` VALUES ('308', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:28');
INSERT INTO `sys_oper_log` VALUES ('309', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:34');
INSERT INTO `sys_oper_log` VALUES ('310', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/server/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":112,\"menuName\":\"服务监控\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"server\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:39');
INSERT INTO `sys_oper_log` VALUES ('311', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/index\",\"createTime\":\"2024-05-10 16:42:12\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"缓存监控\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"cache\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:45');
INSERT INTO `sys_oper_log` VALUES ('312', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/list\",\"createTime\":\"2024-05-10 16:42:12\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"缓存列表\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"cacheList\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:06:50');
INSERT INTO `sys_oper_log` VALUES ('313', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:07:09');
INSERT INTO `sys_oper_log` VALUES ('314', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:07:15');
INSERT INTO `sys_oper_log` VALUES ('315', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:09:59');
INSERT INTO `sys_oper_log` VALUES ('316', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-05-10 16:42:11\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"校区管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:16:06');
INSERT INTO `sys_oper_log` VALUES ('317', '菜单管理', '1', 'cn.lanqiao.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业务管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"unsiness\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:47:30');
INSERT INTO `sys_oper_log` VALUES ('318', '菜单管理', '2', 'cn.lanqiao.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 13:47:30\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"业务管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"unsiness\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-07-07 13:47:50');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '校区经理', '1', '0', 'admin', '2024-05-10 16:42:10', 'admin', '2024-07-07 11:13:11', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '教学主任', '2', '0', 'admin', '2024-05-10 16:42:10', 'admin', '2024-07-07 11:13:23', '');
INSERT INTO `sys_post` VALUES ('4', 'teacher', '讲师', '4', '0', 'admin', '2024-05-10 16:42:10', 'admin', '2024-07-07 11:13:54', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2024-05-10 16:42:11', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通人员', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2024-05-10 16:42:11', 'admin', '2024-07-07 11:14:15', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '管理人员', 'yunwei', '3', '1', '1', '1', '0', '0', 'admin', '2024-05-11 08:42:25', 'admin', '2024-07-07 11:14:26', null);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '117');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '2');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '101');
INSERT INTO `sys_role_menu` VALUES ('100', '102');
INSERT INTO `sys_role_menu` VALUES ('100', '103');
INSERT INTO `sys_role_menu` VALUES ('100', '104');
INSERT INTO `sys_role_menu` VALUES ('100', '105');
INSERT INTO `sys_role_menu` VALUES ('100', '106');
INSERT INTO `sys_role_menu` VALUES ('100', '107');
INSERT INTO `sys_role_menu` VALUES ('100', '108');
INSERT INTO `sys_role_menu` VALUES ('100', '109');
INSERT INTO `sys_role_menu` VALUES ('100', '110');
INSERT INTO `sys_role_menu` VALUES ('100', '111');
INSERT INTO `sys_role_menu` VALUES ('100', '113');
INSERT INTO `sys_role_menu` VALUES ('100', '114');
INSERT INTO `sys_role_menu` VALUES ('100', '500');
INSERT INTO `sys_role_menu` VALUES ('100', '501');
INSERT INTO `sys_role_menu` VALUES ('100', '1000');
INSERT INTO `sys_role_menu` VALUES ('100', '1007');
INSERT INTO `sys_role_menu` VALUES ('100', '1012');
INSERT INTO `sys_role_menu` VALUES ('100', '1016');
INSERT INTO `sys_role_menu` VALUES ('100', '1020');
INSERT INTO `sys_role_menu` VALUES ('100', '1025');
INSERT INTO `sys_role_menu` VALUES ('100', '1030');
INSERT INTO `sys_role_menu` VALUES ('100', '1031');
INSERT INTO `sys_role_menu` VALUES ('100', '1032');
INSERT INTO `sys_role_menu` VALUES ('100', '1033');
INSERT INTO `sys_role_menu` VALUES ('100', '1034');
INSERT INTO `sys_role_menu` VALUES ('100', '1035');
INSERT INTO `sys_role_menu` VALUES ('100', '1036');
INSERT INTO `sys_role_menu` VALUES ('100', '1037');
INSERT INTO `sys_role_menu` VALUES ('100', '1038');
INSERT INTO `sys_role_menu` VALUES ('100', '1039');
INSERT INTO `sys_role_menu` VALUES ('100', '1040');
INSERT INTO `sys_role_menu` VALUES ('100', '1041');
INSERT INTO `sys_role_menu` VALUES ('100', '1042');
INSERT INTO `sys_role_menu` VALUES ('100', '1043');
INSERT INTO `sys_role_menu` VALUES ('100', '1044');
INSERT INTO `sys_role_menu` VALUES ('100', '1045');
INSERT INTO `sys_role_menu` VALUES ('100', '1046');
INSERT INTO `sys_role_menu` VALUES ('100', '1047');
INSERT INTO `sys_role_menu` VALUES ('100', '1048');
INSERT INTO `sys_role_menu` VALUES ('100', '1049');
INSERT INTO `sys_role_menu` VALUES ('100', '1050');
INSERT INTO `sys_role_menu` VALUES ('100', '1051');
INSERT INTO `sys_role_menu` VALUES ('100', '1052');
INSERT INTO `sys_role_menu` VALUES ('100', '1053');
INSERT INTO `sys_role_menu` VALUES ('100', '1054');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '101', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-07 13:05:37', 'admin', '2024-05-10 16:42:10', '', '2024-07-07 13:05:36', '管理员');
INSERT INTO `sys_user` VALUES ('2', '101', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-10 16:42:10', 'admin', '2024-05-10 16:42:10', 'admin', '2024-07-07 11:09:27', '测试员');
INSERT INTO `sys_user` VALUES ('100', '101', 'c45182', 'c45182', '00', '', '', '0', '', '$2a$10$Ac5mYWOOPCDGkkX/ECviOerg0GORHSQcbNEm88Ta9nQ328xNlw8Vq', '0', '0', '127.0.0.1', '2024-05-11 08:45:22', 'admin', '2024-05-11 08:40:37', 'admin', '2024-07-07 11:09:18', null);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '100');
