/**
 * Trigger to update CloseDate Field of the Opportunity object whenever StageName field is changed to 'Closed Won' or 'Closed Lost'.
 */
trigger OpportunityStageChangeTrigger on Opportunity (before update) {
    for(Opportunity oneOpportunity: Trigger.new) {
        if ((Trigger.oldMap.get(oneOpportunity.Id).StageName!='Closed own' || Trigger.oldMap.get(oneOpportunity.Id).StageName!='Closed lost') &&
     			(oneOpportunity.StageName == 'Closed own' || oneOpportunity.StageName == 'Closed lost')) {
                    oneOpportunity.CloseDate = System.Today();
			}
    }
}