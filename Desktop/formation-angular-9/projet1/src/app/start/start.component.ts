import {Component,OnInit,Input,Output,EventEmitter} from '@angular/core';
@Component({
  selector: 'app-start',
  templateUrl: './start.component.html',
  styleUrls: ['./start.component.css'],
})
export class StartComponent implements OnInit {
@Input('is-fav')  isSelected = true;
  constructor() { }
  ngOnInit(): void {
  }
  @Output("change") click = new EventEmitter();
  onclick(){
 this.isSelected = !this.isSelected;
 this.click.emit({newState:this.isSelected});
 }
}
