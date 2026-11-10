import { LightningElement } from 'lwc';
import getTasks from '@salesforce/apex/TaskItemController.getTasks';

export default class TaskTracker extends LightningElement {
    tasks = [];

    connectedCallback() {
        this.loadTasks();
    }

    loadTasks() {
        getTasks()
            .then(result => { this.tasks = result; })
            .catch(error => console.error(error));
    }

    // ADD handlers go below (Developer 1)

    // DONE handler goes below (Developer 2)

    // DELETE handler goes below (Developer 3)
}