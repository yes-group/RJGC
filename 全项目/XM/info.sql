# Host: localhost  (Version: 5.5.47)
# Date: 2016-12-27 20:33:27
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tb_class"
#

DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(8) NOT NULL DEFAULT '' COMMENT '班级名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "tb_class"
#

INSERT INTO `tb_class` VALUES (11,'高一（1）班'),(12,'高一（2）班'),(13,'高一（3）班'),(14,'高一（4）班');

#
# Structure for table "tb_cookie"
#

DROP TABLE IF EXISTS `tb_cookie`;
CREATE TABLE `tb_cookie` (
  `user` int(11) NOT NULL DEFAULT '0',
  `cookie` varchar(32) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_cookie"
#

INSERT INTO `tb_cookie` VALUES (10000,'856821919860DB7B83EF94BE7CDB9C3F',1482805434960),(20000,'C288AF25D2A6C5EEA0F8AE1B46895917',1482820140875),(20002,'4D48646980C048BA54EAE6BE9F7131DF',1482820262238),(20003,'C33035D94C9604773E4267D361EE4778',1482823089225),(20005,'78C5FEBFAB68775CA57936DEFCC8F1EE',1482832969447);

#
# Structure for table "tb_course"
#

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '匿名字段',
  `cno` int(8) NOT NULL DEFAULT '0' COMMENT '课程号',
  `cname` varchar(8) NOT NULL DEFAULT '' COMMENT '课程名称',
  `tno` int(8) NOT NULL DEFAULT '0' COMMENT '任课教师',
  `tclass` int(11) DEFAULT '0' COMMENT '任课班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_course"
#


#
# Structure for table "tb_exam"
#

DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试id',
  `ename` varchar(255) NOT NULL DEFAULT '' COMMENT '考试名称',
  `etime` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试';

#
# Data for table "tb_exam"
#


#
# Structure for table "tb_score"
#

DROP TABLE IF EXISTS `tb_score`;
CREATE TABLE `tb_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '匿名字段',
  `sno` int(11) NOT NULL DEFAULT '0' COMMENT '学号',
  `time` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  `cno` int(5) NOT NULL DEFAULT '0' COMMENT '课程号',
  `score` int(8) NOT NULL DEFAULT '0' COMMENT '成绩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_score"
#


#
# Structure for table "tb_student"
#

DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `sno` int(11) NOT NULL DEFAULT '0' COMMENT '学号',
  `sname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '女' COMMENT '性别',
  `sclass` int(11) NOT NULL DEFAULT '-1' COMMENT '班级',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `studyday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入学日期',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_student"
#

INSERT INTO `tb_student` VALUES (20000,'过儿','男',11,'1993-02-03','2015-09-12','少先队员','广东汕尾'),(20001,'果儿','女',11,'1996-02-29','2015-09-12','团员','广东汕尾'),(20002,'锅儿','男',11,'1994-02-28','2015-09-12','党员','广东汕尾'),(20003,'国儿','女',11,'2005-05-25','2015-09-12','无党人士','广东汕尾'),(20004,'果饵','女',11,'1994-04-30','2015-09-12','无党人士','广东汕尾'),(20005,'聒耳','男',11,'1994-05-31','2015-09-12','无党人士','广东汕尾'),(20006,'国二','男',11,'1994-06-30','2015-09-12','无党人士','广东汕尾');

#
# Structure for table "tb_teacher"
#

DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `tno` int(11) NOT NULL DEFAULT '0' COMMENT '工号',
  `tname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '女' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `workday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入职日期',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#

INSERT INTO `tb_teacher` VALUES (10000,'凤二','男','1987-05-06','2003-09-12','党员','广州白云区'),(10001,'缝儿','女','1986-08-21','2010-09-12','团员','广州白云区'),(10002,'枫儿','男','1980-06-30','2004-09-12','少先队员','广州白云区'),(10003,'凤儿','女','1990-05-06','2005-09-12','无党人士','广州白云区'),(10004,'封二','男','1959-01-31','1995-09-12','无党人士','广州白云区'),(10005,'风儿','女','1965-02-28','1995-09-12','无党人士','广州白云区');

#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user` int(8) NOT NULL DEFAULT '0' COMMENT '账号',
  `password` varchar(20) NOT NULL DEFAULT '' COMMENT '密码',
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '用户身份',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

INSERT INTO `tb_user` VALUES (10000,'123456',1),(10001,'10001',1),(10002,'10002',1),(10003,'10003',1),(10004,'10004',1),(10005,'10005',1),(20000,':;\"\'<,>.?/|}]{[+=_-',2),(20001,'~`! @#$%^&*()_+-= ',2),(20002,'1            2      ',2),(20003,'20003',2),(20004,'20004',2),(20005,'20005',2),(20006,'20006',2),(20007,'20007',2),(1000000000,'1000000000',0);
