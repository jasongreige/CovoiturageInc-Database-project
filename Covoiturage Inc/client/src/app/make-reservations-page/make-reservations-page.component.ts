import { Component } from '@angular/core';
import { CommunicationService } from '../services/communication.service';
import { Reservations } from '../member.interface';
import { v4 as randomUUID } from 'uuid';


@Component({
  selector: 'app-make-reservations-page',
  templateUrl: './make-reservations-page.component.html',
  styleUrls: ['./make-reservations-page.component.css']
})
export class MakeReservationsPageComponent {
  newReservation: Reservations = { idReservation: '', dateDebutReservation: '', dateFinReservation: '', exigence: '', plaqueImmatriculation: '', idMembre: '' };

  constructor(private communicationService: CommunicationService) { }

  addReservation() {
    const input = document.getElementById('start-date') as HTMLInputElement;
    const dateDebut= input.value;
    this.newReservation.dateDebutReservation = dateDebut;

    const input2 = document.getElementById('end-date') as HTMLInputElement;
    const dateFin= input2.value;
    this.newReservation.dateFinReservation = dateFin;
  
    const input3 = document.getElementById('exigence') as HTMLInputElement;
    const exigence= input3.value;
    this.newReservation.exigence = exigence;
  
    const plaque = (document.getElementById('plaque') as HTMLSelectElement).value;
    this.newReservation.plaqueImmatriculation = plaque;
  
    const idMembre = (document.getElementById('id-membre') as HTMLSelectElement).value;

    this.newReservation.idMembre = idMembre;
  

    if (!dateDebut || !dateFin || !exigence || !plaque) {

      const messageElement = document.getElementById('message') as HTMLDivElement;
      messageElement.textContent = 'Veuillez remplir tous les champs obligatoires.';
      messageElement.style.color = 'red';
    } else {
      this.newReservation.idReservation = (randomUUID().substring(0, 6)).toUpperCase();

      this.communicationService.addNewReservation(this.newReservation);
      const messageElement = document.getElementById('message') as HTMLDivElement;
      messageElement.textContent = 'La réservation a été ajoutée avec succès.';
      messageElement.style.color = 'green';
    }
  }
}
