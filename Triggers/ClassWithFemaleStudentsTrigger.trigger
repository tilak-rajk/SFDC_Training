/**
 * Trigger to prevent deletion of class if it has more than one female students.
 */
trigger ClassWithFemaleStudentsTrigger on Class__c (before delete) {
    List<AggregateResult> students = [SELECT Class__r.id classId, COUNT(Id) FROM Student__c WHERE Sex__c = 'Female' AND Class__c IN: Trigger.old GROUP BY Class__r.id HAVING COUNT(Id) > 1];
    for (AggregateResult oneStudent : students) {
        Trigger.oldMap.get((id) oneStudent.get('classId')).addError('Cannot delete a class with more than one female student');    
    }
}