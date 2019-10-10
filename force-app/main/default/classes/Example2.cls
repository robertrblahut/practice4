public class Example2 {
	public Set<String> getUniqueContactNames() {
        Set<String> uniqueContactNames = new Set<String>();
        
        for(List<Contact> contacts: [SELECT Id, Name FROM Contact]) {
            for (Contact anContact : contacts) {
                uniqueContactNames.add(anContact.Name);
            }
        }
        
        return uniqueContactNames;
    }
}