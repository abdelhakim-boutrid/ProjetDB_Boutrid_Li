/* ========================= */
/* Contraintes UTILISATEUR */
/* ========================= */

ALTER TABLE UTILISATEUR
ADD CONSTRAINT unique_email UNIQUE(email);

ALTER TABLE UTILISATEUR
ADD CONSTRAINT unique_pseudo UNIQUE(pseudo);

ALTER TABLE UTILISATEUR
ADD CONSTRAINT check_statut_compte
CHECK (statut_compte IN ('actif','suspendu','desactive'));

ALTER TABLE UTILISATEUR
ADD CONSTRAINT check_date_inscription
CHECK (date_inscription IS NOT NULL);


/* ========================= */
/* Contraintes OFFRE_ABONNEMENT */
/* ========================= */

ALTER TABLE OFFRE_ABONNEMENT
ADD CONSTRAINT unique_nom_offre UNIQUE(nom_offre);

ALTER TABLE OFFRE_ABONNEMENT
ADD CONSTRAINT check_prix_mensuel
CHECK (prix_mensuel >= 0);

ALTER TABLE OFFRE_ABONNEMENT
ADD CONSTRAINT check_nb_appareils
CHECK (nb_appareils_max > 0);

ALTER TABLE OFFRE_ABONNEMENT
ADD CONSTRAINT check_devise
CHECK (devise IN ('EUR','USD','GBP'));


/* ========================= */
/* Contraintes ABONNEMENT */
/* ========================= */

ALTER TABLE ABONNEMENT
ADD CONSTRAINT check_statut_abonnement
CHECK (statut_abonnement IN ('actif','expire','resilie'));

ALTER TABLE ABONNEMENT
ADD CONSTRAINT check_dates_abonnement
CHECK (date_fin IS NULL OR date_fin >= date_debut);


/* ========================= */
/* Contraintes ARTISTE */
/* ========================= */

ALTER TABLE ARTISTE
ADD CONSTRAINT unique_nom_artiste UNIQUE(nom_artiste);


/* ========================= */
/* Contraintes ALBUM */
/* ========================= */

ALTER TABLE ALBUM
ADD CONSTRAINT unique_album_artiste
UNIQUE (titre_album, id_artiste);


/* ========================= */
/* Contraintes GENRE */
/* ========================= */

ALTER TABLE GENRE
ADD CONSTRAINT unique_nom_genre UNIQUE(nom_genre);


/* ========================= */
/* Contraintes PLAYLIST */
/* ========================= */

ALTER TABLE PLAYLIST
ADD CONSTRAINT check_visibilite
CHECK (visibilite IN ('publique','privee'));

ALTER TABLE PLAYLIST
ADD CONSTRAINT unique_playlist_utilisateur
UNIQUE (nom_playlist, id_utilisateur);


/* ========================= */
/* Contraintes PISTE */
/* ========================= */

ALTER TABLE PISTE
ADD CONSTRAINT check_duree_piste
CHECK (duree_sec > 0);

ALTER TABLE PISTE
ADD CONSTRAINT check_numero_piste
CHECK (numero_piste > 0);


/* ========================= */
/* Contraintes AJOUTER */
/* ========================= */

ALTER TABLE AJOUTER
ADD CONSTRAINT check_position_playlist
CHECK (position_ > 0);

ALTER TABLE AJOUTER
ADD CONSTRAINT check_date_ajout
CHECK (date_heure_ajout IS NOT NULL);


/* ========================= */
/* Contraintes ECOUTER */
/* ========================= */

ALTER TABLE ECOUTER
ADD CONSTRAINT check_duree_ecoute
CHECK (duree_ecoutee >= 0);

ALTER TABLE ECOUTER
ADD CONSTRAINT check_date_ecoute
CHECK (date_heure_ecoute IS NOT NULL);
