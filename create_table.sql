DROP TABLE Member;
DROP TABLE Showinfo;
DROP TABLE Reservation;
DROP TABLE PlayTeam;
DROP TABLE Play;
DROP TABLE LineUp;
DROP TABLE Artist;
DROP TABLE Affiliation;

CREATE TABLE member(

M_ID VARCHAR(20) NOT NULL,
M_PW INT(20) NOT NULL,
M_Name VARCHAR(20) NOT NULL,
M_Phone INT(20) NOT NULL,
M_BirthDay INT(20),
CONSTRAINT Member_pk PRIMARY KEY(M_ID));

CREATE TABLE showinfo(

Show_ID INT(11) NOT NULL,
Show_Name INT(11) NOT NULL,
Price INT(20) NOT NULL,
Date DATE NOT NULL,
Play_Num INT(11),
CONSTRAINT Showinfo_pk PRIMARY KEY(Show_ID));

CREATE TABLE reservation(

Show_ID INT(11) NOT NULL,
M_ID VARCHAR(20) NOT NULL,
TimeStamp DATETIME NOT NULL,
Amount INT(11) NOT NULL,

CONSTRAINT Reserv_pk PRIMARY KEY(Show_ID, M_ID),
CONSTRAINT Reserv_fk1 FOREIGN KEY(Show_ID) REFERENCES showinfo (Show_ID),
CONSTRAINT Reserv_fk2 FOREIGN KEY(M_ID) REFERENCES member (M_ID));

CREATE TABLE playteam(

PlayTeam_ID INT(11) NOT NULL,
PlayTeam_Name VARCHAR(20) NOT NULL,
PlayTeam_Leader VARCHAR(20) NOT NULL,
PlayTeam_Phone INT(20) NOT NULL,
PlayTeam_Address VARCHAR(50),

CONSTRAINT PlayTeam_pk PRIMARY KEY(PlayTeam_ID));


CREATE TABLE play(

Play_ID INT(11) NOT NULL,
Description VARCHAR(200) NOT NULL,
Genre VARCHAR(11),
Age_restriction INT(11) NOT NULL,
RunningTime INT(11),
PlayTeam_ID INT(11),

CONSTRAINT Play_ID_pk PRIMARY KEY(Play_ID),
CONSTRAINT PlayTeam_ID_fk FOREIGN KEY(PlayTeam_ID) REFERENCES playteam (PlayTeam_ID));



CREATE TABLE lineup(

PlayTeam_ID INT(11) NOT NULL,
Play_ID INT(11) NOT NULL,

CONSTRAINT LineUp_pk PRIMARY KEY(PlayTeam_ID, Play_ID),
CONSTRAINT LineUp_fk1 FOREIGN KEY(PlayTeam_ID) REFERENCES playteam (PlayTeam_ID),
CONSTRAINT LineUp_fk2 FOREIGN KEY(Play_ID) REFERENCES play (Play_ID));


CREATE TABLE artist(

Artist_ID INT(11) NOT NULL,
Artist_Name VARCHAR(20) NOT NULL,
Artist_Birth INT(20),
Artist_Description VARCHAR(300),


CONSTRAINT Artist_pk PRIMARY KEY(Artist_ID));


CREATE TABLE affiliation(

Artist_ID INT(11) NOT NULL,
A_Salary INT(30),
PlayTeam_ID INT(11) NOT NULL,

CONSTRAINT Affiliation PRIMARY KEY(Artist_ID),
CONSTRAINT Affiliation_fk1 FOREIGN KEY(Artist_ID) REFERENCES artist (Artist_ID),
CONSTRAINT Affiliation_fk2 FOREIGN KEY(PlayTeam_ID) REFERENCES playteam (PlayTeam_ID));





/* 아래부터는 수정사향 */



INSERT INTO member VALUES('kight1',1234,'DongUk1',01066498757,951230);
INSERT INTO member VALUES('kight2',1234,'DongUk2',01066498757,951230);
INSERT INTO member VALUES('kight3',1234,'DongUk2',01066498757,951230);


INSERT INTO artist VALUES(1, 'DongUk', 951230, 'Very intelligent');
INSERT INTO artist VALUES(2, 'DongUk', 951230, 'Very intelligent');
INSERT INTO artist VALUES(3, 'DongUk', 951230, 'Very intelligent');

INSERT INTO playteam VALUES(00001, 'DongUk1', 'Leader1', 01066498757,'address1');
INSERT INTO playteam VALUES(00002, 'DongUk2', 'Leader2', 01066498757,'address1');
INSERT INTO playteam VALUES(00003, 'DongUk3', 'Leader3', 01066498757,'address1');

INSERT INTO affiliation VALUES(1,50000,00001);
INSERT INTO affiliation VALUES(2,60000,00002);
INSERT INTO affiliation VALUES(3,70000,00003);

INSERT INTO play VALUES(1, 'Description1', 'Genre1', 18,180,00001);
INSERT INTO play VALUES(2, 'Description2', 'Genre2', 18,180,00002);
INSERT INTO play VALUES(3, 'Description3', 'Genre3', 18,180,00003);

INSERT INTO lineup VALUES(00001,1);
INSERT INTO lineup VALUES(00002,2);
INSERT INTO lineup VALUES(00003,3);

INSERT INTO showinfo VALUES(01,0001,30000,now(),1);
INSERT INTO showinfo VALUES(02,0001,30000,now(),2);
INSERT INTO showinfo VALUES(03,0001,30000,now(),3);

INSERT INTO reservation VALUES(01,'kight1',now(),10);
INSERT INTO reservation VALUES(02,'kight2',now(),10);
INSERT INTO reservation VALUES(03,'kight3',now(),10);
