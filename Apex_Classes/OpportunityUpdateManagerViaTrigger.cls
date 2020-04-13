/*
Trigger to check if BillToContact field is not blank and Manager is blank 
then 
populate Manager field by related account which is linked with the contact given in BillToContact field.
*/


public class OpportunityUpdateManagerViaTrigger {
    public static void updateManager(List<Opportunity> opportunities) {
		for(Opportunity opp : opportunities) {
			if(opp.BillToContact__c != null && opp.Manager__c == null){
				ID contactID = opp.BillToContact__c;
				Contact cnt = [SELECT AccountID FROM Contact WHERE ID = :contactID LIMIT 1];
				opp.Manager__c = cnt.AccountID;
			}
		}
    }
}