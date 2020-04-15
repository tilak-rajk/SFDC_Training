/**
 * Trigger to update CloseDate Field of the Opportunity object whenever StageName field is changed to 'Closed Won' or 'Closed Lost'.
 */
trigger OpportunityStageChangeTrigger on Opportunity (before update) {
    for(Opportunity newOpp: Trigger.new) {
        if ((Trigger.oldMap.get(newOpp.Id).StageName!='Closed own' || Trigger.oldMap.get(newOpp.Id).StageName!='Closed lost') &&
     			(newOpp.StageName == 'Closed own' || newOpp.StageName == 'Closed lost')) {
                    newOpp.CloseDate = System.Today();
			}
    }
}