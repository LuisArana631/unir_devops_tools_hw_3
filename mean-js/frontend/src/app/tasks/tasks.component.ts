import { Component, OnInit, Inject } from '@angular/core';
import { TasksService } from './tasks.service';
import { FormsModule } from '@angular/forms';

import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-tasks',
  imports: [
    FormsModule,
    MatToolbarModule,
    MatButtonModule,
    MatInputModule,
    MatCardModule,
    MatTableModule,
    MatIconModule,
  ],
  templateUrl: './tasks.component.html',
})
export class TasksComponent implements OnInit {
  tasks: any[] = [];
  title = '';
  description = '';
  _id = '';

  constructor(@Inject(TasksService) private tasksService: TasksService) { }

  ngOnInit() {
    this.fetchTasks();
  }

  fetchTasks() {
    this.tasksService.fetchTasks().subscribe(data => {
      this.tasks = data;
    }, error => console.error(error));
  }

  addOrUpdateTask() {
    const task = {
      title: this.title,
      description: this.description
    };

    if (this._id) {
      this.tasksService.updateTask(this._id, task).subscribe(() => {
        this.resetForm();
        this.fetchTasks();
      });
    } else {
      this.tasksService.addTask(task).subscribe(() => {
        this.resetForm();
        this.fetchTasks();
      });
    }
  }

  editTask(task: any) {
    this.title = task.title;
    this.description = task.description;
    this._id = task._id;
  }

  deleteTask(id: string) {
    if(confirm('Are you sure you want to delete it?')) {
      this.tasksService.deleteTask(id).subscribe(() => {
        this.fetchTasks();
      });
    }
  }

  resetForm() {
    this.title = '';
    this.description = '';
    this._id = '';
  }
}
