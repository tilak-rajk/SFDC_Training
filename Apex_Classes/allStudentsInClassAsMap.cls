/*
CLass which returns a map where key is class and value is set of studentId in it.
*/

public class allStudentsInClassAsMap {
	public static Map<Id, Set<Id>> getClassStudentMap() {
        Map<Id, Set<Id>> classStudents = new Map<Id, Set<Id>>();
        List<Class__c> classes = new List<Class__c>([SELECT Id,(SELECT Id FROM Students__r) FROM Class__c]);
        for( Class__c cls : classes ) {
           	List<Student__c> students = cls.Students__r;
            Set<Id> studId = new Set<id>();
            for(Student__c stud : students){
                studId.add(stud.Id);
            }
            classStudents.Put(cls.Id,studId);
        }                      
        return classStudents;
    }
}