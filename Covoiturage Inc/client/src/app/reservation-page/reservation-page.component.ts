import { Component } from '@angular/core';
import { CommunicationService } from '../services/communication.service';
import { Reservations } from '../member.interface';

@Component({
  selector: 'app-reservation-page',
  templateUrl: './reservation-page.component.html',
  styleUrls: ['./reservation-page.component.css']
})
export class ReservationPageComponent {

  constructor(private communicationService: CommunicationService) { }
  public reservations: Reservations[] = [];


  getReservations(): void {
    this.communicationService.fetchReservations().subscribe((result: any) => {
      this.reservations = result;
    });
  }

  public ngOnInit(): void { 
    this.getReservations();
  }
}
