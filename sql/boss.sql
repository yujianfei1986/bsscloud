CREATE DATABASE  IF NOT EXISTS `bsscloud` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bsscloud`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: Yujianfei-PC    Database: bsscloud
-- ------------------------------------------------------
-- Server version	5.5.47

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bss_acct`
--

DROP TABLE IF EXISTS `bss_acct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bss_acct` (
  `ACCT_ID` int(14) NOT NULL AUTO_INCREMENT COMMENT '账户标识',
  `CUST_ID` int(14) NOT NULL COMMENT '客户标识',
  `ACCT_NAME` varchar(50) DEFAULT NULL COMMENT '账户名称',
  `ADDRESS_ID` int(9) DEFAULT NULL COMMENT '联系地址标识',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '0:有效\n1:失效\n',
  `STATUS_DATE` datetime DEFAULT NULL COMMENT '状态时间',
  `OPERATOR_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ACCT_ID`,`CUST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_acct`
--

LOCK TABLES `bss_acct` WRITE;
/*!40000 ALTER TABLE `bss_acct` DISABLE KEYS */;
INSERT INTO `bss_acct` VALUES (1,1,'abay',1,'0','2017-11-16 05:14:03','ChinaMoblie'),(2,2,'peppa',2,'0','2017-11-16 05:14:05','ChinaMoblie'),(3,3,'adams',3,'0','2017-11-16 06:14:05','ChinaMoblie'),(4,4,'jesica',4,'0','2017-11-16 07:14:05','ChinaMoblie'),(5,5,'judy',5,'0','2017-11-16 07:56:05','ChinaMoblie'),(6,6,'gandy',6,'0','2017-11-16 08:30:05','ChinaMoblie'),(7,7,'gorge',7,'0','2017-11-16 08:45:05','ChinaMoblie'),(8,8,'fei',8,'0','2017-11-16 09:12:05','ChinaMoblie'),(9,9,'yu',9,'0','2017-11-16 09:30:05','ChinaMoblie'),(10,10,'jian',10,'0','2017-11-16 09:56:09','ChinaMoblie'),(11,11,'suse',11,'0','2017-11-16 09:56:33','ChinaMoblie'),(12,12,'gage',12,'0','2017-11-16 10:08:35','ChinaMoblie');
/*!40000 ALTER TABLE `bss_acct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bss_acct_balance`
--

DROP TABLE IF EXISTS `bss_acct_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bss_acct_balance` (
  `acct_balance_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `balance_type_id` int(10) DEFAULT NULL COMMENT '1000：主资金账本\n2000：赠送现金账本\n3000：流量账本\n4000：赠送流量账本\n',
  `acct_id` int(14) DEFAULT NULL COMMENT '账户id',
  `eff_date` datetime DEFAULT NULL COMMENT '生效日期',
  `exp_date` datetime DEFAULT NULL COMMENT '失效时间',
  `balance` double(9,2) DEFAULT NULL COMMENT '余额 单位：分',
  `status` varchar(2) DEFAULT NULL COMMENT '状态  0:可用\n          1:失效\n',
  `status_date` datetime DEFAULT NULL COMMENT '状态时间',
  `acct_items` varchar(50) DEFAULT NULL COMMENT '账本可冲销账目项  *表示均可冲销',
  `ab_order` int(11) DEFAULT NULL COMMENT '账本优先级',
  `operator_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`acct_balance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='存放账本余额信息\n界面显示的现金余额为本表的现金账本之和 -   用户发票表的欠费\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_acct_balance`
--

LOCK TABLES `bss_acct_balance` WRITE;
/*!40000 ALTER TABLE `bss_acct_balance` DISABLE KEYS */;
INSERT INTO `bss_acct_balance` VALUES (1,1000,1,'2017-11-16 05:14:03','2018-11-16 05:14:03',20.00,'0','2017-11-16 08:14:03','*',0,'ChinaMoblie'),(2,1000,2,'2017-11-16 05:14:05','2018-11-16 05:14:05',15.00,'0','2017-11-16 05:14:05','*',1,'ChinaMoblie'),(3,2000,3,'2017-11-16 06:14:05','2018-11-16 06:14:05',25.26,'0','2017-11-16 06:14:05','*',1,'ChinaMoblie'),(4,1000,4,'2017-11-16 07:14:05','2018-11-16 07:14:05',0.00,'0','2017-11-16 07:14:05','*',0,'ChinaMoblie'),(5,1000,5,'2017-11-16 07:56:05','2018-11-16 07:56:05',56.00,'0','2017-11-16 07:56:05','*',0,'ChinaMoblie'),(6,1000,6,'2017-11-16 08:30:05','2018-11-16 08:30:05',152.00,'0','2017-11-16 08:30:05','*',0,'ChinaMoblie'),(7,2000,7,'2017-11-16 08:45:05','2018-11-16 08:45:05',33.00,'0','2017-11-16 08:45:05','*',1,'ChinaMoblie'),(8,1000,8,'2017-11-16 09:12:05','2018-11-16 09:12:05',25.00,'0','2017-11-16 09:12:05','*',0,'ChinaMoblie'),(9,2000,9,'2017-11-16 09:30:05','2018-11-16 09:30:05',11.01,'0','2017-11-16 09:30:05','*',0,'ChinaMoblie'),(10,1000,10,'2017-11-16 09:56:09','2017-11-16 09:56:09',12.02,'0','2017-11-16 09:56:09','*',0,'ChinaMoblie'),(11,1000,11,'2017-11-16 09:56:33','2017-11-16 09:56:33',25.00,'0','2017-11-16 09:56:33','*',0,'ChinaMoblie'),(12,1000,12,'2017-11-16 10:08:35','2018-11-16 10:08:35',77.00,'0','2017-11-16 10:08:35','*',0,'ChinaMoblie');
/*!40000 ALTER TABLE `bss_acct_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bss_invoice`
--

DROP TABLE IF EXISTS `bss_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bss_invoice` (
  `invoice_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '发票id',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `due_date` datetime DEFAULT NULL COMMENT '发票到期时间',
  `use_credit` varchar(2) DEFAULT '1' COMMENT '是否使用有效资金账本；默认使用，创建完发票后，自动扣费 0:不使用\n1:使用\n',
  `invoice_note` varchar(100) DEFAULT NULL COMMENT '显示备注',
  `admin_note` varchar(100) DEFAULT NULL,
  `subtotal` double(12,2) DEFAULT NULL COMMENT '小计',
  `tax` double(4,2) DEFAULT NULL COMMENT '税率',
  `discount` double(12,2) DEFAULT NULL,
  `total` double(12,2) DEFAULT NULL COMMENT '发票总金额',
  `paid_amount` double(12,2) DEFAULT NULL,
  `balance_due` double(12,2) DEFAULT NULL COMMENT '发票未支付的金额',
  `status` varchar(2) DEFAULT NULL COMMENT '发票状态\n0:Draft\n1:Unpaid\n2:Partial\n3:Paid\n4:Void\n',
  `operator_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_invoice`
--

LOCK TABLES `bss_invoice` WRITE;
/*!40000 ALTER TABLE `bss_invoice` DISABLE KEYS */;
INSERT INTO `bss_invoice` VALUES (1,'1','2017-11-16 05:14:03','2017-11-30 05:14:03','0',NULL,NULL,NULL,NULL,NULL,100.00,70.00,80.00,'2','ChinaMoblie'),(2,'2','2017-11-16 05:14:03','2017-11-30 05:14:03','0',NULL,NULL,NULL,NULL,NULL,120.00,20.00,105.00,'2','ChinaMoblie'),(3,'3','2017-11-16 06:14:05','2017-11-30 06:14:05','0',NULL,NULL,NULL,NULL,NULL,100.00,10.00,74.74,'2','ChinaMoblie'),(4,'4','2017-11-16 07:14:05','2017-11-30 07:14:05','0',NULL,NULL,NULL,NULL,NULL,100.00,0.00,100.00,'1','ChinaMoblie'),(5,'5','2017-11-16 07:56:05','2017-11-30 07:56:05','0',NULL,NULL,NULL,NULL,NULL,110.00,0.00,54.00,'1','ChinaMoblie'),(6,'6','2017-11-16 08:30:05','2017-11-30 08:30:05','0',NULL,NULL,NULL,NULL,NULL,100.00,100.00,0.00,'3','ChinaMoblie'),(7,'7','2017-11-16 08:45:05','2017-11-30 08:45:05','0',NULL,NULL,NULL,NULL,NULL,100.00,20.00,67.00,'2','ChinaMoblie'),(8,'8','2017-11-16 09:12:05','2017-11-30 09:12:05','0',NULL,NULL,NULL,NULL,NULL,120.00,10.00,95.00,'2','ChinaMoblie'),(9,'9','2017-11-16 09:30:05','2017-11-30 09:30:05','0',NULL,NULL,NULL,NULL,NULL,100.00,50.00,88.99,'2','ChinaMoblie'),(10,'10','2017-11-16 09:56:09','2017-11-30 09:56:09','0',NULL,NULL,NULL,NULL,NULL,150.00,100.00,137.98,'2','ChinaMoblie'),(11,'11','2017-11-16 09:56:33','2017-11-30 09:56:33','0',NULL,NULL,NULL,NULL,NULL,150.00,25.00,125.00,'1','ChinaMoblie'),(12,'12','2017-11-16 10:08:35','2017-11-30 10:08:35','0',NULL,NULL,NULL,NULL,NULL,100.00,100.00,23.00,'3','ChinaMoblie');
/*!40000 ALTER TABLE `bss_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bss_login_staff`
--

DROP TABLE IF EXISTS `bss_login_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bss_login_staff` (
  `USERID` bigint(12) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `USER_PASSWD` varchar(50) DEFAULT NULL,
  `PASSWD_MODIFY_DATE` datetime DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL COMMENT '0:正常；1:锁定',
  `IS_SUPER_ADMIN` char(1) DEFAULT NULL COMMENT '0:否;1:是',
  `NOTE` varchar(200) DEFAULT NULL,
  `OPERATOR_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_login_staff`
--

LOCK TABLES `bss_login_staff` WRITE;
/*!40000 ALTER TABLE `bss_login_staff` DISABLE KEYS */;
INSERT INTO `bss_login_staff` VALUES (1,'admin','yjf1986','2017-07-26 09:24:27','15910657249','daredevil1986@126.com','2017-07-26 08:00:00','0','1',NULL,'ChinaMoblie');
/*!40000 ALTER TABLE `bss_login_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bss_menu`
--

DROP TABLE IF EXISTS `bss_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bss_menu` (
  `MENU_ID` bigint(20) NOT NULL,
  `MENU_NAME` varchar(200) DEFAULT NULL COMMENT '菜单显示名称',
  `MENU_PA_ID` varchar(50) DEFAULT NULL COMMENT '上级菜单ID',
  `MENU_URL` varchar(200) DEFAULT NULL COMMENT '菜单地址',
  `MENU_TYPE` decimal(1,0) DEFAULT NULL COMMENT '菜单类型；1功能菜单、2按钮功能',
  `MENU_LEAF` decimal(1,0) DEFAULT NULL COMMENT '是否是叶子节点； 1是，0否',
  `MENU_LVL` decimal(2,0) DEFAULT NULL,
  `DISP_ORD` decimal(8,0) DEFAULT NULL COMMENT '菜单顺序，同一级别的菜单顺序',
  `STOP_SIGN` char(1) DEFAULT NULL COMMENT '0菜单使用中，1菜单停用',
  `PERMISSION_ID` varchar(20) DEFAULT NULL,
  `OPERATOR_CODE` varchar(20) DEFAULT NULL,
  `MENU_ICON` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_menu`
--

LOCK TABLES `bss_menu` WRITE;
/*!40000 ALTER TABLE `bss_menu` DISABLE KEYS */;
INSERT INTO `bss_menu` VALUES (100,'YiBiaoPan','0',NULL,1,1,1,0,'0',NULL,NULL,'/images/menu/icon_dashboard.png'),(200,'YunYingShang','0',NULL,1,0,1,1,'0',NULL,NULL,'/images/menu/icon_operator.png'),(300,'KeHu','0',NULL,1,0,1,2,'0',NULL,NULL,'/images/menu/icon_clients.png'),(400,'ZhangDan','0',NULL,1,0,1,3,'0',NULL,NULL,'/images/menu/icon_billing.png'),(500,'GongDan','0',NULL,1,1,1,4,'0',NULL,NULL,'/images/menu/icon_ticketing.png'),(600,'WangLuo','0',NULL,1,0,1,5,'0',NULL,NULL,'/images/menu/icon_resource.png'),(700,'TongJi','0',NULL,1,0,1,6,'0',NULL,NULL,'/images/menu/icon_reports.png'),(800,'XiTongGuanLi','0',NULL,1,0,1,7,'0',NULL,NULL,'/images/menu/icon_statistics.png'),(900,'BangZhu','0',NULL,1,0,1,8,'0',NULL,NULL,'/images/menu/icon_help.png'),(2001,'YunYingShangGuanLi','200',NULL,1,1,2,0,'0','20011',NULL,NULL),(2002,'YueDuJieSuanChaXun','200',NULL,1,1,2,1,'0','20021',NULL,NULL),(3001,'KeHuGuanLi','300',NULL,1,1,2,0,'0','30011',NULL,NULL),(3002,'PiLiangKaiHu','300',NULL,1,1,2,1,'0','30021',NULL,NULL),(4001,'YueDuJieSuanChaXun','400',NULL,1,1,2,0,'0','40011',NULL,NULL),(4002,'FaPiaoCaoAn','400',NULL,1,1,2,1,'0','40021',NULL,NULL),(4003,'ZhiFu','400',NULL,1,1,2,2,'0','40031',NULL,NULL),(4004,'TuiKuan','400',NULL,1,1,2,3,'0','40041',NULL,NULL),(4005,'BaoGao','400',NULL,1,1,2,4,'0','40051',NULL,NULL),(6001,'SIMKaGuanLi','600',NULL,1,0,2,0,'0','60011',NULL,NULL),(6002,'ChongZhiKaGuanLi','600',NULL,1,1,2,1,'0','60021',NULL,NULL),(6003,'SimKaPiLiangDaoRu','6001',NULL,1,1,3,0,'0','60012',NULL,NULL),(7001,'ZaiXianYongHuShuTongJi','700',NULL,1,1,2,0,'0','70011',NULL,NULL),(7002,'LiXianYongHuShuTongJi','700',NULL,1,1,2,1,'0','70021',NULL,NULL),(7003,'ChongZhiTongJi','700',NULL,1,1,2,2,'0','70031',NULL,NULL),(7004,'TuiFeiTongJi','700',NULL,1,1,2,3,'0','70041',NULL,NULL),(7005,'BuKuanTongJi','700',NULL,1,1,2,4,'0','70051',NULL,NULL),(7006,'MeiYueYingShouTongJi','700',NULL,1,1,2,5,'0','70061',NULL,NULL),(7007,'YiZhiFuFaPiaoTongJi','700',NULL,1,1,2,6,'0','70071',NULL,NULL),(7008,'WeiZhiFuFaPiaoTongJi','700',NULL,1,1,2,7,'0','70081',NULL,NULL),(7009,'GuoQiFaPiaoTongJi','700',NULL,1,1,2,8,'0','70091',NULL,NULL),(7010,'KuCunSimKaTongJi','700',NULL,1,1,2,9,'0','70101',NULL,NULL),(7011,'KuCunChongZhiKaTongJi','700',NULL,1,1,2,10,'0','70111',NULL,NULL),(7012,'YiShiYongChongZhiKaTongJi','700',NULL,1,1,2,11,'0','70121',NULL,NULL),(8001,'ChanPinTaoCanZiFeiPeiZhi','800',NULL,1,1,2,0,'0','80011',NULL,NULL),(8002,'YunYingShangQuanJuPeiZhi','800',NULL,1,1,2,1,'0','80021',NULL,NULL),(8003,'YongHuGuanLi','800',NULL,1,1,2,2,'0','80031',NULL,NULL),(8004,'JueSeGuanLi','800',NULL,1,1,2,3,'0','80041',NULL,NULL),(8005,'QuanXianGuanLi','800',NULL,1,1,2,4,'0','80051',NULL,NULL),(8006,'RiZhiGuanLi','800',NULL,1,1,2,5,'0','80061',NULL,NULL),(9001,'YongHuBangZhu','900',NULL,1,1,2,0,'0','90011',NULL,NULL),(9002,'GuanYu','900',NULL,1,1,2,1,'0','90021',NULL,NULL);
/*!40000 ALTER TABLE `bss_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bss_user`
--

DROP TABLE IF EXISTS `bss_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bss_user` (
  `user_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `cust_id` varchar(20) DEFAULT NULL COMMENT '客户 ID',
  `cust_name` varchar(20) DEFAULT NULL COMMENT '客户名称',
  `imsi` varchar(40) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '开户日期',
  `product_id` varchar(200) DEFAULT NULL COMMENT '主产品代码',
  `eff_date` datetime DEFAULT NULL COMMENT '生效时间',
  `exp_date` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL COMMENT '用户状态 \n0:未激活（deactive）\n1激活（active）（开机）\n2主动停机\n3停机  (欠费停机)\n4挂失  \n5 锁定\n6: 待充值\n7:销户\n8:预开户(扩展用)\n9:预销户(扩展用)\n',
  `status_date` datetime DEFAULT NULL COMMENT '用户状态日期',
  `life_status` varchar(10) DEFAULT NULL COMMENT '生命周期状态\n0:有效期\n1:充值期\n2:锁定期\n3:未激活期\n',
  `life_status_date` datetime DEFAULT NULL COMMENT '生命周期状态日期',
  `previous_bill_date` varchar(8) DEFAULT NULL COMMENT '上一次出账日期 yyyy-MM-dd',
  `next_bill_date` varchar(8) DEFAULT NULL COMMENT '下一次出账日期 yyyy-MM-dd',
  `remark` varchar(255) DEFAULT NULL,
  `user_tariff_type` varchar(2) DEFAULT NULL COMMENT '1:时长用户\n2:流量用户\n',
  `invoicing_type` varchar(2) DEFAULT NULL COMMENT '1:backward\n2:forward\n',
  `operator_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_user`
--

LOCK TABLES `bss_user` WRITE;
/*!40000 ALTER TABLE `bss_user` DISABLE KEYS */;
INSERT INTO `bss_user` VALUES (1,'1','abay','257890359741258','2017-11-16 05:14:03','1,2','2017-11-16 05:14:03','2018-11-16 05:14:03','1','2017-11-17 05:14:03','0','2017-11-17 05:14:03','20171130','20180531',NULL,'1','1','ChinaMoblie'),(2,'2','peppa','123490359741258','2017-11-16 05:14:05','1','2017-11-16 05:14:05','2018-11-16 05:14:05','1','2017-11-17 05:14:05','0','2017-11-17 05:14:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(3,'3','adams','123490359741258','2017-11-16 06:14:05','1','2017-11-16 06:14:05','2018-11-16 06:14:05','1','2017-11-16 06:14:05','0','2017-11-16 06:14:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(4,'4','jesica','123490359741345','2017-11-16 07:14:05','2','2017-11-16 07:14:05','2018-11-16 07:14:05','1','2017-11-16 07:14:05','0','2017-11-16 07:14:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(5,'5','judy','124490359741258','2017-11-16 07:56:05','3','2017-11-16 07:56:05','2018-11-16 07:56:05','1','2017-11-16 07:56:05','0','2017-11-16 07:56:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(6,'6','gandy','257890359741250','2017-11-16 08:30:05','1','2017-11-16 08:30:05','2018-11-16 08:30:05','1','2017-11-16 08:30:05','0','2017-11-16 08:30:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(7,'7','gorge','257890300741250','2017-11-16 08:45:05','1','2017-11-16 08:30:05','2018-11-16 08:30:05','1','2017-11-16 08:30:05','0','2017-11-16 08:30:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(8,'8','fei','334490359741258','2017-11-16 09:12:05','2','2017-11-16 09:12:05','2018-11-16 09:12:05','1','2017-11-16 09:12:05','0','2017-11-16 09:12:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(9,'9','yu','334490350041258','2017-11-16 09:30:05','1','2017-11-16 09:30:05','2018-11-16 09:30:05','1','2017-11-16 09:30:05','0','2017-11-16 09:30:05','20171130','20180531',NULL,'1','1','ChinaMoblie'),(10,'10','jian','123456789101112','2017-11-16 09:56:09','1','2017-11-16 09:56:09','2018-11-16 09:56:09','1','2017-11-16 09:56:09','0','2017-11-16 09:56:09','20171130','20180531',NULL,'1','1','ChinaMoblie'),(11,'11','suse','112233445566778','2017-11-16 09:56:33','2','2017-11-16 09:56:33','2018-11-16 09:56:33','1','2017-11-16 09:56:33','0','2017-11-16 09:56:33','20171130','20180531',NULL,'1','1','ChinaMoblie'),(12,'12','gage','225587669754488','2017-11-16 10:08:35','1','2017-11-16 10:08:35','2018-11-16 10:08:35','1','2017-11-16 10:08:35','0','2017-11-16 10:08:35','20171130','20180531',NULL,'1','1','ChinaMoblie');
/*!40000 ALTER TABLE `bss_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ROLEID` bigint(11) NOT NULL AUTO_INCREMENT,
  `P_ROLEID` bigint(11) DEFAULT NULL,
  `ROLE_NAME` varchar(50) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL COMMENT '备注',
  `OPERATOR_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,0,'superAdmin','超级管理员','ChinaMoblie');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_rela`
--

DROP TABLE IF EXISTS `user_role_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_rela` (
  `USERID` varchar(50) NOT NULL,
  `ROLEID` bigint(12) NOT NULL,
  `OPERATOR_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USERID`,`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_rela`
--

LOCK TABLES `user_role_rela` WRITE;
/*!40000 ALTER TABLE `user_role_rela` DISABLE KEYS */;
INSERT INTO `user_role_rela` VALUES ('1',1,'ChinaMoblie');
/*!40000 ALTER TABLE `user_role_rela` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-18  6:11:22
