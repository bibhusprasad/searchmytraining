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
  `certfctId` int(11) NOT NULL,
  `certfctName` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`certfctId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_certificationdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_certificationdetails` */

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_contcatinfomaster` */

insert  into `tbl_contcatinfomaster`(`contctinfoId`,`emailId`,`website`,`cntcPersName`,`userId`) values (28,'abc@gmail.com','www.softinfology.com','Chetan Lohar',116),(29,'ch@gmail.com','www.abc.com','Chetan',70),(34,NULL,NULL,'abc def',78),(35,NULL,NULL,'chetan',99),(36,NULL,NULL,'cheatn',109),(37,NULL,NULL,'Chetan Lohar',109),(38,NULL,NULL,'Chetan Lohar',109),(39,NULL,NULL,'Chetan Lohar',109),(40,NULL,NULL,'Chetan Lohar',109),(41,'chetan@softinfo.com','www','adadfsdfsadf',112),(42,'chetan@softinfo.com','www','adadfsdfsadf',112),(43,'chetan@softinfo.com','www','adadfsdfsadf',112),(44,'a@b.com','w','sadfsadf',114),(45,'a@b.com','q','fafsdfs',116);

/*Table structure for table `tbl_edudetails` */

DROP TABLE IF EXISTS `tbl_edudetails`;

CREATE TABLE `tbl_edudetails` (
  `eduDetailId` int(11) NOT NULL,
  `specltnId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `unvrstyName` varchar(50) DEFAULT NULL,
  `yop` int(11) DEFAULT NULL,
  `grdOther` varchar(50) DEFAULT NULL,
  `postOther` varchar(50) DEFAULT NULL,
  `other` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eduDetailId`)
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

insert  into `tbl_employmentdetails`(`emplmntId`,`employmentType`,`employer`,`jobProfile`,`userId`,`indusrysubid`) values (1,'Full Time','adfsdfas','sdafsdaf',92,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_freelancerregdetails` */

insert  into `tbl_freelancerregdetails`(`freelancerId`,`fullName`,`city`,`contact`,`email`,`password`,`userId`) values (1,'chetan h lohar','Pune','1231231231','a@b.com','123',NULL),(2,'Chetan Lohar',NULL,'8446448344','a@b.com','123123',115);

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_instprofiledetails` */

insert  into `tbl_instprofiledetails`(`compInfoId`,`companyName`,`yrofEstablmnt`,`historyOfCompany`,`hrsOfOpertn`,`workingDays`,`trngMethodology`,`userId`) values (56,'Softinfology Pvt. Ltd',2003,'Nice History','9 am to 7 pm','MON, TUE, WED, THU, FRI, SAT','Online and Offline',116),(57,'abcabc',1999,'nice history','9 am to 7 PM','MON, TUE, WED, THU, FRI, SAT','Online and offline',70),(58,'abcdeeref',NULL,'','','MON, TUE, WED, THU, FRI, SAT','',78);

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
  CONSTRAINT `tbl_keyclients_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_keyclients` */

insert  into `tbl_keyclients`(`keyClientId`,`clientName`,`userId`) values (1,'Capegemini',70),(2,'TCS',70),(3,'Accenture',70),(4,'fsdfasdfsdf',99),(5,'sfsdaf',99),(6,'adsf',99),(7,'sdafdf',99);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_locainfodetails` */

insert  into `tbl_locainfodetails`(`locDetialsId`,`buildingNo`,`street`,`landmark`,`pincode`,`cityId`,`userId`) values (6,'Sr No. 11/19','Hadapsar Bypass Road','ICICI Bank',411014,1,116),(7,'Sr No. 11/19','Hadapsar Bypass','ICICI Bank',411014,1,70),(8,'aaaaaa','aaaaaa','aaaaaa',411014,1,102),(9,'adasd','asdasd','asda',411014,5,107),(10,'Sr no. 11/19','Hadapsar Bypass Road','ICICI bank',411014,9,112);

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_phonedetails` */

insert  into `tbl_phonedetails`(`phoneId`,`phnTypeId`,`userId`,`phoneValue`) values (41,1,112,'3698521478'),(42,3,112,'9856321478'),(43,4,112,'02088888888'),(47,1,114,'8754213652'),(48,1,114,'02088888887'),(49,3,114,'89562314875'),(50,1,116,'8754213265'),(51,2,116,'02025874136');

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

insert  into `tbl_profesnlassociation`(`asscoId`,`assocName`,`userId`) values (1,'abc INC.',70),(2,'xyz Inc.',70),(3,'pqr INC',70),(4,'sdfsdf',99),(5,'safsdf',99),(6,'sdfasdf',99);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_traineedetails` */

insert  into `tbl_traineedetails`(`traineeId`,`fullName`,`organizationName`,`traineeType`,`emailid`,`phone`,`userId`) values (4,'a','a','Corporate','a','a',NULL),(5,'Chetan Lohar','','Individual','c@h.com','8446448344',34),(6,'Chetan','Seed Infotech','Corporate','a','844644834',35),(7,'a b c','','Individual','a@b.com','88888888',36),(8,'Chetan Lohar','Seed Infotech','Corporate','a@b.com','8446448344',38),(9,'aaaaaaaaa','aaaaaaa','Corporate','a','a',42),(10,'aaaaaaaaa','aaaaaaa','Corporate','a','a',43),(11,'aaaaaaaaa','aaaaaaa','Corporate','a','a',44),(12,'aaaaaaaaaa','a','Corporate','a','a',45),(13,'aaaaaaaa','a','Corporate','a','a',46),(14,'aaaaaaaa','aaaaaaaa','Corporate','a','a',47),(15,'aaaaaa','aaaaaaa','Corporate','','a',48),(16,'aaaaaaa','aa','Corporate','a@b.com','a',49),(17,'aaaaaa','a','Corporate','abc@gmaill.com','a',50),(18,'aaaaa','aaaaa','Corporate','a@b.com','1231231211',51),(19,'aaaaaa','aaaaa','Corporate','a@b.com','1111111111',52),(20,'aaaaaa','aaaaa','Corporate','a@b.com','1111111111',53),(21,'aaaaaa','aaaaaa','Corporate','a@b.com','a',54),(22,'aaaaaa','aaaaaaa','Corporate','a@b.com','1234561231',55),(23,'aaaaaa','aaaaa','Corporate','a@b.com','1',56),(24,'aaaaaaa','','Individual','a@b.com','11111',57),(25,'aaaaaa','aaaaaa','Corporate','a@gmail.com','aaaaaa',58),(26,'aaaaaa','aaaaaa','Corporate','abc@gmail.com','1231231231',59),(27,'Chean H Lohar','Seed Infotech','Corporate','abcc@gmail.com','8446448344',71),(28,'Chetan','abc Inc','Corporate','abc@gmail.com','84464448344',73),(29,'chetan','abcde','Corporate','a@b.com','8484848484',75),(30,'fsdfsdf','dgdfgdfgsd','Corporate','abc@gmail.com','8446448344',76),(31,'Chetan','Seed','Corporate','abc@gmail.com','8446448344',77),(32,'abcabc','abcabcabc','Corporate','A@B.COM','8446448344',79),(33,'ateseta','abcabc','Corporate','abc@b.com','8446448344',81),(34,'Chetan Lohar','Seed Infotech','Corporate','a@b.com','8446448344',82),(35,'chetanloahr','seed infotech','Corporate','a@b.com','8446448344',83),(36,'aaaaaaa','','Individual','abc@gmail.com','7878787878',84),(37,'aaaaaa','','Individual','a@b.com','8787878787',85),(38,'aaaaaa','aaaaaaa','Corporate','a@b.com','1234567890',86),(39,'chetan h lohar','chetan h lohar','Corporate','a@b.com','8446448344',87),(40,'chetan h lohar','chetan h lohar','Corporate','a@b.com','8446448344',88),(41,'chetan h lohar','chetan h lohar','Corporate','a@b.com','8446448344',89),(42,'asdsad','dssdass','Corporate','a@b.com','1231321321',90),(43,'asdasd','sadsadad','Corporate','a@b.xi','1231231231',91),(44,'asdfsadf','asdfsdaf','Corporate','a@b.ct','1231231231',92),(45,'asdfsadf','asdfsadf','Corporate','a@b.co','1231231231',93),(46,'sdafsdf','asdfsdfa','Corporate','a@b.com','1231231231',94),(47,'asdfaa','asdf','Corporate','a@b.co','1231231213',95),(48,'dasfsdf','','Individual','a@c.om','1231231122',96),(49,'sadfsdafsdf','adfsafsd','Corporate','a@b.com','1231231231',97),(50,'Cehtan','abcadfs','Corporate','a@b.com','8446448344',98),(51,'asdfsdf','','Individual','a@b.com','1231231231',100),(52,'asfsafasf','adsfsdf','Corporate','a@b.com','3213213211',103),(53,'asdfsf','sadfsdf','Corporate','a@b.co','3213213211',104),(54,'afsadf','','Individual','a@b.com','1231231231',105),(55,'sdfsafsf','asdfsdf','Corporate','a@b.om','3213213211',106),(56,'sdfsdfsaf','sadfsdfaf','Corporate','a@b.com','1231231123',107),(57,'adsfsdf','sdafsfsadf','Corporate','a@b.com','1232123123',108),(58,'asdsadsad','dasdasdsad','Corporate','a@b.com','3213213211',110),(59,'sdfsafsdf','safsdfasd','Corporate','a@b.com','8754216369',111),(60,'adadfsdfsadf','asdfsdafsdf','Corporate','a@b.com','3698521478',112),(61,'sdfsadfsd','sadfsafdasdf','Corporate','a@b.com','8484848484',113),(62,'sadfsadf','seed infotech','Corporate','a@b.com','8754213652',114),(63,'fafsdfs','','Individual','a@b.com','8754213265',116);

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
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trainerregdetails` */

insert  into `tbl_trainerregdetails`(`trainer_id`,`org_name`,`city`,`contact`,`email`,`password`,`userid`) values (609,'a','Pune','1','a','a',NULL),(610,'a','Pune','1','a','a',23),(611,'Seed Infotech','Pune','8446448344','a@b.com','123',24),(612,'abc','Pune','7878978983','swagatika.dwibedi@gmail.com','123456',25),(613,'swa','Pune','5456566567','swa@gmail.com','123456',26),(614,'abc','Pune','4444444444','abc@gmail.com','123',27),(615,'a','Pune','4554544554','swa@gmail.com','123456',28),(616,'Impetus','Pune','1231231231','a@b.com','123123',29),(617,'Impetus','Pune','1231231231','a@b.com','123123',30),(618,'abc','Pune','1231231231','a@b.com','123',31),(619,'ABC','Pune','1231231231','ABC@GMAIL.COM','123',32),(620,'abc tech','Pune','8446448344','a@b.com','123123',33),(621,'Seed Infotech','Pune','1234564569','abc@gmail.com','123123',37),(622,'aaaaaaa','Pune','1111111111','a@b.com','1231231',39),(623,'See INfotech','Pune','1234567897','abc@gmail.com','1234567',40),(624,'aaaaaa','Pune','1234567897','a@g.com','1231234',41),(625,'addfsdaf','Pune','1231231231','abc@gmail.com','123123',60),(626,'abcderf','Pune','1231231231','abc@gmail.com','123123',61),(627,'abcdedfer','Pune','5874698745','abc@gmail.com','123123',62),(628,'abcdefere','Pune','8745211147','abc@gmail.com','123456789',63),(629,'ieieieie','Pune','8787878787','a@b.com','787878',64),(630,'','Pune','','','',65),(631,'sdafsdfsd','Pune','8484848484','a@b.com','123123',66),(632,'abcabc','Pune','8446448344','abc@gmail.com','123123',67),(633,'abcabc','Pune','1231231231','abc@gmail.com','123123',68),(634,'abcabc','Pune','1234567897','abc@gmail.com','123123',69),(635,'abcabc','Pune','8585858585','ch@gmail.com','1231231',70),(636,'adfasfsdf','Pune','8787878787','abc@gmail.com','1231231',72),(637,'abcabc','Pune','8448448448','a@b.com','1231231',74),(638,'abcdeeref','Pune','8446448344','a@b.com','123123',78),(639,'Seed Infotech','Pune','8446448344','a@b.com','123123',80),(640,'asfsdfsdf','Pune','1231231231','a@b.com','123123',99),(641,'asdfsdf','Pune','1231231231','a@v.co','123123',101),(642,'adfsdfdfa','Pune','8446448344','abc@b.com','123123',102),(643,'qasdasdasd','Mumbai','1232131231','a@c.mi','123123',109);

/*Table structure for table `tbl_trngcalender` */

DROP TABLE IF EXISTS `tbl_trngcalender`;

CREATE TABLE `tbl_trngcalender` (
  `trngId` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
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
  PRIMARY KEY (`trngId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_trngcalender_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trngcalender` */

insert  into `tbl_trngcalender`(`trngId`,`code`,`title`,`keywords`,`start_date`,`end_date`,`price`,`brochure`,`type`,`status`,`createdOn`,`createdBy`,`updatedOn`,`updatedBy`,`userId`,`description`,`contenttype`) values (18,'aaa','Spring','Spring, Java, project','2015-05-25','2015-06-30',3000,'C:\\SearchMT\\Git SMT url.txt','Seminar','New','2015-05-21 18:04:12','aaa','2015-05-21 18:04:12','',115,'Industry Training','text/plain');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`userId`,`username`,`password`,`enabled`,`accountNonExpired`,`accountNonLocked`,`credentialsNonExpired`,`created_on`,`created_by`,`Modified_on`,`Modified_by`,`statusId`) values (23,'a','a',1,1,1,1,'2015-05-09 12:12:59','SELF','2015-05-09 12:12:59','SELF',1),(24,'a@b.com','123',1,1,1,1,'2015-05-09 16:13:36','SELF','2015-05-09 16:13:36','SELF',1),(25,'swagatika.dwibedi@gmail.com','123456',1,1,1,1,'2015-05-09 16:26:28','SELF','2015-05-09 16:26:28','SELF',1),(26,'swa@gmail.com','123456',1,1,1,1,'2015-05-09 16:31:15','SELF','2015-05-09 16:31:15','SELF',1),(27,'abc@gmail.com','123',1,1,1,1,'2015-05-09 16:40:04','SELF','2015-05-09 16:40:04','SELF',1),(28,'swa@gmail.com','123456',1,1,1,1,'2015-05-09 16:44:03','SELF','2015-05-09 16:44:03','SELF',1),(29,'a@b.com','123123',1,1,1,1,'2015-05-09 16:57:28','SELF','2015-05-09 16:57:28','SELF',1),(30,'a@b.com','123123',1,1,1,1,'2015-05-09 16:57:29','SELF','2015-05-09 16:57:29','SELF',1),(31,'a@b.com','123',1,1,1,1,'2015-05-09 17:01:30','SELF','2015-05-09 17:01:30','SELF',1),(32,'ABC@GMAIL.COM','123',1,1,1,1,'2015-05-09 17:04:21','SELF','2015-05-09 17:04:21','SELF',1),(33,'a@b.com','123123',1,1,1,1,'2015-05-11 11:02:49','SELF','2015-05-11 11:02:49','SELF',1),(34,'c@h.com','123',1,1,1,1,'2015-05-11 12:24:08','SELF','2015-05-11 12:24:08','SELF',1),(35,'a','123',1,1,1,1,'2015-05-11 12:26:54','SELF','2015-05-11 12:26:54','SELF',1),(36,'a@b.com','123',1,1,1,1,'2015-05-11 13:04:56','SELF','2015-05-11 13:04:56','SELF',1),(37,'abc@gmail.com','123123',1,1,1,1,'2015-05-11 16:34:56','SELF','2015-05-11 16:34:56','SELF',1),(38,'a@b.com','123',1,1,1,1,'2015-05-11 18:49:22','SELF','2015-05-11 18:49:22','SELF',1),(39,'a@b.com','1231231',1,1,1,1,'2015-05-11 19:44:11','SELF','2015-05-11 19:44:11','SELF',1),(40,'abc@gmail.com','1234567',1,1,1,1,'2015-05-11 21:09:07','SELF','2015-05-11 21:09:07','SELF',1),(41,'a@g.com','1231234',1,1,1,1,'2015-05-11 21:20:24','SELF','2015-05-11 21:20:24','SELF',1),(42,'a','a',1,1,1,1,'2015-05-12 16:03:11','SELF','2015-05-12 16:03:11','SELF',1),(43,'a','a',1,1,1,1,'2015-05-12 16:03:46','SELF','2015-05-12 16:03:46','SELF',1),(44,'a','a',1,1,1,1,'2015-05-12 16:03:52','SELF','2015-05-12 16:03:52','SELF',1),(45,'a','a',1,1,1,1,'2015-05-12 16:07:21','SELF','2015-05-12 16:07:21','SELF',1),(46,'a','a',1,1,1,1,'2015-05-12 16:12:14','SELF','2015-05-12 16:12:14','SELF',1),(47,'a','a',1,1,1,1,'2015-05-12 16:14:33','SELF','2015-05-12 16:14:33','SELF',1),(48,'','',1,1,1,1,'2015-05-12 18:43:02','SELF','2015-05-12 18:43:02','SELF',1),(49,'a@b.com','a',1,1,1,1,'2015-05-12 19:06:07','SELF','2015-05-12 19:06:07','SELF',1),(50,'abc@gmaill.com','123',1,1,1,1,'2015-05-12 19:13:11','SELF','2015-05-12 19:13:11','SELF',1),(51,'a@b.com','123',1,1,1,1,'2015-05-12 20:22:52','SELF','2015-05-12 20:22:52','SELF',1),(52,'a@b.com','123',1,1,1,1,'2015-05-12 21:09:14','SELF','2015-05-12 21:09:14','SELF',1),(53,'a@b.com','',1,1,1,1,'2015-05-12 21:10:04','SELF','2015-05-12 21:10:04','SELF',1),(54,'a@b.com','a',1,1,1,1,'2015-05-12 21:11:07','SELF','2015-05-12 21:11:07','SELF',1),(55,'a@b.com','1231',1,1,1,1,'2015-05-12 21:16:30','SELF','2015-05-12 21:16:30','SELF',1),(56,'a@b.com','123',1,1,1,1,'2015-05-12 21:27:57','SELF','2015-05-12 21:27:57','SELF',1),(57,'a@b.com','123',1,1,1,1,'2015-05-13 12:40:06','SELF','2015-05-13 12:40:06','SELF',1),(58,'a@gmail.com','123123123',1,1,1,1,'2015-05-13 13:03:55','SELF','2015-05-13 13:03:55','SELF',1),(59,'abc@gmail.com','123123',1,1,1,1,'2015-05-14 12:43:21','SELF','2015-05-14 12:43:21','SELF',1),(60,'abc@gmail.com','123123',1,1,1,1,'2015-05-14 16:59:01','SELF','2015-05-14 16:59:01','SELF',1),(61,'abc@gmail.com','123123',1,1,1,1,'2015-05-14 17:07:55','SELF','2015-05-14 17:07:55','SELF',1),(62,'abc@gmail.com','123123',1,1,1,1,'2015-05-14 17:11:14','SELF','2015-05-14 17:11:14','SELF',1),(63,'abc@gmail.com','123456789',1,1,1,1,'2015-05-14 17:12:39','SELF','2015-05-14 17:12:39','SELF',1),(64,'a@b.com','787878',1,1,1,1,'2015-05-14 17:13:47','SELF','2015-05-14 17:13:47','SELF',1),(65,'','',1,1,1,1,'2015-05-14 17:46:41','SELF','2015-05-14 17:46:41','SELF',1),(66,'a@b.com','123123',1,1,1,1,'2015-05-15 12:11:03','SELF','2015-05-15 12:11:03','SELF',1),(67,'abc@gmail.com','123123',1,1,1,1,'2015-05-15 13:10:38','SELF','2015-05-15 13:10:38','SELF',1),(68,'abc@gmail.com','123123',1,1,1,1,'2015-05-15 13:53:28','SELF','2015-05-15 13:53:28','SELF',1),(69,'abc@gmail.com','123123',1,1,1,1,'2015-05-15 13:54:18','SELF','2015-05-15 13:54:18','SELF',1),(70,'ch@gmail.com','1231231',1,1,1,1,'2015-05-15 14:24:20','SELF','2015-05-15 14:24:20','SELF',1),(71,'abcc@gmail.com','abcabc',1,1,1,1,'2015-05-15 19:17:00','SELF','2015-05-15 19:17:00','SELF',1),(72,'abc@gmail.com','1231231',1,1,1,1,'2015-05-15 19:31:38','SELF','2015-05-15 19:31:38','SELF',1),(73,'abc@gmail.com','chetan844',1,1,1,1,'2015-05-15 19:59:25','SELF','2015-05-15 19:59:25','SELF',1),(74,'a@b.com','1231231',1,1,1,1,'2015-05-16 09:20:00','SELF','2015-05-16 09:20:00','SELF',1),(75,'a@b.com','123',1,1,1,1,'2015-05-16 09:20:41','SELF','2015-05-16 09:20:41','SELF',1),(76,'abc@gmail.com','12312312',1,1,1,1,'2015-05-16 21:05:29','SELF','2015-05-16 21:05:29','SELF',1),(77,'abc@gmail.com','123123',1,1,1,1,'2015-05-18 09:10:48','SELF','2015-05-18 09:10:48','SELF',1),(78,'a@b.com','123123',1,1,1,1,'2015-05-18 09:42:33','SELF','2015-05-18 09:42:33','SELF',1),(79,'A@B.COM','123123',1,1,1,1,'2015-05-18 10:43:18','SELF','2015-05-18 10:43:18','SELF',1),(80,'a@b.com','123123',1,1,1,1,'2015-05-18 21:21:08','SELF','2015-05-18 21:21:08','SELF',1),(81,'abc@b.com','1231231',1,1,1,1,'2015-05-19 02:36:55','SELF','2015-05-19 02:36:55','SELF',1),(82,'a@b.com','123123',1,1,1,1,'2015-05-19 11:16:15','SELF','2015-05-19 11:16:15','SELF',1),(83,'a@b.com','1231231',1,1,1,1,'2015-05-19 16:47:32','SELF','2015-05-19 16:47:32','SELF',1),(84,'abc@gmail.com','1231231',1,1,1,1,'2015-05-19 17:04:02','SELF','2015-05-19 17:04:02','SELF',1),(85,'a@b.com','1231231',1,1,1,1,'2015-05-19 17:07:25','SELF','2015-05-19 17:07:25','SELF',1),(86,'a@b.com','123123',1,1,1,1,'2015-05-19 17:55:02','SELF','2015-05-19 17:55:02','SELF',1),(87,'a@b.com','123123',1,1,1,1,'2015-05-19 19:47:39','SELF','2015-05-19 19:47:39','SELF',1),(88,'a@b.com','123123',1,1,1,1,'2015-05-19 19:48:02','SELF','2015-05-19 19:48:02','SELF',1),(89,'a@b.com','123123',1,1,1,1,'2015-05-19 19:48:03','SELF','2015-05-19 19:48:03','SELF',1),(90,'a@b.com','123123',1,1,1,1,'2015-05-19 20:01:20','SELF','2015-05-19 20:01:20','SELF',1),(91,'a@b.xi','abcder',1,1,1,1,'2015-05-19 20:34:09','SELF','2015-05-19 20:34:09','SELF',1),(92,'a@b.ct','123123',1,1,1,1,'2015-05-19 20:37:04','SELF','2015-05-19 20:37:04','SELF',1),(93,'a@b.co','1231231',1,1,1,1,'2015-05-19 21:04:14','SELF','2015-05-19 21:04:14','SELF',1),(94,'a@b.com','1231231',1,1,1,1,'2015-05-19 21:12:26','SELF','2015-05-19 21:12:26','SELF',1),(95,'a@b.co','123123',1,1,1,1,'2015-05-19 21:17:04','SELF','2015-05-19 21:17:04','SELF',1),(96,'a@c.om','123123',1,1,1,1,'2015-05-19 21:18:22','SELF','2015-05-19 21:18:22','SELF',1),(97,'a@b.com','123123',1,1,1,1,'2015-05-19 22:34:07','SELF','2015-05-19 22:34:07','SELF',1),(98,'a@b.com','123123',1,1,1,1,'2015-05-20 13:31:53','SELF','2015-05-20 13:31:53','SELF',1),(99,'a@b.com','123123',1,1,1,1,'2015-05-20 17:46:27','SELF','2015-05-20 17:46:27','SELF',1),(100,'a@b.com','123123',1,1,1,1,'2015-05-20 19:28:53','SELF','2015-05-20 19:28:53','SELF',1),(101,'a@v.co','123123',1,1,1,1,'2015-05-20 19:29:34','SELF','2015-05-20 19:29:34','SELF',1),(102,'abc@b.com','123123',1,1,1,1,'2015-05-20 19:41:43','SELF','2015-05-20 19:41:43','SELF',1),(103,'a@b.com','123123',1,1,1,1,'2015-05-20 21:05:19','SELF','2015-05-20 21:05:19','SELF',1),(104,'a@b.co','1231231',1,1,1,1,'2015-05-20 21:19:45','SELF','2015-05-20 21:19:45','SELF',1),(105,'a@b.com','asdfasdf',1,1,1,1,'2015-05-20 21:32:47','SELF','2015-05-20 21:32:47','SELF',1),(106,'a@b.om','123123',1,1,1,1,'2015-05-20 21:44:22','SELF','2015-05-20 21:44:22','SELF',1),(107,'a@b.com','123123',1,1,1,1,'2015-05-20 21:55:23','SELF','2015-05-20 21:55:23','SELF',1),(108,'a@b.com','123123',1,1,1,1,'2015-05-21 09:25:47','SELF','2015-05-21 09:25:47','SELF',1),(109,'a@c.mi','123123',1,1,1,1,'2015-05-21 09:33:45','SELF','2015-05-21 09:33:45','SELF',1),(110,'a@b.com','123123',1,1,1,1,'2015-05-21 15:50:36','SELF','2015-05-21 15:50:36','SELF',1),(111,'a@b.com','123456',1,1,1,1,'2015-05-21 16:05:05','SELF','2015-05-21 16:05:05','SELF',1),(112,'a@b.com','123123',1,1,1,1,'2015-05-21 16:51:55','SELF','2015-05-21 16:51:55','SELF',1),(113,'a@b.com','123123',1,1,1,1,'2015-05-21 17:33:49','SELF','2015-05-21 17:33:49','SELF',1),(114,'a@b.com','1231231',1,1,1,1,'2015-05-21 17:49:39','SELF','2015-05-21 17:49:39','SELF',1),(115,'a@b.com','123123',1,1,1,1,'2015-05-21 18:03:11','SELF','2015-05-21 18:03:11','SELF',1),(116,'a@b.com','123123',1,1,1,1,'2015-05-21 18:27:28','SELF','2015-05-21 18:27:28','SELF',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
