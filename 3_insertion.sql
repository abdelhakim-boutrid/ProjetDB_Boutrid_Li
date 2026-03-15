/* ========================= */
/* OFFRE_ABONNEMENT (3) */
/* ========================= */
INSERT INTO OFFRE_ABONNEMENT VALUES
(1,'Free',0.00,'EUR','standard',TRUE,1),
(2,'Premium',9.99,'EUR','haute',FALSE,3),
(3,'Family',14.99,'EUR','haute',FALSE,6);

/* ========================= */
/* UTILISATEUR (10) */
/* ========================= */
INSERT INTO UTILISATEUR VALUES
(1,'alex','alex@mail.com','hash1','2023-01-10','actif'),
(2,'marie','marie@mail.com','hash2','2023-02-12','actif'),
(3,'luc','luc@mail.com','hash3','2023-03-05','actif'),
(4,'emma','emma@mail.com','hash4','2023-04-18','actif'),
(5,'leo','leo@mail.com','hash5','2023-05-20','suspendu'),
(6,'noah','noah@mail.com','hash6','2023-06-22','actif'),
(7,'sarah','sarah@mail.com','hash7','2023-07-01','actif'),
(8,'paul','paul@mail.com','hash8','2023-08-10','actif'),
(9,'lina','lina@mail.com','hash9','2023-09-15','actif'),
(10,'yann','yann@mail.com','hash10','2023-10-20','actif');

/* ========================= */
/* ARTISTE (5) */
/* ========================= */
INSERT INTO ARTISTE VALUES
(1,'Daft Punk'),
(2,'Coldplay'),
(3,'Adele'),
(4,'The Weeknd'),
(5,'Billie Eilish');

/* ========================= */
/* GENRE (6) */
/* ========================= */
INSERT INTO GENRE VALUES
(1,'Pop',NULL),
(2,'Rock',NULL),
(3,'Electro',NULL),
(4,'Alternative',2),
(5,'Dance',3),
(6,'Indie',1);

/* ========================= */
/* ALBUM (6) */
/* ========================= */
INSERT INTO ALBUM VALUES
(1,'Discovery','2001-03-01',1),
(2,'Random Access Memories','2013-05-01',1),
(3,'Parachutes','2000-07-10',2),
(4,'25','2015-11-20',3),
(5,'After Hours','2020-03-20',4),
(6,'Happier Than Ever','2021-07-30',5);

/* ========================= */
/* PISTE (12) */
/* ========================= */
INSERT INTO PISTE VALUES
(1,1,'One More Time',320,FALSE,3),
(1,2,'Digital Love',300,FALSE,3),
(2,1,'Get Lucky',360,FALSE,3),
(2,2,'Instant Crush',330,FALSE,3),
(3,1,'Yellow',280,FALSE,2),
(3,2,'Trouble',250,FALSE,2),
(4,1,'Hello',295,FALSE,1),
(4,2,'Send My Love',270,FALSE,1),
(5,1,'Blinding Lights',200,FALSE,5),
(5,2,'Save Your Tears',210,FALSE,5),
(6,1,'Bad Guy',195,TRUE,6),
(6,2,'Happier Than Ever',300,FALSE,6);

/* ========================= */
/* PLAYLIST (6) */
/* ========================= */
INSERT INTO PLAYLIST VALUES
(1,'Workout','publique',TRUE,1),
(2,'Chill','publique',FALSE,2),
(3,'Roadtrip','publique',TRUE,3),
(4,'Focus','privee',FALSE,4),
(5,'Party','publique',TRUE,5),
(6,'Relax','privee',FALSE,6);

/* ========================= */
/* ABONNEMENT (8) */
/* ========================= */
INSERT INTO ABONNEMENT VALUES
(1,'2023-01-10',NULL,'actif',2,1),
(2,'2023-02-12',NULL,'actif',1,2),
(3,'2023-03-05',NULL,'actif',2,3),
(4,'2023-04-18',NULL,'actif',2,4),
(5,'2023-05-20',NULL,'actif',1,5),
(6,'2023-06-22',NULL,'actif',3,6),
(7,'2023-07-01',NULL,'actif',2,7),
(8,'2023-08-10',NULL,'actif',1,8);

/* ========================= */
/* AJOUTER (12) */
/* ========================= */
INSERT INTO AJOUTER VALUES
(1,1,1,1,'2024-01-01 10:00:00',1),
(1,1,1,2,'2024-01-01 10:05:00',2),
(2,2,3,1,'2024-01-02 11:00:00',1),
(2,2,3,2,'2024-01-02 11:05:00',2),
(3,3,5,1,'2024-01-03 12:00:00',1),
(3,3,5,2,'2024-01-03 12:05:00',2),
(4,4,4,1,'2024-01-04 09:00:00',1),
(5,5,6,1,'2024-01-05 18:00:00',1),
(6,6,6,2,'2024-01-06 20:00:00',1),
(7,1,2,1,'2024-01-07 14:00:00',3),
(8,3,3,1,'2024-01-08 16:00:00',2),
(9,2,4,1,'2024-01-09 19:00:00',1);

/* ========================= */
/* ECOUTER (15) */
/* ========================= */
INSERT INTO ECOUTER VALUES
(1,1,1,'2024-02-01 10:00:00',300,'mobile'),
(2,3,1,'2024-02-02 11:00:00',250,'web'),
(3,5,1,'2024-02-03 12:00:00',200,'desktop'),
(4,4,1,'2024-02-04 13:00:00',290,'mobile'),
(5,6,1,'2024-02-05 14:00:00',190,'mobile'),
(6,6,2,'2024-02-06 15:00:00',300,'web'),
(7,2,1,'2024-02-07 16:00:00',360,'desktop'),
(8,3,2,'2024-02-08 17:00:00',240,'mobile'),
(9,1,2,'2024-02-09 18:00:00',300,'mobile'),
(10,5,2,'2024-02-10 19:00:00',210,'web'),
(1,2,1,'2024-02-11 10:30:00',350,'mobile'),
(2,1,1,'2024-02-12 11:15:00',310,'desktop'),
(3,4,2,'2024-02-13 12:40:00',260,'mobile'),
(4,5,1,'2024-02-14 13:20:00',190,'web'),
(5,3,1,'2024-02-15 14:50:00',270,'mobile');