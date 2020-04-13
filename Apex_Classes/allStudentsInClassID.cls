/*
Class to returns all names of the students in a particular class as a list.
*/

public class allStudentsInClassID {
    public static List<Student__c> getAllStudentsInClass(Id clsId) {
		List<Class__c> classes = new List<Class__C>([SELECT (SELECT First_Name__c FROM Students__r) FROM Class__c WHERE Id = :clsId]);
        List<Student__c> students = new List<Student__c>();
		for(Class__C class : classes) {
			students.add(class.Students__r);
		}
        return students;
    }
}


/*
Wrote following code in anonymous window to check the output:

Class__c cls = [SELECT Id FROM Class__C LIMIT 1];
Student__c[] res =  allStudentsInClassID.getAllStudentsInClass(cls.Id); 
for(Student__c s : res){
    System.debug(s.First_Name__c);
}
*/