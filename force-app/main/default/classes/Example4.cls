public class Example4 {
    
    /**
    Returns set of contacts names
     */
    public Set<String> getUniqueContactNames() {
        return getUniqueNames('Contact');
    }
    
    /**
    Returns set of accounts names
     */
    public Set<String> getUniqueAccountNames() {
        return getUniqueNames('Account');
    }
    
    /**
    Returns set of names of sObject with given name
     */
    private Set<String> getUniqueNames(String sObjectApiName) {
        return getUniqueRecordNames(getRecords(sObjectApiName));
    }

    /**
    Returns all records of sObject with given name
     */
    private List<SObject> getRecords(String sObjectApiName) {
        List<SObject> records = new List<SObject>();
        
        if (Schema.getGlobalDescribe().containsKey(sObjectApiName)) {
            records = Database.query('SELECT Id, Name FROM ' + sObjectApiName);
        }

        return records;
    }
    
    /**
    Returns set of names of given list of sObjects
     */
    private Set<String> getUniqueRecordNames(List<SObject> records) {
        Set<String> uniqueNames = new Set<String>();
        
        for (SObject recordItem: records) {
            uniqueNames.add(String.valueOf(recordItem.get('Name')));
        }
        
        return uniqueNames;
    }
}