/*
Apex Classes Assignment 5: 

Create a Scheduler to mail to Opportunity Owner, if not modified for last 30 days.
*/

global class SendEmailToOpptyOwnerScheduler implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Opportunity> opportunityList = [Select Id,Owner.Email from Opportunity where LastModifiedDate = LAST_N_DAYS:30];
        for(Opportunity opp : opportunityList){
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            User owner =  opp.Owner;
            String[] toAddresses = new String[] {owner.Email};
			mail.setToAddresses(toAddresses);
			mail.setSubject('Opportunity not modified since last 30 days : ' + opp.Id);
			mail.setPlainTextBody('Opportunity: ' + opp.Id +' has not been modified since last 30 days.');
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		}   
    }
}