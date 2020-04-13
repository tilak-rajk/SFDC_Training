/*
CLass which returns a map where key is class and value is set of studentId in it.
*/

public class allStudentsInClassAsMap {
	public static Map<Id, Set<Id>> getClassStudentMap() {
        Map<Id, Set<Id>> classStudents = new Map<Id, Set<Id>>();
        for(Class__c cls : [SELECT Id,(SELECT Id FROM Students__r) FROM Class__c]) {
           	List<Student__c> students = cls.Students__r;
            Set<Id> studentIds = new Set<Id>();
            for(Student__c stud : students){
                studentIds.add(stud.Id);
            }
            classStudents.put(cls.Id,studentIds);
        }                      
        return classStudents;
    }
}