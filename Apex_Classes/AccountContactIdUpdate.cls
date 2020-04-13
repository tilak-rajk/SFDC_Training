/*
This class will update Account object's ContactIDs custom field according to the following logic:
- If Account’s ContactIDs field is Null then it will fetch all related Account Contacts and store their IDs as a comma separated list in it.
- If Account’s ContactIDs field is Not Null then it checks if ContactID argument already exist in the field value, if not then append it on that value.
*/

public class AccountContactIdUpdate
{
	public static void updateContactIds(ID id) {
		List<Account> accounts = [SELECT id,ContactIDs__c, (SELECT id FROM Contacts ) FROM account WHERE Name LIKE 'Accout Cnct Update%'];
		
		for( Account acc : accounts ) {
			if(String.isBlank(acc.ContactIDs__c)) {
				List<string> ids = new List<String>();
				for(Contact con : acc.Contacts) {
					ids.add(con.id);
				}
				acc.ContactIDs__c = string.join(ids,',');
			} else {
				List<String> contacts =  acc.ContactIDs__c.split(','); 
				if(!contacts.contains(id)) {
					contacts.add(id);
					acc.ContactIDs__c = string.join(contacts,',');
				}
			}
		}
		update accounts;
	}
}