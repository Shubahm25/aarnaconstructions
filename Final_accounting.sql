-- MySQL dump 10.13  Distrib 5.6.39-83.1, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Accounting
-- ------------------------------------------------------
-- Server version	5.6.39-83.1

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






DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code` (
  `codeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `codetype` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parentcodeid` bigint(20) DEFAULT NULL,
  `displayorder` tinyint(4) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codeid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--


/*!40000 ALTER TABLE `code` DISABLE KEYS */;
	insert into code 
		select max(codeid)+1 , 'AC_BALSHEET', 'BALANCESHEET', 1, 'Balance Sheet', 0, 0, 'Balance Sheet' from code union 
	select max(codeid)+1,'AC_CATG_UNDER','CATEGORYUNDER',1,'Category Under',0,0,'Category Under' from code union
	select max(codeid)+1,'AC_CATEGORY','CATEGORY',1,'Category',0,0,'Category' from code union
	select max(codeid)+1,'AC_GROUP','GROUP',1,'Group',0,0,'Group' from code union
	select max(codeid)+1,'AC_LEDGER','LEDGER',1,'Ledger',0,0,'Ledger' from code union 
	select max(codeid)+1,'AC_PL_UPPER','P&LACCOUNTUPPER',1,'P&L Account Upper',0,0,'P&L Account Upper' from code union
	select max(codeid)+1,'AC_PL_LOWER','P&LACCOUNTLOWER',1,'P&L Account Lower',0,0,'P&L Account Lower' from code union
	select max(codeid)+1,'VC_RECEIPT','RECEIPTVOUCHERTYPE',1,'ReceiptVoucherType',NULL,0,'Receipt Voucher Type'from code union
	select max(codeid)+1,'VC_PAYMENT','PAYMENTVOUCHERTYPE',1,'PaymentVoucherType',NULL,0,'Payment Voucher Type' from code union
	select max(codeid)+1,'ENT_PAYMENT', 'VOUCHERTYPE', '1', 'Payment', NULL, '0', 'Payment Entry type' from code union
	select max(codeid)+1,'ENT_RECEIPT', 'VOUCHERTYPE', '1', 'Receipt', NULL, '0', 'Receipt Entry type' from code union
	select max(codeid)+1,'ENT_REVENUE', 'VOUCHERTYPE', '1', 'Revenue/Billing', NULL, '0', 'Revenue Entry type' from code union
	select max(codeid)+1, 'ENT_JOURNAL', 'VOUCHERTYPE', '1', 'Journal', NULL, '0', 'Journal Entry type' from code union
	select max(codeid)+1,'ENT_PURCHASE', 'VOUCHERTYPE', '1', 'Purchase', NULL, '0', 'Purchase Entry type' from code union
	select max(codeid)+1,'ENT_BANK','BANKENTRYTYPE',1,'Bank Entry Payment Modes',NULL,0,'Bank Entry Payment Modes' from code union
	select max(codeid)+1,'ENT_CASH','CASHENTRYTYPE',1,'Cash Entry Payment Modes',NULL,0,'Cash Entry Payment Modes'from code union
	select max(codeid)+1,'ENT_CHEQUE','CHEQUEENTRYTYPE',1,'Cheque Entry Payment Modes',NULL,0,'Cheque Payment Modes' from code union
	select max(codeid)+1,'ENT_ONLINE','ONLINEENTRYTYPE',1,'Online Entry Payment Modes',NULL,0,'Online Payment Modes' from code union
	select max(codeid)+1,'ENT_OTHERS','OTHERSENTRYTYPE',1,'Others Entry Payment Modes',NULL,0,'Others Payment Modes' from code union
	select max(codeid)+1,'ENT_CONTRA', 'VOUCHERTYPE', '1', 'Contra', NULL, '0', 'Bank Entry Payment Modes' from code union
	select max(codeid)+1,'AC_SUBGROUP','SUBGROUP',1,'SubGroup',0,0,'Subgroup type' from code  union
	select max(codeid)+1, 'CLND_YEAR', 'MONTHLYTYPE', '1', 'Calendar Year', NULL, '0', 'Calendar Year' from code  union
	select max(codeid)+1, 'FIN_YEAR', 'MONTHLYTYPE', '1', 'Financial Year', NULL, '0', 'Financial Year' from code  union		
	select max(codeid)+1, 'MNTHLY', 'MONTHLYTYPE', '1', 'Monthly', NULL, '0', 'Monthly' from code  union
	select max(codeid)+1, 'NVER', 'MONTHLYTYPE', '1', 'Never', NULL, '0', 'Never' from code  union
	select max(codeid)+1, 'HLF_YEARLY', 'PERIODTYPE', '1', 'Half Yearly', NULL, '0', 'Half Yearly' from code  union
	select max(codeid)+1, 'QURATELY', 'PERIODTYPE', '1', 'Quarterly', NULL, '0', 'Quarterly' from code  union
	select max(codeid)+1, 'MNTHLY', 'PERIODTYPE', '1', 'Monthly', NULL, '0', 'Monthly' from code  union
	select max(codeid)+1, 'ANULLY', 'PERIODTYPE', '1', 'Annually', NULL, '0', 'Annually' from code  union
	select max(codeid)+1, 'SELECT_TYPE', 'MONTHLYTYPE', '1', 'Select VoucherReset Type', NULL, '0', 'Select VoucherReset Type' from code  ;
/*!40000 ALTER TABLE `code` ENABLE KEYS */;











--
-- Table structure for table accountingconfigmaster`
--

DROP TABLE IF EXISTS `accountingconfigmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountingconfigmaster` (
  `masterid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `codetype` bigint(20) DEFAULT '0',
  `configmasterparentid` int(11) DEFAULT '0',
  `tags` varchar(45) DEFAULT NULL,
  `isactive` int(10) DEFAULT '0',
  `tenantid` int(10) DEFAULT '0',
  `treatment` int(11) DEFAULT '0',
  `debitopeningbalance` double DEFAULT '0',
  `creditopeningbalance` double DEFAULT '0',
  `debitclosingbalance` double DEFAULT '0',
  `creditclosingbalance` double DEFAULT '0',
  `groupid` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `categoryunderid` int(11) DEFAULT '0',
  `createdby` int(11) DEFAULT '0',
  `createdon` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT '0',
  `modifiedon` datetime DEFAULT NULL,
  `isTemplate` int(11) DEFAULT '0',
  PRIMARY KEY (`masterid`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=big5;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountingconfigmaster`
--




INSERT INTO `accountingconfigmaster` VALUES (1,'MST_BALSHEET','Balance Sheet','Balance Sheet',(select codeid from code where code='AC_BALSHEET' and codetype='BALANCESHEET'),0,'',1,1,0,0,0,0,0,0,0,0,1,NULL,1,NULL,1),(2,'MST_LIABILITY','Liabilities','Liabilities',(select codeid from code where code='AC_CATG_UNDER' and codetype='CATEGORYUNDER'),1,NULL,1,1,0,0,0,0,0,0,0,0,1,NULL,1,NULL,1),(3,'MST_BRDIVISION','Branch Division','Branch Division',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),2,NULL,1,1,0,0,0,0,0,0,0,2,1,NULL,1,NULL,1),(5,'MST_CAPACNT','Capital Account','Capital Account',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),2,NULL,1,1,0,1,0,0,0,0,0,2,1,NULL,1,NULL,1),(7,'MST_CURRLIABILITY','Current Liabilities','Current Liabilities',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),2,NULL,1,1,0,1,0,0,0,0,0,2,1,NULL,1,NULL,1),(9,'MST_DUTTAX','Duties Tax','Duties Tax',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),7,NULL,1,1,0,0,0,0,0,0,7,2,1,NULL,1,NULL,1),(10,'PL_PACNT_UPPER','Profit And Loss Account Upper','Profit And Loss Account',(select codeid from code where code='AC_PL_UPPER' and codetype='P&LACCOUNTUPPER'),0,NULL,1,1,1,0,0,0,0,0,0,0,1,NULL,1,NULL,1),(11,'PL_PUCHACNT','Purchase Account','Purchase Account',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),10,'P&LAcnt',1,1,1,0,0,0,0,0,0,10,1,NULL,1,NULL,1),(13,'PL_DIRINC','Direct Incomes','Direct Incomes',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),10,'DI',1,1,2,0,0,0,0,0,0,10,1,NULL,1,NULL,1),(14,'PL_INCDIR','Income (Direct)','Income (Direct)',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),13,'ID',1,1,2,0,0,0,0,0,13,10,1,NULL,1,NULL,1),(105,'PL_PACNT_LOWER','Profit And Loss Account Lower','Profit And Loss Account Lower',(select codeid from code where code='AC_PL_LOWER' and codetype='P&LACCOUNTLOWER'),0,'qqqaaa',1,1,0,0,0,0,0,0,0,0,1,NULL,0,NULL,1),(123,'LOAN(LIABILITY)','Loan(Liability)','Loan(Liability)',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),2,NULL,1,1,0,0,0,0,0,0,0,2,1,'2019-09-03 18:14:20',0,NULL,1),(124,'BANK OD/CC A/C','Bank OD/CC A/C','Bank OD/CC A/C',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),123,NULL,1,1,0,0,0,0,0,0,123,2,1,'2019-09-03 18:14:20',0,NULL,1),(125,'SECURED LOANS','Secured Loans','Secured Loans',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),123,NULL,1,1,0,0,0,0,0,0,123,2,1,NULL,0,NULL,1),(126,'UNSECURED LOANS','Unsecured Loans','Unsecured Loans',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),123,NULL,0,1,0,0,0,0,0,0,123,2,1,NULL,1,'2019-09-30 09:22:33',1),(127,'PROVISIONS','Provisions','Provisions',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),7,NULL,1,1,0,0,0,0,0,0,7,2,1,NULL,0,NULL,1),(128,'SUNDRY CREDITORS','Sundry Creditors','Sunry Creditors',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),7,NULL,1,1,0,0,0,0,0,0,7,2,1,NULL,0,NULL,1),(129,'MST_ASSETS','Assets','Assets',(select codeid from code where code='AC_CATG_UNDER' and codetype='CATEGORYUNDER'),1,NULL,1,1,0,0,0,0,0,0,0,0,1,NULL,0,NULL,1),(130,'CURRENT_ASSETS','Current Assets','Current Assets',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),129,NULL,1,1,0,0,0,0,0,0,0,129,0,NULL,0,NULL,1),(132,'BANK ACCOUNTS','Bank Accounts','Bank Accounts',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(133,'CASHINHAND','Cash in Hand','Cash in Hand',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(134,'DEPOSIT(ASSETS)','Deposit (Assets)','Deposit (Assets)',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(135,'LOAN&ADVANCE(ASSETS)','Loan & Advance (Assets)','Loan & Advance (Assets)',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(136,'STOCKINHAND','Stock in Hand','Stock in Hand',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(137,'SUNDRY DEBTORS','Sundry Debtors','Sundry Debtors',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,1,'2019-10-23 10:48:34',1),(138,'FIXED ASSETS','Fixed Assets','Fixed Assets',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),129,NULL,1,1,0,0,0,0,0,0,0,129,0,NULL,0,NULL,1),(140,'INVESTMENTS','Investments','Investments',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),129,NULL,1,1,0,0,0,0,0,0,0,129,0,NULL,0,NULL,1),(141,'MISC.EXPENSES(ASSETS)','Misc. Expenses (Assets)','Misc. Expenses (Assets)',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),129,NULL,1,1,0,0,0,0,0,0,0,129,0,NULL,0,NULL,1),(142,'BRANCH DIVISION(ASSETS)','Branch Division (Assets)','Branch Division',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),129,NULL,1,1,0,0,0,0,0,0,0,129,0,NULL,0,NULL,1),(144,'SUSPENSES A/C','Suspenses A/c','Suspenses A/c',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),129,NULL,1,1,0,0,0,0,0,0,0,129,0,NULL,0,NULL,1),(145,'DIRECT EXPENSES','Direct Expenses','Direct Expenses',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),10,NULL,1,1,1,0,0,0,0,0,0,10,0,NULL,0,NULL,1),(146,'EXPENSES (DIRECT)','Expenses (Direct)','Expenses (Direct)',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),145,NULL,1,1,1,0,0,0,0,0,145,10,0,NULL,0,NULL,1),(147,'SALES ACCOUNT','Sales Account','Sales Account',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),10,NULL,1,1,2,0,0,0,0,0,0,10,0,NULL,0,NULL,1),(151,'PROFIT/(LOSS) ACCOUNT','Profit/ (Loss) Account','Profit/ (Loss) Account',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),105,NULL,1,1,0,0,0,0,0,0,0,105,0,NULL,0,NULL,1),(152,'INDIRECTEXPENSES','Indirect Expenses','Indirect Expenses',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),105,NULL,1,1,3,0,0,0,0,0,0,105,0,NULL,0,NULL,1),(153,'EXPENSES(INDIRECT','Expenses (Indirect)','Expenses (Indirect)',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),152,NULL,1,1,3,0,0,0,0,0,152,105,0,NULL,0,NULL,1),(155,'INDIRECTINCOME','Indirect Income','Indirect Income',(select codeid from code where code='AC_CATEGORY' and codetype='CATEGORY'),105,NULL,1,1,4,0,0,0,0,0,0,105,0,NULL,0,NULL,1),(156,'INCOME(INDIRECT)','Income (Indirect)','Income (Indirect)',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),155,NULL,1,1,4,0,0,0,0,0,155,105,0,NULL,0,NULL,1),(157,'FUNDS','Funds','Funds',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),7,NULL,1,1,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(158,'ADVANCES_DEPOSIT','Advances & Deposit','Advances & Deposit',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),7,NULL,1,1,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(159,'CMN_WELFARE_FUND','Common Welfare Fund','Common Welfare Fund',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),157,NULL,0,0,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(160,'AMENT_FUND','Amenities Fund','Amenities Fund',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),157,NULL,0,0,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(161,'Building_REP_FUND','Building Repair Fund','Building Repair Fund',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),157,NULL,0,0,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(162,'SINK_FUND','Sinking Fund','Sinking Fund',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),157,NULL,0,0,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(163,'RES_FUND','Reserve Fund','Reserve Fund',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),157,NULL,0,0,0,0,0,0,0,0,7,2,0,NULL,0,NULL,1),(164,'ACC_INT','Accrued Interest','Accrued Interest',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),130,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(165,'DUES_MEMBERS','Dues From Members','Dues From Members',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),137,NULL,1,1,0,0,0,0,0,0,130,129,0,NULL,0,NULL,1),(166,'MISC_ASSETS','Misc Assets','Misc Assets',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),141,NULL,1,0,0,0,0,0,0,0,141,129,0,NULL,0,NULL,1),(167,'COST_LAND','Cost of Land','Cost of Land',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),138,NULL,1,1,0,0,0,0,0,0,138,129,0,NULL,0,NULL,1),(168,'COST_CNST','Cost of construction','Cost of construction',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),138,NULL,1,0,0,0,0,0,0,0,138,129,0,NULL,0,NULL,1),(169,'RENT_RATE_TAXES','Rent,Rates & Taxes','Cost of construction',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),153,NULL,1,0,3,0,0,0,0,0,152,105,0,NULL,0,NULL,1),(170,'ESTABLSISH_EXPENSES','Etablishment Expenses','Etablishment Expenses',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),153,NULL,1,0,3,0,0,0,0,0,152,105,0,NULL,0,NULL,1),(171,'MAINTAINCE','Maintainence','Maintainence',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),153,NULL,1,0,3,0,0,0,0,0,152,105,0,NULL,0,NULL,1),(172,'OTHER EXPENSES','Other Expenses','Other Expenses',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),153,NULL,1,0,3,0,0,0,0,0,152,105,0,NULL,0,NULL,1),(173,'MAINTAINENCE_SERVICE_CHARGES','Maintenance & Service Chgs.','Maintenance & Service Chgs.',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),156,NULL,1,0,4,0,0,0,0,0,155,105,0,NULL,0,NULL,1),(174,'INTEREST_RECEIVED','Interest Received','Interest Received',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),156,NULL,1,0,4,0,0,0,0,0,155,105,0,NULL,0,NULL,1),(175,'OTHER_INCOME_SOURCES','Other Income Sources','Other Income Sources',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),156,NULL,1,0,4,0,0,0,0,0,155,105,0,NULL,0,NULL,1),(176,'RENT_RECEIVED','Rent Received','Rent Received',(select codeid from code where code='AC_SUBGROUP' and codetype='SUBGROUP'),156,NULL,1,0,4,0,0,0,0,0,155,105,0,NULL,0,NULL,1),(177,'AUTHORISED_SHARED','Authorised Shared Capital','Authorised Shared Capital',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),5,NULL,1,0,0,0,0,0,0,0,5,2,0,NULL,0,NULL,1),(178,'ISSUED_SUB & PAID UP CAPITAL','Issued,Sub & Paid Up Capital','Issued,Sub & Paid Up Capital',(select codeid from code where code='AC_GROUP' and codetype='GROUP'),5,NULL,1,0,0,0,0,0,0,0,5,2,0,NULL,0,NULL,1);


/*!40000 ALTER TABLE `accountingconfigmaster` ENABLE KEYS */;

--
-- Table structure for table `ledger_additional_details`
--

DROP TABLE IF EXISTS `ledger_additional_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_additional_details` (
  `ledgerdetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `masterid` bigint(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gstno` varchar(255) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `contactpersonname` varchar(255) DEFAULT NULL,
  `mobilenumber` varchar(45) DEFAULT NULL,
  `landlinenumber` varchar(45) DEFAULT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `creditperioddays` int(11) DEFAULT NULL,
  `tenantid` int(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`ledgerdetailsId`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_additional_details`
--



--
-- Table structure for table `balancesheet`
--

DROP TABLE IF EXISTS `balancesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balancesheet` (
`balsheetid` bigint(20) NOT NULL AUTO_INCREMENT,
`date` datetime DEFAULT NULL,
`category_underid` bigint(20) DEFAULT '0',
`categoryid` bigint(20) DEFAULT '0',
`groupid` bigint(20) DEFAULT '0',
`tenantid` int(11) DEFAULT '0',
`amount` double DEFAULT NULL,
`createdby` int(11) DEFAULT '0',
`modifiedby` int(11) DEFAULT '0',
`treatment` varchar(45) DEFAULT NULL,
`group_name` varchar(45) DEFAULT NULL,
`category_name` varchar(45) DEFAULT NULL,
`category_under_name` varchar(45) DEFAULT NULL,
`ledgertype` bigint(13) DEFAULT '0',
PRIMARY KEY (`balsheetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balancesheet`
--



--
-- Table structure for table `code`
--



--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry` (
`entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
`accountmasterid` bigint(20) NOT NULL,
`amount` double NOT NULL,
`amounttype` varchar(255) DEFAULT NULL,
`createdby` int(11) NOT NULL,
`createdon` datetime DEFAULT NULL,
`entrydatetime` datetime DEFAULT NULL,
`entrytype` bigint(20) NOT NULL,
`modifiedby` int(11) NOT NULL,
`modifiedon` datetime DEFAULT NULL,
`narration` varchar(255) DEFAULT NULL,
`referencebillno` varchar(255) DEFAULT NULL,
`remarks` varchar(255) DEFAULT NULL,
`tenantid` int(11) NOT NULL,
`totalamount` double NOT NULL,
`transactionid` bigint(20) NOT NULL,
`voucherno` varchar(20) DEFAULT NULL,
`prefix` varchar(50) DEFAULT NULL,
`suffix` varchar(50) DEFAULT NULL,
`vouchernumberdigit` varchar(50) DEFAULT NULL,
PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--


--
-- Table structure for table `entry_additionaldetails`
--

DROP TABLE IF EXISTS `entry_additionaldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_additionaldetails` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`transactionId` bigint(11) DEFAULT '0',
`bankName` varchar(40) DEFAULT NULL,
`chequeNo` varchar(30) DEFAULT NULL,
`chequeDate` datetime DEFAULT NULL,
`cleared` int(11) DEFAULT '0',
`remarks` varchar(50) DEFAULT NULL,
`createdOn` datetime DEFAULT NULL,
`createdBy` int(11) DEFAULT '0',
`modifiedOn` datetime DEFAULT NULL,
`modifiedBy` int(11) DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_additionaldetails`
--



--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger` (
`ledgerid` int(11) NOT NULL AUTO_INCREMENT,
`ledgertype` bigint(20) DEFAULT '0',
`tags` varchar(255) DEFAULT NULL,
`transactionid` bigint(11) DEFAULT '0',
`transactiondate` datetime DEFAULT NULL,
`openingbalancedate` datetime DEFAULT NULL,
`debitopeningbalance` double DEFAULT '0',
`creditopeningbalance` double DEFAULT '0',
`narration` varchar(45) DEFAULT NULL,
`entrytype` varchar(45) DEFAULT NULL,
`voucherno` varchar(45) DEFAULT NULL,
`referencebillno` varchar(45) DEFAULT NULL,
`debitamount` double DEFAULT '0',
`creditamount` double DEFAULT '0',
`debitclosingbalance` double DEFAULT '0',
`creditclosingbalance` double DEFAULT '0',
`particulars` varchar(45) DEFAULT NULL,
`tenantid` bigint(11) DEFAULT '0',
`userid` bigint(11) DEFAULT '0',
`createdby` bigint(11) DEFAULT '0',
`createdon` datetime DEFAULT NULL,
`modifiedby` bigint(11) DEFAULT '0',
`modifiedon` datetime DEFAULT NULL,
`entry_id` bigint(11) DEFAULT '0',
PRIMARY KEY (`ledgerid`),
KEY `fk_Ledger_type_idx` (`ledgertype`),
KEY `fk_Ledger_entrytype_idx` (`transactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--



--
-- Table structure for table `profitandloss`
--

DROP TABLE IF EXISTS `profitandloss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profitandloss` (
`pnlid` bigint(20) NOT NULL AUTO_INCREMENT,
`pnldate` datetime DEFAULT NULL,
`categoryid` bigint(20) DEFAULT NULL,
`groupid` bigint(20) DEFAULT NULL,
`amount` double DEFAULT '0',
`CreatedOn` datetime DEFAULT NULL,
`CreatedBy` int(11) DEFAULT '0',
`ModifiedOn` datetime DEFAULT NULL,
`ModifiedBy` int(11) DEFAULT '0',
`ledgerid` bigint(20) DEFAULT NULL,
`category_name` varchar(45) DEFAULT NULL,
`categoryunderid` int(11) DEFAULT '0',
`group_name` varchar(45) DEFAULT NULL,
`treatment` int(11) DEFAULT '0',
`ledger_name` varchar(45) DEFAULT NULL,
`ledgertype` bigint(13) DEFAULT '0',
PRIMARY KEY (`pnlid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profitandloss`
--


--
-- Table structure for table `sequence_data`
--

CREATE TABLE `sequence_data` (
`sequence_name` varchar(100) NOT NULL,
`sequence_increment` int(11) unsigned NOT NULL DEFAULT '1',
`sequence_min_value` int(11) unsigned NOT NULL DEFAULT '1',
`sequence_max_value` bigint(20) unsigned NOT NULL DEFAULT '18446744073709551615',
`sequence_cur_value` bigint(20) unsigned DEFAULT '1',
`sequence_cycle` tinyint(1) NOT NULL DEFAULT '0',
PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_data`
--


--
-- Table structure for table `society_name`
--

DROP TABLE IF EXISTS `accounting_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_tenant` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`tenantid` int(11) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_name`
--




--
-- Table structure for table `trialbalance`
--

DROP TABLE IF EXISTS `trialbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trialbalance` (
`trial_id` bigint(20) NOT NULL AUTO_INCREMENT,
`accountMasterId` bigint(20) DEFAULT '0',
`debitClosingBalance` double DEFAULT '0',
`creditClosingBalance` double DEFAULT '0',
`tenantId` int(11) DEFAULT '0',
`date` datetime DEFAULT NULL,
`RefLedgerId` int(11) DEFAULT NULL,
`groupid` int(11) DEFAULT '0',
`categoryid` int(11) DEFAULT '0',
`finalclosingblance` double DEFAULT '0',
`treatment` varchar(45) DEFAULT NULL,
`previousclosingbalance` double DEFAULT '0',
PRIMARY KEY (`trial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `accountingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountingdetails` (
  `accountid` int(11) NOT NULL AUTO_INCREMENT,
  `accountingmasterid` int(11) DEFAULT '0',
  `amount` double DEFAULT NULL,
  `creditclosingbalance` double DEFAULT NULL,
  `debitclosingbalance` double DEFAULT NULL,
  `treatment` varchar(30) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `investments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investments` (
  `investmentid` int(11) NOT NULL AUTO_INCREMENT,
  `investedate` datetime DEFAULT NULL,
  `maturitydate` datetime DEFAULT NULL,
  `bankname` varchar(140) DEFAULT NULL,
  `bankaddress` varchar(140) DEFAULT NULL,
  `fdnumber` varchar(30) DEFAULT NULL,
  `investmentperiod` int(11) DEFAULT NULL,
  `tenantid` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `rate` double DEFAULT '0',
  `investmentamount` double DEFAULT '0',
  `maturityvalue` double DEFAULT '0',
  `interestedcompunded` varchar(34) DEFAULT NULL,
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`investmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `accruedinterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accruedinterest` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`investmentid` int(11) DEFAULT NULL,
`finyear` varchar(25) DEFAULT NULL,
`date_of_val` datetime DEFAULT NULL,
`interestamount` double DEFAULT NULL,
`cummlativeamount` double DEFAULT NULL,
`tdsamount` double DEFAULT '0',
`banktdsamount` double DEFAULT '0',
`bankinterestamount` double DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `societysettings`;
CREATE TABLE `societysettings` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`openingdate` datetime DEFAULT NULL,
`chequedataallow` int(11) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
`masterid` int(11) DEFAULT NULL,
`name` varchar(50) DEFAULT NULL,
`parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `accountingvouchersettings`;
CREATE TABLE `accountingvouchersettings` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`tenantid` int(11) DEFAULT '0',
`vouchertype` varchar(50) DEFAULT NULL,
`Vouchernumbering` varchar(50) DEFAULT NULL,
`vouchernumberingprefix` varchar(50) DEFAULT NULL,
`vouchernumberingsuffix` varchar(50) DEFAULT NULL,
`duplicatevoucherno` int(11) DEFAULT '0',
`voucherprint` int(11) DEFAULT '0',
`createdby` int(11) DEFAULT '0',
`modifiedby` int(11) DEFAULT '0',
`createdon` datetime DEFAULT NULL,
`modifiedon` datetime DEFAULT NULL,
`vouchernumberingstartfrom` varchar(50) DEFAULT NULL,
`vouchernoreset` varchar(50) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


insert into accountingvouchersettings
values ('1', '1', (select codeid from code where code='ENT_RECEIPT' and codetype='VOUCHERTYPE'), 'Manual', NULL, NULL, '0', '0', '0', '0', '2019-10-19 13:06:56', NULL, NULL, NULL),
('2', '1', (select codeid from code where code='ENT_PAYMENT' and codetype='VOUCHERTYPE'), 'Manual', NULL, NULL, '0', '0', '0', '0', '2019-10-19 13:06:56', NULL, NULL, NULL),
('3', '1', (select codeid from code where code='ENT_CONTRA' and codetype='VOUCHERTYPE'), 'Manual', NULL, NULL, '0', '0', '0', '0', '2019-10-19 13:06:56', NULL, NULL, NULL),
('4', '1', (select codeid from code where code='ENT_PURCHASE' and codetype='VOUCHERTYPE'), 'Manual', NULL, NULL, '0', '0', '0', '0', '2019-10-19 13:06:56', NULL, NULL, NULL),
('5', '1', (select codeid from code where code='ENT_JOURNAL' and codetype='VOUCHERTYPE'), 'Manual', NULL, NULL, '0', '0', '0', '0', '2019-10-19 13:06:56', NULL, NULL, NULL),
('6', '1', (select codeid from code where code='ENT_REVENUE' and codetype='VOUCHERTYPE'), 'Manual', NULL, NULL, '0', '0', '0', '0', '2019-10-19 13:06:56', NULL, NULL, NULL);








/*Functions */;

/* Generate TransactionId */;
/* To Generate the dynamic transactionID When creating voucher entry */;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `generated_sequence`(seq_name varchar(100)) RETURNS bigint(20)
BEGIN
DECLARE cur_val bigint(20);
SELECT
sequence_cur_value INTO cur_val
FROM
`sequence_data`
WHERE
sequence_name = seq_name FOR update;

IF cur_val IS NOT NULL THEN
UPDATE
`sequence_data`
SET
sequence_cur_value = IF (
(sequence_cur_value + sequence_increment) > sequence_max_value,
IF (
sequence_cycle = TRUE,
sequence_min_value,
NULL
),
sequence_cur_value + sequence_increment
)
WHERE
sequence_name = seq_name;
SELECT
sequence_cur_value INTO cur_val
FROM
`sequence_data`
WHERE
sequence_name = seq_name;
else
insert into `sequence_data`(sequence_name) values(seq_name);
SELECT
sequence_cur_value INTO cur_val
FROM
`sequence_data`
WHERE
sequence_name = seq_name;
END IF;







RETURN cur_val;
END$$
DELIMITER ;



/* Procedures */;

/* Back_Insert */;
/* Back Insert  handles the previous dates entries */;
/* Back Insert insert  or update the table in trialbalance,balancesheet,profitandloss,acccountingdetails */;



/* CreateAccountingTables  */;
/* Create Accountingtables create dynamic table  generation */;
/* CreateAccountingTables  acc  */;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAccountingTables`(in society_code varchar(50),out response varchar(15))
BEGIN

set society_code=CONCAT(society_code,'_');
SET @t1 =CONCAT('Create Table',' ',society_code,'accountingconfigmaster  like accountingconfigmaster ' );
SET @t2=CONCAT('Create Table',' ',society_code,'ledger_additional_details like ledger_additional_details' );
SET @t3=CONCAT('Create Table',' ',society_code,'entry like  entry' );
SET @t4=CONCAT('Create Table',' ',society_code,'entry_additionaldetails like entry_additionaldetails' );
SET @t5=CONCAT('Create Table',' ',society_code,'ledger like ledger' );
SET @t6=CONCAT('Create Table',' ',society_code,'trialbalance like trialbalance' );
SET @t7=CONCAT('Create Table',' ',society_code,'balancesheet like balancesheet' );
SET @t8=CONCAT('Create Table',' ',society_code,'profitandloss like  profitandloss' );
SET @t9=CONCAT('Create Table',' ',society_code,'accountingdetails like  accountingdetails' );
SET @t10=CONCAT('Create Table',' ',society_code,'investments like  investments' );
SET @t11=CONCAT('Create Table',' ',society_code,'accruedinterest like  accruedinterest' );
SET @t12=CONCAT('Create Table',' ',society_code,'societysettings like  societysettings' );
SET @t13=CONCAT('Create Table',' ',society_code,'accountingvouchersettings like  accountingvouchersettings' );



PREPARE param_stmt1 FROM @t1;
PREPARE param_stmt2 FROM @t2;
PREPARE param_stmt3 FROM @t3;
PREPARE param_stmt4 FROM @t4;
PREPARE param_stmt5 FROM @t5;
PREPARE param_stmt6 FROM @t6;
PREPARE param_stmt7 FROM @t7;
PREPARE param_stmt8 FROM @t8;
PREPARE param_stmt9 FROM @t9;
PREPARE param_stmt10 FROM @t10;
PREPARE param_stmt11 FROM @t11;
PREPARE param_stmt12 FROM @t12;
PREPARE param_stmt13 FROM @t13;


EXECUTE param_stmt1;
DEALLOCATE PREPARE param_stmt1;
EXECUTE param_stmt2;
DEALLOCATE PREPARE param_stmt2;
EXECUTE param_stmt3;
DEALLOCATE PREPARE param_stmt3;
EXECUTE param_stmt4;
DEALLOCATE PREPARE param_stmt4;
EXECUTE param_stmt5;

DEALLOCATE PREPARE param_stmt5;

EXECUTE param_stmt6;

DEALLOCATE PREPARE param_stmt6;

EXECUTE param_stmt7;

DEALLOCATE PREPARE param_stmt7;
EXECUTE param_stmt8;

DEALLOCATE PREPARE param_stmt8;
EXECUTE param_stmt9;

DEALLOCATE PREPARE param_stmt9;
EXECUTE param_stmt10;

DEALLOCATE PREPARE param_stmt10;
EXECUTE param_stmt11;

DEALLOCATE PREPARE param_stmt11;
EXECUTE param_stmt12;

DEALLOCATE PREPARE param_stmt12;
EXECUTE param_stmt13;

DEALLOCATE PREPARE param_stmt13;



SET @t14=CONCAT('insert into ',' ',society_code,'accountingvouchersettings select * from   accountingvouchersettings' );
SET @t15=CONCAT('insert into ',' ',society_code,'accountingconfigmaster select * from   accountingconfigmaster' );

select @t14;

select @t15;

PREPARE param_stmt14 FROM @t14;
PREPARE param_stmt15 FROM @t15;
EXECUTE param_stmt14;

DEALLOCATE PREPARE param_stmt14;

EXECUTE param_stmt15;

DEALLOCATE PREPARE param_stmt15;







set response='success';




END$$
DELIMITER ;

















/* Back_Insert */;
/* Back Insert  handles the previous dates entries */;
/* Back Insert insert  or update the table in trialbalance,balancesheet,profitandloss,acccountingdetails */;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Back_Insert`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in bal_groupid bigint ,in bal_category_underid int,in amount double,in reledgerid bigint)
BEGIN



declare txndat datetime;




set society_code=CONCAT(society_code,'_');
SET @t1=CONCAT('insert into temp select t.masterid as masterid,name, @pv:=t.configmasterparentid as parent from (select * from    ','  ',society_code,'accountingconfigmaster where masterid >', bal_groupid ,' order by masterid desc) t inner join (select @pv:=',accountMasterId1,' )tmp where t.masterid=@pv');
select @t1;

PREPARE param_stmt FROM @t1;

EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;




while Date(txndate) <= Date(CURDATE()) Do
select txndate;


select "success";
call accountingdetailsinsert(society_code,accountMasterId1,debitClosingBalance,creditClosingBalance,tenantId,txndate,RefLedgerId,groupid1,categoryid,amounttype,category_underid,bal_categoryid,bal_groupid,bal_category_underid,amount,reledgerid);



set @trialcount=0;


SET @t1=CONCAT('select count(*) into @trialcount from',' ',society_code,'trialbalance where accountMasterId =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;






-- select @trialcount := count(*) from trialbalance where accountMasterId=accountMasterId1 and date=txndate;
-- select DateAdd(@txndate,Interval 1 Day) ;
if @trialcount <= 0
then

SET @t1=CONCAT('Insert into',' ',society_code,'trialbalance(accountMasterId,debitClosingBalance,creditClosingBalance,tenantId,date,RefLedgerId,groupid,categoryid) values(',accountMasterId1,',',debitClosingBalance,',',creditClosingBalance,',',tenantId,',','"',txndate,'",',RefLedgerId,',',groupid1,',',categoryid,')' );
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'trialbalance set creditClosingBalance=creditClosingBalance+',creditClosingBalance,' ','where accountMasterId=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'trialbalance set debitClosingBalance=debitClosingBalance+',debitClosingBalance,' ','where accountMasterId=',accountMasterId1, ' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
end if;







select "success" ;
end if;


set @balcount=0;


SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'balancesheet where ledgertype =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @balcount := count(*) from balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then



select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;




SET @t2=CONCAT('Insert into',' ',society_code,'balancesheet(date,category_underid,categoryid,groupid,tenantid,amount,ledgertype) values("',txndate,'",',category_underid,',',bal_categoryid,',',bal_groupid,',',tenantId,',',amount,',',accountMasterId1,')' );

PREPARE param_stmt FROM @t2;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;





else

set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from   ',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @category_undername := name from accountingconfigmaster where masterid=bal_category_underid;

select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then
select "success12333";
SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');
select @t3;

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;



else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;

elseif @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;

else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;



else
SET @t4=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t4;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;




end if;










end if;


set @treatment=0;
SET @t1=CONCAT('select treatment into @treatment from  ','  ',society_code,'accountingconfigmaster where masterid =',groupid1);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @treatment := treatment from accountingconfigmaster where masterid=groupid1;

if @treatment > 0

then



set @pnlcount=0;


SET @t1=CONCAT('select count(*) into @pnlcount from',' ',society_code,'profitandloss where ledgertype =',accountMasterId1,' ','and pnldate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @pnlcount := count(*) from profitandloss where groupid=bal_groupid and pnldate=txndate;



if @pnlcount <= 0

then
select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;

SET @t2=CONCAT('Insert into',' ',society_code,'profitandloss(pnldate,categoryid,groupid,amount,ledgerid,ledgertype) values("',txndate,'",',bal_categoryid,',',bal_groupid,',',amount,',',reledgerid,',',accountMasterId1,')' );

PREPARE param_stmt FROM @t2;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;





else



SET @t3=CONCAT('update',' ',society_code,'profitandloss set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and pnldate=','"',txndate,'"');


PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;







end if;

end if;






set txndate = (txndate +Interval 1 Day);
END WHILE;



truncate table temp;









END$$
DELIMITER ;



/* Forward_Insert */;
/* Forward Insert  handles the future and current dates entries */;
/* Back Insert insert  or update the table in trialbalance,balancesheet,profitandloss,acccountingdetails */;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Forward_Insert`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in bal_groupid bigint ,in bal_category_underid int,in amount double,in reledgerid bigint)
BEGIN



declare txndat datetime;


set society_code=CONCAT(society_code,'_');

SET @t1=CONCAT('insert into temp select t.masterid as masterid,name, @pv:=t.configmasterparentid as parent from (select * from  ',society_code,'accountingconfigmaster where masterid >', bal_groupid ,' order by masterid desc) t inner join (select @pv:=',accountMasterId1,' )tmp where t.masterid=@pv');
select @t1;

PREPARE param_stmt FROM @t1;

EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;








select "success";
call accountingdetailsinsert(society_code,accountMasterId1,debitClosingBalance,creditClosingBalance,tenantId,txndate,RefLedgerId,groupid1,categoryid,amounttype,category_underid,bal_categoryid,bal_groupid,bal_category_underid,amount,reledgerid);



set @trialcount=0;


SET @t1=CONCAT('select count(*) into @trialcount from',' ',society_code,'trialbalance where accountMasterId =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;






-- select @trialcount := count(*) from trialbalance where accountMasterId=accountMasterId1 and date=txndate;
-- select DateAdd(@txndate,Interval 1 Day) ;
if @trialcount <= 0
then

SET @t1=CONCAT('Insert into',' ',society_code,'trialbalance(accountMasterId,debitClosingBalance,creditClosingBalance,tenantId,date,RefLedgerId,groupid,categoryid) values(',accountMasterId1,',',debitClosingBalance,',',creditClosingBalance,',',tenantId,',','"',txndate,'",',RefLedgerId,',',groupid1,',',categoryid,')' );
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'trialbalance set creditClosingBalance=creditClosingBalance+',creditClosingBalance,' ','where accountMasterId=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'trialbalance set debitClosingBalance=debitClosingBalance+',debitClosingBalance,' ','where accountMasterId=',accountMasterId1, ' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
end if;







select "success" ;
end if;


set @balcount=0;


SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'balancesheet where ledgertype =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @balcount := count(*) from balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then



select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;




SET @t2=CONCAT('Insert into',' ',society_code,'balancesheet(date,category_underid,categoryid,groupid,tenantid,amount,ledgertype) values("',txndate,'",',category_underid,',',bal_categoryid,',',bal_groupid,',',tenantId,',',amount,',',accountMasterId1,')' );

PREPARE param_stmt FROM @t2;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;





else

set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @category_undername := name from accountingconfigmaster where masterid=bal_category_underid;

select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then
select "success12333";
SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');
select @t3;

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;



else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;

elseif @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;

else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;



else
SET @t4=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t4;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;




end if;










end if;


set @treatment=0;
SET @t1=CONCAT('select treatment into @treatment from',' ',society_code,'accountingconfigmaster where masterid =',groupid1);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @treatment := treatment from accountingconfigmaster where masterid=groupid1;

if @treatment > 0

then



set @pnlcount=0;


SET @t1=CONCAT('select count(*) into @pnlcount from',' ',society_code,'profitandloss where ledgertype =',accountMasterId1,' ','and pnldate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @pnlcount := count(*) from profitandloss where groupid=bal_groupid and pnldate=txndate;



if @pnlcount <= 0

then
select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;

SET @t2=CONCAT('Insert into',' ',society_code,'profitandloss(pnldate,categoryid,groupid,amount,ledgerid,ledgertype) values("',txndate,'",',bal_categoryid,',',bal_groupid,',',amount,',',reledgerid,',',accountMasterId1,')' );

PREPARE param_stmt FROM @t2;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;





else



SET @t3=CONCAT('update',' ',society_code,'profitandloss set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and pnldate=','"',txndate,'"');


PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;







end if;

end if;




truncate table temp;













END$$
DELIMITER ;



/* accountingdetailsinsert */;
/* accountingdetailsinsert  insert  the future and current dates entries in accountingtables  */;
/* accountingdetailsinsert insert  or update the table in tacccountingdetails */;





DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `accountingdetailsinsert`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in  bal_groupid bigint ,in bal_category_underid int,in amount double,in  reledgerid bigint)
BEGIN











Declare d int default 0;
Declare masterid1 int;

Declare accountingcursor CURSOR for select distinct masterid from temp;
Declare CONTINUE HANDLER FOR SQLSTATE '02000' SET
d=1;
Declare CONTINUE HANDLER FOR SQLSTATE '23000' SET
d=1;






OPEN accountingcursor;

lbl:LOOP
IF d=1 THEN
LEAVE lbl;
END IF;
IF NOT d=1 THEN

FETCH accountingcursor INTO masterid1;


select masterid1;
IF d=1 THEN

LEAVE lbl;
END IF;
set  @balcount=0;

SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'accountingdetails where accountingmasterid =',masterid1,'  ','and txndate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;
select  @balcount;

-- select @balcount :=  count(*) from  balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then


set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;




select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

if  @creditordebit = 0
then

set amount=(-1 * amount);


SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


else

set amount=amount;
SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

end if;


elseif  @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0

then

set amount=amount;
SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

else
set amount=(-1 * amount);


SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

end if;


else

set amount=amount;

SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );
PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


end if;


else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'accountingdetails set creditclosingbalance=creditClosingBalance+',creditClosingBalance,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'accountingdetails set debitclosingbalance=debitClosingBalance+',debitClosingBalance,' ','where accountingmasterid=',masterid1, '  ','and txndate=','"',txndate,'"');


PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
end if;







set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;

-- select @category_undername :=  name from  where masterid=bal_category_underid;

select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0

then
select  "success12333";
SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount-',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');
select @t3;

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;



else

SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount+',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


end if;

elseif  @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0

then

SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount+',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

else

SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount-',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


end if;



else
SET @t4=CONCAT('update',' ',society_code,'accountingdetails set amount=amount+',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');


PREPARE param_stmt FROM @t4;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;




end if;










end if;






END IF;
END LOOP;

CLOSE accountingcursor;














END$$
DELIMITER ;


/* Opening_balance */;
/* Opening_balance  insert  the openingbalance */;
/* Opening_balance insert  or update the table in acccountingdetails */;




DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Opening_balance`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in bal_groupid bigint ,in bal_category_underid int,in amount double,in reledgerid bigint)
BEGIN



set society_code=CONCAT(society_code,'_');
select "suceess";
SET @t1=CONCAT('insert into temp select t.masterid as masterid,name, @pv:=t.configmasterparentid as parent from (select * from ',society_code,'accountingconfigmaster where masterid>',groupid1 ,' order by masterid desc) t join (select @pv:=',accountMasterId1,')tmp where t.masterid=@pv');

select @t1;

PREPARE param_stmt FROM @t1;

EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;


while Date(txndate) <= Date(CURDATE()) Do
select txndate;

call accountingdetailsinsertopeningbalance(society_code,accountMasterId1,debitClosingBalance,creditClosingBalance,tenantId,txndate,RefLedgerId,groupid1,categoryid,amounttype,category_underid,bal_categoryid,bal_groupid,bal_category_underid,amount,reledgerid);






set @trialcount=0;


SET @t1=CONCAT('select count(*) into @trialcount from',' ',society_code,'trialbalance where accountMasterId =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;






-- select @trialcount := count(*) from trialbalance where accountMasterId=accountMasterId1 and date=txndate;
-- select DateAdd(@txndate,Interval 1 Day) ;
if @trialcount <= 0
then

SET @t1=CONCAT('Insert into',' ',society_code,'trialbalance(accountMasterId,debitClosingBalance,creditClosingBalance,tenantId,date,RefLedgerId,groupid,categoryid) values(',accountMasterId1,',',debitClosingBalance,',',creditClosingBalance,',',tenantId,',','"',txndate,'",',RefLedgerId,',',groupid1,',',categoryid,')' );
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'trialbalance set creditClosingBalance=creditClosingBalance+',creditClosingBalance,' ','where accountMasterId=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'trialbalance set debitClosingBalance=debitClosingBalance+',debitClosingBalance,' ','where accountMasterId=',accountMasterId1, ' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
end if;







select "success" ;
end if;


set @balcount=0;


SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'balancesheet where ledgertype =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @balcount := count(*) from balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then



select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;




SET @t2=CONCAT('Insert into',' ',society_code,'balancesheet(date,category_underid,categoryid,groupid,tenantid,amount,ledgertype) values("',txndate,'",',category_underid,',',bal_categoryid,',',bal_groupid,',',tenantId,',',amount,',',accountMasterId1,')' );

PREPARE param_stmt FROM @t2;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;





else

set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @category_undername := name from accountingconfigmaster where masterid=bal_category_underid;

select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then
select "success12333";
SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');
select @t3;

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;



else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;

elseif @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;

else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;



else
SET @t4=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t4;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;




end if;










end if;









set txndate = (txndate +Interval 1 Day);
END WHILE;



END$$
DELIMITER ;




/* accountingdetailsinsertopeningbalance */;
/* accountingdetailsinsertopeningbalance  insert  the openingbalance */;
/* accountingdetailsinsertopeningbalance insert  or update the table in acccountingdetails */;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `accountingdetailsinsertopeningbalance`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in bal_groupid bigint ,in bal_category_underid int,in amount double,in reledgerid bigint)
BEGIN











Declare d int default 0;
Declare masterid1 int;

Declare accountingcursor CURSOR for select distinct masterid from temp;
Declare CONTINUE HANDLER FOR SQLSTATE '02000' SET
d=1;
Declare CONTINUE HANDLER FOR SQLSTATE '23000' SET
d=1;






OPEN accountingcursor;

lbl:LOOP
IF d=1 THEN
LEAVE lbl;
END IF;
IF NOT d=1 THEN

FETCH accountingcursor INTO masterid1;


select masterid1;
IF d=1 THEN

LEAVE lbl;
END IF;


set  @balcount=0;

SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'accountingdetails where accountingmasterid =',masterid1,'  ','and txndate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;


if @balcount <= 0

then

SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


else





select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'accountingdetails set creditclosingbalance=creditClosingBalance+',creditClosingBalance,'  ',',amount=amount+',amount ,'   where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

select @t1;
PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'accountingdetails set debitclosingbalance=debitclosingbalance+',debitClosingBalance,'  ',',amount=amount+',amount ,'   where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

select @t1;
PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
end if;

















end if;




















END IF;
END LOOP;

CLOSE accountingcursor;







END$$
DELIMITER ;




/* Delete_Entry */;
/* Delete_Entry  delete entry */;
/* Delete_Entry  delete the data in accountingdetails,balancesheet,profitandloss,trialbalance */;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Entry`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in groupid1 int ,in amounttype varchar(25),in amount double)
BEGIN







set society_code=CONCAT(society_code,'_');

SET @t1=CONCAT('insert into temp select t.masterid as masterid,name, @pv:=t.configmasterparentid as parent from (select * from   ',society_code,'accountingconfigmaster where masterid >', groupid1 ,' order by masterid desc) t inner join (select @pv:=',accountMasterId1,' )tmp where t.masterid=@pv');
select @t1;

PREPARE param_stmt FROM @t1;

EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;




while Date(txndate) <= Date(CURDATE()) Do


select "success";

call deleteaccountingdetails(society_code,accountMasterId1,debitClosingBalance,creditClosingBalance,tenantId,txndate,groupid1,amounttype,amount);


set txndate = (txndate +Interval 1 Day);
END WHILE;



truncate table temp;









END$$
DELIMITER ;




/* deleteaccountingdetails */;
/* deleteaccountingdetails  delete entry */;
/* deleteaccountingdetails  delete the data in accountingdetails,balancesheet,profitandloss,trialbalance */;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteaccountingdetails`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in groupid1 int ,in amounttype varchar(25),in amount double)
BEGIN











Declare d int default 0;
Declare masterid1 int;

Declare accountingcursor CURSOR for select distinct masterid from temp;
Declare CONTINUE HANDLER FOR SQLSTATE '02000' SET
d=1;
Declare CONTINUE HANDLER FOR SQLSTATE '23000' SET
d=1;






OPEN accountingcursor;

lbl:LOOP
IF d=1 THEN
LEAVE lbl;
END IF;
IF NOT d=1 THEN

FETCH accountingcursor INTO masterid1;


select masterid1;
IF d=1 THEN

LEAVE lbl;
END IF;
set @balcount=0;

SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'accountingdetails where accountingmasterid =',masterid1,' ','and txndate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;
select @balcount;

-- select @balcount := count(*) from balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then



select "nothing";





else

set  @amount=0;
SET @t1=CONCAT('select SIGN(amount) into @amount from',' ',society_code,'accountingdetails where accountingmasterid =',masterid1,'  ','and txndate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;
 

if @amount <= -1 
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'accountingdetails set creditclosingbalance=creditClosingBalance-',creditClosingBalance,' ',',amount=amount+',amount ,' where accountingmasterid=',masterid1,' ','and txndate=','"',txndate,'"');

select @t1;
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'accountingdetails set debitclosingbalance=debitclosingbalance-',debitClosingBalance,' ',',amount=amount+',amount ,' where accountingmasterid=',masterid1,' ','and txndate=','"',txndate,'"');

select @t1;
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
end if;

else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'accountingdetails set creditclosingbalance=creditClosingBalance-',creditClosingBalance,'  ',',amount=amount-',amount ,'   where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

select @t1;
PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'accountingdetails set debitclosingbalance=debitclosingbalance-',debitClosingBalance,'  ',',amount=amount-',amount ,'   where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

select @t1;
PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
end if;























end if;

end if;






END IF;
END LOOP;

CLOSE accountingcursor;







END$$
DELIMITER ;




































