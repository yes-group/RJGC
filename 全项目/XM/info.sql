# Host: localhost  (Version: 5.5.47)
# Date: 2016-12-23 10:57:03
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tb_class"
#

DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_class"
#

/*!40000 ALTER TABLE `tb_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_class` ENABLE KEYS */;

#
# Structure for table "tb_cookie"
#

DROP TABLE IF EXISTS `tb_cookie`;
CREATE TABLE `tb_cookie` (
  `user` int(11) NOT NULL DEFAULT '0',
  `cookie` varchar(32) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_cookie"
#

/*!40000 ALTER TABLE `tb_cookie` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cookie` ENABLE KEYS */;

#
# Structure for table "tb_course"
#

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) NOT NULL DEFAULT '0',
  `exam` int(11) NOT NULL DEFAULT '0',
  `chinese` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maths` smallint(5) unsigned NOT NULL DEFAULT '0',
  `english` smallint(5) unsigned NOT NULL DEFAULT '0',
  `politics` smallint(5) unsigned NOT NULL DEFAULT '0',
  `history` smallint(5) unsigned NOT NULL DEFAULT '0',
  `geography` smallint(5) unsigned NOT NULL DEFAULT '0',
  `physics` smallint(5) unsigned NOT NULL DEFAULT '0',
  `chemistry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `biology` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_course"
#

/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;

#
# Structure for table "tb_exam"
#

DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_exam"
#

/*!40000 ALTER TABLE `tb_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_exam` ENABLE KEYS */;

#
# Structure for table "tb_student"
#

DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `no` int(11) NOT NULL DEFAULT '0',
  `name` varchar(8) NOT NULL DEFAULT '',
  `sex` varchar(1) NOT NULL DEFAULT '女',
  `birthday` date DEFAULT NULL,
  `studyday` date NOT NULL DEFAULT '0000-00-00',
  `class` int(8) NOT NULL DEFAULT '0',
  `pface` varchar(8) DEFAULT NULL,
  `origin` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tb_student"
#

/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;

#
# Structure for table "tb_teacher"
#

DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `no` int(11) NOT NULL DEFAULT '0',
  `name` varchar(8) NOT NULL DEFAULT '',
  `sex` varchar(1) NOT NULL DEFAULT '女',
  `birthday` date DEFAULT NULL,
  `workday` date NOT NULL DEFAULT '0000-00-00',
  `class` int(8) NOT NULL DEFAULT '0',
  `teach` smallint(6) NOT NULL DEFAULT '0',
  `pface` varchar(8) DEFAULT NULL,
  `origin` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#

/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;

#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user` int(11) NOT NULL DEFAULT '0',
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1143910315,'1143910315',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
