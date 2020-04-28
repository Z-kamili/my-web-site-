/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  4/5/2020 10:12:25 PM                     */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists CONSULTATION;

drop table if exists MEDECIN;

drop table if exists PATIENT;

drop table if exists PIECE_JOINT;

drop table if exists SPECIALITES;

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create table ADMIN
(
   ID_ADMIN             int not null,
   EMAIL                char(250),
   PASSWORD             char(250),
   primary key (ID_ADMIN)
);

/*==============================================================*/
/* Table : CONSULTATION                                         */
/*==============================================================*/
create table CONSULTATION
(
   MATRICULE_PAT        char(250) not null,
   MATRICULE            char(250) not null,
   ID_CNSLT             int,
   CODE_REF             char(250),
   JOUR_REPOS_R           int,
   JOUR_REPOS_V           int,
   MOTIF                text,
   ATC                  text,
   TYPE                 char(250),
   DATE_CONSULTATION    datetime,
   ID_PIECE             int,
   primary key (MATRICULE_PAT, MATRICULE)
);

/*==============================================================*/
/* Table : MEDECIN                                              */
/*==============================================================*/
create table MEDECIN
(
   MATRICULE            char(250) not null,
   ID_SPEC              int not null,
   ID_ADMIN             int not null,
   NOM_MED              char(250),
   TEL                  char(250),
   EMAIL                char(250),
   DISPONIBLE           BOOLEAN,
   VILLE                char(250),
   primary key (MATRICULE)
);

/*==============================================================*/
/* Table : PATIENT                                              */
/*==============================================================*/
create table PATIENT
(
   MATRICULE_PAT        char(250) not null,
   NOM_PAT              char(250),
   EMAIL                char(250),
   PASSWORD             char(250),
   TEL                  char(250),
   ADRESS               char(250),
   AGE                  int,
   Direction            char(250),
   primary key (MATRICULE_PAT)
);

/*==============================================================*/
/* Table : PIECE_JOINT                                          */
/*==============================================================*/
create table PIECE_JOINT
(
   ID                   int not null,
   DOCUMENT             longblob,
   primary key (ID)
);

/*==============================================================*/
/* Table : SPECIALITES                                          */
/*==============================================================*/
create table SPECIALITES
(
   ID_SPEC              int not null,
   NOM_SPEC             char(250),
   primary key (ID_SPEC)
);

alter table CONSULTATION add constraint FK_CONSULTATION foreign key (MATRICULE)
      references MEDECIN (MATRICULE) on delete restrict on update restrict;

alter table CONSULTATION add constraint FK_CONSULTATION2 foreign key (MATRICULE_PAT)
      references PATIENT (MATRICULE_PAT) on delete restrict on update restrict;
      
      alter table CONSULTATION add constraint FK_CONSULTATION3 foreign key (ID_PIECE)
      references PIECE_JOINT (ID) on delete restrict on update restrict;

alter table MEDECIN add constraint FK_AJOUTER foreign key (ID_ADMIN)
      references ADMIN (ID_ADMIN) on delete restrict on update restrict;

alter table MEDECIN add constraint FK_CONTIENT foreign key (ID_SPEC)
      references SPECIALITES (ID_SPEC) on delete restrict on update restrict;


/*enregistrement*/
Insert Into patient VALUES('M01','ABDELAZIZ','AZIZE@gmail.Com','azerty','0657468897','VILLE DE SAFI',50);
Insert Into patient VALUES('M02','Ahmed','AHMED@gmail.Com','azerty','0657468897','VILLE DE SAFI',30);
Insert Into patient VALUES('M03','SAID','SAID@gmail.Com','azerty','0657468897','VILLE DE SAFI',20);

INSERT into specialites values(1,"Cardiologue")
INSERT into admin values(1,'AbdAzize@gmail.Com','Te$t2020')
Insert into medecin VALUES('C01',1,1,'Hind','0657468897','Hind@gmail.Com',true,null,null,'SAFI')
