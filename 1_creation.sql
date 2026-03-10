-- FICHIER 1 : 1_creation.sql

CREATE TABLE id_utilisateur(
   id_utilisateur VARCHAR(50),
   pseudo VARCHAR(50),
   email VARCHAR(50),
   hash_mdp VARCHAR(50),
   date_inscription VARCHAR(50),
   statut_compte VARCHAR(50),
   PRIMARY KEY(id_utilisateur)
);

CREATE TABLE OFFRE_ABONNEMENT(
   id_offre VARCHAR(50),
   nom_offre VARCHAR(50),
   prix_mensuel VARCHAR(50),
   devise VARCHAR(50),
   qualite_audio_max VARCHAR(50),
   pub_incluse VARCHAR(50),
   nb_appareils_max VARCHAR(50),
   PRIMARY KEY(id_offre)
);

CREATE TABLE ABONNEMENT(
   id_abonnement VARCHAR(50),
   date_debut VARCHAR(50),
   date_fin VARCHAR(50),
   statut_abonnement VARCHAR(50),
   id_offre VARCHAR(50) NOT NULL,
   id_utilisateur VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_abonnement),
   FOREIGN KEY(id_offre) REFERENCES OFFRE_ABONNEMENT(id_offre) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_utilisateur) REFERENCES id_utilisateur(id_utilisateur) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ARTISTE(
   id_artiste VARCHAR(50),
   nom_artiste VARCHAR(50),
   PRIMARY KEY(id_artiste)
);

CREATE TABLE ALBUM(
   id_album VARCHAR(50),
   titre_album VARCHAR(50),
   date_sortie_album VARCHAR(50),
   id_artiste VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_album),
   FOREIGN KEY(id_artiste) REFERENCES ARTISTE(id_artiste) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GENRE(
   id_genre VARCHAR(50),
   nom_genre VARCHAR(50),
   Identifiant_genre_parent_hiérarchie_ VARCHAR(50),
   id_genre_1 VARCHAR(50),
   PRIMARY KEY(id_genre),
   FOREIGN KEY(id_genre_1) REFERENCES GENRE(id_genre) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PLAYLIST(
   id_playlist VARCHAR(50),
   nom_playlist VARCHAR(50),
   visibilite VARCHAR(50),
   collaborative VARCHAR(50),
   id_utilisateur VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_playlist),
   FOREIGN KEY(id_utilisateur) REFERENCES id_utilisateur(id_utilisateur) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PISTE(
   id_album VARCHAR(50),
   numero_piste VARCHAR(50),
   titre_piste VARCHAR(50),
   duree_sec VARCHAR(50),
   explicite VARCHAR(50),
   id_genre VARCHAR(50) NOT NULL,
   id_album_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_album, numero_piste),
   FOREIGN KEY(id_genre) REFERENCES GENRE(id_genre) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_album_1) REFERENCES ALBUM(id_album) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AJOUTER(
   id_utilisateur VARCHAR(50),
   id_playlist VARCHAR(50),
   id_album VARCHAR(50),
   numero_piste VARCHAR(50),
   date_heure_ajout VARCHAR(50),
   position_ VARCHAR(50),
   PRIMARY KEY(id_utilisateur, id_playlist, id_album, numero_piste),
   FOREIGN KEY(id_utilisateur) REFERENCES id_utilisateur(id_utilisateur) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_playlist) REFERENCES PLAYLIST(id_playlist) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_album, numero_piste) REFERENCES PISTE(id_album, numero_piste) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ECOUTER(
   id_utilisateur VARCHAR(50),
   id_album VARCHAR(50),
   numero_piste VARCHAR(50),
   date_heure_ecoute VARCHAR(50),
   duree_ecoutee VARCHAR(50),
   type_appareil VARCHAR(50),
   PRIMARY KEY(id_utilisateur, id_album, numero_piste),
   FOREIGN KEY(id_utilisateur) REFERENCES id_utilisateur(id_utilisateur) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_album, numero_piste) REFERENCES PISTE(id_album, numero_piste) ON DELETE CASCADE ON UPDATE CASCADE
);