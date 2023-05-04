export interface Member {
  idMembre: number,
  dateNaissance: string,
  adressePostale: string,
  adresseElectronique: string,
  numeroCompteBanquaire: string,
  nom: string,
  nomBanque: string,
  numeroPermis: string,
  motDePasse: string,
  lieuOrigine: string
}

export interface Reservations {
  idReservation: string,
  dateDebutReservation: string,
  dateFinReservation: string,
  exigence: string,
  idMembre: string,
  plaqueImmatriculation: string,
}