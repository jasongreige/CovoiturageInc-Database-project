// À DÉCOMMENTER ET À UTILISER LORSQUE VOTRE COMMUNICATION EST IMPLÉMENTÉE
// import { HttpClient } from "@angular/common/http";
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, Subject } from "rxjs";
import { Member, Reservations } from "../member.interface";

@Injectable()
export class CommunicationService {
  // À DÉCOMMENTER ET À UTILISER LORSQUE VOTRE COMMUNICATION EST IMPLÉMENTÉE
  private readonly BASE_URL: string = "http://localhost:3000/database";
  public constructor(private readonly http: HttpClient) {}

  private _listeners: any = new Subject<any>();

  listen(): Observable<any> {
    return this._listeners.asObservable();
  }

  filter(filterBy: string): void {
    this._listeners.next(filterBy);
  }

  fetchNames(name: string): Observable<Member[]> {
    return this.http.get<Member[]>(this.BASE_URL + "/search/" + name);
  }

  fetchReservations(): Observable<Reservations[]> {
    return this.http.get<Reservations[]>(this.BASE_URL + "/reservations");
  }

  addNewReservation(reservation: Reservations): void { 
    this.http.post(this.BASE_URL + "/reservations", reservation).subscribe();
  } 


  // À DÉCOMMENTER ET À UTILISER LORSQUE VOTRE COMMUNICATION EST IMPLÉMENTÉE
  // private handleError<T>(
  //   request: string,
  //   result?: T
  // ): (error: Error) => Observable<T> {
  //   return (error: Error): Observable<T> => {
  //     return of(result as T);
  //   };
  // }
}
