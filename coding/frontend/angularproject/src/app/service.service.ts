import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Config } from './config/config';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

  private REST_API_SERVER = "http://localhost:3000";

  public getUsers(){
    return this.http.get(this.REST_API_SERVER+'/users');
  }


}
