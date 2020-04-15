/**
 * Trigger to prevent insertion of a student into a class if class's max capacity is reached.
 */
trigger StudentClassMaxLimitReachedTrigger on Student__c (before insert) {
    Set<Id> studentIds = new Set<Id>();
    
    for(Student__c oneStudent : Trigger.New) {
        studentIds.add(oneStudent.Class__c);
    }
    
    Map<Id, Decimal> studentsCountInClass = new Map<Id, Decimal>();
    Map<Id, Class__c> classes = new Map<Id, Class__c>(
        [SELECT Id, Max_Size__c, Number_Of_Students__c FROM Class__c WHERE Id in :studentIds]
    );

    for(Student__c student: Trigger.new) {
        Decimal maxSize = classes.get(student.Class__c).Max_Size__c;
        if(studentsCountInClass.get(student.Class__c) == null) {
            Decimal existingStudentsInClass = classes.get(student.Class__c).Number_Of_Students__c;
        
            if(existingStudentsInClass >=  maxSize) {
                student.addError('Maximum class size reached');
            } else {
                studentsCountInClass.put(student.Class__c, existingStudentsInClass);
            }
        } else {
            Decimal numberOfStudents = studentsCountInClass.get(student.Class__c) + 1 ;
            if(numberOfStudents >= maxSize) {
                student.addError('Maximum class size reached');
            } else {
                studentsCountInClass.put(student.Class__c, numberOfStudents);
            }
        }
    }
}