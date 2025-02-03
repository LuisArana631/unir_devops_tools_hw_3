import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TasksService {

  constructor(private http: HttpClient) { }

  fetchTasks(): Observable<any> {
    return this.http.get('/api/tasks');
  }

  addTask(task: any): Observable<any> {
    return this.http.post('/api/tasks', task);
  }

  updateTask(id: string, task: any): Observable<any> {
    return this.http.put(`/api/tasks/${id}`, task);
  }

  deleteTask(id: string): Observable<any> {
    return this.http.delete(`/api/tasks/${id}`);
  }
}
