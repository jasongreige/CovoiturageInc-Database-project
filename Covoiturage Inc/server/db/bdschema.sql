DROP SCHEMA IF EXISTS Carpooling_schema CASCADE;
CREATE SCHEMA Carpooling_schema;
SET search_path = Carpooling_schema;

CREATE TABLE Emplacement (
    nomEmplacement VARCHAR(50) NOT NULL,
    adressePostale VARCHAR(100) NOT NULL,
    nombreStationnements INT NOT NULL,
    PRIMARY KEY (nomEmplacement)
);

CREATE TABLE Vehicule (
    plaqueImmatriculation VARCHAR(50) NOT NULL,
	nomModele VARCHAR(50) NOT NULL,
    odometre INT NOT NULL,
    dateMiseService DATE NOT NULL,
    consommationEssence DECIMAL NOT NULL,
	tarifHoraire DECIMAL NOT NULL,
    tarifKilometrique DECIMAL NOT NULL, 
	emplacementOrigine VARCHAR(50),
    PRIMARY KEY (plaqueImmatriculation),
    FOREIGN KEY (emplacementOrigine) REFERENCES Emplacement(nomEmplacement)
);

CREATE TABLE Hybride (
	plaqueImmatriculation VARCHAR(20) NOT NULL,
	puissanceChargement DECIMAL NOT NULL,
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
    idMembre VARCHAR(10) NOT NULL,
	nom VARCHAR(100) NOT NULL,
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
	idMembre VARCHAR(10) NOT NULL,
	partsAchetes DECIMAL NOT NULL,
	PRIMARY KEY (idMembre),
	FOREIGN KEY (idMembre) REFERENCES Membre(idMembre)
);

CREATE TABLE MembreAutopartage (
	idMembre VARCHAR(10) NOT NULL,
	cotisationAnnuelle DECIMAL NOT NULL,
	reductionAnnuelle DECIMAL,
	PRIMARY KEY (idMembre),
	FOREIGN KEY (idMembre) REFERENCES Membre(idMembre)
);

CREATE TABLE Reservation (
    idReservation VARCHAR(10) NOT NULL,
    dateDebutReservation TIMESTAMP NOT NULL,
    dateFinReservation TIMESTAMP NOT NULL,
    exigence VARCHAR(100),
	idMembre VARCHAR(10) NOT NULL,
    plaqueImmatriculation VARCHAR(20) NOT NULL,
    PRIMARY KEY (idReservation),
    FOREIGN KEY (idMembre) REFERENCES Membre(idMembre),
    FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule(plaqueImmatriculation)
);

CREATE TABLE Facture (
    idFacture VARCHAR(10) NOT NULL,
    dateFacture DATE NOT NULL,
    dateEcheance DATE NOT NULL,
    coutTotal DECIMAL NOT NULL,
    estPayee BOOL NOT NULL,
	idMembre VARCHAR(10) NOT NULL,
    PRIMARY KEY (idFacture),
    FOREIGN KEY (idMembre) REFERENCES Membre(idMembre)
);

CREATE TABLE Utilisation (
    idUtilisation VARCHAR(5) NOT NULL,
    duree DECIMAL NOT NULL,
    odometreDebut INT NOT NULL,
    odometreFin INT NOT NULL,
	coutUtilisation DECIMAL NOT NULL,
    idReservation VARCHAR(10) NOT NULL,
	idFacture VARCHAR(10) NOT NULL,
    PRIMARY KEY (idUtilisation),
	FOREIGN KEY (idReservation) REFERENCES Reservation(idReservation),
	FOREIGN KEY (idFacture) REFERENCES Facture(idFacture)
);