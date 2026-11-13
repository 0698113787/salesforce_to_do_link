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
            Date.today().addDays(7)
        );
        Test.stopTest();

        Task_Item__c result = [
            SELECT Id, Name, Due_Date__c
            FROM Task_Item__c
            WHERE Name = 'Learn Apex'
            LIMIT 1
        ];

        Assert.areEqual('Learn Apex', result.Name);
        Assert.areEqual(Date.today().addDays(7), result.Due_Date__c);
    }
    @isTest
    static void testMarkDone() {

        // Arrange: create a task that is not done yet
        Task_Item__c t = new Task_Item__c(
            Name = 'Finish report',
            Status__c = 'Not Started'
        );
        insert t;

        // Act: mark it as done
        Test.startTest();
        TaskItemController.markDone(t.Id);
        Test.stopTest();

        // Assert: the status was changed to Done
        Task_Item__c result = [
            SELECT Id, Status__c
            FROM Task_Item__c
            WHERE Id = :t.Id
        ];

        Assert.areEqual('Done', result.Status__c);
    }
}