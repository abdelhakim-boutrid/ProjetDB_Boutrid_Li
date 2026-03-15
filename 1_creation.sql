CREATE TABLE UTILISATEUR(
   id_utilisateur INT,
   pseudo VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   hash_mdp VARCHAR(50) NOT NULL,
   date_inscription DATE NOT NULL,
   statut_compte VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_utilisateur)
);

CREATE TABLE OFFRE_ABONNEMENT(
   id_offre INT,
   nom_offre VARCHAR(50) NOT NULL,
   prix_mensuel DECIMAL(6,2) NOT NULL,
   devise VARCHAR(3) NOT NULL,
   qualite_audio_max VARCHAR(50) NOT NULL,
   pub_incluse BOOLEAN NOT NULL,
   nb_appareils_max INT NOT NULL,
   PRIMARY KEY(id_offre)
);

CREATE TABLE ABONNEMENT(
   id_abonnement INT,
   date_debut DATE NOT NULL,
   date_fin DATE,
   statut_abonnement VARCHAR(50) NOT NULL,
   id_offre INT NOT NULL,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_abonnement),
   FOREIGN KEY(id_offre)
      REFERENCES OFFRE_ABONNEMENT(id_offre)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(id_utilisateur)
      REFERENCES UTILISATEUR(id_utilisateur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE ARTISTE(
   id_artiste INT,
   nom_artiste VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_artiste)
);

CREATE TABLE ALBUM(
   id_album INT,
   titre_album VARCHAR(50) NOT NULL,
   date_sortie_album DATE NOT NULL,
   id_artiste INT NOT NULL,
   PRIMARY KEY(id_album),
   FOREIGN KEY(id_artiste)
      REFERENCES ARTISTE(id_artiste)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE GENRE(
   id_genre INT,
   nom_genre VARCHAR(50) NOT NULL,
   id_genre_parent_hierarchie INT,
   PRIMARY KEY(id_genre),
   FOREIGN KEY(id_genre_parent_hierarchie)
      REFERENCES GENRE(id_genre)
      ON DELETE SET NULL
      ON UPDATE CASCADE
);

CREATE TABLE PLAYLIST(
   id_playlist INT,
   nom_playlist VARCHAR(50) NOT NULL,
   visibilite VARCHAR(50) NOT NULL,
   collaborative BOOLEAN NOT NULL,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_playlist),
   FOREIGN KEY(id_utilisateur)
      REFERENCES UTILISATEUR(id_utilisateur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE PISTE(
   id_album INT,
   numero_piste INT,
   titre_piste VARCHAR(50) NOT NULL,
   duree_sec INT NOT NULL,
   explicite BOOLEAN NOT NULL,
   id_genre INT NOT NULL,
   PRIMARY KEY(id_album, numero_piste),
   FOREIGN KEY(id_genre)
      REFERENCES GENRE(id_genre)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(id_album)
      REFERENCES ALBUM(id_album)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE AJOUTER(
   id_utilisateur INT,
   id_playlist INT,
   id_album INT,
   numero_piste INT,
   date_heure_ajout DATETIME,
   position_ INT,
   PRIMARY KEY(id_utilisateur, id_playlist, id_album, numero_piste),
   FOREIGN KEY(id_utilisateur)
      REFERENCES UTILISATEUR(id_utilisateur)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(id_playlist)
      REFERENCES PLAYLIST(id_playlist)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(id_album, numero_piste)
      REFERENCES PISTE(id_album, numero_piste)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE ECOUTER(
   id_utilisateur INT,
   id_album INT,
   numero_piste INT,
   date_heure_ecoute DATETIME,
   duree_ecoutee INT,
   type_appareil VARCHAR(50),
   PRIMARY KEY(id_utilisateur, id_album, numero_piste),
   FOREIGN KEY(id_utilisateur)
      REFERENCES UTILISATEUR(id_utilisateur)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(id_album, numero_piste)
      REFERENCES PISTE(id_album, numero_piste)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);