/*
Class which shows the list of all sobjects (Standard + Custom) exists in org.
*/

public class ListAllObjects {
    public static List<String> getAllCustomSObjects() {
        List<String> sObjectList = new List<String>();
        
		for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()) {
            Schema.DescribeSObjectResult describeSObjectResultObj = objTyp.getDescribe();
           
			String name = objTyp.getDescribe().getName();
			// Excluding all the unwanted Sobjects e.g. History, Share etc..
			if(!name.containsignorecase('history') && !name.containsignorecase('tag')&&
			 !name.containsignorecase('share') && !name.containsignorecase('feed'))
			{
				SobjectList.add(name);
			}
        }
        return sObjectList;
    }
}

/*
Wrote following code in anonymous window to check the output:

ListAllObjects.getAllCustomSObjects();
*/