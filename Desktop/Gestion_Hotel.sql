/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  4/25/2020 6:29:00 PM                     */
/*==============================================================*/


drop table if exists HOTEL;

drop table if exists PAYEMENTTYPE;

drop table if exists RESERVATION;

drop table if exists ROOM;

drop table if exists ROOMTYPE;

/*create user and donnes les permission*/
CREATE USER 'user'@'localhost' IDENTIFIED BY 'azerty';
GRANT ALL PRIVILEGES ON hotel TO 'user'@'localhost';

/* Table : HOTEL                                                */
/*==============================================================*/
create table HOTEL
(
   HOTEL                int not null,
   NAME                 varchar(250),
   STARS                varchar(50),
   primary key (HOTEL)
);

INSERT INTO HOTEL VALUES(1,"FARA7","**");

/*==============================================================*/
/* Table : PAYEMENTTYPE                                         */
/*==============================================================*/
create table PAYEMENTTYPE
(
   PAYEMENT             int not null,
   DESCRIPTION          text,
   primary key (PAYEMENT)
);
insert  into `PAYEMENTTYPE`(`PAYEMENT`,`DESCRIPTION`) values (1,'Check'),(2,'MasterCard'),(3,'Visa'),(4,'American Express'),(5,'Cash');

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION
(
   RESNO                int not null,
   HOTEL                int not null,
   PAYEMENT             int not null,
   LASTNAME             varchar(50),
   FIRSTNAME            varchar(50),
   ADRESS               varchar(50),
   CITY                 varchar(50),
   STATE                varchar(50),
   POSTAL               int,
   PHONE                varchar(30),
   AMOUNT               decimal,
   DATEIN               date,
   DATEOUT              date,
   DATENOW              date,
   Room                int
   primary key (RESNO)
);



/*==============================================================*/
/* Table : ROOM                                                 */
/*==============================================================*/
create table ROOM
(
   HOTEL                int not null,
   ROOMTYPE             int not null,
   ROOM                 int,
   PRICE                float,
   ROOMSTATUS           bool,
   COMMENTS             text
);
/*==============================================================*/
/* Table : ROOMTYPE                                             */
/*==============================================================*/
create table ROOMTYPE
(
   ROOMTYPE             int not null,
   BEDS                 varchar(50),
   DESCRIPTION          text,
   primary key (ROOMTYPE)
);
/*select*/
select * from reservations
/*update*/
update reservations SET City = "SAFI" where FirstName = "Helen";

alter table RESERVATION add constraint FK_CONTIENT foreign key (HOTEL)
      references HOTEL (HOTEL) on delete restrict on update restrict;

alter table RESERVATION add constraint FK_REGLER foreign key (PAYEMENT)
      references PAYEMENTTYPE (PAYEMENT) on delete restrict on update restrict;

alter table ROOM add constraint FK_APPARTIENT foreign key (ROOMTYPE)
      references ROOMTYPE (ROOMTYPE) on delete restrict on update restrict;

alter table rOOM add constraint FK_CONTENIR foreign key (HOTEL)
      references HOTEL (HOTEL) on delete restrict on update restrict;
      
alter table RESERVATION add constraint FK_CONTENIR2 foreign key (Room)
      references ROOM(HOTEL) on delete restrict on update restrict;

