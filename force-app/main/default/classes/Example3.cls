public class Example3 {
    public Set<String> getUniqueContactNames() {
        return getUniqueNames('Contact');
    }
    
    public Set<String> getUniqueAccountNames() {
        return getUniqueNames('Account');
    }
    
    private Set<String> getUniqueNames(String sObjectApiName) {
        return getUniqueRecordNames(getRecords(sObjectApiName));
    }

    private List<SObject> getRecords(String sObjectApiName) {
        List<SObject> records = new List<SObject>();
        
        if (Schema.getGlobalDescribe().containsKey(sObjectApiName)) {
            records = Database.query('SELECT Id, Name FROM ' + sObjectApiName);
        }

        return records;
    }
    
    private Set<String> getUniqueRecordNames(List<SObject> records) {
        Set<String> uniqueNames = new Set<String>();
        
        for (SObject recordItem: records) {
            uniqueNames.add(String.valueOf(recordItem.get('Name')));
        }
        
        return uniqueNames;
    }
}
