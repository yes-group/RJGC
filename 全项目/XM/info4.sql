# Host: localhost  (Version: 5.5.47)
# Date: 2016-12-27 00:36:34
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tb_class"
#

DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(8) NOT NULL DEFAULT '' COMMENT '班级名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_class"
#

INSERT INTO `tb_class` VALUES (1,'\'\"\''),(2,'\'\'\'\'\'');

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

INSERT INTO `tb_cookie` VALUES (1000000000,'710BDBE9F4E3CFB5971FD0EF1F59CD58',1482756878661);

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
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `sclass` int(11) NOT NULL DEFAULT '0' COMMENT '班级',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `studyday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入学日期',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_student"
#


#
# Structure for table "tb_teacher"
#

DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `tno` int(11) NOT NULL DEFAULT '0' COMMENT '工号',
  `tname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `workday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入职日期',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#


#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user` int(8) NOT NULL DEFAULT '0' COMMENT '账号',
  `password` varchar(10) NOT NULL DEFAULT '' COMMENT '密码',
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '用户身份',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

INSERT INTO `tb_user` VALUES (1000000000,'1000000000',0);
