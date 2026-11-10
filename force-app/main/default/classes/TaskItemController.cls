public with sharing class TaskItemController {

    @AuraEnabled
    public static List<Task_Item__c> getTasks() {
        return [SELECT Id, Name
                FROM Task_Item__c];
    }

    // ADD TASK method goes below (Developer 1)
    @AuraEnabled
    public static void addTask(String name, Date duedate, String priority){
        try {
            Task_Item__c t = new Task_Item__c(
                Name = name,
                Due_Date__c = duedate,
                Priority__c = priority,
                Status__c = 'Not Started'
            );
            insert t;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // MARK DONE method goes below (Developer 2)

    // DELETE TASK method goes below (Developer 3)
}