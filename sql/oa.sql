/*
SQLyog Ultimate v9.62 
MySQL - 5.5.49 : Database - ssmoa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmoa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmoa`;

/*Table structure for table `t_class` */

DROP TABLE IF EXISTS `t_class`;

CREATE TABLE `t_class` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `major_id` int(6) DEFAULT NULL,
  `class_name` varchar(30) DEFAULT NULL,
  `class_date` date DEFAULT NULL,
  `class_time` varchar(30) DEFAULT NULL,
  `class_address` varchar(30) DEFAULT NULL,
  `class_delete` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_major_id_01` (`major_id`),
  CONSTRAINT `FK_major_id_01` FOREIGN KEY (`major_id`) REFERENCES `t_major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_class` */

insert  into `t_class`(`id`,`major_id`,`class_name`,`class_date`,`class_time`,`class_address`,`class_delete`) values (1,1,'物联网01班','2019-08-08','50','19楼1教室',0),(2,2,'商务外语1班','2019-08-07','60','19楼2教室',0),(6,2,'软件工程1班','2020-12-03','55','3楼8室',0),(7,2,'软件工程3班','2020-12-05','90','3楼5室',0),(8,2,'软件工程2班','2020-12-04','85','3楼7室',0),(9,1,'商务外语2班','2020-12-05','70','4楼3室',0),(10,1,'物联网02班','2020-12-05','60','1楼3室',0);

/*Table structure for table `t_depart` */

DROP TABLE IF EXISTS `t_depart`;

CREATE TABLE `t_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `del` int(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `t_depart` */

insert  into `t_depart`(`id`,`name`,`createtime`,`del`) values (1,'教学部','2018-06-27',0),(2,'就业部','2018-06-27',0),(3,'农业部','2020-12-01',0),(4,'人事部','2018-12-19',0),(5,'财政部','2013-12-17',0),(6,'开发部','2020-09-23',0),(7,'纪检部','2020-08-25',0),(8,'党群部','2020-04-23',0),(9,'追求部','2012-05-03',0),(10,'共好部','2012-02-28',0),(11,'商务发展部','2003-02-28',0),(12,'研发部','1997-02-11',0),(13,'销售推广部','1997-05-22',0),(14,'胜利部','1997-05-23',0),(15,'互联网联合运营管理总局','1997-05-29',0),(16,'仓储物流部','1997-05-27',0),(17,'船务部','1997-06-01',0),(18,'市场部','1997-06-02',0),(19,'电商部','1997-06-04',0),(20,'专案部','1997-06-05',0),(21,'客服部','1997-06-09',0),(22,'品牌部','1997-06-10',0),(23,'销售部','1997-06-11',0),(24,'文宣部','1997-06-12',0),(25,'业务部','1997-06-13',0),(26,'总务部','1997-06-14',0),(27,'企业策划部','1997-06-15',0),(28,'健身部','1997-06-16',0),(29,'信息部','1997-06-17',0),(30,'行政部','1997-06-18',0),(31,'品管部','1997-06-19',0),(32,'商品部','1997-06-20',0),(33,'设计部','1997-06-21',0),(34,'国际市场部','1997-06-22',0),(35,'组织部','1997-06-23',0),(36,'保险部','1997-06-24',0),(37,'文体部','1997-06-25',0),(38,'内务部','1997-06-26',0),(39,'编辑部','1997-06-27',0),(40,'程序部','1997-06-28',0),(41,'进口部','1997-06-29',1),(42,'售后部','2017-06-08',0),(43,'广电总局','2020-11-23',0),(44,'行政部','2024-11-07',0),(45,'党委办公室','2024-11-22',0),(46,'质量管理部','2024-11-23',0),(47,'信息网络中心部','2024-11-24',0),(48,'门诊部','2025-12-25',0),(49,'住院部','2025-12-26',0),(50,'住院处','2025-12-28',0),(51,'隔离室','2025-12-29',0),(52,'矫形外科','2025-12-29',0),(53,'创新创意部','2020-12-16',0);

/*Table structure for table `t_emp` */

DROP TABLE IF EXISTS `t_emp`;

CREATE TABLE `t_emp` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `did` int(11) DEFAULT NULL COMMENT '外键  部门ID',
  `flag` int(11) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `del` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DID` (`did`),
  CONSTRAINT `FK_DID` FOREIGN KEY (`did`) REFERENCES `t_depart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_emp` */

insert  into `t_emp`(`id`,`no`,`pass`,`name`,`did`,`flag`,`sex`,`email`,`qq`,`phone`,`createdate`,`photo`,`del`) values (1,'qf000001',NULL,'张三',1,1,'男','zhansgan@163.com','222321','110','2018-03-03','9e3e1612ed004b7ca5c561407828db5a_userface4.jpg',0),(2,'admin','111','李四',2,1,'男','zhansgan@163.com','121212','1212','2020-11-30','9e3e1612ed004b7ca5c561407828db5a_userface4.jpg',0),(3,'root','111','王五',4,1,'男','zhansgan@163.com','121212','1212','2020-12-01','9e3e1612ed004b7ca5c561407828db5a_userface4.jpg',0),(4,'mww','111','莫文蔚',4,1,'女','mww@163.com','1009786543','13423567890','2020-12-02','9e3e1612ed004b7ca5c561407828db5a_userface4.jpg',0),(5,'cyx','123','陈奕迅',5,1,'男','cyx@163.com','1445678903','13423567890','2020-12-03','b445a25cd603424eb7d278faa2a2c1ff_header.png',0),(6,'zjl','123','周杰伦',8,1,'男','zjljlkjsadlfkj@qq.com','1998765432','13423567890','2020-12-03','0d37d68514e542758b35f8feb5c3665c_header.jpg',0),(7,'ty','123','唐嫣',4,1,'女','tyyjjjllj@qq.com','1005794683','13423578943','2020-12-11','6273aebc00c44a4b90c23f85aeb9352e_mn3.jpg',0);

/*Table structure for table `t_loginlog` */

DROP TABLE IF EXISTS `t_loginlog`;

CREATE TABLE `t_loginlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

/*Data for the table `t_loginlog` */

insert  into `t_loginlog`(`id`,`ip`,`no`,`createtime`,`location`) values (1,'117.159.15.221','admin','2018-07-12 14:04:49','河南省信阳市'),(2,'117.159.15.221','admin','2018-07-12 16:02:08','河南省信阳市'),(3,'117.159.15.221','admin','2018-07-12 16:05:00','河南省信阳市'),(4,'117.159.15.221','admin','2018-07-12 16:13:30','河南省信阳市'),(5,'117.159.15.221','admin','2018-07-12 16:14:36','河南省信阳市'),(6,'117.159.15.221','admin','2018-07-12 16:23:53','河南省信阳市'),(7,'117.159.15.221','admin','2018-07-12 16:25:51','河南省信阳市'),(8,'117.159.15.221','admin','2018-07-12 16:27:00','河南省信阳市'),(9,'117.159.15.221','admin','2018-07-12 16:53:44','河南省信阳市'),(10,'117.159.15.221','admin','2018-07-12 17:01:38','河南省信阳市'),(11,'117.159.15.221','admin','2018-07-12 17:04:31','河南省信阳市'),(55,'117.159.15.221','admin','2018-07-14 16:03:21','河南省信阳市'),(56,'120.197.197.12','admin','2020-12-01 16:00:42','广东省广州市'),(57,'120.197.197.12','admin','2020-12-01 16:01:42','广东省广州市'),(58,'120.197.197.12','admin','2020-12-01 16:03:44','广东省广州市'),(59,'120.197.197.12','admin','2020-12-01 16:35:16','广东省韶关市'),(60,'120.197.197.12','admin','2020-12-01 16:42:14','广东省韶关市'),(61,'120.197.197.12','admin','2020-12-01 16:43:04','广东省韶关市'),(62,'120.197.197.12','admin','2020-12-01 16:52:11','广东省韶关市'),(63,'120.197.197.12','root','2020-12-01 17:02:56','广东省茂名市1'),(64,'120.197.197.12','root','2020-12-01 17:03:12','广东省茂名市'),(65,'120.197.197.12','admin','2020-12-02 08:16:08',''),(66,'120.197.197.12','root','2020-12-02 09:18:43',''),(67,'120.197.197.12','root','2020-12-02 09:53:27',''),(68,'120.197.197.12','root','2020-12-02 10:02:35',''),(69,'120.197.197.12','mww','2020-12-02 10:26:11',''),(70,'120.197.197.12','mww','2020-12-02 10:38:40',''),(71,'120.197.197.12','mww','2020-12-02 10:57:49','广东省广州市'),(72,'120.197.197.12','mww','2020-12-02 14:54:09',''),(73,'120.197.197.12','admin','2020-12-03 08:07:12',''),(74,'120.197.197.12','mww','2020-12-03 08:27:09',''),(75,'120.197.197.12','mww','2020-12-03 08:47:12',''),(76,'120.197.197.12','mww','2020-12-03 09:42:06',''),(77,'120.197.197.12','mww','2020-12-03 10:27:10',''),(78,'120.197.197.12','mww','2020-12-03 12:30:29',''),(79,'120.197.197.12','mww','2020-12-03 13:19:33',''),(80,'120.197.197.12','ty','2020-12-03 13:21:20',''),(81,'120.197.197.12','mww','2020-12-03 15:09:45',''),(82,'120.197.197.12','mww','2020-12-03 15:15:18',''),(83,'120.197.197.12','mww','2020-12-03 15:16:45',''),(84,'120.197.197.12','mww','2020-12-03 15:49:33',''),(85,'120.197.197.45','mww','2020-12-03 16:38:18','广东省广州市'),(86,'120.197.197.45','mww','2020-12-03 16:52:15',''),(87,'120.197.197.45','mww','2020-12-03 21:33:08',''),(88,'120.197.197.45','mww','2020-12-03 21:47:57',''),(89,'120.197.197.45','mww','2020-12-03 21:49:49',''),(90,'120.197.197.45','mww','2020-12-03 21:56:53',''),(91,'120.197.197.45','mww','2020-12-03 22:14:37',''),(92,'120.197.197.45','mww','2020-12-03 22:24:32',''),(93,'120.197.197.45','mww','2020-12-04 08:14:55',''),(94,'120.197.197.45','mww','2020-12-04 09:36:33',''),(95,'120.197.197.45','mww','2020-12-04 09:59:29',''),(96,'120.197.197.45','mww','2020-12-04 11:27:36',''),(97,'120.197.197.3','mww','2020-12-04 14:49:29',''),(98,'120.197.197.3','mww','2020-12-04 14:59:47',''),(99,'120.197.197.3','mww','2020-12-04 15:07:28',''),(100,'120.197.197.3','mww','2020-12-04 16:13:29',''),(101,'120.197.197.3','mww','2020-12-04 16:18:04',''),(102,'120.197.197.3','mww','2020-12-04 16:31:32',''),(103,'117.136.12.149','mww','2020-12-04 20:40:46',''),(104,'117.136.12.149','mww','2020-12-05 12:53:03',''),(105,'117.136.12.149','mww','2020-12-05 12:53:43',''),(106,'117.136.12.149','mww','2020-12-05 14:27:15',''),(107,'117.136.12.149','mww','2020-12-05 16:09:09',''),(108,'117.136.12.149','mww','2020-12-05 17:18:02',''),(109,'117.136.12.149','mww','2020-12-05 17:21:06',''),(110,'117.136.12.149','mww','2020-12-05 17:23:48',''),(111,'117.136.12.149','mww','2020-12-05 17:25:16',''),(112,'117.136.12.149','mww','2020-12-05 17:36:34',''),(113,'117.136.12.149','mww','2020-12-05 18:45:39',''),(114,'117.136.12.149','mww','2020-12-05 18:48:56',''),(115,'117.136.12.149','mww','2020-12-05 18:50:46',''),(116,'117.136.12.149','mww','2020-12-05 18:56:33',''),(117,'117.136.12.149','mww','2020-12-05 19:47:58',''),(118,'223.104.1.243','mww','2020-12-08 16:44:28','');

/*Table structure for table `t_major` */

DROP TABLE IF EXISTS `t_major`;

CREATE TABLE `t_major` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(20) DEFAULT NULL,
  `major_time` varchar(20) DEFAULT NULL,
  `major_date` date DEFAULT NULL,
  `major_type` int(6) DEFAULT NULL,
  `major_delete` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_major_id` (`major_type`),
  CONSTRAINT `FK_major_id` FOREIGN KEY (`major_type`) REFERENCES `t_majortype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_major` */

insert  into `t_major`(`id`,`major_name`,`major_time`,`major_date`,`major_type`,`major_delete`) values (1,'物联网','40','2019-08-02',1,0),(2,'商务外语','200','2019-08-08',2,0),(3,'计算机应用技术','35','2020-12-06',3,0),(4,'通信工程','65','2020-12-10',1,0),(5,'电子信息工程','50','2020-12-11',2,0),(6,'计算机系统维护','70','2020-12-24',3,0);

/*Table structure for table `t_majortype` */

DROP TABLE IF EXISTS `t_majortype`;

CREATE TABLE `t_majortype` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `majortype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_majortype` */

insert  into `t_majortype`(`id`,`majortype`) values (1,'精品'),(2,'业余'),(3,'普通');

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `cardno` varchar(20) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL COMMENT '外键 和班级主键有关系',
  `flag` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `del` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_student_class_id` (`class_id`),
  CONSTRAINT `FK_student_class_id` FOREIGN KEY (`class_id`) REFERENCES `t_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`id`,`no`,`name`,`sex`,`birthday`,`cardno`,`school`,`education`,`class_id`,`flag`,`email`,`qq`,`phone`,`createdate`,`photo`,`del`) values (61,'17115073052','古力娜扎','女','2020-12-12','440982199603156666','广州大学','本科',2,1,'wlf666666@qq.com','1009727380','13423578943','2018-03-03','photos\\e49c64f2-0df8-464c-93ad-7ab95fb7867e_cw1.jpg',0),(62,'wf','王菲','女','2020-12-01','440982199702182098','韶关大学','本科',1,1,'wwwfff@163.com','1009727384','13423578946','2020-12-03','userface4.jpg',0),(63,'wf','王菲','女','2020-12-01','440982199702182098','韶关大学','本科',1,1,'wwwfff@163.com','1009727384','13423578946','2020-12-03','userface4.jpg',0),(64,'wf','王菲','女','2020-12-01','440982199702182098','韶关大学','本科',1,1,'wwwfff@163.com','1009727384','13423578946','2020-12-03','userface4.jpg',0),(65,'lm','黎明','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(66,'lm','黎明','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(67,'lm','黎明','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(68,'lm','白百合','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(69,'lm','白百合','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(70,'lm','陈美琪','女','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(71,'lm','陈晓旭','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(72,'lm','郭碧婷','女','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(73,'lm','黄圣依','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(74,'lm','黄圣依','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(75,'lm','黄圣依','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(76,'lm','金莎','女','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(77,'lm','黎明','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(78,'lm','刘涛','男','2020-12-11','440982199702182098','广东工业大学','本科',1,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(79,'lm','刘雯','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(80,'lm','金莎','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(81,'lm','刘雨欣','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(82,'lm','金莎','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(83,'lm','刘雨欣','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(84,'lm','娄艺潇','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(85,'lm','娄艺潇','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(86,'lm','张敏','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(87,'lm','金莎','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(88,'lm','李菲儿','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','13423578946','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(89,'lm','林允儿','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(90,'lm','梁静茹','女','2020-12-11','440982199702182098','暨南大学','本科',2,1,'lm666666@qq.com','136687462','2323','2020-12-03','userface4.jpguserface4.jpguserface4.jpguserface4.jpg',0),(91,'17115073053','欧阳娜娜','女','2020-12-30','440982199603159999','广州大学','硕士',1,1,'wlf666666@qq.com','1009727380','13423578943',NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
