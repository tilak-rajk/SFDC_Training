/*
Apex Classes Assignment 6:

Create one custom field in Account object (ContactIDs), it would have comma separated list of all
related Contact IDs. Create a class and a static function which takes a ContactID as argument and
check if Account’s ContactIDs field is Null or Not Null

- IF Null, then fetch all related Account Contacts and store their IDs as a comma separated list in it.

- IF Not Null, then check, Is ContactID already exist in the field value, if not then append it on that value.
*/

public class AccountContactIdUpdate
{
  public static void updateContactIds(ID id) 
  {
      List<Account> lstAccount = [select id,ContactIDs__c, (select id from Contacts ) from account where Name like 'Accout Cnct Update%'];
      for( Account acc : lstAccount )
      {
			
			if(String.isBlank(acc.ContactIDs__c)){
				String ids = '';
				for(Contact cnt : acc.Contacts){
					if(String.isBlank(ids))
						ids = ids + cnt.id;
					else
						ids = ids + ',' + cnt.id;
				}
                acc.ContactIDs__c = ids;
            } else {
           		List<string> cncts =  acc.ContactIDs__c.split(','); 
              	if(!cncts.contains(id)){
                    cncts.add(id);
                    acc.ContactIDs__c = string.join(cncts,',');
                }
            }
			
      }
      update lstAccount;
  }
}