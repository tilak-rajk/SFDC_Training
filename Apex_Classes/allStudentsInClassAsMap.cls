/*
Apex Classes Assignment 2:

Create a function which returns a map where key is class and value is set of studentId in it.
*/

public class allStudentsInClassAsMap {
	public static Map<ID, Set<ID>> getClassStudentMap() {
        Map<ID, Set<ID>> classStudents = new Map<ID, Set<ID>>();
        List<Class__c> classes = new List<Class__c>([SELECT ID,(SELECT ID FROM Students__r) FROM Class__c]);
        for( Class__c cls : classes ) {
           	List<Student__c> students = cls.Students__r;
            Set<ID> studId = new Set<id>();
            for(Student__c stud : students){
                studId.add(stud.ID);
            }
            classStudents.Put(cls.Id,studId);
        }                      
        return classStudents;
    }
}