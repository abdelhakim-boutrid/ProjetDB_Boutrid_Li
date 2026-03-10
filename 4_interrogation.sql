
-- I. PROJECTIONS ET SÉLECTIONS (5 requêtes) [cite: 43]
-- 1. Liste des utilisateurs inscrits en 2023
SELECT pseudo, email FROM id_utilisateur WHERE date_inscription LIKE '2023%';

-- 2. Offres dont le prix est entre 5 et 15 euros
SELECT nom_offre, prix_mensuel FROM OFFRE_ABONNEMENT WHERE prix_mensuel BETWEEN 5 AND 15;

-- 3. Utilisateurs ayant un pseudo commençant par 'A' ou 'B'
SELECT pseudo FROM id_utilisateur WHERE pseudo REGEXP '^[AB]';

-- 4. Pistes explicites uniquement
SELECT titre_piste FROM PISTE WHERE explicite = 'Oui';

-- 5. Abonnements expirés ou suspendus
SELECT id_abonnement FROM ABONNEMENT WHERE statut_abonnement IN ('Expiré', 'Suspendu');


-- II
-- 6. Nombre d'utilisateurs par statut de compte
SELECT statut_compte, COUNT(*) FROM id_utilisateur GROUP BY statut_compte;

-- 7. Prix moyen des offres par devise
SELECT devise, AVG(prix_mensuel) FROM OFFRE_ABONNEMENT GROUP BY devise;

-- 8. Nombre de pistes par album, seulement pour les albums de plus de 3 pistes
SELECT id_album, COUNT(*) as nb_pistes FROM PISTE GROUP BY id_album HAVING nb_pistes > 3;

-- 9. Durée totale d'écoute par utilisateur
SELECT id_utilisateur, SUM(duree_ecoutee) FROM ECOUTER GROUP BY id_utilisateur;

-- 10. Nombre de playlists créées par chaque utilisateur
SELECT id_utilisateur, COUNT(id_playlist) FROM PLAYLIST GROUP BY id_utilisateur;


-- III. JOINTURES (5 requêtes) [cite: 45]
-- 11. Liste des utilisateurs avec le nom de leur offre d'abonnement
SELECT u.pseudo, o.nom_offre 
FROM id_utilisateur u 
JOIN ABONNEMENT a ON u.id_utilisateur = a.id_utilisateur
JOIN OFFRE_ABONNEMENT o ON a.id_offre = o.id_offre;

-- 12. Titres des pistes et le nom de leur album respectif
SELECT p.titre_piste, al.titre_album FROM PISTE p JOIN ALBUM al ON p.id_album = al.id_album;

-- 13. Tous les artistes et leurs albums (même s'ils n'en ont pas - Jointure externe)
SELECT ar.nom_artiste, al.titre_album FROM ARTISTE ar LEFT JOIN ALBUM al ON ar.id_artiste = al.id_artiste;

-- 14. Détails des ajouts en playlist (pseudo, nom playlist, titre piste)
SELECT u.pseudo, pl.nom_playlist, p.titre_piste 
FROM AJOUTER aj
JOIN id_utilisateur u ON aj.id_utilisateur = u.id_utilisateur
JOIN PLAYLIST pl ON aj.id_playlist = pl.id_playlist
JOIN PISTE p ON aj.id_album = p.id_album AND aj.numero_piste = p.numero_piste;

-- 15. Albums et noms des genres associés
SELECT al.titre_album, g.nom_genre FROM ALBUM al 
JOIN PISTE p ON al.id_album = p.id_album
JOIN GENRE g ON p.id_genre = g.id_genre;


-- IV. REQUÊTES IMBRIQUÉES (5 requêtes) [cite: 46]
-- 16. Utilisateurs qui n'ont jamais écouté de musique (NOT EXISTS)
SELECT pseudo FROM id_utilisateur u 
WHERE NOT EXISTS (SELECT 1 FROM ECOUTER e WHERE e.id_utilisateur = u.id_utilisateur);

-- 17. Albums dont l'artiste est 'Pop Queen' (IN)
SELECT titre_album FROM ALBUM WHERE id_artiste IN (SELECT id_artiste FROM ARTISTE WHERE nom_artiste = 'Pop Queen');

-- 18. Pistes dont la durée est supérieure à la moyenne de toutes les pistes
SELECT titre_piste FROM PISTE WHERE duree_sec > (SELECT AVG(duree_sec) FROM PISTE);

-- 19. Utilisateurs ayant le même type d'abonnement qu'Alice01 (ANY)
SELECT pseudo FROM id_utilisateur WHERE id_utilisateur = ANY (
    SELECT id_utilisateur FROM ABONNEMENT WHERE id_offre = (
        SELECT id_offre FROM ABONNEMENT a JOIN id_utilisateur u ON a.id_utilisateur = u.id_utilisateur WHERE u.pseudo = 'Alice01'
    )
);

-- 20. Offres plus chères que toutes les offres "Basic" (ALL)
SELECT nom_offre FROM OFFRE_ABONNEMENT WHERE prix_mensuel > ALL (SELECT prix_mensuel FROM OFFRE_ABONNEMENT WHERE nom_offre = 'Basic');