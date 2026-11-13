public with sharing class TaskItemController {

    @AuraEnabled
    public static List<Task_Item__c> getTasks() {
        return [SELECT Id, Name, Due_Date__c, Status__c
        FROM Task_Item__c];
    }

    // ADD TASK method goes below (Developer 1)
    @AuraEnabled
    public static void addTask(String name, Date dueDate, String status) {
        
            Task_Item__c t = new Task_Item__c(
                Name = name,
                Due_Date__c = dueDate,
                Status__c = status
            );
            insert t;
        
    }

    // MARK DONE method goes below (Dev_Andile)
@AuraEnabled
public static void markDone(Id taskId) {
    Task_Item__c t = new Task_Item__c(Id = taskId, Status__c = 'Done');
    update t;
}

    // DELETE TASK method goes below (Dev_Slindoh)
    @AuraEnabled
    public static void deleteTask(Id taskId) {
        Task_Item__c t = new Task_Item__c(Id = taskId);
        delete t;
    }

}