DROP SCHEMA IF EXISTS Carpooling_schema CASCADE;
CREATE SCHEMA Carpooling_schema;
SET search_path = Carpooling_schema;

CREATE TABLE Emplacement (
    nomEmplacement VARCHAR(50) NOT NULL,
    adressePostale VARCHAR(100) NOT NULL,
    carte VARCHAR(100) NOT NULL,
    nombreStationnements INT NOT NULL,
    PRIMARY KEY (nomEmplacement)
);

CREATE TABLE Vehicule (
    plaqueImmatriculation VARCHAR(20) NOT NULL,
	nomModele VARCHAR(50) NOT NULL,
    odometre INT NOT NULL,
    dateMiseService DATE NOT NULL,
    consommationEssence DECIMAL(5,2) NOT NULL,
	tarifHoraire DECIMAL(7,2) NOT NULL,
    tarifKilometrique DECIMAL(7,2) NOT NULL, 
	emplacementOrigine VARCHAR(50) NOT NULL,
    PRIMARY KEY (plaqueImmatriculation),
    FOREIGN KEY (emplacementOrigine) REFERENCES Emplacement(nomEmplacement)
);

CREATE TABLE Hybride (
	plaqueImmatriculation VARCHAR(20) NOT NULL,
	puissanceChargement INT NOT NULL,
	PRIMARY KEY (plaqueImmatriculation),
	FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule(plaqueImmatriculation)
);

CREATE TABLE Berline (
	plaqueImmatriculation VARCHAR(20) NOT NULL,
	PRIMARY KEY (plaqueImmatriculation),
	FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule(plaqueImmatriculation)
);

CREATE TABLE Minicamionnette (
	plaqueImmatriculation VARCHAR(20) NOT NULL,
	PRIMARY KEY (plaqueImmatriculation),
	FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule(plaqueImmatriculation)
);

CREATE TABLE Assurance (
	numeroAssurance VARCHAR(20) NOT NULL,
    dateDebut DATE NOT NULL,
    dateEcheance DATE NOT NULL,
    assureur VARCHAR(50) NOT NULL,
    plaqueImmatriculation VARCHAR(20) NOT NULL,
    PRIMARY KEY (numeroAssurance),
    FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule(plaqueImmatriculation)
);

CREATE TABLE Membre (
    idMembre INT NOT NULL,
	dateNaissance DATE NOT NULL, 
    adressePostale VARCHAR(100) NOT NULL,
    adresseElectronique VARCHAR(100) NOT NULL,
    numeroCompteBancaire VARCHAR(50) NOT NULL,
	nomBanque VARCHAR(50) NOT NULL,
	numeroPermis VARCHAR(20) NOT NULL,
    motDePasse VARCHAR(50) NOT NULL,
	lieuOrigine VARCHAR(50) NOT NULL,
    PRIMARY KEY (idMembre),
    FOREIGN KEY (lieuOrigine) REFERENCES Emplacement(nomEmplacement)
);

CREATE TABLE MembreCooperative (
	idMembre INT NOT NULL,
	partsAchetes INT NOT NULL,
	PRIMARY KEY (idMembre),
	FOREIGN KEY (idMembre) REFERENCES Membre(idMembre)
);

CREATE TABLE MembreAutopartage (
	idMembre INT NOT NULL,
	cotisationAnnuelle INT NOT NULL,
	reductionAnnuelle INT,
	PRIMARY KEY (idMembre),
	FOREIGN KEY (idMembre) REFERENCES Membre(idMembre)
);

CREATE TABLE Reservation (
    idReservation INT NOT NULL,
    dateDebutReservation TIMESTAMP NOT NULL,
    dateFinReservation TIMESTAMP NOT NULL,
    exigence VARCHAR(100),
	idMembre INT NOT NULL,
    plaqueImmatriculation VARCHAR(20) NOT NULL,
    PRIMARY KEY (idReservation),
    FOREIGN KEY (idMembre) REFERENCES Membre(idMembre),
    FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule(plaqueImmatriculation)
);

CREATE TABLE Facture (
    idFacture INT NOT NULL,
    dateFacture DATE NOT NULL,
    dateEcheance DATE NOT NULL,
    coutTotal DECIMAL(10,2) NOT NULL,
    estPayee BOOL NOT NULL,
	idMembre INT NOT NULL,
    PRIMARY KEY (idFacture),
    FOREIGN KEY (idMembre) REFERENCES Membre(idMembre)
);

CREATE TABLE Utilisation (
    idUtilisation INT NOT NULL,
    duree DECIMAL(10,2) NOT NULL,
    odometreDebut INT NOT NULL,
    odometreFin INT NOT NULL,
	coutUtilisation DECIMAL(10,2) NOT NULL,
    idReservation INT NOT NULL,
	idFacture INT NOT NULL,
    PRIMARY KEY (idUtilisation),
	FOREIGN KEY (idReservation) REFERENCES Reservation(idReservation),
	FOREIGN KEY (idFacture) REFERENCES Facture(idFacture)
);

