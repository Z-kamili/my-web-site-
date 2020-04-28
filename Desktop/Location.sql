/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  4/25/2020 1:32:13 PM                     */
/*==============================================================*/


drop table if exists CLIENT;

drop table if exists PRODUIT;

drop table if exists RESERVATION;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT
(
   ID_CLIENT            int not null,
   DATE_PERMIS          datetime,
   NOM                  varchar(250),
   PRENOM               varchar(250),
   AGE                  int,
   EMAIL                varchar(250),
   primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT
(
   ID_PRODUIT           int not null,
   ID_RESERVATION       int not null,
   NOM_PRODUIT          varchar(250),
   ETATS                bool,
   primary key (ID_PRODUIT)
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION
(
   ID_RESERVATION       int not null,
   ID_CLIENT            int not null,
   DUREE                int,
   NBR_PERSONNE         int,
   primary key (ID_RESERVATION)
);

alter table PRODUIT add constraint FK_CONTIENT foreign key (ID_RESERVATION)
      references RESERVATION (ID_RESERVATION) on delete restrict on update restrict;

alter table RESERVATION add constraint FK_RESERVE foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT) on delete restrict on update restrict;

