import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MakeReservationsPageComponent } from './make-reservations-page.component';

describe('MakeReservationsPageComponent', () => {
  let component: MakeReservationsPageComponent;
  let fixture: ComponentFixture<MakeReservationsPageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MakeReservationsPageComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MakeReservationsPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
