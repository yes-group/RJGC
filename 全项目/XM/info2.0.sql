# Host: localhost  (Version: 5.5.47)
# Date: 2016-12-16 15:33:59
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tb_class"
#

DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(8) NOT NULL DEFAULT '' COMMENT '班级名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "tb_class"
#

/*!40000 ALTER TABLE `tb_class` DISABLE KEYS */;
INSERT INTO `tb_class` VALUES (1,'高一（1）班'),(2,'高二（1）班'),(3,'高一（3）班'),(4,'高一（2）班');
/*!40000 ALTER TABLE `tb_class` ENABLE KEYS */;

#
# Structure for table "tb_course"
#

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(8) NOT NULL DEFAULT '0' COMMENT '课程号',
  `cname` varchar(8) NOT NULL DEFAULT '' COMMENT '课程名称',
  `scoremax` int(8) NOT NULL DEFAULT '0' COMMENT '满分制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_course"
#

/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES (1,1,'语文',150),(2,9,'地理',100),(3,2,'数学',150),(4,3,'英语',150),(5,4,'物理',100),(6,5,'化学',100),(7,6,'生物',100),(8,7,'政治',100),(9,8,'历史',100);
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;

#
# Structure for table "tb_student"
#

DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(50) NOT NULL DEFAULT '0' COMMENT '学号',
  `sname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `studyday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入学日期',
  `classid` int(11) NOT NULL DEFAULT '0' COMMENT '班级',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "tb_student"
#

/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student` VALUES (1,'0600000001','小明','男','1996-01-01','2015-01-01',1,NULL,NULL),(2,'0600000002','小丽','女','1996-01-01','2015-01-01',1,NULL,NULL),(3,'0600000003','小芳','女','1996-01-01','2015-01-01',1,NULL,NULL),(4,'0600000004','小李','男','1996-01-01','2015-01-01',1,NULL,NULL),(5,'0600000005','小东','男','1996-01-01','2015-01-01',2,NULL,NULL),(6,'0600000006','小桃子','女','1996-01-01','2015-01-01',2,NULL,NULL),(7,'0600000007','小米','女','1996-01-01','2015-01-01',1,NULL,NULL),(8,'0600000008','小树','男','1996-01-01','2015-01-01',2,NULL,NULL),(9,'0600000009','小花','女','1996-01-01','2015-01-01',1,NULL,NULL),(10,'0600000010','小白','男','1996-01-01','2015-01-01',1,NULL,NULL);
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;

#
# Structure for table "tb_stuscore"
#

DROP TABLE IF EXISTS `tb_stuscore`;
CREATE TABLE `tb_stuscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(50) NOT NULL DEFAULT '0' COMMENT '学号',
  `stime` date NOT NULL DEFAULT '0000-00-00' COMMENT '考试时间',
  `cno` int(5) NOT NULL DEFAULT '0' COMMENT '课程号',
  `score` int(8) NOT NULL DEFAULT '0' COMMENT '成绩',
  `sorder` int(8) NOT NULL DEFAULT '0' COMMENT '排名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "tb_stuscore"
#

/*!40000 ALTER TABLE `tb_stuscore` DISABLE KEYS */;
INSERT INTO `tb_stuscore` VALUES (1,'0600000001','2015-01-01',1,135,0),(2,'0600000001','2015-01-01',2,89,0),(3,'0600000001','2015-01-01',3,60,0),(4,'0600000002','2015-01-01',1,111,0),(5,'0600000002','2015-01-01',5,50,0),(6,'0600000010','2015-01-01',2,122,0),(7,'0600000008','2015-01-01',2,45,0),(8,'0600000009','2015-01-01',2,15,0),(9,'0600000005','2015-01-01',1,62,0),(10,'0600000005','2015-01-01',7,88,0);
/*!40000 ALTER TABLE `tb_stuscore` ENABLE KEYS */;

#
# Structure for table "tb_teacher"
#

DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tno` varchar(50) NOT NULL DEFAULT '0' COMMENT '工号',
  `tname` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(8) NOT NULL DEFAULT '' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT 'birthday',
  `workday` date NOT NULL DEFAULT '0000-00-00' COMMENT '入职日期',
  `position` varchar(8) NOT NULL DEFAULT '' COMMENT '职务',
  `pface` varchar(8) DEFAULT NULL COMMENT '政治面貌',
  `origin` varchar(8) DEFAULT NULL COMMENT '籍贯',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "tb_teacher"
#

/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (1,'0432','十十','女','1980-01-01','2000-01-01','语文',NULL,NULL),(2,'0422','房九','男','1980-01-01','2000-01-01','语文',NULL,NULL),(3,'0522','唐八','女','1980-01-01','2000-01-01','语文',NULL,NULL),(4,'0111','陶六','男','1980-01-01','2000-01-01','语文',NULL,NULL),(5,'0221','王五','男','1980-01-01','2000-01-01','语文',NULL,NULL),(6,'0023','李四','男','1980-01-01','2000-01-01','语文',NULL,NULL),(7,'0455','张三','男','1980-01-01','2000-01-01','语文',NULL,NULL);
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;

#
# Structure for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usercode` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户账户',
  `username` varchar(8) NOT NULL DEFAULT '0' COMMENT '用户姓名',
  `password` varchar(8) NOT NULL DEFAULT '' COMMENT '密码',
  `idcard` int(11) NOT NULL DEFAULT '0' COMMENT '用户身份',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tb_user"
#

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'0000','管理元大人','123456',0),(2,'0600000001','小明','123456',1),(3,'0455','张三','123456',2),(4,'0600000002','小丽','123465',1);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
