/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.21 : Database - security
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`security` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `security`;

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `persistent_logins` */

/*Table structure for table `product_table` */

DROP TABLE IF EXISTS `product_table`;

CREATE TABLE `product_table` (
  `product_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` int DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `product_table` */

insert  into `product_table`(`product_id`,`product_name`,`num`,`price`) values ('17b0da6c5d382967264201508a3e59fc','桃子',10,'5.00'),('2e72f69fbf3fdfb14aede7792cbb1e88','西瓜',10,'4.00'),('4001d341639e40b0aa40bc685d57c37c','榴莲',45,'15.00'),('7b635cc84bce7d35179a21259e0ae52e','葡萄',50,'6.80'),('a970e6817a3fb3f575a2caeef0658eb1','梨子',5800,'6.00'),('c5df33344a096427297262f6bfcf9dc3','柚子',6,'6.00'),('e399083c104bb7aeb0e2371a85275ee3','苹果',5,'6.80'),('e68bc88cfa5ae593d7f4bbee38a74735','香蕉',6,'3.00');

/*Table structure for table `sys_backend_api_table` */

DROP TABLE IF EXISTS `sys_backend_api_table`;

CREATE TABLE `sys_backend_api_table` (
  `backend_api_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `backend_api_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'API名称',
  `backend_api_url` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'API请求地址',
  `backend_api_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'API请求方式：GET、POST、PUT、DELETE',
  `pid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '父ID',
  `backend_api_sort` int NOT NULL COMMENT '排序',
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`backend_api_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_backend_api_table` */

insert  into `sys_backend_api_table`(`backend_api_id`,`backend_api_name`,`backend_api_url`,`backend_api_method`,`pid`,`backend_api_sort`,`description`) values ('1','所有API','/**','GET,POST,PUT,DELETE',NULL,100,NULL),('234dbd90c37363e2a6dea629adc7389e','编辑商品','/productTable','PUT','4725d5b946c8789ebd2f758a93d416d8',203,'put'),('4725d5b946c8789ebd2f758a93d416d8','商品管理','none','',NULL,200,'商品管理下所有API'),('49bcd49553fd6274c5ea8b6fcc84097e','订单模块','none',NULL,NULL,300,'订单模块下的所有API'),('623c3f7156fb4a345f3c030f87d09aa9','菜单管理','/sysFrontendMenuTable','GET,POST,PUT,DELETE','ccb6659817cf193adc6bfb4dc17709ec',902,'前端菜单管理'),('73b81575b6737e4d38e6716bc773c5bb','订单查询','/order','GET','49bcd49553fd6274c5ea8b6fcc84097e',301,'订单查询'),('760ba9bf47fcda793203b1f3cd731083','删除商品','/productTable','DELETE','4725d5b946c8789ebd2f758a93d416d8',204,'delete'),('8ba918894b2ed504e2a3db56b33327b4','订单处理','/order/?','GET','49bcd49553fd6274c5ea8b6fcc84097e',302,'单条查询'),('9e70d298027fc5a101f40b1cd38d3d41','前端菜单显示','/frontendMenu','GET','ccb6659817cf193adc6bfb4dc17709ec',901,'前端左侧菜单显示'),('adc60ab150c543223d9d454b1e9d43a6','商品查询','/productTable','GET','4725d5b946c8789ebd2f758a93d416d8',201,'get'),('ccb6659817cf193adc6bfb4dc17709ec','系统管理','none',NULL,NULL,900,NULL),('fa0c9a0b71a1d654f4ad2db4aac8e903','新增商品','/productTable','POST','4725d5b946c8789ebd2f758a93d416d8',202,'post');

/*Table structure for table `sys_frontend_menu_table` */

DROP TABLE IF EXISTS `sys_frontend_menu_table`;

CREATE TABLE `sys_frontend_menu_table` (
  `frontend_menu_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `frontend_menu_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '前端菜单名称',
  `frontend_menu_url` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端菜单访问HTML地址',
  `pid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '父ID',
  `frontend_menu_sort` int NOT NULL COMMENT '排序',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`frontend_menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_frontend_menu_table` */

insert  into `sys_frontend_menu_table`(`frontend_menu_id`,`frontend_menu_name`,`frontend_menu_url`,`pid`,`frontend_menu_sort`,`description`) values ('0af385f5e237445d369a49cb35b20da4','系统管理',NULL,NULL,900,NULL),('105eb6c65a907eb589dbd3a9eeea013a','商品管理',NULL,NULL,100,'商品管理'),('2e5739a73173a22ed55eca37bb67aae6','购物分析',NULL,'b65d3ad4906ffc8be6932f9a1f51df1d',601,NULL),('3a8846521659085ed6ce0b0187d6d72a','商品属性','productattr.html','105eb6c65a907eb589dbd3a9eeea013a',103,NULL),('40ca076892e16ef6f788eb4d753df964','用户管理','user.html','0af385f5e237445d369a49cb35b20da4',901,NULL),('434e4bd50799bd145f4590d0f4705162','订单管理','',NULL,200,NULL),('6423ae277e4ec862ff23bd7b2c0922ce','商品图片上传','upphoto.html','b3c72fd354b3df32ceb1dd7db0c61086',402,NULL),('737addccb1ac6307d29802ad988b13d8','订单查询','order.html','434e4bd50799bd145f4590d0f4705162',201,'前端的订单查询页面'),('76cb7b2df76c79d159c561ecfbd54ef2','swagger api管理',NULL,'0af385f5e237445d369a49cb35b20da4',909,NULL),('7f448ccf628eb577e20f6413c5810300','客户分析',NULL,'b65d3ad4906ffc8be6932f9a1f51df1d',602,NULL),('80c23202f9d72076359518ef33854a4f','角色-菜单分配','rolemenu.html','0af385f5e237445d369a49cb35b20da4',906,'角色-菜单分配'),('94025c8731dc0dc403b66f9e8899cbc7','商品查询','product.html','105eb6c65a907eb589dbd3a9eeea013a',101,'前端的商品查询页面'),('a3baa2f584b4032be78d38bd49b891c8','未处理订单','notordertask.html','434e4bd50799bd145f4590d0f4705162',203,'未处理订单'),('ab9fdc8116dab6c8d110aa4387c97e08','角色-API分配','roleapi.html','0af385f5e237445d369a49cb35b20da4',907,'角色-API分配'),('b2dcfb940a72deb68b338b934128a1e4','商品图片查询','photo.html','b3c72fd354b3df32ceb1dd7db0c61086',401,NULL),('b3c72fd354b3df32ceb1dd7db0c61086','资源管理',NULL,NULL,400,NULL),('b65d3ad4906ffc8be6932f9a1f51df1d','运营管理',NULL,NULL,600,NULL),('b973d15c229778a6d98e742d096b2e41','角色管理','role.html','0af385f5e237445d369a49cb35b20da4',902,'角色管理页面'),('c7eb10d6513f40ac25f75e34a2679eab','商品类目','category.html','105eb6c65a907eb589dbd3a9eeea013a',102,'前端商品类目'),('c9fe45ef063af26c3e4c3208ffe1ff9f','供应商供货',NULL,'b65d3ad4906ffc8be6932f9a1f51df1d',603,NULL),('d2948d3e4a0914825f70aa39ce1c9d23','组织机构',NULL,'0af385f5e237445d369a49cb35b20da4',908,NULL),('e1fc2013f32ece3c772becb9489296e4','后端API管理','api.html','0af385f5e237445d369a49cb35b20da4',904,'后端API管理页面'),('e529e97e6ab0f95fc85cfbda5247eeaa','前端菜单管理','menu.html','0af385f5e237445d369a49cb35b20da4',903,NULL),('eb70ecd66ed156ca2f49e4d0e32b36f6','角色-用户分配','roleuser.html','0af385f5e237445d369a49cb35b20da4',905,'角色用户分配');

/*Table structure for table `sys_role_backend_api_table` */

DROP TABLE IF EXISTS `sys_role_backend_api_table`;

CREATE TABLE `sys_role_backend_api_table` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `backend_api_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'API管理表ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_backend_api_table` */

insert  into `sys_role_backend_api_table`(`id`,`role_id`,`backend_api_id`) values (10,'d04c2ebb1e32995f384ad49f6d4b421d','234dbd90c37363e2a6dea629adc7389e'),(11,'d04c2ebb1e32995f384ad49f6d4b421d','fa0c9a0b71a1d654f4ad2db4aac8e903'),(12,'d04c2ebb1e32995f384ad49f6d4b421d','4725d5b946c8789ebd2f758a93d416d8'),(13,'d04c2ebb1e32995f384ad49f6d4b421d','760ba9bf47fcda793203b1f3cd731083'),(14,'d04c2ebb1e32995f384ad49f6d4b421d','49bcd49553fd6274c5ea8b6fcc84097e'),(15,'d04c2ebb1e32995f384ad49f6d4b421d','adc60ab150c543223d9d454b1e9d43a6'),(16,'d04c2ebb1e32995f384ad49f6d4b421d','73b81575b6737e4d38e6716bc773c5bb'),(17,'d04c2ebb1e32995f384ad49f6d4b421d','8ba918894b2ed504e2a3db56b33327b4'),(18,'1','1'),(52,'2f412c59e5077e0cd53d21fac3eee402','49bcd49553fd6274c5ea8b6fcc84097e'),(53,'2f412c59e5077e0cd53d21fac3eee402','73b81575b6737e4d38e6716bc773c5bb'),(54,'2f412c59e5077e0cd53d21fac3eee402','adc60ab150c543223d9d454b1e9d43a6'),(55,'2f412c59e5077e0cd53d21fac3eee402','8ba918894b2ed504e2a3db56b33327b4');

/*Table structure for table `sys_role_frontend_menu_table` */

DROP TABLE IF EXISTS `sys_role_frontend_menu_table`;

CREATE TABLE `sys_role_frontend_menu_table` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `frontend_menu_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '前端菜单管理ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_frontend_menu_table` */

insert  into `sys_role_frontend_menu_table`(`id`,`role_id`,`frontend_menu_id`) values (52,'1','*'),(53,'1','b2dcfb940a72deb68b338b934128a1e4'),(54,'1','c9fe45ef063af26c3e4c3208ffe1ff9f'),(55,'1','105eb6c65a907eb589dbd3a9eeea013a'),(56,'1','434e4bd50799bd145f4590d0f4705162'),(57,'1','e529e97e6ab0f95fc85cfbda5247eeaa'),(58,'1','e1fc2013f32ece3c772becb9489296e4'),(59,'1','737addccb1ac6307d29802ad988b13d8'),(60,'1','6423ae277e4ec862ff23bd7b2c0922ce'),(61,'1','b65d3ad4906ffc8be6932f9a1f51df1d'),(62,'1','d2948d3e4a0914825f70aa39ce1c9d23'),(63,'1','b3c72fd354b3df32ceb1dd7db0c61086'),(64,'1','eb70ecd66ed156ca2f49e4d0e32b36f6'),(65,'1','94025c8731dc0dc403b66f9e8899cbc7'),(66,'1','b973d15c229778a6d98e742d096b2e41'),(67,'1','7f448ccf628eb577e20f6413c5810300'),(68,'1','40ca076892e16ef6f788eb4d753df964'),(69,'1','0af385f5e237445d369a49cb35b20da4'),(70,'1','ab9fdc8116dab6c8d110aa4387c97e08'),(71,'1','76cb7b2df76c79d159c561ecfbd54ef2'),(72,'1','2e5739a73173a22ed55eca37bb67aae6'),(73,'1','a3baa2f584b4032be78d38bd49b891c8'),(74,'1','c7eb10d6513f40ac25f75e34a2679eab'),(75,'1','3a8846521659085ed6ce0b0187d6d72a'),(120,'d04c2ebb1e32995f384ad49f6d4b421d','b3c72fd354b3df32ceb1dd7db0c61086'),(121,'d04c2ebb1e32995f384ad49f6d4b421d','6423ae277e4ec862ff23bd7b2c0922ce'),(122,'d04c2ebb1e32995f384ad49f6d4b421d','c7eb10d6513f40ac25f75e34a2679eab'),(123,'d04c2ebb1e32995f384ad49f6d4b421d','105eb6c65a907eb589dbd3a9eeea013a'),(124,'d04c2ebb1e32995f384ad49f6d4b421d','b65d3ad4906ffc8be6932f9a1f51df1d'),(125,'d04c2ebb1e32995f384ad49f6d4b421d','2e5739a73173a22ed55eca37bb67aae6'),(126,'d04c2ebb1e32995f384ad49f6d4b421d','434e4bd50799bd145f4590d0f4705162'),(127,'d04c2ebb1e32995f384ad49f6d4b421d','94025c8731dc0dc403b66f9e8899cbc7'),(128,'d04c2ebb1e32995f384ad49f6d4b421d','7f448ccf628eb577e20f6413c5810300'),(129,'d04c2ebb1e32995f384ad49f6d4b421d','3a8846521659085ed6ce0b0187d6d72a'),(130,'d04c2ebb1e32995f384ad49f6d4b421d','b2dcfb940a72deb68b338b934128a1e4'),(131,'d04c2ebb1e32995f384ad49f6d4b421d','737addccb1ac6307d29802ad988b13d8'),(132,'d04c2ebb1e32995f384ad49f6d4b421d','a3baa2f584b4032be78d38bd49b891c8'),(133,'d04c2ebb1e32995f384ad49f6d4b421d','c9fe45ef063af26c3e4c3208ffe1ff9f'),(173,'2f412c59e5077e0cd53d21fac3eee402','b65d3ad4906ffc8be6932f9a1f51df1d'),(174,'2f412c59e5077e0cd53d21fac3eee402','2e5739a73173a22ed55eca37bb67aae6'),(175,'2f412c59e5077e0cd53d21fac3eee402','105eb6c65a907eb589dbd3a9eeea013a'),(176,'2f412c59e5077e0cd53d21fac3eee402','94025c8731dc0dc403b66f9e8899cbc7'),(177,'2f412c59e5077e0cd53d21fac3eee402','7f448ccf628eb577e20f6413c5810300'),(178,'2f412c59e5077e0cd53d21fac3eee402','c9fe45ef063af26c3e4c3208ffe1ff9f'),(179,'2f412c59e5077e0cd53d21fac3eee402','737addccb1ac6307d29802ad988b13d8'),(180,'2f412c59e5077e0cd53d21fac3eee402','a3baa2f584b4032be78d38bd49b891c8'),(181,'2f412c59e5077e0cd53d21fac3eee402','434e4bd50799bd145f4590d0f4705162');

/*Table structure for table `sys_role_table` */

DROP TABLE IF EXISTS `sys_role_table`;

CREATE TABLE `sys_role_table` (
  `role_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `sys_role_table_pk` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_table` */

insert  into `sys_role_table`(`role_id`,`role_name`,`description`) values ('1','ROLE_ADMIN','超级管理员'),('2f412c59e5077e0cd53d21fac3eee402','ROLE_收银员','收银员'),('d04c2ebb1e32995f384ad49f6d4b421d','ROLE_店长','店长');

/*Table structure for table `sys_role_user_table` */

DROP TABLE IF EXISTS `sys_role_user_table`;

CREATE TABLE `sys_role_user_table` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_user_table` */

insert  into `sys_role_user_table`(`id`,`role_id`,`user_id`) values (40,'1','bcad19f214499feab47f15b18ae9bc88'),(43,'d04c2ebb1e32995f384ad49f6d4b421d','6268cbe21e573513a66799114d925e04'),(76,'2f412c59e5077e0cd53d21fac3eee402','d01c54801e8155223f3a6656056fa2dd'),(77,'2f412c59e5077e0cd53d21fac3eee402','86c887c04ec842d1a5ce7050f263355a'),(78,'2f412c59e5077e0cd53d21fac3eee402','0f09bb6fd9b516d25932fcd4c2d1fbfc'),(79,'2f412c59e5077e0cd53d21fac3eee402','b0b4c302687e1c29409ebb688298b667');

/*Table structure for table `sys_user_table` */

DROP TABLE IF EXISTS `sys_user_table`;

CREATE TABLE `sys_user_table` (
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `pass_word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码-BCR算法加密',
  `description` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `state` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user_table` */

insert  into `sys_user_table`(`user_id`,`user_name`,`pass_word`,`description`,`state`) values ('0f09bb6fd9b516d25932fcd4c2d1fbfc','刘伟','$2a$10$mKVSgJnapbUKoBYfIVJyT.19wG3SuSrn6ZYu20eeon0Mrpc/D1Oey',NULL,1),('13a0d86310b052bb1d7c57786316077a','白杨树','$2a$10$jalwt9mC7GWOkM5HjZroeOuD/1xhXcqvXgSYYX7ruCXBSeIX/ypW6',NULL,1),('1a9fa07a96f44f40a020b24c54b52428','程小东','$2a$10$TKeidhFBUt5oAnCkYkmQj.DpMULqZR3ITCqKep0J36kf50HEgXRZa',NULL,1),('1f540f553a4dd536e52aeca3d470dad7','郭强','$2a$10$Q7Xcmhe8N71niSFriYRREOKACg8nSA8cFDk1NUQTm2JStuasGllN.',NULL,1),('330708e6680c4e9dd0d772af7343f01e','谭红红','$2a$10$jVFVJ59rKW1VObOVWX7Wpedhlb.oubFIFWfqg9RWby5jE2AkPw3bS',NULL,1),('40529d21d3f4fb975043c63e43630253','韦博','$2a$10$Gwk0Oaz04AxZz1O9s7LSfuOw56H9zGX2HG1I3wqLtpEPh/fRbdR2y',NULL,1),('469c4d4d21d900d2446edaf5f646c663','郭德纲','$2a$10$y4d3fWr7ajYQ9qyAdGfW/OG8qInla9U7U4gL0/EDwRvCm2fAeJl6m',NULL,1),('5ae28c392a6779e41c7d0f8c9f7dfb09','任静','$2a$10$VCRbyDApB15zA5wLNTfkNeEvG7Yu3h3fHeG82Cgz6JpaSXeXx/fHe',NULL,1),('6268cbe21e573513a66799114d925e04','李兰','$2a$10$uAU6hwGYTdynwnjOpQFfYO.a17DWhqkaKU52fdw9IKdYY7Pj/QOuy',NULL,1),('86c887c04ec842d1a5ce7050f263355a','含','$2a$10$Omd.iEgCyiHbc8pxPMF.F./FLmRuvf.9tLjjHf8f/mXAzWVGJjToG','ceshi',1),('b0b4c302687e1c29409ebb688298b667','李四','$2a$10$mjMbuWPgl/ZkBkfv.uHTk.6k1LTbpPvFoKHivz5I16mEnRbq0REcu',NULL,1),('b3c9e9218fdf0347cc358755c365f2fa','郭明','$2a$10$UdhLqkJ.uCD3e/3Z13mV3eEkIrbxpG3oXNyBLm4y8Kwxs8NnXcOly',NULL,1),('bcad19f214499feab47f15b18ae9bc88','admin','$2a$10$1H81ddXs9x/KqYC3IA.kBO7hFac5KXHz1Bgwt49GZbwvjXkXbLFTq','超级管理员',1),('c2ea699c481735cd2288dcedbc558d54','魏艳梅','$2a$10$h5RdNWDVHmwdRV4X/HYR0eOXT9ISRtDXf8RA5/y3nmczAGCZI/iya',NULL,1),('c915222fff04f4a3e29afff8d62a56f2','胡柳杨','$2a$10$VRtWxeuvWP8ILmGWKoDPv.5AACxhznGKV.pspWYVqLrVYHdWp3PAC',NULL,1),('c9b52031507db4e87e128747afb686bc','伊能静','$2a$10$Z./P3eWTSs9klr9cmHwC9uui/BFtfhF5pzwUrKP8Jyi0TisqFL5S2',NULL,1),('d01c54801e8155223f3a6656056fa2dd','张三','$2a$10$4ed508knTPCdkBp5TfiZROge2WWxcYTTCV.LHo3/jI6tbZPK5wwna',NULL,1),('da52a0c77af941b43fb54074313ebd9a','郭敬明','$2a$10$9hWszcWfimQNiwEiet.dCueLMkXxiUAfX35KBLcaNUdwZu4ZvwpZe',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
