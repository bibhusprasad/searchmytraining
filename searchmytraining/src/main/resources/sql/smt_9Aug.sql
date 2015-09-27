/*
SQLyog Ultimate v10.00 Beta1
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
  `certfctName` text,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`certfctId`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `tbl_certificationdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_certificationdetails` */

insert  into `tbl_certificationdetails`(`certfctId`,`certfctName`,`userId`) values (1,'I got vey good awards whaen kawf ',83),(2,'5ytrrewtber tew erwt',81);

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

insert  into `tbl_citymaster`(`cityId`,`cityName`,`stateId`) values (1,'PUNE',1),(2,'NAGPUR',1),(3,'MUMBAI',1),(4,'NASHIK',1),(5,'AHEMEDABAD',2),(6,'SURAT',2),(7,'HYDERABAD',3),(8,'BANGLORE',4),(9,'TALLAHASSEE',5),(10,'AUSTIN',6),(11,'ALBANY',7);

/*Table structure for table `tbl_cntrymaster` */

DROP TABLE IF EXISTS `tbl_cntrymaster`;

CREATE TABLE `tbl_cntrymaster` (
  `countryId` int(11) NOT NULL,
  `countryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_cntrymaster` */

insert  into `tbl_cntrymaster`(`countryId`,`countryName`) values (1,'INDIA'),(2,'USA'),(3,'ENGLAND'),(4,'NEW ZEALAND'),(5,'PAKISTAN'),(6,'NEPAL'),(7,'SRI LANKA');

/*Table structure for table `tbl_contactinfomaster` */

DROP TABLE IF EXISTS `tbl_contactinfomaster`;

CREATE TABLE `tbl_contactinfomaster` (
  `contctinfoId` int(11) NOT NULL AUTO_INCREMENT,
  `emailId` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `cntcPersName` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`contctinfoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_contactinfomaster_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_contactinfomaster` */

insert  into `tbl_contactinfomaster`(`contctinfoId`,`emailId`,`website`,`cntcPersName`,`userId`) values (1,'prashant@gmail.com',NULL,NULL,NULL),(2,'info@seed.com',NULL,NULL,79),(3,'info@mind.com','www.mindscript.com','Mind Script',80),(4,'chetan@yahoo.com','www.softinfology.com','Chetan Lohar',81),(5,'ranjit@softinfology.com','www.softinfology.com','Ranjit Shinde',83),(6,'info@mindchips.com',NULL,NULL,84),(7,'soft@soft.com',NULL,NULL,85),(8,'ping2chetan@gmail.com','www.mzos.com','Chetan H Lohar',86),(9,'info@impetuss.com',NULL,NULL,87),(10,'info@boston.com','www.boston.com','Bostonkar',88),(11,'chetan@weweww.com','asdfsf.com','Chetan Lohar',89),(12,'chetan@iii.com','www.infotech.com','Chetan Lohar',90),(15,'iuiu@gmail.com',NULL,NULL,91);

/*Table structure for table `tbl_edudetails` */

DROP TABLE IF EXISTS `tbl_edudetails`;

CREATE TABLE `tbl_edudetails` (
  `eduDetId` int(11) NOT NULL AUTO_INCREMENT,
  `university` varchar(50) DEFAULT NULL,
  `yop` int(11) DEFAULT NULL,
  `degreeOther` varchar(50) DEFAULT NULL,
  `specltnId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`eduDetId`),
  UNIQUE KEY `cons_edudet_fk_userid` (`userId`),
  KEY `specltnId` (`specltnId`),
  CONSTRAINT `cons_edudet_fk_userid` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_edudetails_ibfk_1` FOREIGN KEY (`specltnId`) REFERENCES `tbl_eduspecmaster` (`specltnId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_edudetails` */

insert  into `tbl_edudetails`(`eduDetId`,`university`,`yop`,`degreeOther`,`specltnId`,`userId`) values (1,'uop',2011,NULL,10,81);

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
  PRIMARY KEY (`specltnId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_eduspecmaster` */

insert  into `tbl_eduspecmaster`(`specltnId`,`specltnName`) values (1,'Bachelor of Engineering'),(2,'Bachelor of Technology'),(3,'Bachelor of Arts'),(4,'Bachelor of Computer Application'),(5,'Bachelor of Commerce'),(6,'Bachelor of Computer Science'),(7,'Bachelor of Science'),(8,'Bachelor of Laws'),(9,'Master of Arts'),(10,'Master of Commerce'),(11,'Master of Business Administration'),(12,'Master of Engineering'),(13,'Master of Technology'),(14,'Master of Laws'),(15,'Other');

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
  UNIQUE KEY `cons_unq_userid` (`userId`),
  KEY `userId` (`userId`),
  KEY `indusrysubid` (`indusrysubid`),
  CONSTRAINT `tbl_employmentdetails_ibfk_3` FOREIGN KEY (`indusrysubid`) REFERENCES `tbl_trnsubcatmaster` (`trnIndstrSubCatId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_employmentdetails_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_employmentdetails` */

insert  into `tbl_employmentdetails`(`emplmntId`,`employmentType`,`employer`,`jobProfile`,`userId`,`indusrysubid`) values (1,'Full Time','Wipro Ltd','Working as a S/W developer',89,3);

/*Table structure for table `tbl_flprofdet` */

DROP TABLE IF EXISTS `tbl_flprofdet`;

CREATE TABLE `tbl_flprofdet` (
  `profdetid` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photograph` mediumblob,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`profdetid`),
  UNIQUE KEY `userid` (`userid`),
  CONSTRAINT `tbl_flprofdet_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_flprofdet` */

insert  into `tbl_flprofdet`(`profdetid`,`fullname`,`email`,`photograph`,`userid`) values (1,'Chetan Lohar','chetan@yahoo.com',NULL,81),(2,'Harsh Hajare','harsh@gmail.com',NULL,82),(3,'Ranjit Shinde','ranjit@softinfology.com',NULL,83);

/*Table structure for table `tbl_freelancerregdetails` */

DROP TABLE IF EXISTS `tbl_freelancerregdetails`;

CREATE TABLE `tbl_freelancerregdetails` (
  `freelancerId` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`freelancerId`),
  KEY `userId` (`userId`),
  KEY `city` (`city`),
  CONSTRAINT `tbl_freelancerregdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_freelancerregdetails_ibfk_2` FOREIGN KEY (`city`) REFERENCES `tbl_citymaster` (`cityId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_freelancerregdetails` */

insert  into `tbl_freelancerregdetails`(`freelancerId`,`fullName`,`city`,`contact`,`email`,`userId`) values (1,'Chetan Lohar',1,'8446448344','chetan@yahoo.com',81);

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

/*Table structure for table `tbl_instituesearch` */

DROP TABLE IF EXISTS `tbl_instituesearch`;

CREATE TABLE `tbl_instituesearch` (
  `searchId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `instProfId` int(11) DEFAULT NULL,
  `locId` int(11) DEFAULT NULL,
  `contactInfoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`searchId`),
  UNIQUE KEY `userId` (`userId`),
  KEY `instProfId` (`instProfId`),
  KEY `locId` (`locId`),
  KEY `contactInfoId` (`contactInfoId`),
  CONSTRAINT `tbl_instituesearch_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_instituesearch_ibfk_2` FOREIGN KEY (`instProfId`) REFERENCES `tbl_instprofiledetails` (`compInfoId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_instituesearch_ibfk_3` FOREIGN KEY (`locId`) REFERENCES `tbl_locainfodetails` (`locDetialsId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_instituesearch_ibfk_4` FOREIGN KEY (`contactInfoId`) REFERENCES `tbl_contactinfomaster` (`contctinfoId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_instituesearch` */

insert  into `tbl_instituesearch`(`searchId`,`userId`,`instProfId`,`locId`,`contactInfoId`) values (1,86,5,4,8),(2,88,7,6,10);

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
  `institutelogo` mediumblob,
  PRIMARY KEY (`compInfoId`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `tbl_instprofiledetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_instprofiledetails` */

insert  into `tbl_instprofiledetails`(`compInfoId`,`companyName`,`yrofEstablmnt`,`historyOfCompany`,`hrsOfOpertn`,`workingDays`,`trngMethodology`,`userId`,`institutelogo`) values (1,'Seed Infotech',NULL,NULL,NULL,NULL,NULL,79,NULL),(2,'MindScript Technologies',2009,'Nice History','9 am to 7 pm','MON, TUE, WED, THU, FRI, SAT','online, offline and individual',80,NULL),(3,'MindChips Techno',NULL,NULL,NULL,NULL,NULL,84,NULL),(4,'Softinfology Vlt Ltx',NULL,NULL,NULL,NULL,NULL,85,NULL),(5,'Mzos Pvt ltd.',2005,'Nice History really','9 am to 7 pm','MON, TUE, WED, THU, FRI, SAT','Online and Offline and F2F',86,NULL),(6,'Impetus Pvt LTd',2007,'Nice history','9 am to 7 pm','MON, TUE, WED, THU, FRI, SAT','Online and Offline',87,NULL),(7,'Boston Pvt Ltd',2001,'Nice History','10 am to 7 pm','MON, TUE, WED, THU, FRI, SAT','Onlien and Offline F2F',88,NULL),(8,'Training Techo cratz',2000,'Very nice history','9 am to 7 pm','MON, TUE, WED, THU, FRI, SAT','Online and Offline',90,NULL),(9,'asfsdfs asdfs',NULL,NULL,NULL,NULL,NULL,91,NULL);

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
  `searchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`keyClientId`),
  KEY `userId` (`userId`),
  KEY `searchId` (`searchId`),
  CONSTRAINT `tbl_keyclients_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_keyclients_ibfk_2` FOREIGN KEY (`searchId`) REFERENCES `tbl_instituesearch` (`searchId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_keyclients` */

insert  into `tbl_keyclients`(`keyClientId`,`clientName`,`userId`,`searchId`) values (1,'sdfsdf asdfsdf fsfa LOAHR',86,1),(2,'sdfad sdfasfs',86,1),(7,'CHETAN LOHAR H',86,1),(8,'111',80,NULL),(9,'222',80,NULL),(10,'333',80,NULL),(11,'CL1',88,NULL),(12,'CL2',88,NULL),(13,'CL3',88,NULL),(14,'CL4',88,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_locainfodetails` */

insert  into `tbl_locainfodetails`(`locDetialsId`,`buildingNo`,`street`,`landmark`,`pincode`,`cityId`,`userId`) values (1,'sr no. 11/19','Kharadi Bypass','ICICI bank javal',411014,1,82),(2,'11/19 adjfsdlkfj','KHaradi bypass','asjfslfj',411004,1,83),(3,'11/19','Kharadi Bypass','ICICI or SBI Bank',411014,1,81),(4,'asfsadf','asdfsdf','rwerwer',123123,1,86),(5,'11111','Karve Nagar','Karve Statue',411245,1,80),(6,'8B Jagdamba Hsg Society','Railway Station Road','Swami Samarth Temple',424001,4,88),(7,'8b Housing soci','safasdf','agsd',411014,1,89),(8,'11 54a asd sdfasf','asdfasf','awfasdff',411014,1,90);

/*Table structure for table `tbl_phonedetails` */

DROP TABLE IF EXISTS `tbl_phonedetails`;

CREATE TABLE `tbl_phonedetails` (
  `phoneId` int(11) NOT NULL AUTO_INCREMENT,
  `phnTypeId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `phoneValue` varchar(30) DEFAULT NULL,
  `searchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`phoneId`),
  UNIQUE KEY `phonevalue_unq` (`phoneValue`),
  KEY `phnTypeId` (`phnTypeId`),
  KEY `userId` (`userId`),
  KEY `searchId` (`searchId`),
  CONSTRAINT `tbl_phonedetails_ibfk_1` FOREIGN KEY (`phnTypeId`) REFERENCES `tbl_phonetypemaster` (`phnTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_phonedetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_phonedetails_ibfk_3` FOREIGN KEY (`searchId`) REFERENCES `tbl_instituesearch` (`searchId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_phonedetails` */

insert  into `tbl_phonedetails`(`phoneId`,`phnTypeId`,`userId`,`phoneValue`,`searchId`) values (32,NULL,79,'8754986587',NULL),(33,1,80,'9568658985',NULL),(34,3,81,'8446448344',NULL),(35,3,81,'8686232927',NULL),(36,3,82,'7796056555',NULL),(37,3,83,'9890115114',NULL),(38,4,83,'02077777777',NULL),(39,NULL,84,'9536624877',NULL),(40,NULL,85,'8521212121',NULL),(41,1,86,'5411154888',1),(42,2,86,'8521545454',1),(43,3,88,'8521214477',2),(44,2,88,'02562247901',2),(45,2,89,'8745544444',NULL),(46,3,90,'8744444444',NULL),(48,NULL,91,'5321234444',NULL);

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
  `searchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`asscoId`),
  KEY `userId` (`userId`),
  KEY `searchId` (`searchId`),
  CONSTRAINT `tbl_profesnlassociation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tbl_profesnlassociation_ibfk_2` FOREIGN KEY (`searchId`) REFERENCES `tbl_instituesearch` (`searchId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_profesnlassociation` */

insert  into `tbl_profesnlassociation`(`asscoId`,`assocName`,`userId`,`searchId`) values (1,'gdfdsfsdf',86,1),(2,'asfsdfasd',86,1),(3,'asfsadf sd  d fdgdfgf',86,1),(4,'TCS',80,NULL),(5,'Amdocs',80,NULL),(6,'Seed',80,NULL),(7,'Impetus',80,NULL),(8,'boston child',88,NULL),(9,'ssvps',88,NULL),(10,'rc patel',88,NULL),(11,'nothing',88,NULL);

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
  `fullName` varchar(50) NOT NULL,
  `organizationName` varchar(50) DEFAULT NULL,
  `traineeType` varchar(20) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`traineeId`),
  UNIQUE KEY `userid_unq` (`userId`),
  CONSTRAINT `tbl_traineedetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_traineedetails` */

insert  into `tbl_traineedetails`(`traineeId`,`fullName`,`organizationName`,`traineeType`,`emailid`,`phone`,`userId`) values (1,'Chetan Lohar','','Individual','chetan@wewe.com','8745544444',89);

/*Table structure for table `tbl_trainerregdetails` */

DROP TABLE IF EXISTS `tbl_trainerregdetails`;

CREATE TABLE `tbl_trainerregdetails` (
  `trainer_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(50) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `cons_trainerregdet_userid_fk` (`userid`),
  KEY `city` (`city`),
  CONSTRAINT `cons_trainerregdet_userid_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_trainerregdetails_ibfk_1` FOREIGN KEY (`city`) REFERENCES `tbl_citymaster` (`cityId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trainerregdetails` */

insert  into `tbl_trainerregdetails`(`trainer_id`,`org_name`,`city`,`contact`,`email`,`password`,`userid`) values (1,'Seed Infotech',1,'8754986587','info@seed.com','123456',79),(2,'MindScript Technologies',3,'9568658985','info@mind.com','123456',80),(3,'MindChips Techno',1,'9536624877','info@mindchips.com','chetan',84),(4,'Softinfology Vlt Ltx',1,'8521212121','soft@soft.com','chetan',85),(5,'Mzos Pvt ltd.',3,'5411154888','info@mzos.com','chetan',86),(6,'Impetus Pvt LTd',1,'8521545454','info@impetuss.com','chetan',87),(7,'Boston Pvt Ltd',1,'8521214477','info@boston.com','chetan',88),(8,'Training Techo cratz',3,'8744444444','chetan@iii.com','chetan',90),(9,'asfsdfs asdfs',1,'5321234444','iuiu@gmail.com','chetan',91);

/*Table structure for table `tbl_trangcatdetails` */

DROP TABLE IF EXISTS `tbl_trangcatdetails`;

CREATE TABLE `tbl_trangcatdetails` (
  `trngcatid` int(11) NOT NULL AUTO_INCREMENT,
  `subcatid` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`trngcatid`),
  UNIQUE KEY `subcatid` (`subcatid`),
  KEY `userId` (`userId`),
  CONSTRAINT `tbl_trangcatdetails_ibfk_1` FOREIGN KEY (`subcatid`) REFERENCES `tbl_trnsubcatmaster` (`trnIndstrSubCatId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `tbl_trangcatdetails_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trangcatdetails` */

insert  into `tbl_trangcatdetails`(`trngcatid`,`subcatid`,`exp`,`userId`) values (1,3,5,86);

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
  `description` varchar(200) DEFAULT NULL,
  `contenttype` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `vFlag` varchar(30) DEFAULT NULL,
  `keyword` text,
  `place` int(11) DEFAULT NULL,
  `trnIndstrSubCatId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`trngId`),
  KEY `userId` (`userId`),
  KEY `trnIndstrSubCatId` (`trnIndstrSubCatId`),
  KEY `place` (`place`),
  CONSTRAINT `tbl_trngcalender_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `tbl_trngcalender_ibfk_2` FOREIGN KEY (`trnIndstrSubCatId`) REFERENCES `tbl_trnsubcatmaster` (`trnIndstrSubCatId`),
  CONSTRAINT `tbl_trngcalender_ibfk_3` FOREIGN KEY (`place`) REFERENCES `tbl_citymaster` (`cityId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trngcalender` */

insert  into `tbl_trngcalender`(`trngId`,`title`,`code`,`start_date`,`end_date`,`price`,`brochure`,`type`,`status`,`createdOn`,`createdBy`,`updatedOn`,`updatedBy`,`description`,`contenttype`,`rank`,`vFlag`,`keyword`,`place`,`trnIndstrSubCatId`,`userId`) values (6,'Core Java Training','keyCode','2015-07-01','2015-07-31',3000,'C:\\\\SearchMT\\\\ICDM07-prism.pdf','Seminar','New','2015-07-23 13:07:42','aaa','2015-06-29 16:05:18','','Core Java is a programming language to develope the Software','application/pdf',0,'Not Varified','java,core java,collections,oops,applet,multithreading',1,1,86),(7,'Advance Java Training','keyCode','2015-08-04','2015-08-31',3000,'C:\\\\SearchMT\\\\ICDM07-prism.pdf','Seminar','New','2015-07-23 13:07:43','aaa','2015-06-29 16:07:54','','Advance Java is a Programming language to develope web application','application/pdf',0,'Not Varified','java,advance java,jsp,servlet,web application',1,1,86),(8,'Spring Training','keyCode','2015-07-01','2015-07-28',3000,'C:\\\\SearchMT\\\\ICDM07-prism.pdf','Seminar','New','2015-07-23 13:07:44','aaa','2015-06-29 16:16:50','','Spring is a java framework','application/pdf',0,'Not Varified','java, spring,ioc,spring aop,spring boot,spring batch',1,1,86),(9,'Hibernate Training','keyCode','2015-07-07','2015-07-31',3000,'C:\\\\SearchMT\\\\ICDM07-prism.pdf','Seminar','New','2015-07-23 13:07:44','aaa','2015-06-29 16:35:18','','Hibernate is a ORM tool','application/pdf',0,'Not Varified','java,hibernate,orm tool,mapping,hql',1,1,86),(10,'Oracle Training','keyCode','2015-08-11','2015-08-31',7000,'C:\\\\SearchMT\\\\ICDM07-prism.pdf','Workshop','New','2015-07-23 13:07:47','aaa','2015-06-29 16:36:47','','Oracle is a Database to store the information','application/pdf',0,'Not Varified','oracle,database,dbms,rdbms,procedure,function,sql,plsql',3,1,86),(11,'Oracle DBMS Training','keyCode','2015-08-12','2015-08-31',4000,'C:\\\\SearchMT\\\\ICDM07-prism.pdf','Seminar','New','2015-07-16 12:50:46','aaa','2015-07-01 21:28:00','','Oracle is a RDBMS','application/pdf',0,'Not Varified','oracle,database,rdbms,sql,plsql,procedures,functions',1,1,80);

/*Table structure for table `tbl_trngenquiry` */

DROP TABLE IF EXISTS `tbl_trngenquiry`;

CREATE TABLE `tbl_trngenquiry` (
  `trngenqId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `courseTitle` varchar(50) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `trngNeed` varchar(50) DEFAULT NULL,
  `noOfParticipents` int(6) DEFAULT NULL,
  PRIMARY KEY (`trngenqId`),
  KEY `cityId` (`cityId`),
  CONSTRAINT `tbl_trngenquiry_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `tbl_cntrymaster` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_trngenquiry` */

insert  into `tbl_trngenquiry`(`trngenqId`,`name`,`companyName`,`courseTitle`,`cityId`,`phone`,`email`,`trngNeed`,`noOfParticipents`) values (1,'Chetan Lohar','Individual','Spring Training',2,'8754875487','chetan@gmail.com','fsdfaddfsf sdaff',1),(2,'dsdfsdf fsdfsafa','sdfasdfsdf ','safsafas',1,'3434343333','asdf@asd.com','asfasfasf',5),(3,'asdfsdf sadfsdfs','sfsdfasd','asdfsdf',1,'8754875555','ccc@gmail.com','sdfsdfff sdf sdf sdf sddd',5);

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

insert  into `tbl_trnsubcatmaster`(`trnIndstrSubCatId`,`indstrSubCatName`,`indstrSubCatDescrption`,`trnIndstrCatId`) values (1,'C','--',1),(2,'C++','--',1),(3,'Java','--',1),(4,'DOT NET','--',1),(5,'OTHER','--',1),(6,'Networking','--',2),(7,'Autocad','--',3),(8,'Corel Draw','--',3),(9,'2D','--',4),(10,'3D','--',4),(11,'Finance & Accounting','--',5),(12,'HR, Admin. IR','--',6),(13,'Sales & Marketing','--',7),(14,'Self Development','--',8),(15,'Strategy Management','--',9),(16,'Quality Management','--',10),(17,'Health & Safety','--',11),(18,'Music','--',12),(19,'Painting','--',13),(20,'Pottery','--',14),(21,'Acting','--',15),(22,'Sports','--',16),(23,'Six Sigma','--',17),(24,'Sedex','--',18),(25,'ISO 9001','--',19),(26,'MSCI','--',20),(27,'PHP','--',1);

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

insert  into `user_attempts`(`USERID`,`ATTEMPTS`,`LASTMODIFIED`) values (80,0,'2015-07-23 13:02:25'),(86,0,'2015-08-05 18:25:13');

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

insert  into `user_roles`(`USER_ROLE_ID`,`USERID`,`ROLE`) values (3,81,'TPF'),(4,82,'TPF'),(5,83,'TPF'),(1,79,'TPI'),(2,80,'TPI'),(6,84,'TPI'),(7,85,'TPI'),(8,86,'TPI'),(9,87,'TPI'),(10,88,'TPI'),(12,90,'TPI'),(13,91,'TPI'),(11,89,'TRAINEE');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `accountNonExpired` tinyint(4) NOT NULL DEFAULT '1',
  `accountNonLocked` tinyint(4) NOT NULL DEFAULT '1',
  `credentialsNonExpired` tinyint(4) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `Modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Modified_by` varchar(100) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `emailVerified` tinyint(4) DEFAULT '0',
  `uuid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username_UNQ` (`username`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`statusId`) REFERENCES `tbl_statusmaster` (`statusId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

ALTER TABLE `searchmytraining`.`users` 
CHANGE COLUMN `enabled` `enabled` BIT(1) NOT NULL DEFAULT b'0' COMMENT '' ,
CHANGE COLUMN `accountNonExpired` `accountNonExpired` BIT(1) NOT NULL DEFAULT b'0' COMMENT '' ,
CHANGE COLUMN `accountNonLocked` `accountNonLocked` BIT(1) NOT NULL DEFAULT b'0' COMMENT '' ,
CHANGE COLUMN `credentialsNonExpired` `credentialsNonExpired` BIT(1) NOT NULL DEFAULT b'0' COMMENT '' ,
CHANGE COLUMN `emailVerified` `emailVerified` BIT(1) NULL DEFAULT b'0' COMMENT '' ;

/*Data for the table `users` */


insert  into `users`(`userId`,`username`,`password`,`enabled`,`accountNonExpired`,`accountNonLocked`,`credentialsNonExpired`,`created_on`,`created_by`,`Modified_on`,`Modified_by`,`statusId`,`emailVerified`,`uuid`) values (79,'info@seed.com','$2a$10$aALqfEeXdiZB1UsjyjwuLu2ZCOqX7rY5Yrlon3yGWjO3Ss8jp6rl.',1,1,0,1,'2015-07-23 12:41:11','SELF','2015-07-16 12:47:29','SELF',1,0,NULL),(80,'info@mind.com','$2a$10$rryfrTKtSr3kkodwrRGZa.Zs67kh91edRI7Gpj3jRSpt8dfzYcYXC',1,1,1,1,'2015-07-16 12:49:05','SELF','2015-07-16 12:49:05','SELF',1,0,NULL),(81,'chetan@yahoo.com','$2a$10$lZdmuW1XDdqz/Si0mZETZ.m1qFqFkmw7yRN9Q/Mr35UH68hST55Q2',1,1,1,1,'2015-07-16 13:10:39','SELF','2015-07-16 13:10:39','SELF',1,0,NULL),(82,'harsh@gmail.com','$2a$10$kZipQLGLVN41u2bD08A4V.AIxEYjePlxJf/ALDFP2A3Fdxv9NiJsG',1,1,1,1,'2015-07-16 13:44:14','SELF','2015-07-16 13:44:14','SELF',1,0,NULL),(83,'ranjit@softinfology.com','$2a$10$FiuL764tvFJjTUfJnSKBeON4iIe2Y6i0pfIFaAEhmjqYndleLLMaS',1,1,1,1,'2015-07-16 20:33:20','SELF','2015-07-16 20:33:20','SELF',1,0,NULL),(84,'info@mindchips.com','$2a$10$hR.v38fV6mp4heuaXmVsquhXi1DFOuwXQd7U.BfGYw2uRFng/S/fa',1,1,1,1,'2015-07-17 12:42:19','SELF','2015-07-17 12:42:19','SELF',1,0,NULL),(85,'soft@soft.com','$2a$10$fOiiXvPY44/O8i3v9wcQ4enA.TO6qwBiR01oA/WOZyMeJm7cFoISO',1,1,1,1,'2015-07-17 18:08:16','SELF','2015-07-17 18:08:16','SELF',1,0,NULL),(86,'info@mzos.com','$2a$10$2bI3i726oIN6y6TuNCM4VOzsb73iI/QpRrxVKgDCFB4pMARoHERmS',1,1,1,1,'2015-07-17 18:52:24','SELF','2015-07-17 18:52:24','SELF',1,0,NULL),(87,'info@impetuss.com','$2a$10$Trst237HcQzfKsSLnA5sju7/zPLNokh2p6UTvCAVI92wf91smBE.K',1,1,1,1,'2015-07-22 20:00:35','SELF','2015-07-22 20:00:35','SELF',1,0,NULL),(88,'info@boston.com','$2a$10$UEx2qhyxLyFeaPsuqUGpr.01tzru79lTQ2G5LmvLx0ARwAzlRMkhu',1,1,1,1,'2015-07-24 13:46:16','SELF','2015-07-24 13:46:16','SELF',1,0,NULL),(89,'chetan@wewe.com','$2a$10$3WkvphjwnMZNIFf8s09CyuyDYZANTu2EcWYbNIPUFz794xmMqrzSy',1,1,1,1,'2015-07-24 20:20:38','SELF','2015-07-24 20:20:38','SELF',1,0,NULL),(90,'chetan@iii.com','$2a$10$cEO65K2TZhKGmMgFasu1ReScCMuHA9Z2sp7xQrUT2BEbobwsuLZdS',1,1,1,1,'2015-07-24 20:38:18','SELF','2015-07-24 20:38:18','SELF',1,0,NULL),(91,'iuiu@gmail.com','$2a$10$303.7NVdtrzIAFl.ek0I.OwvZ3Q78ZJ4OR/kcgqzvBRGFaxa7nALG',1,1,1,1,'2015-08-05 19:59:10','SELF','2015-08-05 19:59:10','SELF',1,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE TABLE `searchmytraining`.`tbl_instaddress` (
  `paId` INT(11) NOT NULL COMMENT '',
  `addressLine1` VARCHAR(4000) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(4000) NULL COMMENT '',
  `landmark` VARCHAR(200) NOT NULL COMMENT '',
  `cityId` INT(11) NOT NULL COMMENT '',
  `stateId` INT(11) NOT NULL COMMENT '',
  `countryId` INT(11) NOT NULL COMMENT '',
  `pincode` INT(6) NOT NULL COMMENT '',
  PRIMARY KEY (`paId`)  COMMENT '');
  
  CREATE TABLE `searchmytraining`.`tbl_trnginstituteoverview` (
  `trngoverviewId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `facultyDetails` VARCHAR(2000) NOT NULL COMMENT '',
  `howtoregister` VARCHAR(2000) NOT NULL COMMENT '',
  `detailsOfProvider` VARCHAR(1000) NOT NULL COMMENT '',
  `calenderPdf` LONGBLOB NOT NULL COMMENT '',
  PRIMARY KEY (`trngoverviewId`)  COMMENT '');
  
  
  CREATE TABLE `searchmytraining`.`tbl_trngoverview` (
  `overviewId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `trngQuickView` VARCHAR(2000) NOT NULL COMMENT '',
  `trngOverView` VARCHAR(2000) NOT NULL COMMENT '',
  `trngTakeAway` VARCHAR(2000) NOT NULL COMMENT '',
  `trngMethodology` VARCHAR(2000) NOT NULL COMMENT '',
  `trngAttandant` VARCHAR(500) NOT NULL COMMENT '',
  `trngKey` VARCHAR(500) NOT NULL COMMENT '',
  PRIMARY KEY (`overviewId`)  COMMENT '');
  
ALTER TABLE `searchmytraining`.`tbl_trngcalender` 
ADD COLUMN `paId` INT(11) NOT NULL COMMENT '' AFTER `userId`,
ADD COLUMN `trngoverviewId` INT(11) NOT NULL COMMENT '' AFTER `paId`,
ADD COLUMN `overviewId` INT(11) NOT NULL COMMENT '' AFTER `trngoverviewId`;

