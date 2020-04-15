/**
 * Trigger to prevent teacher to insert or update if the teacher is teaching 'Hindi'
 */
trigger TeacherSubjectCheckForHindiTrigger on Teach__c  (before insert, before update) {
    for(integer i = 0; i < Trigger.new.Size(); i++) {
        if(Trigger.new[i].Subject__c.contains('Hindi'))
        {
            Trigger.new[i].addError('Cannot Insert or Update teacher if that teacher is teaching Hindi.');
        }
    }    
}