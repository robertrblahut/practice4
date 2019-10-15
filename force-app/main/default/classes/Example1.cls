public class Example1 {
	public List<String> getUniqueContactNames() {
        Set<String> uniqueContactNames = new Set<String>();
        
        for (Contact contactItem: [SELECT Id, Name FROM Contact]) {
            uniqueContactNames.add(contactItem.Name);
        }
        
        return new List<String>(uniqueContactNames);
    }
}