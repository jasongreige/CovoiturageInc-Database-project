import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "../app.component";
import { SearchPageComponent } from "../search-page/search-page.component";
import { ReservationPageComponent } from "../reservation-page/reservation-page.component";
import { MakeReservationsPageComponent } from "../make-reservations-page/make-reservations-page.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "search", component: SearchPageComponent },
  { path: "reservation", component: ReservationPageComponent },
  { path: "make-reservation", component: MakeReservationsPageComponent }


];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
