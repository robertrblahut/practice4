public class Example2 {
	public Set<String> getUniqueContactNames() {
        Set<String> uniqueContactNames = new Set<String>();
        
        for (List<Contact> contacts: [SELECT Id, Name FROM Contact]) {
            for (Contact contactItem : contacts) {
                uniqueContactNames.add(contactItem.Name);
            }
        }
        
        return uniqueContactNames;
    }
}