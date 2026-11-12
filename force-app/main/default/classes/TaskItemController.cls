public with sharing class TaskItemController {

    @AuraEnabled
    public static List<Task_Item__c> getTasks() {
        return [SELECT Id, Name, Due_Date__c
                FROM Task_Item__c];
    }

    // ADD TASK method goes below (Developer 1)
    @AuraEnabled
    public static void addTask(String name, Date dueDate) {
        
            Task_Item__c t = new Task_Item__c(
                Name = name,
                Due_Date__c = dueDate
            );
            insert t;
        
    }

    // MARK DONE method goes below (Developer 2)

    // DELETE TASK method goes below (Developer 3)
}