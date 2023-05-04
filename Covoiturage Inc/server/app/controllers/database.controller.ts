import { Router } from "express";
import { inject, injectable } from "inversify";
import { DatabaseService } from "../services/database.service";
import Types from "../types";

@injectable()
export class DatabaseController {
  _router: Router = Router();

  public constructor(
    // @ts-ignore -- À ENLEVER LORSQUE L'IMPLÉMENTATION EST TERMINÉE
    @inject(Types.DatabaseService) private readonly databaseService: DatabaseService
  ) {

    this.configureRoutes();
  }

  public get router(): Router {
    return this._router;
  }

  private configureRoutes(): void {
    this.router.get("/search/:name", async (req: any, res: any) => {
      try {
        this.databaseService.searchName(req.params.name).then((result: any) => {
          res.send(result);
        });
      } catch (err) {
        console.error('Error during query execution', err);
        throw err;
      }

    });

    this.router.get("/reservations", (req: any, res: any) => {
      try {
        this.databaseService.getReservations().then((result: any) => {
          res.send(result);
        });
      } catch (err) {
        console.error('Error during query execution', err);
        throw err;
      }
    });


    this.router.post("/reservations", (req: any, res: any) => {
      try {
        this.databaseService.addNewReservation(req.body);
      } catch (err) {
        console.error('Error during query execution', err);
        throw err;
      }
    }
    );
  }
}
