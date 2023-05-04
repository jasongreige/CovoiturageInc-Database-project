"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.DatabaseController = void 0;
const express_1 = require("express");
const inversify_1 = require("inversify");
const database_service_1 = require("../services/database.service");
const types_1 = require("../types");
let DatabaseController = class DatabaseController {
    constructor(databaseService) {
        this.databaseService = databaseService;
        this._router = (0, express_1.Router)();
        this.configureRoutes();
    }
    get router() {
        return this._router;
    }
    configureRoutes() {
        this.router.get("/search/:name", (req, res) => __awaiter(this, void 0, void 0, function* () {
            try {
                this.databaseService.searchName(req.params.name).then((result) => {
                    res.send(result);
                });
            }
            catch (err) {
                console.error('Error during query execution', err);
                throw err;
            }
        }));
        this.router.get("/reservations", (req, res) => {
            try {
                this.databaseService.getReservations().then((result) => {
                    res.send(result);
                });
            }
            catch (err) {
                console.error('Error during query execution', err);
                throw err;
            }
        });
        this.router.post("/reservations", (req, res) => {
            try {
                this.databaseService.addNewReservation(req.body);
            }
            catch (err) {
                console.error('Error during query execution', err);
                throw err;
            }
        });
    }
};
DatabaseController = __decorate([
    (0, inversify_1.injectable)(),
    __param(0, (0, inversify_1.inject)(types_1.default.DatabaseService)),
    __metadata("design:paramtypes", [database_service_1.DatabaseService])
], DatabaseController);
exports.DatabaseController = DatabaseController;
//# sourceMappingURL=database.controller.js.map