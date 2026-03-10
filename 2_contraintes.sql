-- Étape III.B : Contraintes de validation supplémentaires

ALTER TABLE OFFRE_ABONNEMENT ADD CONSTRAINT chk_prix_positif CHECK (prix_mensuel >= 0);

ALTER TABLE id_utilisateur ADD CONSTRAINT chk_email_format CHECK (email LIKE '%@%.%');

ALTER TABLE PISTE ADD CONSTRAINT chk_duree_piste CHECK (duree_sec > 0);

ALTER TABLE ABONNEMENT ADD CONSTRAINT chk_dates_abonnement CHECK (date_fin >= date_debut);