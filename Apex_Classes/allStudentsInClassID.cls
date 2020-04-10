/* 
Apex Classes Assignemnt 1:

Create a class and a static function which takes classId as argument and returns all names of the
students in that class as a list.
*/

public class allStudentsInClassID {
    public static List<Student__c> getAllStudentsInClass(ID cls_id) {
		Class__c[] classes = [SELECT (SELECT First_Name__c FROM Students__r) FROM Class__c WHERE ID = :cls_id];
        List<Student__c> students = classes[0].Students__r;
        return students;
    }
}


/*
Wrote following code in anonymous window to check the output:

Class__c cls = [SELECT ID FROM Class__C LIMIT 1];
Student__c[] res =  allStudentsInClassID.getAllStudentsInClass(cls.ID); 
for(Student__c s : res){
    System.debug(s.First_Name__c);
}
*/