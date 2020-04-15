/**
 * Trigger which updates 'My Count' field of Class when any student is inserted/updated for that class. 
 */
trigger UpdateClassMyCountTrigger on Student__c (after insert, after update) {
    List<Class__C> classList = new List<Class__c>();
    Set<Id> newIds = new Set<Id>();
    for(Student__c oneStudent : Trigger.New) {
        newIds.add(oneStudent.Class__c);
    }
    if(Trigger.isUpdate) {
        Set<Id> oldIds = new Set<Id>();
        for(Student__c oneStudent : Trigger.Old) {
                oldIds.add(oneStudent.Class__c);
        }
        classList = [SELECT Name, (SELECT Name FROM Students__r) FROM Class__c WHERE Id IN :newIds OR Id IN :oldIds];
    } else {
        classList = [SELECT Name, (SELECT Name FROM Students__r) FROM Class__c WHERE Id IN :newIds];
    }

    for(Class__c oneClass : classList) {
        oneClass.My_Count__c = oneClass.Students__r.size();
    }
    update classList;
}