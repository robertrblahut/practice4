public class MyFirstClass {
    public static void printAllAccountFields() {
        Schema.DescribeSObjectResult r = Account.sObjectType.getDescribe();
		
        List<String>apiNames = new list<String>();
		
        for(string apiName : r.fields.getMap().keySet()) {
   			apiNames.add(apiName);
		}
		
        System.debug(apiNames);
    }
}