# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: info
# ------------------------------------------------------
# Server version 5.5.38

#
# Source for table tb_class
#

DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(8) NOT NULL DEFAULT '' COMMENT '班级名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_class
#

LOCK TABLES `tb_class` WRITE;
/*!40000 ALTER TABLE `tb_class` DISABLE KEYS */;
INSERT INTO `tb_class` VALUES (1,'高一（1）班');
INSERT INTO `tb_class` VALUES (2,'高一（3）班');
INSERT INTO `tb_class` VALUES (3,'高一（2）班');
INSERT INTO `tb_class` VALUES (5,'15软件1班');
/*!40000 ALTER TABLE `tb_class` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_cookie
#

DROP TABLE IF EXISTS `tb_cookie`;
CREATE TABLE `tb_cookie` (
  `user` int(11) NOT NULL DEFAULT '0',
  `cookie` varchar(32) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_cookie
#

LOCK TABLES `tb_cookie` WRITE;
/*!40000 ALTER TABLE `tb_cookie` DISABLE KEYS */;
INSERT INTO `tb_cookie` VALUES (123,'D917C50910E8B49F6BF9242D5463A96C',1231384705016);
INSERT INTO `tb_cookie` VALUES (321,'8690DE6DC634C0AC82FC75E28A65B657',1231381355001);
INSERT INTO `tb_cookie` VALUES (123456,'71F9BFF0A11404CA03C5B34208BCDA4F',1231384798547);
INSERT INTO `tb_cookie` VALUES (1143910315,'E887FF1B91BE2C378C91B899C90C0E63',1482485161225);
/*!40000 ALTER TABLE `tb_cookie` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_course
#

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(8) NOT NULL DEFAULT '0' COMMENT '课程号',
  `cname` varchar(8) NOT NULL DEFAULT '' COMMENT '课程名称',
  `tno` int(8) NOT NULL DEFAULT '0' COMMENT '任课教师',
  `tclass` varchar(255) NOT NULL DEFAULT '' COMMENT '任课班级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_course
#

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES (1,1,'语文',432,'3');
INSERT INTO `tb_course` VALUES (2,9,'地理',422,'1');
INSERT INTO `tb_course` VALUES (3,2,'数学',111,'1');
INSERT INTO `tb_course` VALUES (4,3,'英语',455,'1');
INSERT INTO `tb_course` VALUES (5,4,'物理',455,'1');
INSERT INTO `tb_course` VALUES (6,5,'化学',455,'1');
INSERT INTO `tb_course` VALUES (7,6,'生物',23,'1');
INSERT INTO `tb_course` VALUES (8,7,'政治',522,'1');
INSERT INTO `tb_course` VALUES (9,8,'历史',455,'1');
INSERT INTO `tb_course` VALUES (10,1,'语文',422,'2');
INSERT INTO `tb_course` VALUES (11,1,'语文',455,'1');
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_exam
#

DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试id',
  `ename` varchar(255) NOT NULL DEFAULT '' COMMENT '考试名称',
  `etime` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='考试';

#
# Dumping data for table tb_exam
#

LOCK TABLES `tb_exam` WRITE;
/*!40000 ALTER TABLE `tb_exam` DISABLE KEYS */;
INSERT INTO `tb_exam` VALUES (1,'周测1','2015-01-01');
INSERT INTO `tb_exam` VALUES (2,'周测2','2015-01-08');
INSERT INTO `tb_exam` VALUES (3,'月考1','2015-02-01');
/*!40000 ALTER TABLE `tb_exam` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_score
#

DROP TABLE IF EXISTS `tb_score`;
CREATE TABLE `tb_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(11) NOT NULL DEFAULT '0' COMMENT '学号',
  `time` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  `cno` int(5) NOT NULL DEFAULT '0' COMMENT '课程号',
  `score` int(8) NOT NULL DEFAULT '0' COMMENT '成绩',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_score
#

LOCK TABLES `tb_score` WRITE;
/*!40000 ALTER TABLE `tb_score` DISABLE KEYS */;
INSERT INTO `tb_score` VALUES (1,600000001,'2015-01-01',1,135);
INSERT INTO `tb_score` VALUES (2,600000001,'2015-01-01',2,89);
INSERT INTO `tb_score` VALUES (3,600000001,'2015-01-01',3,60);
INSERT INTO `tb_score` VALUES (4,600000002,'2015-01-01',1,111);
INSERT INTO `tb_score` VALUES (5,600000002,'2015-01-01',5,50);
INSERT INTO `tb_score` VALUES (6,600000010,'2015-01-01',1,122);
INSERT INTO `tb_score` VALUES (7,600000008,'2015-01-01',2,45);
INSERT INTO `tb_score` VALUES (8,600000009,'2015-01-01',1,82);
INSERT INTO `tb_score` VALUES (9,600000003,'2015-01-01',1,62);
INSERT INTO `tb_score` VALUES (10,600000004,'2015-01-01',1,88);
/*!40000 ALTER TABLE `tb_score` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_student
#

DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(11) NOT NULL DEFAULT '0' COMMENT '学号',
  `sname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `sclass` int(11) NOT NULL DEFAULT '0' COMMENT '班级',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `studyday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入学日期',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_student
#

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student` VALUES (1,600000001,'小明','男',1,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (2,600000002,'小丽','女',1,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (3,600000003,'小芳','女',1,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (4,600000004,'小李','男',1,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (5,600000005,'小东','男',2,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (6,600000006,'小桃子','女',2,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (7,600000007,'小米','女',3,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (8,600000008,'小树','男',2,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (9,600000009,'小花','女',1,'1996-01-01','2015-01-01',NULL,NULL);
INSERT INTO `tb_student` VALUES (10,600000010,'小白','男',1,'1996-01-01','2015-01-01',NULL,NULL);
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_teacher
#

DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tno` int(11) DEFAULT '0' COMMENT '工号',
  `tname` varchar(8) DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT 'birthday',
  `workday` date DEFAULT '2016-01-01' COMMENT '入职日期',
  `pface` varchar(8) DEFAULT '' COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_teacher
#

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (1,600000,'十十十','女','1980-01-05','2000-01-06','团员','广东');
INSERT INTO `tb_teacher` VALUES (2,422,'房九','男','1980-01-01','2000-01-01','','');
INSERT INTO `tb_teacher` VALUES (3,522,'唐八','女','1980-01-01','2000-01-01','','');
INSERT INTO `tb_teacher` VALUES (4,111,'陶六','男','1980-01-01','2000-01-01','','');
INSERT INTO `tb_teacher` VALUES (5,221,'王五','男','1980-01-01','2000-01-01','','');
INSERT INTO `tb_teacher` VALUES (6,23,'李四','男','1980-01-01','2000-01-01','','');
INSERT INTO `tb_teacher` VALUES (7,455,'张三','男','1980-01-01','2000-01-01','','');
INSERT INTO `tb_teacher` VALUES (9,6657,NULL,'','2016-01-01','2016-01-01',NULL,NULL);
INSERT INTO `tb_teacher` VALUES (10,6565898,'','','2016-01-01','2016-01-01','',NULL);
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_user
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user` int(8) NOT NULL DEFAULT '0' COMMENT '账号',
  `password` varchar(8) NOT NULL DEFAULT '' COMMENT '密码',
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '用户身份'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_user
#

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (123456,'123456',0);
INSERT INTO `tb_user` VALUES (123,'123456',1);
INSERT INTO `tb_user` VALUES (321,'12345',2);
INSERT INTO `tb_user` VALUES (0,'123465',1);
INSERT INTO `tb_user` VALUES (56868,'56868',1);
INSERT INTO `tb_user` VALUES (611111,'611111',1);
INSERT INTO `tb_user` VALUES (56868,'56868',1);
INSERT INTO `tb_user` VALUES (1314,'1314',1);
INSERT INTO `tb_user` VALUES (1314,'1314',1);
INSERT INTO `tb_user` VALUES (60062430,'60062430',1);
INSERT INTO `tb_user` VALUES (60062430,'60062430',1);
INSERT INTO `tb_user` VALUES (6006243,'6006243',1);
INSERT INTO `tb_user` VALUES (600,'600',1);
INSERT INTO `tb_user` VALUES (3454365,'3454365',1);
INSERT INTO `tb_user` VALUES (6657,'6657',1);
INSERT INTO `tb_user` VALUES (6565898,'6565898',1);
INSERT INTO `tb_user` VALUES (6565898,'6565898',1);
INSERT INTO `tb_user` VALUES (6666,'6666',1);
INSERT INTO `tb_user` VALUES (6666,'6666',1);
INSERT INTO `tb_user` VALUES (6565898,'6565898',1);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
