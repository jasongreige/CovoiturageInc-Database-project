import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.css']
})
export class MemberComponent {
  @Input() idMembre: number;
  @Input() dateNaissance: string;
  @Input() adressePostale: string;
  @Input() adresseElectronique: string;
  @Input() numeroCompteBanquaire: string;
  @Input() nom: string;
  @Input() nomBanque: string;
  @Input() numeroPermis: string;
  @Input() motDePasse: string;
  @Input() lieuOrigine: string;
}
