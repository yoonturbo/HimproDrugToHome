/*
 Navicat Premium Data Transfer

 Source Server         : himpro
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 14.11.0.3:3306
 Source Schema         : hos

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 13/12/2020 20:37:04
*/
use hos;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for drug_store
-- ----------------------------
DROP TABLE IF EXISTS `drug_store`;
CREATE TABLE `drug_store`  (
  `code` varchar(15) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL COMMENT 'รหัสร้านยา',
  `name` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ชื่อร้านยา',
  `address` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ที่อยู่',
  `email` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'อิเมล์',
  `phone` varchar(10) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'เบอร์โทร',
  `tambon` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ตำบล',
  `amphur` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'อำเภอ',
  `province` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'จังหวัด',
  `zipcode` varchar(5) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'รหัสไปรษณีย์',
  `user_contact` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ชื่อผู้่ติดต่อ',
  `active` int(1) NULL DEFAULT 1 COMMENT 'สถานะการใช้งาน 0=ยกเลิก, 1=ใช้งาน',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

use hos_hist;
-- ----------------------------
-- Table structure for drug_tohome_logs
-- ----------------------------
DROP TABLE IF EXISTS `drug_tohome_logs`;
CREATE TABLE `drug_tohome_logs`  (
  `date_send` date NOT NULL COMMENT 'วันที่ส่งข้อมูล',
  `regdate` date NOT NULL COMMENT 'วันที่สั่งยา',
  `hn` varchar(15) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL,
  `frequency` int(2) NOT NULL COMMENT 'ครั้งที่รับบริการ',
  `orderno` varchar(50) CHARACTER SET tis620 COLLATE tis620_thai_ci NOT NULL COMMENT 'เลขที่ใบสั่งยา',
  `fullname` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ชื่อคนไข้',
  `send_type` varchar(10) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ประเภทการส่ง เช่น รับยาร้านยา,รับยาทางไปรษณีย์',
  `store_code` varchar(40) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'รหัสร้านยา เขื่อมกันตาราง hos.drug_store',
  `store_name` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'รหัสร้านยา',
  `send_by` varchar(150) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL COMMENT 'ผู้บันทึกการส่งข้อมูล',
  `dispensing` varchar(1) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT '0' COMMENT 'สถานะการจ่ายยา 1= จ่ายยาแล้ว 0=ยังไม่จ่ายยา',
  PRIMARY KEY (`date_send`, `regdate`, `hn`, `frequency`, `orderno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
