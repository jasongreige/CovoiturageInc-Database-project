import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-reservations',
  templateUrl: './reservations.component.html',
  styleUrls: ['./reservations.component.css']
})
export class ReservationsComponent {
  @Input() idReservation: number;
  @Input() dateDebutReservation: string;
  @Input() dateFinReservation: string;
  @Input() exigence: string;
  @Input() idMembre: number;
  @Input() plaqueImmatriculation: string;
}
