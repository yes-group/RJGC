# Host: localhost  (Version: 5.5.47)
# Date: 2016-12-22 17:59:55
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

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
INSERT INTO `tb_cookie` VALUES (2,'0BBD1B45DE191B90B7F6E83B25A5CD2E',1482368925064),(1001,'C4046D5129458BAD7E8421F4AFAEE501',1482330024312),(1002,'012EFA06D38DBE2143CD9F18705937EB',1482400124665),(1143910315,'0E0760D5AB30A2678DF3C4F501672811',1482396908704);
/*!40000 ALTER TABLE `tb_cookie` ENABLE KEYS */;

#
# Structure for table "tb_course"
#

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `no` int(11) NOT NULL DEFAULT '0',
  `name` varchar(8) NOT NULL DEFAULT '',
  `scoremax` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_course"
#

/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;

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
  `class` varchar(8) NOT NULL DEFAULT '',
  `pface` varchar(8) DEFAULT NULL,
  `origin` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "tb_student"
#

/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student` VALUES (1000,'姓名','男','1998-02-18','2015-09-12','15软件一班','8hi]-08','广东汕尾'),(1001,'学生','男','1996-01-18','2016-05-06','16软件怪班','zzm','jg'),(1002,'','女','1996-01-31','0000-00-00','',NULL,NULL),(1003,'','女',NULL,'0000-00-00','',NULL,NULL),(1004,'刘六郡','女',NULL,'0000-00-00','',NULL,NULL),(1005,'','女',NULL,'0000-00-00','',NULL,NULL),(1006,'刘绍钧','男',NULL,'0000-00-00','',NULL,NULL),(1007,'刘惜君','女',NULL,'0000-00-00','',NULL,NULL),(1008,'刘利军','女',NULL,'0000-00-00','',NULL,NULL),(1009,'','女',NULL,'0000-00-00','',NULL,NULL);
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
  `position` varchar(8) NOT NULL DEFAULT '',
  `pface` varchar(8) DEFAULT NULL,
  `origin` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#

/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (2,'','男',NULL,'0000-00-00','',NULL,NULL),(3,'','女',NULL,'0000-00-00','',NULL,NULL),(4,'','女',NULL,'0000-00-00','',NULL,NULL),(5,'','女',NULL,'0000-00-00','',NULL,NULL),(6,'','女',NULL,'0000-00-00','',NULL,NULL),(7,'dasf','女',NULL,'0000-00-00','',NULL,NULL),(8,'','女',NULL,'0000-00-00','',NULL,NULL),(9,'the tea','女',NULL,'0000-00-00','',NULL,NULL),(10,'t','女',NULL,'0000-00-00','',NULL,NULL),(100,'','女',NULL,'0000-00-00','',NULL,NULL),(200,'陈瑱楠','男','0001-01-02','0001-01-02','打酱油','煞笔','广东');
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;

#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user` int(11) NOT NULL DEFAULT '0',
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`user`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (2,'2',1),(3,'3',1),(4,'4',1),(5,'5',1),(6,'6',1),(7,'7',1),(8,'8',1),(9,'9',1),(10,'10',1),(100,'100',1),(200,'200',1),(1000,'1000',2),(1001,'1001',2),(1002,'1002',2),(1003,'1003',2),(1004,'1004',2),(1005,'1005',2),(1006,'1006',2),(1007,'1007',2),(1008,'1008',2),(1009,'1009',2),(1143910315,'1143910315',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
