import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls:['./app.component.css']
})
export class AppComponent {
courses;
loadcourses(){
this.courses = [
  {id:1,title:"Laravel"},
  {id:2,title:"Angular"},
  {id:3,title:"VueJS"},
  {id:4,title:"Symfony"},
  {id:5,title:"AdonisJS"},
  ];
}
trackCourse(index,course){
  return course ? course.id : undefined;
}
AddCourse(){
this.courses.push({id:6,title:"ReactJS"});
}
removeCourse(course){
  let index = this.courses.indexOf(course);
  this.courses.splice(index,1);
}
EditeCourse(course){
  course.title = "updated"; 
}

personne = 
  {
    nom:"zakaria",
    prenom:"Kamili",
    adress : {
      ville : "Safi",
      Rue : "Kores"
    }
  }
 



}
