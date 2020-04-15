/**
 * Trigger to delete all associated students with related Class if 'Custom Status' of Class changed to the value 'Reset'.
 */
trigger ClassResetDeleteRelatedStudentsTrigger on Class__c (after update) {
    List<Id> classIds = new List<Id>();
    for(Class__c clas: Trigger.New) {
        Class__c oldRecord = Trigger.oldMap.get(clas.Id);
        if(oldRecord.Custom_Status__c != 'Reset' && clas.Custom_Status__c == 'Reset') {
            classIds.add(clas.Id);
        }
    }
    List<Student__c> studentList = [SELECT Id FROM Student__c WHERE Class__c IN :classIds];
    delete studentList;
}