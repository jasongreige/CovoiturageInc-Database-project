-- Retourner la marque, le modèle et l'emplacement d'origine des véhicules
SELECT V.nomModele, V.emplacementOrigine
FROM Vehicule V;

-- Retourner la marque, le modèle et l'emplacement d'origine des véhicules, y compris les marques et modèles qui n'ont pas de localisation
SELECT V.nomModele, V.emplacementOrigine
FROM Vehicule V
LEFT JOIN Emplacement E ON V.emplacementOrigine = E.nomEmplacement;

-- Retourner les emplacements sans véhicules
SELECT E.nomEmplacement, E.adressePostale, E.carte, E.nombreStationnements
FROM Emplacement E
LEFT JOIN Vehicule V ON E.nomEmplacement = V.emplacementOrigine
WHERE V.plaqueImmatriculation IS NULL;

-- Retourner tous les véhicules dont le domicile est situé dans la ville de Montréal
SELECT V.nomModele, V.emplacementOrigine
FROM Vehicule V
LEFT JOIN Emplacement E ON V.emplacementOrigine = E.nomEmplacement
WHERE E.adressePostale LIKE '%Montréal%';

-- Retourner les emplacements et le nombre de voitures hybrides à chaque emplacement
SELECT E.nomEmplacement, COUNT(*) AS nombreHybrides
FROM Vehicule V
JOIN Hybride H ON V.plaqueImmatriculation = H.plaqueImmatriculation
JOIN Emplacement E ON V.emplacementOrigine = E.nomEmplacement
GROUP BY E.nomEmplacement;

-- Liste des plaques d'immatriculation des véhicules qui ont été utilisés
SELECT DISTINCT plaque_immatriculation
FROM reservation
WHERE date_debut <= NOW() AND date_fin >= NOW();

-- Informations des membres vivant dans une ville avec un emplacement qui a des voitures hybrides
SELECT m.*
FROM membre m
INNER JOIN emplacement e ON m.ville = e.ville
INNER JOIN vehicule v ON e.id_emplacement = v.id_emplacement
WHERE v.type = 'hybride';

SELECT *
FROM vehicule
WHERE id_emplacement IN (SELECT id_emplacement FROM emplacement WHERE ville = 'Montréal')
AND plaque_immatriculation NOT IN (
    SELECT DISTINCT plaque_immatriculation
    FROM reservation
    WHERE date_debut <= '2023-01-23 10:00:00' AND date_fin >= '2023-01-23 10:00:00'
);

-- Liste des plaques d'immatriculation et nombre de réservations de chaque véhicule
SELECT v.plaque_immatriculation, COUNT(r.plaque_immatriculation) AS nombre_reservations
FROM vehicule v
LEFT JOIN reservation r ON v.plaque_immatriculation = r.plaque_immatriculation
GROUP BY v.plaque_immatriculation;

-- Véhicule avec la consommation de carburant la plus élevée
SELECT *
FROM vehicule
WHERE consommation_carburant = (
    SELECT MAX(consommation_carburant)
    FROM vehicule
);

-- Consommation de carburant maximale, moyenne et minimale par catégorie de véhicule
SELECT type, MAX(consommation_carburant) AS consommation_maximale, AVG(consommation_carburant) AS consommation_moyenne, MIN(consommation_carburant) AS consommation_minimale
FROM vehicule
GROUP BY type;

-- Retournez tous les membres qui ont réservé un véhicule à un endroit autre que leur emplacement d’origine même si le type de véhicule existe à leur emplacement d’origine
SELECT m.*
FROM membres m
JOIN reservations r ON m.id = r.membre_id
JOIN vehicules v ON r.vehicule_id = v.id
JOIN emplacements e1 ON r.emplacement_depart_id = e1.id
JOIN emplacements e2 ON r.emplacement_arrivee_id = e2.id
WHERE e1.ville != e2.ville AND v.type = ANY(SELECT v2.type FROM vehicules v2 JOIN emplacements e3 ON v2.emplacement_id = e3.id WHERE e3.id = e1.id)