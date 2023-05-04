import { Component } from '@angular/core';
import { CommunicationService } from '../services/communication.service';
import { Member } from '../member.interface';

@Component({
  selector: 'app-search-page',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.css']
})
export class SearchPageComponent {

  constructor(private communicationService: CommunicationService) { }
  public members: Member[] = [];
  
  ngOnInit(): void {
    this. getMembers();
    
  }
  

  getMembers(): void {
    const input = document.getElementById('search-input') as HTMLInputElement;
    if (input.value === '') {
      this.members = [];
      return;
    }
    const name = input.value.toLocaleLowerCase();
    this.communicationService.fetchNames(name).subscribe((result: any) => {
      this.members = result;
    });
  }

}
