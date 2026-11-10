@isTest
private class TaskItemControllerTest {

    @isTest
    static void testGetTasks() {

        Task_Item__c t = new Task_Item__c(
            Name = 'Test Task'
        );
        insert t;

        Test.startTest();
        List<Task_Item__c> result = TaskItemController.getTasks();
        Test.stopTest();

        Assert.areEqual(1, result.size());
        Assert.areEqual(t.Id, result[0].Id);
        Assert.areEqual('Test Task', result[0].Name);
    }

    @isTest
    static void testAddTask() {

        Test.startTest();
        TaskItemController.addTask(
            'Learn Apex',
            Date.today().addDays(7),
            'High'
        );
        Test.stopTest();

        Task_Item__c result = [
            SELECT Id, Name, Due_Date__c, Priority__c, Status__c
            FROM Task_Item__c
            WHERE Name = 'Learn Apex'
            LIMIT 1
        ];

        Assert.areEqual('Learn Apex', result.Name);
        Assert.areEqual(Date.today().addDays(7), result.Due_Date__c);
        Assert.areEqual('High', result.Priority__c);
        Assert.areEqual('Not Started', result.Status__c);
    }
}