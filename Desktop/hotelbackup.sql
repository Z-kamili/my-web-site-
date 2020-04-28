/*
SQLyog Community Edition- MySQL GUI v6.14
MySQL - 5.1.30-community : Database - hotel
*********************************************************************
*/


/*

D.D => GDF  => MCD => MLD => MPD => D.D => Langage SQL Relationnele  SQL.

SGBD => Systeme de gestion de base de donnes Relationnelle {SQL-server,oracle,mysql...};

SQL => {Lanage declaratif => {

LDD :   langage de definition de base de donnes 

LMD :  langage de manipulation de base de donnes 

LID :  langage interogation de base de donnes

}}

*/

/* creation de base de donnes */
CREATE DATABASE IF NOT EXISTS gestion_hotel;
/*USE hotel;*/
USE gestion_hotel;
/*Table structure for table `hotels` */
DROP TABLE IF EXISTS `hotels`;
/*creation de la table */
CREATE TABLE `hotels`(
  `Hotel` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
   Stars varchar(10) DEFAULT NULL,
    primary key(Hotel)
);
/*Data for the table `hotels` */
insert  into `hotels`(`Hotel`,`Name`,Stars) values (1,'Grand View Hotel','*'),(2,'Mountain Side Resort','**'),(3,'Hard Days Inn','***'),(4,'Gunners Lodge','****');
/*Table structure for table `paymenttypes` */
DROP TABLE IF EXISTS `paymenttypes`;
CREATE TABLE `paymenttypes` (
  `Payment` int(11) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
    primary key(Payment)
);
/*Data for the table `paymenttypes` */
insert  into `paymenttypes`(`Payment`,`Description`) values (1,'Check'),(2,'MasterCard'),(3,'Visa'),(4,'American Express'),(5,'Cash');
/*Table structure for table `tbl_reservations` */
DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations` (
  `ResNo` int(11) NOT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Postal` varchar(10) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Payment` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Hotel` int(11) NOT NULL,
  `Room` smallint(6) DEFAULT NULL,
  `DateIn` date DEFAULT NULL,
  `DateOut` date DEFAULT NULL,
  `DateNow` datetime DEFAULT NULL,
   primary key(ResNo)
);
insert into reservations(ResNo,LastName,FirstName,Address,City,State,Postal,Phone,Payment,Amount,Hotel,Room,DateIn,DateOut,DateNow) values (5001,'Hedge','Helen','1125 Garden Way','Broadstill','WY','66431','(767)346-8725',2,'75.00',1,1110,'2006-10-25','2006-10-28','2006-10-14 09:09:23')
/*Data for the table `reservations` */

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `tbl_rooms`;

CREATE TABLE `rooms`(
  `Hotel` int(11) NOT NULL,
  `Room` smallint(6) NOT NULL,
  `RoomType` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Comments` blob,
  `RoomStatus` boolean,
   primary key(Room)
);

/*Data for the table `tbl_rooms` */

insert  into `rooms`(`Hotel`,`Room`,`RoomType`,`Price`,`Comments`,`RoomStatus`) values (1,1110,10,'75.00','','0'),(1,1220,10,'75.00','','0'),(1,1330,10,'75.00','','0'),(1,1440,10,'75.00','','0'),(1,1550,11,'90.00','','0');
/*Table structure for table `roomtypes` */

DROP TABLE IF EXISTS `tbl_roomtypes`;

CREATE TABLE `roomtypes`(
  `RoomType` int(11) NOT NULL,
  `Beds` smallint(6) DEFAULT NULL,
  `Description` varchar(254) DEFAULT NULL,
   primary key(RoomType)
);

/*Data for the table `roomtypes` */

insert  into `roomtypes`(`RoomType`,`Beds`,`Description`) values (10,1,'Double; Non-smoking'),(12,1,'Double; Non-smoking; Kitchenette'),(13,2,'Double; Non-smoking; Kitchenette'),(15,1,'Double; Smoking'),(16,2,'Double; Smoking'),(17,1,'Double; Smoking; Kitchenette'),(18,2,'Double; Smoking; Kitchenette'),(14,1,'Double; Non-smoking; Whirlpool'),(19,1,'Double; Smoking; Whirlpool'),(20,1,'Queen; Non-smoking'),(21,2,'Queen; Non-smoking'),(22,1,'Queen; Non-smoking; Kitchenette'),(23,2,'Queen; Non-smoking; Kitchenette'),(24,1,'Queen; Non-smoking; Whirlpool'),(25,1,'Queen; Smoking'),(26,2,'Queen; Smoking'),(27,1,'Queen; Smoking; Kitchenette'),(28,2,'Queen; Smoking; Kitchenette'),(29,1,'Queen; Smoking; Whirlpool'),(30,1,'King; Non-smoking'),(31,2,'King; Non-smoking'),(32,1,'King; Non-smoking; Kitchenette'),(33,2,'King; Non-smoking; Kitchenette'),(34,1,'King; Non-smoking; Whirlpool'),(35,1,'King; Smoking'),(36,2,'King; Smoking'),(37,1,'King; Smoking; Kitchenette'),(38,2,'King; Smoking; Kitchenette'),(39,1,'King; Smoking; Whirlpool'),(40,1,'Suite w/ King'),(41,1,'Suite w/ King & Whirlpool'),(42,1,'Penhouse w/ King'),(11,2,'Double; Non-smoking');


/*foreing key constraint*/
alter table reservations add constraint FK_CONTIENT foreign key (HOTEL)
      references hotels (Hotel) on delete restrict on update restrict;

alter table reservations add constraint FK_REGLER foreign key (Payment)
      references paymenttypes (Payment) on delete restrict on update restrict;

alter table rooms add constraint FK_APPARTIENT foreign key (RoomType)
      references roomtypes (RoomType) on delete restrict on update restrict;

alter table rooms add constraint FK_CONTENIR foreign key (Hotel)
      references hotels (Hotel) on delete restrict on update restrict;
      
alter table reservations add constraint FK_CONTENIR2 foreign key (Room)
      references rooms(Room) on delete restrict on update restrict;
      

     

      






