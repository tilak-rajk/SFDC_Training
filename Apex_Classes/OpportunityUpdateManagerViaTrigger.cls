/*
Apex Classes Assignment 7:

Create two new fields of type Lookup in Opportunity named BillToContact(Contact) and
Manager(Account). Create a function in class which is called on Update of Opportunities (from Trigger),
it takes List<Opportunity> as argument and check if BillToContact field is not Blank and Manager is
Blank then populate Manager field by related account which is linked with the contact given in
BillToContact field..
*/


public class OpportunityUpdateManagerViaTrigger {
    public static void updateManager(List<Opportunity> opp) {
        if(opp[0].BillToContact__c != null && opp[0].Manager__c == null){
            ID contactID = opp[0].BillToContact__c;
       		Contact cnt = [SELECT AccountID FROM Contact WHERE ID = :contactID LIMIT 1];
            opp[0].Manager__c = cnt.AccountID;
        }
    }
}