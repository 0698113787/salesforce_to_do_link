public with sharing class TaskItemController {

    @AuraEnabled
    public static List<Task_Item__c> getTasks() {
        return [SELECT Id, Name, Due_Date__c
                FROM Task_Item__c];
    }

    // ADD TASK method goes below (Developer 1)

    // MARK DONE method goes below (Developer 2)

    // DELETE TASK method goes below (Developer 3)
}