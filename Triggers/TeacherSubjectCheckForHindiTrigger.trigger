/**
 * Trigger to prevent teacher to insert or update if the teacher is teaching 'Hindi'
 */
trigger TeacherSubjectCheckForHindiTrigger on Teach__c  (before insert, before update) {
    for(Teach__c teacher: Trigger.New) {
        if(teacher.Subject__c.contains('Hindi'))
        {
            teacher.addError('Cannot Insert or Update teacher if that teacher is teaching Hindi.');
        }
    }    
}