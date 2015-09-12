/*
SQLyog Community v12.03 (32 bit)
MySQL - 5.5.11 : Database - searchmytraining
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`searchmytraining` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `searchmytraining`;

/*Table structure for table `tbl_activitymaster` */

DROP TABLE IF EXISTS `tbl_activitymaster`;

CREATE TABLE `tbl_activitymaster` (
  `actId` int(11) NOT NULL,
  `actName` varchar(50) DEFAULT NULL,
  `actDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_activitymaster` */

insert  into `tbl_activitymaster`(`actId`,`actName`,`actDescription`) values (1,'Login','When User Will Login'),(2,'logout','When User Will Logout'),(3,'update location info','User Will Update Location Information'),(4,'update contact info','User Will Update Contact Information');

/*Table structure for table `tbl_alrtndnotfction` */

DROP TABLE IF EXISTS `tbl_alrtndnotfction`;

CREATE TABLE `tbl_alrtndnotfction` (
  `alrtId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `alertTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`alrtId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_alrtndnotfction` */

/*Table structure for table `tbl_alrttypemaster` */

DROP TABLE IF EXISTS `tbl_alrttypemaster`;

CREATE TABLE `tbl_alrttypemaster` (
  `alertTypeId` int(11) NOT NULL,
  `alertType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alertTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_alrttypemaster` */

insert  into `tbl_alrttypemaster`(`alertTypeId`,`alertType`) values (1,'Training Alert_Email'),(2,'Training Alert_SMS'),(3,'Important Notification FROM Search My Training_Email'),(4,'Important Notification FROM Search My Training_SMS'),(5,'Communication FROM providers_Email'),(6,'Communication FROM providers_SMS'),(7,'News Letter/Blogs_Email'),(8,'News Letter/Blogs_SMS'),(9,'Other Promotion Special Offers_Email'),(10,'Other Promotion Special Offers_SMS');

/*Table structure for table `tbl_certificationdetails` */

DROP TABLE IF EXISTS `tbl_certificationdetails`;

CREATE TABLE `tbl_certificationdetails` (
  `certfctId` int(11) NOT NULL AUTO_INCREMENT,
  `certfctName` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`certfctId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_certificationdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_certificationdetails` */

insert  into `tbl_certificationdetails`(`certfctId`,`certfctName`,`userId`) values (1,' sdfsdfsf sdf  sdf  fsd fsf ',NULL);

/*Table structure for table `tbl_citymaster` */

DROP TABLE IF EXISTS `tbl_citymaster`;

CREATE TABLE `tbl_citymaster` (
  `cityId` int(11) NOT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cityId`),
  KEY `stateId` (`stateId`),
  CONSTRAINT `tbl_citymaster_ibfk_1` FOREIGN KEY (`stateId`) REFERENCES `tbl_statemaster` (`stateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_citymaster` */

insert  into `tbl_citymaster`(`cityId`,`cityName`,`stateId`) values (1,'PUNE',1),(2,'NAGPUR',1),(3,'MUMBAI',1),(4,'Nashik',1),(5,'Ahemedabad',2),(6,'Surat',2),(7,'Hyderabad',3),(8,'Banglore',4),(9,'Tallahassee',5),(10,'Austin',6),(11,'Albany',7);

/*Table structure for table `tbl_cntrymaster` */

DROP TABLE IF EXISTS `tbl_cntrymaster`;

CREATE TABLE `tbl_cntrymaster` (
  `countryId` int(11) NOT NULL,
  `countryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_cntrymaster` */

insert  into `tbl_cntrymaster`(`countryId`,`countryName`) values (1,'INDIA'),(2,'USA'),(3,'ENGLAND'),(4,'NEW ZEALAND'),(5,'PAKISTAN'),(6,'NEPAL'),(7,'SRI LANKA');

/*Table structure for table `tbl_contcatinfomaster` */

DROP TABLE IF EXISTS `tbl_contcatinfomaster`;

CREATE TABLE `tbl_contcatinfomaster` (
  `contctinfoId` int(11) NOT NULL AUTO_INCREMENT,
  `emailId` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `cntcPersName` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`contctinfoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_contcatinfomaster_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_contcatinfomaster` */

/*Table structure for table `tbl_edudetails` */

DROP TABLE IF EXISTS `tbl_edudetails`;

CREATE TABLE `tbl_edudetails` (
  `eduDetailId` int(11) NOT NULL,
  `unvrstyName` varchar(50) DEFAULT NULL,
  `yop` int(11) DEFAULT NULL,
  `grdOther` varchar(50) DEFAULT NULL,
  `postOther` varchar(50) DEFAULT NULL,
  `dother` varchar(50) DEFAULT NULL,
  `specltnId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`eduDetailId`),
  KEY `cons_edudet_fk_userid` (`userId`),
  CONSTRAINT `cons_edudet_fk_userid` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_edudetails` */

/*Table structure for table `tbl_edumaster` */

DROP TABLE IF EXISTS `tbl_edumaster`;

CREATE TABLE `tbl_edumaster` (
  `eduid` int(11) NOT NULL,
  `eduTypeBit` varchar(50) DEFAULT NULL,
  `eduName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eduid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_edumaster` */

insert  into `tbl_edumaster`(`eduid`,`eduTypeBit`,`eduName`) values (1,'D','DIPLOMA'),(2,'G','BA'),(3,'G','BCOM'),(4,'G','BSC'),(5,'G','BE/BTECH'),(6,'P','MBA'),(7,'P','ME/MTECH/MS'),(8,'P','MA'),(9,'P','MCOM'),(10,'P','MCS'),(11,'G','BCA'),(12,'P','MCA');

/*Table structure for table `tbl_eduspecmaster` */

DROP TABLE IF EXISTS `tbl_eduspecmaster`;

CREATE TABLE `tbl_eduspecmaster` (
  `specltnId` int(11) NOT NULL,
  `specltnName` varchar(50) DEFAULT NULL,
  `eduid` int(11) DEFAULT NULL,
  PRIMARY KEY (`specltnId`),
  KEY `eduid` (`eduid`),
  CONSTRAINT `tbl_eduspecmaster_ibfk_1` FOREIGN KEY (`eduid`) REFERENCES `tbl_edumaster` (`eduid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_eduspecmaster` */

insert  into `tbl_eduspecmaster`(`specltnId`,`specltnName`,`eduid`) values (101,'CS/CSE/IT/COMPUTER ENGINEERING',5),(102,'ELECTRONICS ENGINEERING',5),(103,'ENTC',5),(104,'CIVIL ENGINEERING',5),(105,'MECHANICAL ENGINEERING',5),(106,'AUTOMOBILE ENGINEERING',5),(107,'PRODUCTION',5),(108,'IT',6),(109,'MARKETING',6),(110,'HUMAN RESOURCES',6);

/*Table structure for table `tbl_employmentdetails` */

DROP TABLE IF EXISTS `tbl_employmentdetails`;

CREATE TABLE `tbl_employmentdetails` (
  `emplmntId` int(11) NOT NULL AUTO_INCREMENT,
  `employmentType` varchar(50) DEFAULT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `jobProfile` varchar(200) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `indusrysubid` int(11) DEFAULT NULL,
  PRIMARY KEY (`emplmntId`),
  KEY `userId` (`userId`),
  KEY `indusrysubid` (`indusrysubid`),
  CONSTRAINT `tbl_employmentdetails_ibfk_3` FOREIGN KEY (`indusrysubid`) REFERENCES `tbl_trnsubcatmaster` (`trnIndstrSubCatId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_employmentdetails_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_employmentdetails` */

insert  into `tbl_employmentdetails`(`emplmntId`,`employmentType`,`employer`,`jobProfile`,`userId`,`indusrysubid`) values (1,'Full Time','adfsdfas','sdafsdaf',NULL,2);

/*Table structure for table `tbl_freelancerregdetails` */

DROP TABLE IF EXISTS `tbl_freelancerregdetails`;

CREATE TABLE `tbl_freelancerregdetails` (
  `freelancerId` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`freelancerId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_freelancerregdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_freelancerregdetails` */

insert  into `tbl_freelancerregdetails`(`freelancerId`,`fullName`,`city`,`contact`,`email`,`password`,`userId`) values (1,'chetan h lohar','Pune','1231231231','a@b.com','123',NULL),(2,'Chetan Lohar',NULL,'8446448344','a@b.com','123123',NULL),(3,'chetan lohar',NULL,'8754213265','a@b.com','123123',NULL),(4,'Chetan Lohar',NULL,'8446448344','a@b.com','123123',NULL),(5,'Chetan Lohar',NULL,'8446448344','a@b.com','1231231',NULL),(6,'asdfasdfsdf',NULL,'8754213265','a@b.com','abc844',NULL),(7,'Achetan Lohar',NULL,'8754213698','a@b.com','123123',NULL),(8,'chetan lohar',NULL,'8446448344','a@bc.com','123123',NULL),(9,'adfasdfsf',NULL,'3698521478','a@b.com','784512',NULL),(10,'aaaaaa',NULL,'9865321478','a@b.com','321645',NULL),(11,'Chetan',NULL,'8754213265','abc@gmail.com','123456',NULL),(12,'dddasdasd',NULL,'3216549874','a@b.com','123456a',NULL),(13,'dsafsdf',NULL,'1231231231','a@b.com','chetan844',NULL),(14,'Chetan Lohar',NULL,'8446448344','aa@bb.com','chetan844',NULL),(15,'Chetan Lohar',NULL,'8446448344','a@b.com','chetan844',143);

/*Table structure for table `tbl_freelncerprofiledetails` */

DROP TABLE IF EXISTS `tbl_freelncerprofiledetails`;

CREATE TABLE `tbl_freelncerprofiledetails` (
  `freeId` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) DEFAULT NULL,
  `expInMonth` int(10) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`freeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_freelncerprofiledetails` */

/*Table structure for table `tbl_grptrngrequest` */

DROP TABLE IF EXISTS `tbl_grptrngrequest`;

CREATE TABLE `tbl_grptrngrequest` (
  `trngreqId` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `courseTitle` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `trngNeeds` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trngreqId`),
  KEY `cityId` (`cityId`),
  CONSTRAINT `tbl_grptrngrequest_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `tbl_citymaster` (`cityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_grptrngrequest` */

/*Table structure for table `tbl_instprofiledetails` */

DROP TABLE IF EXISTS `tbl_instprofiledetails`;

CREATE TABLE `tbl_instprofiledetails` (
  `compInfoId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) DEFAULT NULL,
  `yrofEstablmnt` int(10) DEFAULT NULL,
  `historyOfCompany` varchar(200) DEFAULT NULL,
  `hrsOfOpertn` varchar(30) DEFAULT NULL,
  `workingDays` varchar(50) DEFAULT NULL,
  `trngMethodology` varchar(200) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`compInfoId`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `tbl_instprofiledetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_instprofiledetails` */

/*Table structure for table `tbl_intrsttrngareas` */

DROP TABLE IF EXISTS `tbl_intrsttrngareas`;

CREATE TABLE `tbl_intrsttrngareas` (
  `userId` int(11) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `intsrId` int(11) DEFAULT NULL,
  KEY `userId` (`userId`),
  KEY `CategoryId` (`CategoryId`),
  CONSTRAINT `tbl_intrsttrngareas_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `tbl_intrsttrngareas_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `tbl_trnindcatmaster` (`trnIndstrCatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_intrsttrngareas` */

/*Table structure for table `tbl_keyclients` */

DROP TABLE IF EXISTS `tbl_keyclients`;

CREATE TABLE `tbl_keyclients` (
  `keyClientId` int(11) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`keyClientId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_keyclients_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_keyclients` */

/*Table structure for table `tbl_locainfodetails` */

DROP TABLE IF EXISTS `tbl_locainfodetails`;

CREATE TABLE `tbl_locainfodetails` (
  `locDetialsId` int(11) NOT NULL AUTO_INCREMENT,
  `buildingNo` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`locDetialsId`),
  KEY `cityId` (`cityId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_locainfodetails_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `tbl_citymaster` (`cityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_locainfodetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_locainfodetails` */

/*Table structure for table `tbl_phonedetails` */

DROP TABLE IF EXISTS `tbl_phonedetails`;

CREATE TABLE `tbl_phonedetails` (
  `phoneId` int(11) NOT NULL AUTO_INCREMENT,
  `phnTypeId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `phoneValue` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`phoneId`),
  UNIQUE KEY `phonevalue_unq` (`phoneValue`),
  KEY `phnTypeId` (`phnTypeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_phonedetails_ibfk_1` FOREIGN KEY (`phnTypeId`) REFERENCES `tbl_phonetypemaster` (`phnTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_phonedetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_phonedetails` */

/*Table structure for table `tbl_phonetypemaster` */

DROP TABLE IF EXISTS `tbl_phonetypemaster`;

CREATE TABLE `tbl_phonetypemaster` (
  `phnTypeId` int(11) NOT NULL,
  `phnTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`phnTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_phonetypemaster` */

insert  into `tbl_phonetypemaster`(`phnTypeId`,`phnTypeName`) values (1,'OFFICE-MOBILE'),(2,'OFFICE-LANDLINE'),(3,'PERSONAL-MOBILE'),(4,'PERSONAL-LANDLINE'),(5,'FAX'),(6,'TOLL FREE');

/*Table structure for table `tbl_profesnlassociation` */

DROP TABLE IF EXISTS `tbl_profesnlassociation`;

CREATE TABLE `tbl_profesnlassociation` (
  `asscoId` int(11) NOT NULL AUTO_INCREMENT,
  `assocName` varchar(100) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`asscoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_profesnlassociation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_profesnlassociation` */

insert  into `tbl_profesnlassociation`(`asscoId`,`assocName`,`userId`) values (1,'abc INC.',NULL),(2,'xyz Inc.',NULL),(3,'pqr INC',NULL),(4,'sdfsdf',NULL),(5,'safsdf',NULL),(6,'sdfasdf',NULL);

/*Table structure for table `tbl_rolemaster` */

DROP TABLE IF EXISTS `tbl_rolemaster`;

CREATE TABLE `tbl_rolemaster` (
  `roleId` int(11) NOT NULL,
  `roleType` varchar(50) DEFAULT NULL,
  `roleDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_rolemaster` */

insert  into `tbl_rolemaster`(`roleId`,`roleType`,`roleDescription`) values (1,'Institute','Corporate organization or any institute'),(2,'Freelancer','Individual User'),(3,'Trainee','Individual or Group Trainee'),(4,'Admin','Master User Of the System');

/*Table structure for table `tbl_statemaster` */

DROP TABLE IF EXISTS `tbl_statemaster`;

CREATE TABLE `tbl_statemaster` (
  `stateId` int(11) NOT NULL,
  `stateName` varchar(50) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`stateId`),
  KEY `countryId` (`countryId`),
  CONSTRAINT `tbl_statemaster_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `tbl_cntrymaster` (`countryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_statemaster` */

insert  into `tbl_statemaster`(`stateId`,`stateName`,`countryId`) values (1,'MAHARASHTRA',1),(2,'GUJRAT',1),(3,'TELANGANA STATE',1),(4,'KARNATAKA',1),(5,'FLORIDA',2),(6,'TEXAS',2),(7,'NEW YORK',2);

/*Table structure for table `tbl_statusmaster` */

DROP TABLE IF EXISTS `tbl_statusmaster`;

CREATE TABLE `tbl_statusmaster` (
  `statusId` int(11) NOT NULL,
  `statusCode` varchar(30) DEFAULT NULL,
  `stsDescription` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_statusmaster` */

insert  into `tbl_statusmaster`(`statusId`,`statusCode`,`stsDescription`,`name`) values (1,'NEW','--','once registered'),(2,'Confirmed','--','Once email conf done'),(3,'Invalid','--','admin verification failed'),(4,'Active','--','Admin USER has verified'),(5,'Deactive','--','Deactive');

/*Table structure for table `tbl_traineedetails` */

DROP TABLE IF EXISTS `tbl_traineedetails`;

CREATE TABLE `tbl_traineedetails` (
  `traineeId` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) DEFAULT NULL,
  `organizationName` varchar(50) DEFAULT NULL,
  `traineeType` varchar(20) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`traineeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_traineedetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_traineedetails` */

insert  into `tbl_traineedetails`(`traineeId`,`fullName`,`organizationName`,`traineeType`,`emailid`,`phone`,`userId`) values (4,'a','a','Corporate','a','a',NULL),(5,'Chetan Lohar','','Individual','c@h.com','8446448344',NULL),(6,'Chetan','Seed Infotech','Corporate','a','844644834',NULL),(7,'a b c','','Individual','a@b.com','88888888',NULL),(8,'Chetan Lohar','Seed Infotech','Corporate','a@b.com','8446448344',NULL),(9,'aaaaaaaaa','aaaaaaa','Corporate','a','a',NULL),(10,'aaaaaaaaa','aaaaaaa','Corporate','a','a',NULL),(11,'aaaaaaaaa','aaaaaaa','Corporate','a','a',NULL),(12,'aaaaaaaaaa','a','Corporate','a','a',NULL),(13,'aaaaaaaa','a','Corporate','a','a',NULL),(14,'aaaaaaaa','aaaaaaaa','Corporate','a','a',NULL),(15,'aaaaaa','aaaaaaa','Corporate','','a',NULL),(16,'aaaaaaa','aa','Corporate','a@b.com','a',NULL),(17,'aaaaaa','a','Corporate','abc@gmaill.com','a',NULL),(18,'aaaaa','aaaaa','Corporate','a@b.com','1231231211',NULL),(19,'aaaaaa','aaaaa','Corporate','a@b.com','1111111111',NULL),(20,'aaaaaa','aaaaa','Corporate','a@b.com','1111111111',NULL),(21,'aaaaaa','aaaaaa','Corporate','a@b.com','a',NULL),(22,'aaaaaa','aaaaaaa','Corporate','a@b.com','1234561231',NULL),(23,'aaaaaa','aaaaa','Corporate','a@b.com','1',NULL),(24,'aaaaaaa','','Individual','a@b.com','11111',NULL),(25,'aaaaaa','aaaaaa','Corporate','a@gmail.com','aaaaaa',NULL),(26,'aaaaaa','aaaaaa','Corporate','abc@gmail.com','1231231231',NULL),(27,'Chean H Lohar','Seed Infotech','Corporate','abcc@gmail.com','8446448344',NULL),(28,'Chetan','abc Inc','Corporate','abc@gmail.com','84464448344',NULL),(29,'chetan','abcde','Corporate','a@b.com','8484848484',NULL),(30,'fsdfsdf','dgdfgdfgsd','Corporate','abc@gmail.com','8446448344',NULL),(31,'Chetan','Seed','Corporate','abc@gmail.com','8446448344',NULL),(32,'abcabc','abcabcabc','Corporate','A@B.COM','8446448344',NULL),(33,'ateseta','abcabc','Corporate','abc@b.com','8446448344',NULL),(34,'Chetan Lohar','Seed Infotech','Corporate','a@b.com','8446448344',NULL),(35,'chetanloahr','seed infotech','Corporate','a@b.com','8446448344',NULL),(36,'aaaaaaa','','Individual','abc@gmail.com','7878787878',NULL),(37,'aaaaaa','','Individual','a@b.com','8787878787',NULL),(38,'aaaaaa','aaaaaaa','Corporate','a@b.com','1234567890',NULL),(39,'chetan h lohar','chetan h lohar','Corporate','a@b.com','8446448344',NULL),(40,'chetan h lohar','chetan h lohar','Corporate','a@b.com','8446448344',NULL),(41,'chetan h lohar','chetan h lohar','Corporate','a@b.com','8446448344',NULL),(42,'asdsad','dssdass','Corporate','a@b.com','1231321321',NULL),(43,'asdasd','sadsadad','Corporate','a@b.xi','1231231231',NULL),(44,'asdfsadf','asdfsdaf','Corporate','a@b.ct','1231231231',NULL),(45,'asdfsadf','asdfsadf','Corporate','a@b.co','1231231231',NULL),(46,'sdafsdf','asdfsdfa','Corporate','a@b.com','1231231231',NULL),(47,'asdfaa','asdf','Corporate','a@b.co','1231231213',NULL),(48,'dasfsdf','','Individual','a@c.om','1231231122',NULL),(49,'sadfsdafsdf','adfsafsd','Corporate','a@b.com','1231231231',NULL),(50,'Cehtan','abcadfs','Corporate','a@b.com','8446448344',NULL),(51,'asdfsdf','','Individual','a@b.com','1231231231',NULL),(52,'asfsafasf','adsfsdf','Corporate','a@b.com','3213213211',NULL),(53,'asdfsf','sadfsdf','Corporate','a@b.co','3213213211',NULL),(54,'afsadf','','Individual','a@b.com','1231231231',NULL),(55,'sdfsafsf','asdfsdf','Corporate','a@b.om','3213213211',NULL),(56,'sdfsdfsaf','sadfsdfaf','Corporate','a@b.com','1231231123',NULL),(57,'adsfsdf','sdafsfsadf','Corporate','a@b.com','1232123123',NULL),(58,'asdsadsad','dasdasdsad','Corporate','a@b.com','3213213211',NULL),(59,'sdfsafsdf','safsdfasd','Corporate','a@b.com','8754216369',NULL),(60,'adadfsdfsadf','asdfsdafsdf','Corporate','a@b.com','3698521478',NULL),(61,'sdfsadfsd','sadfsafdasdf','Corporate','a@b.com','8484848484',NULL),(62,'sadfsadf','seed infotech','Corporate','a@b.com','8754213652',NULL),(63,'fafsdfs','','Individual','a@b.com','8754213265',NULL),(64,'sadfsdaf','adsfsdf','Corporate','a@b.com','9874569899',NULL),(65,'chetanlohar ','chetan lohar','Corporate','a@B.com','8484848484',NULL),(66,'Chetan Lohar','','Individual','chetanlohar@gmail.com','8446448344',NULL),(67,'Chetan Lohar','','Individual','chetanlohar@gmail.com','8446448344',NULL),(68,'Chetan','Seed ','Corporate','a@b.com','1231231231',NULL),(69,'Chetan','Seed Infotech','Corporate','a@bb.com','8446448344',NULL),(70,'Chetan','Mzos pvt. ltd.','Corporate','chetan@gmail.om','7769057555',NULL);

/*Table structure for table `tbl_trainerregdetails` */

DROP TABLE IF EXISTS `tbl_trainerregdetails`;

CREATE TABLE `tbl_trainerregdetails` (
  `trainer_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `cons_trainerregdet_userid_fk` (`userid`),
  CONSTRAINT `cons_trainerregdet_userid_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trainerregdetails` */

insert  into `tbl_trainerregdetails`(`trainer_id`,`org_name`,`city`,`contact`,`email`,`password`,`userid`) values (609,'a','Pune','1','a','a',NULL),(610,'a','Pune','1','a','a',NULL),(611,'Seed Infotech','Pune','8446448344','a@b.com','123',NULL),(612,'abc','Pune','7878978983','swagatika.dwibedi@gmail.com','123456',NULL),(613,'swa','Pune','5456566567','swa@gmail.com','123456',NULL),(614,'abc','Pune','4444444444','abc@gmail.com','123',NULL),(615,'a','Pune','4554544554','swa@gmail.com','123456',NULL),(616,'Impetus','Pune','1231231231','a@b.com','123123',NULL),(617,'Impetus','Pune','1231231231','a@b.com','123123',NULL),(618,'abc','Pune','1231231231','a@b.com','123',NULL),(619,'ABC','Pune','1231231231','ABC@GMAIL.COM','123',NULL),(620,'abc tech','Pune','8446448344','a@b.com','123123',NULL),(621,'Seed Infotech','Pune','1234564569','abc@gmail.com','123123',NULL),(622,'aaaaaaa','Pune','1111111111','a@b.com','1231231',NULL),(623,'See INfotech','Pune','1234567897','abc@gmail.com','1234567',NULL),(624,'aaaaaa','Pune','1234567897','a@g.com','1231234',NULL),(625,'addfsdaf','Pune','1231231231','abc@gmail.com','123123',NULL),(626,'abcderf','Pune','1231231231','abc@gmail.com','123123',NULL),(627,'abcdedfer','Pune','5874698745','abc@gmail.com','123123',NULL),(628,'abcdefere','Pune','8745211147','abc@gmail.com','123456789',NULL),(629,'ieieieie','Pune','8787878787','a@b.com','787878',NULL),(630,'','Pune','','','',NULL),(631,'sdafsdfsd','Pune','8484848484','a@b.com','123123',NULL),(632,'abcabc','Pune','8446448344','abc@gmail.com','123123',NULL),(633,'abcabc','Pune','1231231231','abc@gmail.com','123123',NULL),(634,'abcabc','Pune','1234567897','abc@gmail.com','123123',NULL),(635,'abcabc','Pune','8585858585','ch@gmail.com','1231231',NULL),(636,'adfasfsdf','Pune','8787878787','abc@gmail.com','1231231',NULL),(637,'abcabc','Pune','8448448448','a@b.com','1231231',NULL),(638,'abcdeeref','Pune','8446448344','a@b.com','123123',NULL),(639,'Seed Infotech','Pune','8446448344','a@b.com','123123',NULL),(640,'asfsdfsdf','Pune','1231231231','a@b.com','123123',NULL),(641,'asdfsdf','Pune','1231231231','a@v.co','123123',NULL),(642,'adfsdfdfa','Pune','8446448344','abc@b.com','123123',NULL),(643,'qasdasdasd','Mumbai','1232131231','a@c.mi','123123',NULL),(644,'seed infotech','Pune','1231231231','a@b.com','abcabc',NULL),(645,'dffsdfsf','Pune','8754213658','a@b.com','123123',NULL),(646,'sdfsdafsdf','Pune','8446448344','a@b.com','123123',NULL),(647,'fasdfsadf','Pune','8446448344','a@b.com','chetan844',NULL),(648,'Seed Infotech','Pune','8446448344','a@b.com','chetan844',NULL),(649,'Seed INfotehc','Pune','8446448344','a@b.com','chetan844',NULL),(650,'chetan','Pune','8754215487','a@bb.com','chetan',144),(651,'chetanlohar','Pune','8521478523','at@jati.com','chetan',149),(652,'chetalohar','Pune','8446448344','p@c.om','chetan',150),(653,'loharcheatn','Pune','8574963625','abc@gmail.com','chetan844',152),(654,'asdfsdaf','Pune','8754213265','rr@dd.com','chetan',153),(655,'Seed Infotech','Pune','8446448344','aa@vv.com','chetan844',154);

/*Table structure for table `tbl_trngcalender` */

DROP TABLE IF EXISTS `tbl_trngcalender`;

CREATE TABLE `tbl_trngcalender` (
  `trngId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `brochure` varchar(150) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(30) DEFAULT 'SELF',
  `updatedOn` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updatedBy` varchar(30) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `contenttype` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `vFlag` varchar(30) DEFAULT NULL,
  `trnIndstrSubCatId` int(11) DEFAULT NULL,
  `keyword` text,
  `place` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trngId`),
  KEY `userId` (`userId`),
  KEY `trnIndstrSubCatId` (`trnIndstrSubCatId`),
  CONSTRAINT `tbl_trngcalender_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `tbl_trngcalender_ibfk_2` FOREIGN KEY (`trnIndstrSubCatId`) REFERENCES `tbl_trnsubcatmaster` (`trnIndstrSubCatId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trngcalender` */

insert  into `tbl_trngcalender`(`trngId`,`title`,`code`,`start_date`,`end_date`,`price`,`brochure`,`type`,`status`,`createdOn`,`createdBy`,`updatedOn`,`updatedBy`,`userId`,`description`,`contenttype`,`rank`,`vFlag`,`trnIndstrSubCatId`,`keyword`,`place`) values (44,'Core Java Training','keyCode','2015-06-04','2015-06-06',5000,'C:\\SearchMT\\Jellyfish.jpg','Workshop','New','2015-06-06 20:13:57','aaa','2015-06-03 19:57:47','',154,'Basic Core Java Training','image/jpeg',0,'Not Varified',1,'core,java,j2se,j2ee','Pune'),(45,'spring training','keyCode','2015-06-04','2015-06-06',6000,'C:\\SearchMT\\Penguins.jpg','Seminar','New','2015-06-06 20:14:02','aaa','2015-06-03 19:59:26','',154,'industrial spring training','image/jpeg',0,'Not Varified',1,'java,spring,hibernate,j2ee,jsp,servlet','Banglore'),(46,'advance java training','keyCode','2015-06-06','2015-06-08',8000,'C:\\SearchMT\\Lighthouse.jpg','Workshop','New','2015-06-06 20:14:03','aaa','2015-06-03 20:01:15','',154,'j2ee training workshop','image/jpeg',0,'Not Varified',1,'j2ee,jdbc,jsp,servlet,j2ee,html,java','Nagpur'),(47,'hibernate training','keyCode','2015-06-10','2015-06-11',3000,'C:\\SearchMT\\Koala.jpg','Seminar','New','2015-06-06 20:14:03','aaa','2015-06-03 20:02:54','',154,'industrial hibernate training workshop','image/jpeg',0,'Not Varified',1,'hibernate,j2ee,spring,orm,jpa','Pune'),(48,'Soft skill training','keyCode','2015-06-11','2015-06-12',10000,'C:\\SearchMT\\Jellyfish.jpg','Etc','New','2015-06-06 20:14:04','aaa','2015-06-03 20:05:19','',154,'communication skill training','image/jpeg',0,'Not Varified',7,'softskill,communictaion,personality,development,verbal,nmon-verbal','Mumbai'),(49,'Management training','keyCode','2015-06-13','2015-06-15',15000,'C:\\SearchMT\\Hydrangeas.jpg','Etc','New','2015-06-06 20:14:04','aaa','2015-06-03 20:07:54','',154,'management skill training','image/jpeg',0,'Not Varified',2,'management,decision,making','Nasik'),(50,'HR Training','keyCode','2015-06-12','2015-06-15',1500,'C:\\SearchMT\\Desert.jpg','Etc','New','2015-06-06 20:14:05','aaa','2015-06-03 20:10:32','',154,'HR training','image/jpeg',0,'Not Varified',2,'hr-training,mangement-training','Pune'),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-06-06 20:09:01','SELF','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hyderabad');

/*Table structure for table `tbl_trngenquiry` */

DROP TABLE IF EXISTS `tbl_trngenquiry`;

CREATE TABLE `tbl_trngenquiry` (
  `trngenqId` int(11) NOT NULL,
  `fName` varchar(50) DEFAULT NULL,
  `lName` varchar(50) DEFAULT NULL,
  `courseTitle` varchar(50) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `trngNeed` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trngenqId`),
  KEY `cityId` (`cityId`),
  CONSTRAINT `tbl_trngenquiry_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `tbl_cntrymaster` (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trngenquiry` */

/*Table structure for table `tbl_trngoffrddetails` */

DROP TABLE IF EXISTS `tbl_trngoffrddetails`;

CREATE TABLE `tbl_trngoffrddetails` (
  `offredId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `trnIndstrSubCatId` int(11) DEFAULT NULL,
  PRIMARY KEY (`offredId`),
  KEY `userId` (`userId`),
  KEY `trnIndstrSubCatId` (`trnIndstrSubCatId`),
  CONSTRAINT `tbl_trngoffrddetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `tbl_trngoffrddetails_ibfk_2` FOREIGN KEY (`trnIndstrSubCatId`) REFERENCES `tbl_trnsubcatmaster` (`trnIndstrSubCatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trngoffrddetails` */

/*Table structure for table `tbl_trnindcatmaster` */

DROP TABLE IF EXISTS `tbl_trnindcatmaster`;

CREATE TABLE `tbl_trnindcatmaster` (
  `trnIndstrCatId` int(11) NOT NULL,
  `indstrCatName` varchar(100) DEFAULT NULL,
  `indstrCatDescrption` varchar(200) DEFAULT NULL,
  `trnIndstrId` int(11) DEFAULT NULL,
  PRIMARY KEY (`trnIndstrCatId`),
  KEY `trnIndstrId` (`trnIndstrId`),
  CONSTRAINT `tbl_trnindcatmaster_ibfk_1` FOREIGN KEY (`trnIndstrId`) REFERENCES `tbl_trnindmaster` (`trnIndstrId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trnindcatmaster` */

insert  into `tbl_trnindcatmaster`(`trnIndstrCatId`,`indstrCatName`,`indstrCatDescrption`,`trnIndstrId`) values (1,'Programming','--',1),(2,'Hardware','--',1),(3,'Design','--',1),(4,'Multimedia','--',1),(5,'Finance & Accounting','--',2),(6,'HR, Admin. IR','--',2),(7,'Sales & Marketing','--',2),(8,'Self Development','--',2),(9,'Strategy Management','--',2),(10,'Quality Management','--',3),(11,'Health & Safety','--',4),(12,'Music','--',5),(13,'Painting','--',5),(14,'Pottery','--',5),(15,'Acting','--',5),(16,'Sports','--',5),(17,'Six Sigma','--',6),(18,'Sedex','--',6),(19,'ISO 9001','--',6),(20,'MSCI','--',6);

/*Table structure for table `tbl_trnindmaster` */

DROP TABLE IF EXISTS `tbl_trnindmaster`;

CREATE TABLE `tbl_trnindmaster` (
  `trnIndstrId` int(11) NOT NULL,
  `indstrName` varchar(100) DEFAULT NULL,
  `indstrDescrption` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`trnIndstrId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trnindmaster` */

insert  into `tbl_trnindmaster`(`trnIndstrId`,`indstrName`,`indstrDescrption`) values (1,'Information Technology','--'),(2,'Business & Management','--'),(3,'Engineering & Manufacturing','--'),(4,'Health & Safety','--'),(5,'Art & Craft & Sports','--'),(6,'Certifications','--');

/*Table structure for table `tbl_trnrawrddetails` */

DROP TABLE IF EXISTS `tbl_trnrawrddetails`;

CREATE TABLE `tbl_trnrawrddetails` (
  `awardId` int(11) NOT NULL AUTO_INCREMENT,
  `awardType` varchar(50) DEFAULT NULL,
  `awardName` varchar(50) DEFAULT NULL,
  `yearReceived` varchar(50) DEFAULT NULL,
  `certificate` blob,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`awardId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_trnrawrddetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trnrawrddetails` */

/*Table structure for table `tbl_trnsubcatmaster` */

DROP TABLE IF EXISTS `tbl_trnsubcatmaster`;

CREATE TABLE `tbl_trnsubcatmaster` (
  `trnIndstrSubCatId` int(11) NOT NULL,
  `indstrSubCatName` varchar(100) DEFAULT NULL,
  `indstrSubCatDescrption` varchar(200) DEFAULT NULL,
  `trnIndstrCatId` int(11) DEFAULT NULL,
  PRIMARY KEY (`trnIndstrSubCatId`),
  KEY `trnIndstrCatId` (`trnIndstrCatId`),
  CONSTRAINT `tbl_trnsubcatmaster_ibfk_1` FOREIGN KEY (`trnIndstrCatId`) REFERENCES `tbl_trnindcatmaster` (`trnIndstrCatId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trnsubcatmaster` */

insert  into `tbl_trnsubcatmaster`(`trnIndstrSubCatId`,`indstrSubCatName`,`indstrSubCatDescrption`,`trnIndstrCatId`) values (1,'C','--',1),(2,'C++','--',1),(3,'Java','--',1),(4,'DOT NET','--',1),(5,'OTHER','--',1),(6,'Networking','--',2),(7,'Autocad','--',3),(8,'Corel Draw','--',3),(9,'2D','--',4),(10,'3D','--',4),(11,'Finance & Accounting','--',5),(12,'HR, Admin. IR','--',6),(13,'Sales & Marketing','--',7),(14,'Self Development','--',8),(15,'Strategy Management','--',9),(16,'Quality Management','--',10),(17,'Health & Safety','--',11),(18,'Music','--',12),(19,'Painting','--',13),(20,'Pottery','--',14),(21,'Acting','--',15),(22,'Sports','--',16),(23,'Six Sigma','--',17),(24,'Sedex','--',18),(25,'ISO 9001','--',19),(26,'MSCI','--',20);

/*Table structure for table `tbl_unlistedtraining` */

DROP TABLE IF EXISTS `tbl_unlistedtraining`;

CREATE TABLE `tbl_unlistedtraining` (
  `unlstTrnId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `unlstTrainingStatus` varchar(20) DEFAULT NULL,
  `IndustryId` int(11) DEFAULT NULL,
  `IndustryName` varchar(50) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `CategoryName` varchar(50) DEFAULT NULL,
  `SubCategoryName` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`unlstTrnId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `tbl_unlistedtraining_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_unlistedtraining` */

/*Table structure for table `tbl_usractivitydetails` */

DROP TABLE IF EXISTS `tbl_usractivitydetails`;

CREATE TABLE `tbl_usractivitydetails` (
  `usrActId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sessionId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`usrActId`),
  KEY `actId` (`actId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_usractivitydetails_ibfk_1` FOREIGN KEY (`actId`) REFERENCES `tbl_activitymaster` (`actId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_usractivitydetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_usractivitydetails` */

/*Table structure for table `user_attempts` */

DROP TABLE IF EXISTS `user_attempts`;

CREATE TABLE `user_attempts` (
  `USERID` int(11) NOT NULL,
  `ATTEMPTS` int(11) NOT NULL,
  `LASTMODIFIED` datetime NOT NULL,
  PRIMARY KEY (`USERID`),
  CONSTRAINT `user_attempts_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_attempts` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `USER_ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `ROLE` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  UNIQUE KEY `UK1_USERNAME_ROLE` (`ROLE`,`USERID`),
  KEY `FK1_USER_ROLES` (`USERID`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert  into `user_roles`(`USER_ROLE_ID`,`USERID`,`ROLE`) values (7,143,'TPF'),(8,144,'TPI'),(9,149,'TPI'),(10,150,'TPI'),(11,152,'TPI'),(12,153,'TPI'),(13,154,'TPI');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `accountNonExpired` tinyint(4) NOT NULL DEFAULT '1',
  `accountNonLocked` tinyint(4) NOT NULL DEFAULT '1',
  `credentialsNonExpired` tinyint(4) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `Modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Modified_by` varchar(100) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`statusId`) REFERENCES `tbl_statusmaster` (`statusId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`userId`,`username`,`password`,`enabled`,`accountNonExpired`,`accountNonLocked`,`credentialsNonExpired`,`created_on`,`created_by`,`Modified_on`,`Modified_by`,`statusId`) values (143,'a@b.com','$2a$10$7tBa/DVauFVDW9nI5Ppd5ONEj5QRkzpqSOza3jJelFu5iAF2bnqci',1,1,1,1,'2015-06-03 17:28:41','SELF','2015-06-03 17:28:41','SELF',1),(144,'a@bb.com','$2a$10$5hsNlfUI0bv2oKfzSgRx5.J/yN.W1L/5zCmaBtcQcWn2MmTI0FRDO',1,1,1,1,'2015-06-03 18:21:35','SELF','2015-06-03 18:21:35','SELF',1),(149,'at@jati.com','$2a$10$BRflaVgztiQOhzLfiWVkzOQk0pQQYVQ.Lao.Os5V7alPRnQBxXkbK',1,1,1,1,'2015-06-03 18:31:33','SELF','2015-06-03 18:31:33','SELF',1),(150,'p@c.om','$2a$10$X.cpZRDh2YVqt3DnK2I0XuM28febiEPK.jYtQIRF/Pmr40PhKsz3y',1,1,1,1,'2015-06-03 18:33:45','SELF','2015-06-03 18:33:45','SELF',1),(152,'abc@gmail.com','$2a$10$QxV/QwyCXr3HA9pOD1SPUu8REvZhwdng0S2P7srUqLS67VtG1mlvK',1,1,1,1,'2015-06-03 18:35:15','SELF','2015-06-03 18:35:15','SELF',1),(153,'rr@dd.com','$2a$10$1Wz2GuuAU3GsO9r7aZzI0.nd7VGZ3VxSzZnFB2FHUjgLeA3gJRwz.',1,1,1,1,'2015-06-03 18:35:36','SELF','2015-06-03 18:35:36','SELF',1),(154,'aa@vv.com','$2a$10$5WxqOXbTf7jtgSB2Ord3m.PC/nNOq9Ct9Q1CqTNiyxqMegYLaXzke',1,1,1,1,'2015-06-06 15:05:12','SELF','2015-06-06 15:05:12','SELF',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
