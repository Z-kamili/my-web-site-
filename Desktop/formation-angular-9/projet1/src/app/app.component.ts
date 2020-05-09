import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
  post = {
    title:"Lorem ipsum",
    isFavorite : false
  }
  
  maFonction(isfavorite){
    console.log("Favorite changed",isfavorite);
  }

}
