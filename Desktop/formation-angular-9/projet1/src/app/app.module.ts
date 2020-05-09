import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { CoursesComponent } from './courses.component';
import { CourseComponent } from './course/course.component';
import { CoursesService } from './courses.service';
import { EmailService } from './email.service';
import { StartComponent } from './start/start.component';
import { ResumePipe } from './resume.pipe';
import { FavoriteComponent } from './favorite/favorite.component';
import { PanelComponent } from './panel/panel.component';

@NgModule({
  declarations: [
    AppComponent,
    CoursesComponent,
    CourseComponent,
    StartComponent,
    ResumePipe,
    FavoriteComponent,
    PanelComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [CoursesService,EmailService],
  bootstrap: [AppComponent]
})
export class AppModule { }
