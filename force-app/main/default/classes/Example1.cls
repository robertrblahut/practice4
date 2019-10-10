public class Example1 {
	public Set<String> getUniqueContactNames() {
        Set<String> uniqueContactNames = new Set<String>();
        List<Contact> contacts = new List<Contact>();
        
        contacts = [SELECT Id, Name FROM Contact];
        
        for(Contact cont: contacts) {
            uniqueContactNames.add(cont.Name);
        }
        
        return uniqueContactNames;
    }
}