/**
 * Trigger to delete all associated students with related Class if 'Custom Status' of Class changed to the value 'Reset'.
 */
trigger ClassResetDeleteRelatedStudentsTrigger on Class__c (after update) {
    List<Id> classIdsList = new List<Id>();
    for(Class__c oneClass: Trigger.New) {
        Class__c oldRecord = Trigger.oldMap.get(oneClass.Id);
        if(oldRecord.Custom_Status__c != 'Reset' && oneClass.Custom_Status__c == 'Reset') {
            classIdsList.add(oneClass.Id);
        }
    }
    List<Student__c> studentList = [SELECT Id FROM Student__c WHERE Class__c IN :classIdsList];
    delete studentList;
}