import { Component, OnInit } from '@angular/core';
import { DataService } from './service.service';
import { User } from './user'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})


export class AppComponent implements OnInit {

  user:User;
  title = "U2 Front End Service"

  constructor(private dataService: DataService) { }

  ngOnInit() {
    this.dataService.getUsers().subscribe((data: User)=>{
      this.user = data
      console.log(this.user)
    })  
  }

}
