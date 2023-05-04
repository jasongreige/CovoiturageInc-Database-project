SET search_path = Carpooling_schema;

INSERT INTO Emplacement (nomEmplacement, adressePostale, nombreStationnements)
VALUES ('Decarie', 'H4A 3J3', 20),
       ('Sherbrooke', 'H4A 3H4', 35),
	   ('Mont-Royal', 'H2J 1X5', 25),
       ('Berri', 'H2L 2E4', 50),
       ('Edouard-Montpetit','H3T 1J6', 15);	
SELECT * FROM Emplacement;
	   
INSERT INTO Vehicule (plaqueImmatriculation, nomModele, odometre, dateMiseService, consommationEssence,
	tarifHoraire, tarifKilometrique, emplacementOrigine)
VALUES ('CANNES', 'Audi Q5', 161453, '2021-12-12', 8.70, 2.25, 0.93, 'Berri'),
       ('YY3DE4', 'Lexus RX350', 20000, '2022-01-15', 9.90, 1.90, 0.75, 'Edouard-Montpetit'),
       ('3LJF5T', 'Toyota C-HR', 20000, '2022-12-02', 4.80, 2.16, 0.65, 'Berri'),
	   ('ABCDE2', 'Hyundai Sonata', 8799, '2023-01-21', 8.80, 1.70, 0.78, 'Decarie'),
	   ('MILAN1', 'Mecerdes AMG G63', 70875, '2022-06-16', 17.20, 3.52, 4.79, 'Berri'),
	   ('RF2DE1', 'Jeep Wrangler', 150432, '2020-03-25', 13.70, 2.44, 3.10, 'Sherbrooke'),
	   ('J44YYE', 'Nissan Elantra', 10443, '2022-10-01', 4.75, 1.86, 0.45, 'Berri'),
       ('TURIN2', 'Toyota FJ Cruiser', 6098, '2023-02-13', 13.40, 2.12, 2.43, 'Decarie'),	
	   ('AA3ER1', 'Fiat Fiorino', 5438, '2023-03-05', 7.80, 1.52, 1.43, 'Mont-Royal'),
	   ('BI2FF1', 'Peugeot Bipper', 123043, '2022-07-21', 08.20, 1.62, 1.59, null),
	   ('NEMO32', 'Citroen Nemo', 10345, '2023-01-01', 7.00, 1.80, 1.61, 'Sherbrooke');
SELECT * FROM Vehicule;

INSERT INTO Hybride(plaqueImmatriculation, puissanceChargement)
VALUES ('3LJF5T', 1.31),
		('ABCDE2', 1.50),
		('J44YYE', 1.51);
SELECT * FROM Hybride;

INSERT INTO Minicamionnette (plaqueImmatriculation)
VALUES ('AA3ER1'),
		('BI2FF1'),
		('NEMO32');
SELECT * FROM Minicamionnette;
	 
INSERT INTO Berline(plaqueImmatriculation)
VALUES ('CANNES'),
		('YY3DE4'),
		('MILAN1'),
		('RF2DE1'),
		('TURIN2');
SELECT * FROM Berline;

INSERT INTO Assurance(numeroAssurance,dateDebut,dateEcheance, assureur, plaqueImmatriculation)
VALUES ('12345678','2021-11-01', '2022-10-30' , 'BelairDirect','CANNES'),
	   ('14943023','2022-10-15', '2023-10-14' , 'BelairDirect', 'CANNES'),
	   ('88543356', '2022-01-14', '2023-01-13','Intact', 'YY3DE4'),
	   ('65994303', '2023-01-13', '2024-01-12', 'Intact', 'YY3DE4'),
	   ('23469584', '2022-11-30', '2023-11-29' , 'Beneva', '3LJF5T'),
	   ('30486869', '2023-01-04','2024-01-03' , 'TDAssurance', 'ABCDE2'),
	   ('50943323', '2022-05-30', '2023-05-29' , 'Beneva','MILAN1'),
	   ('76765943', '2020-03-20', '2021-03-19', 'TDAssurance', 'RF2DE1'),
	   ('18544931', '2021-03-17', '2022-03-16', 'TDAssurance', 'RF2DE1'),
	   ('99665435', '2022-03-15', '2023-03-14', 'TDAssurance', 'RF2DE1'),
	   ('58597584', '2023-03-10', '2024-03-09', 'Intact', 'RF2DE1'),
	   ('60494848', '2022-09-30', '2023-09-29','Intact', 'J44YYE'),
	   ('96858747', '2023-02-13', '2024-02-12', 'BelairDirect', 'TURIN2'),
	   ('49857473', '2023-02-28', '2024-02-27', 'Beneva', 'AA3ER1' ),
	   ('85543034', '2022-07-15', '2023-07-14', 'Intact','BI2FF1'),
	   ('20495543', '2023-01-01', '2023-12-31' , 'BelairDirect', 'NEMO32');
SELECT * FROM Assurance;

INSERT INTO Membre(idMembre, nom, dateNaissance, adressePostale, adresseElectronique, numeroCompteBancaire,
	nomBanque, numeroPermis, motDePasse, lieuOrigine)
VALUES ('MC12345', 'Asimina Koutsos','1985-03-05' ,'H2T 3G4', 'asiminakoutsos@gmail.com', '59654', 'Desjardins',
	   	'L1537-454', '@MiKonoS', 'Berri'),
	   ('MC20041', 'Jason Greige', '1980-11-03', 'A2G 3D5', 'jasongreige@gmail.com', '49531', 'CIBC',
	   	'13AA394-32', 'HelloWorld', 'Decarie'),
	   ('MA39520', 'Gerty Sima', '1990-12-30', 'H4A 3H7', 'gertysima@gmail.com', '30120', 'Desjardins',
	   	'129B493-10', '@SoleIl', 'Berri'),
	   ('MA00231', 'Michel Desmarais','1975-07-12', 'A2G 3J6', 'micheldesmarais@gmail.com', '10001', 'RBC',
	   	'L3432-43', 'ErkgEwq2', 'Edouard-Montpetit'),
	   ('MA12054', 'Omar Azizi', '1988-10-11','H3B 1B5', 'omarazizi@gmail.com', '29786', 'Scotiabank',
	   	'32AE43-23', '54FKroe2', 'Berri'),
	   ('MC00365', 'Didier Deschamps', '1970-04-20', 'F1A 5B6', 'didierdeschamps@gmail.com', '08971', 'RBC',
	   	'A4043-44','AllezLESBleus', 'Decarie');
SELECT * FROM Membre;

INSERT INTO MembreCooperative(idMembre, partsAchetes)
VALUES ('MC12345', 20000),
	   ('MC20041', 5000),
	   ('MC00365', 40000);
SELECT * FROM MembreCooperative; 

INSERT INTO MembreAutopartage(idMembre, cotisationAnnuelle ,reductionAnnuelle)
VALUES ('MA39520', 2400, 360),
	   ('MA00231', 3000, 300),
	   ('MA12054', 5150, 772.5);
SELECT * FROM MembreAutopartage;

INSERT INTO Reservation( idReservation, dateDebutReservation, dateFinReservation, exigence,
	idMembre, plaqueImmatriculation)
VALUES ('R12345', '2023-03-12 15:00:00' , '2023-03-14 15:00:00', null, 'MA00231', 'BI2FF1'),
	   ('R00654', '2023-03-30 10:00:00', '2023-04-05 10:00:00', null, 'MC00365', 'BI2FF1'),
	   ('R40653', '2023-04-30 10:00:00', '2023-05-06 12:00:00', 'siege enfant', 'MA12054', 'CANNES'),
	   ('R79076', '2023-08-12 12:45:00', '2023-08-25 10:30:00', 'toit ouvrant', 'MA39520','MILAN1' ),
	   ('R24053', '2023-07-20 13:00:00', '2023-07-21 15:00:00', 'siege enfant', 'MA00231', '3LJF5T'),
  	   ('R43000', '2023-05-30 10:00:00', '2023-06-02 10:00:00', null, 'MC00365', 'TURIN2');
SELECT * FROM Reservation;


INSERT INTO Facture( idFacture, dateFacture,dateEcheance, coutTotal,estPayee, idMembre)
VALUES ('F35007', '2023-03-15 12:00:00', '2023-04-15 12:00:00', 1230.2, 'true', 'MA00231'),
	   ('F49483', '2023-04-06 12:00:00', '2023-05-06 12:00:00',540, 'true', 'MC00365'),
	   ('F13944', '2023-05-07 12:00:00', '2023-06-07 12:00:00', 230.54, 'true', 'MA12054'),
	   ('F34593', '2023-08-26 12:00:00', '2023-09-27 12:00:00', 143, 'false','MA39520'),
	   ('F19354', '2023-07-22 12:00:00', '2023-08-22 12:00:00', 303, 'false', 'MA00231'),
  	   ('F40532', '2023-06-03 12:00:00', '2023-07-03 12:00:00', 230.43, 'true', 'MC00365');
SELECT * FROM Facture;

INSERT INTO Utilisation( idUtilisation, duree, odometreDebut, odometreFin, coutUtilisation,
    idReservation, idFacture)
VALUES ('U0001', 5.25, 123043, 130000, 100.55, 'R12345', 'F35007'),
	   ('U0002', 2.43, 130000, 131000, 87.43, 'R12345', 'F35007'),
	   ('U0003', 7.21, 131000, 133000, 250.60, 'R12345', 'F35007'),
	   ('U0101', 9.71, 6098, 7000, 40.65, 'R43000', 'F40532'),
	   ('U0021', 5.13, 20000, 20500, 232.12, 'R24053', 'F19354'),
	   ('U0015', 3.12, 70875, 72000, 334.65, 'R79076', 'F34593');
SELECT * FROM Utilisation;

