import { Member, Reservations } from "@app/member.interface";
import { injectable } from "inversify";
import * as pg from "pg";
import "reflect-metadata";

@injectable()
export class DatabaseService {
  public connectionConfig: pg.ConnectionConfig = {
    user: "postgres",
    database: "TP4-3710-Database",
    password: "laval2002",
    port: 5432,          // Attention ! Peut aussi être 5433 pour certains utilisateurs
    host: "127.0.0.1",
    keepAlive: true
  };

  public pool: pg.Pool = new pg.Pool(this.connectionConfig);


  async searchName(name: string): Promise<Member[]> {
    const client = await this.pool.connect();
    try {
      const result = await client.query(`SELECT * FROM carpooling_schema.Membre WHERE LOWER(nom) LIKE LOWER('%${name}%')`);
      return result.rows;
    } catch (err) {
      console.error('Error during query execution', err);
      throw err;
    } finally {
      client.release();
    }
  }

  async getReservations(): Promise<Reservations[]> {
    const client = await this.pool.connect();
    try {
      const result = await client.query(`SELECT * FROM carpooling_schema.Reservation`);
      return result.rows;
    } catch (err) {
      console.error('Error during query execution', err);
      throw err;
    } finally {
      client.release();
    }
  }

  async addNewReservation(reservation: Reservations): Promise<void> {
    const client = await this.pool.connect();
    try {
      await client.query(`INSERT INTO carpooling_schema.Reservation(idReservation, dateDebutReservation, dateFinReservation, exigence, idMembre, plaqueImmatriculation) VALUES ('${reservation.idReservation}', '${reservation.dateDebutReservation}', '${reservation.dateFinReservation}', '${reservation.exigence}', '${reservation.idMembre}', '${reservation.plaqueImmatriculation}')`);
    } catch (err) {
      console.error('Error during query execution', err);
      throw err;
    } finally {
      client.release();
    }
  }
}

