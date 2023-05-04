CREATE OR REPLACE FUNCTION odometer_reached() 
RETURNS TRIGGER AS 
$$
BEGIN
    -- Vérifier si l'odomètre a atteint la valeur spécifique
    IF NEW.odometre >= (SELECT valeur_odometre FROM types_vehicules WHERE id = NEW.type_vehicule) THEN
        -- Créer la table AVENDRE si elle n'existe pas encore
        CREATE TABLE IF NOT EXISTS AVENDRE (
            id SERIAL PRIMARY KEY,
            marque VARCHAR(255) NOT NULL,
            modele VARCHAR(255) NOT NULL,
            annee INTEGER NOT NULL,
            kilometrage INTEGER NOT NULL,
            prix DECIMAL(10, 2) NOT NULL
        );
        -- Insérer les informations du véhicule dans la table AVENDRE
        INSERT INTO AVENDRE (marque, modele, annee, kilometrage, prix) VALUES (NEW.marque, NEW.modele, NEW.annee, NEW.odometre, (NEW.valeur_achat * 0.8));
    END IF;
    -- Renvoyer le déclencheur
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Créer le déclencheur qui appelle la fonction odometer_reached lorsqu'une nouvelle ligne est insérée dans la table vehicules
CREATE TRIGGER insert_avendre AFTER INSERT ON vehicules FOR EACH ROW EXECUTE FUNCTION odometer_reached();