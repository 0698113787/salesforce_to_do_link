public with sharing class TaskItemController {

    @AuraEnabled
    public static List<Task_Item__c> getTasks() {
        return [SELECT Id, Name, Due_Date__c, Priority__c, Status__c
                FROM Task_Item__c
                ORDER BY Due_Date__c ASC];
    }

    @AuraEnabled
    public static void addTask(String name, Date dueDate, String priority) {
    Task_Item__c t = new Task_Item__c(
        Name = name,
        Due_Date__c = dueDate,
        Priority__c = priority,
        Status__c = 'Not Started'
    );
    insert t;
    }// (Andile Developer 1 addtask method)

    // MARK DONE method goes below (Developer 2)

    // DELETE TASK method goes below (Developer 3)
}