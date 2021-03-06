﻿# Host: localhost  (Version 5.5.47)
# Date: 2016-12-25 11:54:42
# Generator: MySQL-Front 5.4  (Build 4.71) - http://www.mysqlfront.de/

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tb_class"
#

CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(8) NOT NULL DEFAULT '' COMMENT '班级名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "tb_class"
#

INSERT INTO `tb_class` VALUES (1,'高一（1）班'),(2,'高一（3）班'),(3,'高一（2）班');

#
# Structure for table "tb_cookie"
#

CREATE TABLE `tb_cookie` (
  `user` int(11) NOT NULL DEFAULT '0',
  `cookie` varchar(32) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cookie"
#

INSERT INTO `tb_cookie` VALUES (1143910315,'E887FF1B91BE2C378C91B899C90C0E63',1482485161225);

#
# Structure for table "tb_course"
#

CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(8) NOT NULL DEFAULT '0' COMMENT '课程号',
  `cname` varchar(8) NOT NULL DEFAULT '' COMMENT '课程名称',
  `tno` int(8) NOT NULL DEFAULT '0' COMMENT '任课教师',
  `tclass` varchar(255) NOT NULL DEFAULT '' COMMENT '任课班级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "tb_course"
#

INSERT INTO `tb_course` VALUES (1,1,'语文',432,'3'),(2,9,'地理',422,'1'),(3,2,'数学',111,'1'),(4,3,'英语',455,'1'),(5,4,'物理',455,'1'),(6,5,'化学',455,'1'),(7,6,'生物',23,'1'),(8,7,'政治',522,'1'),(9,8,'历史',455,'1'),(10,1,'语文',422,'2'),(11,1,'语文',455,'1');

#
# Structure for table "tb_exam"
#

CREATE TABLE `tb_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试id',
  `ename` varchar(255) NOT NULL DEFAULT '' COMMENT '考试名称',
  `etime` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考试';

#
# Data for table "tb_exam"
#

INSERT INTO `tb_exam` VALUES (1,'周测1','2015-01-01'),(2,'周测2','2015-01-08'),(3,'月考1','2015-02-01');

#
# Structure for table "tb_score"
#

CREATE TABLE `tb_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(11) NOT NULL DEFAULT '0' COMMENT '学号',
  `time` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  `cno` int(5) NOT NULL DEFAULT '0' COMMENT '课程号',
  `score` int(8) NOT NULL DEFAULT '0' COMMENT '成绩',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "tb_score"
#

INSERT INTO `tb_score` VALUES (1,600000001,'2015-01-01',1,135),(2,600000001,'2015-01-01',2,89),(3,600000001,'2015-01-01',3,60),(4,600000002,'2015-01-01',1,111),(5,600000002,'2015-01-01',5,50),(6,600000010,'2015-01-01',1,122),(7,600000008,'2015-01-01',2,45),(8,600000009,'2015-01-01',1,82),(9,600000003,'2015-01-01',1,62),(10,600000004,'2015-01-01',1,88);

#
# Structure for table "tb_student"
#

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
# Data for table "tb_student"
#

INSERT INTO `tb_student` VALUES (1,600000001,'小明','男',1,'1996-01-01','2015-01-01',NULL,NULL),(2,600000002,'小丽','女',1,'1996-01-01','2015-01-01',NULL,NULL),(3,600000003,'小芳','女',1,'1996-01-01','2015-01-01',NULL,NULL),(4,600000004,'小李','男',1,'1996-01-01','2015-01-01',NULL,NULL),(5,600000005,'小东','男',2,'1996-01-01','2015-01-01',NULL,NULL),(6,600000006,'小桃子','女',2,'1996-01-01','2015-01-01',NULL,NULL),(7,600000007,'小米','女',3,'1996-01-01','2015-01-01',NULL,NULL),(8,600000008,'小树','男',2,'1996-01-01','2015-01-01',NULL,NULL),(9,600000009,'小花','女',1,'1996-01-01','2015-01-01',NULL,NULL),(10,600000010,'小白','男',1,'1996-01-01','2015-01-01',NULL,NULL);

#
# Structure for table "tb_teacher"
#

CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tno` int(11) NOT NULL DEFAULT '0' COMMENT '工号',
  `tname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT 'birthday',
  `workday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入职日期',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#

INSERT INTO `tb_teacher` VALUES (1,432,'十十','女','1980-01-01','2000-01-01',NULL,NULL),(2,422,'房九','男','1980-01-01','2000-01-01',NULL,NULL),(3,522,'唐八','女','1980-01-01','2000-01-01',NULL,NULL),(4,111,'陶六','男','1980-01-01','2000-01-01',NULL,NULL),(5,221,'王五','男','1980-01-01','2000-01-01',NULL,NULL),(6,23,'李四','男','1980-01-01','2000-01-01',NULL,NULL),(7,455,'张三','男','1980-01-01','2000-01-01',NULL,NULL);

#
# Structure for table "tb_user"
#

CREATE TABLE `tb_user` (
  `user` int(8) NOT NULL DEFAULT '0' COMMENT '账号',
  `password` varchar(8) NOT NULL DEFAULT '' COMMENT '密码',
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '用户身份'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

INSERT INTO `tb_user` VALUES (0,'123456',0),(0,'123456',1),(0,'123456',2),(0,'123465',1);
