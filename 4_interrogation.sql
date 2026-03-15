/* ========================================= */
/* 1️⃣ PROJECTIONS / SELECTIONS (au moins 5) */
/* ========================================= */

/* 1. Liste des pseudos et emails des utilisateurs actifs */
SELECT pseudo, email
FROM UTILISATEUR
WHERE statut_compte = 'actif';

/* 2. Liste des albums triés par date de sortie */
SELECT titre_album, date_sortie_album
FROM ALBUM
ORDER BY date_sortie_album DESC;

/* 3. Genres uniques présents dans la base */
SELECT DISTINCT nom_genre
FROM GENRE;

/* 4. Pistes dont la durée est comprise entre 200 et 300 secondes */
SELECT titre_piste, duree_sec
FROM PISTE
WHERE duree_sec BETWEEN 200 AND 300;

/* 5. Playlists publiques */
SELECT nom_playlist
FROM PLAYLIST
WHERE visibilite = 'publique';



/* ========================================= */
/* 2️⃣ AGRÉGATIONS (GROUP BY / HAVING) */
/* ========================================= */

/* 6. Nombre de playlists créées par utilisateur */
SELECT id_utilisateur, COUNT(*) AS nb_playlists
FROM PLAYLIST
GROUP BY id_utilisateur;

/* 7. Nombre de pistes par album */
SELECT id_album, COUNT(*) AS nb_pistes
FROM PISTE
GROUP BY id_album;

/* 8. Durée moyenne des pistes par genre */
SELECT id_genre, AVG(duree_sec) AS duree_moyenne
FROM PISTE
GROUP BY id_genre;

/* 9. Nombre d'écoutes par utilisateur */
SELECT id_utilisateur, COUNT(*) AS nb_ecoutes
FROM ECOUTER
GROUP BY id_utilisateur;

/* 10. Albums ayant plus d'une piste */
SELECT id_album, COUNT(*) AS nb_pistes
FROM PISTE
GROUP BY id_album
HAVING COUNT(*) > 1;



/* ========================================= */
/* 3️⃣ JOINTURES (au moins 5) */
/* ========================================= */

/* 11. Liste des albums avec le nom de l'artiste */
SELECT ALBUM.titre_album, ARTISTE.nom_artiste
FROM ALBUM
INNER JOIN ARTISTE
ON ALBUM.id_artiste = ARTISTE.id_artiste;

/* 12. Liste des playlists avec le pseudo de l'utilisateur */
SELECT PLAYLIST.nom_playlist, UTILISATEUR.pseudo
FROM PLAYLIST
INNER JOIN UTILISATEUR
ON PLAYLIST.id_utilisateur = UTILISATEUR.id_utilisateur;

/* 13. Liste des pistes avec leur genre */
SELECT PISTE.titre_piste, GENRE.nom_genre
FROM PISTE
INNER JOIN GENRE
ON PISTE.id_genre = GENRE.id_genre;

/* 14. Liste des abonnements avec l'offre correspondante */
SELECT ABONNEMENT.id_abonnement, OFFRE_ABONNEMENT.nom_offre
FROM ABONNEMENT
INNER JOIN OFFRE_ABONNEMENT
ON ABONNEMENT.id_offre = OFFRE_ABONNEMENT.id_offre;

/* 15. Liste des pistes écoutées avec le pseudo utilisateur */
SELECT UTILISATEUR.pseudo, PISTE.titre_piste
FROM ECOUTER
INNER JOIN UTILISATEUR
ON ECOUTER.id_utilisateur = UTILISATEUR.id_utilisateur
INNER JOIN PISTE
ON ECOUTER.id_album = PISTE.id_album
AND ECOUTER.numero_piste = PISTE.numero_piste;



/* ========================================= */
/* 4️⃣ REQUÊTES IMBRIQUÉES */
/* ========================================= */

/* 16. Utilisateurs ayant un abonnement Premium */
SELECT pseudo
FROM UTILISATEUR
WHERE id_utilisateur IN (
    SELECT id_utilisateur
    FROM ABONNEMENT
    WHERE id_offre = 2
);

/* 17. Albums contenant au moins une piste explicite */
SELECT titre_album
FROM ALBUM
WHERE id_album IN (
    SELECT id_album
    FROM PISTE
    WHERE explicite = TRUE
);

/* 18. Utilisateurs ayant au moins une écoute enregistrée */
SELECT pseudo
FROM UTILISATEUR
WHERE EXISTS (
    SELECT *
    FROM ECOUTER
    WHERE ECOUTER.id_utilisateur = UTILISATEUR.id_utilisateur
);

/* 19. Pistes appartenant à un genre parent spécifique */
SELECT titre_piste
FROM PISTE
WHERE id_genre IN (
    SELECT id_genre
    FROM GENRE
    WHERE id_genre_parent_hierarchie IS NOT NULL
);

/* 20. Utilisateurs n'ayant aucune playlist */
SELECT pseudo
FROM UTILISATEUR
WHERE id_utilisateur NOT IN (
    SELECT id_utilisateur
    FROM PLAYLIST
);