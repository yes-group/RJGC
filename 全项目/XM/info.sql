# Host: localhost  (Version: 5.5.47)
# Date: 2016-12-16 11:57:47
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
INSERT INTO `tb_cookie` VALUES (1143910315,'2C2FDC00555E0372C46AC73E5111AC3E',1481860131213);
/*!40000 ALTER TABLE `tb_cookie` ENABLE KEYS */;

#
# Structure for table "tb_teacher"
#

DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `tno` int(11) NOT NULL DEFAULT '0',
  `tname` varchar(8) NOT NULL DEFAULT '',
  `sex` varchar(8) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `workday` date NOT NULL DEFAULT '0001-01-02',
  `position` varchar(8) NOT NULL DEFAULT '',
  `pface` varchar(8) DEFAULT NULL,
  `origin` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#

/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (1,'','',NULL,'0001-01-02','',NULL,NULL),(6,'','',NULL,'0001-01-02','',NULL,NULL),(42,'','',NULL,'0001-01-02','',NULL,NULL),(44,'','',NULL,'0001-01-02','',NULL,NULL),(79,'','',NULL,'0001-01-02','',NULL,NULL),(102,'','',NULL,'0001-01-02','',NULL,NULL),(111,'','',NULL,'0001-01-02','',NULL,NULL),(123,'','',NULL,'0001-01-02','',NULL,NULL),(126,'','',NULL,'0001-01-02','',NULL,NULL),(213,'','',NULL,'0001-01-02','',NULL,NULL),(226,'','',NULL,'0001-01-02','',NULL,NULL),(420,'','',NULL,'0001-01-02','',NULL,NULL),(445,'','',NULL,'0001-01-02','',NULL,NULL),(456,'','',NULL,'0001-01-02','',NULL,NULL),(666,'','',NULL,'0001-01-02','',NULL,NULL),(674,'','',NULL,'0001-01-02','',NULL,NULL),(779,'','',NULL,'0001-01-02','',NULL,NULL),(789,'','',NULL,'0001-01-02','',NULL,NULL),(1205,'','',NULL,'0001-01-02','',NULL,NULL),(1233,'','',NULL,'0001-01-02','',NULL,NULL),(4046,'','',NULL,'0001-01-02','',NULL,NULL),(4065,'','',NULL,'0001-01-02','',NULL,NULL),(4211,'','',NULL,'0001-01-02','',NULL,NULL),(4578,'','',NULL,'0001-01-02','',NULL,NULL),(7852,'','',NULL,'0001-01-02','',NULL,NULL),(7891,'','',NULL,'0001-01-02','',NULL,NULL),(7896,'','',NULL,'0001-01-02','',NULL,NULL),(7897,'','',NULL,'0001-01-02','',NULL,NULL),(42030,'','',NULL,'0001-01-02','',NULL,NULL),(45689,'','',NULL,'0001-01-02','',NULL,NULL),(52336,'p','p','2009-09-08','2009-09-09','p','p','p'),(123231,'','',NULL,'0001-01-02','',NULL,NULL),(301564,'','',NULL,'0001-01-02','',NULL,NULL),(456456,'','',NULL,'0001-01-02','',NULL,NULL),(1111111,'p','p','2009-09-09','2009-09-09','p','p','p'),(9654412,'p','p','2009-09-09','2009-09-09','p','p','p');
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
INSERT INTO `tb_user` VALUES (1143910315,'1143910315',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
