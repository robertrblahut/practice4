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
        List<SObject> quiredSObjects 	= new List<SObject>();
        
        try {
            quiredSObjects = Database.query('SELECT Id, Name FROM ' + sObjectApiName);
        } catch (QueryException e) {
            System.debug('Query error: ' + e.getMessage());
            return null;
        }

        return quiredSObjects;
    }
    
    private Set<String> getUniqueRecordNames(List<SObject> sObjects) {
        Set<String> uniqueNames = new Set<String>();
        
        for(SObject sobj: sObjects) {
            uniqueNames.add(String.valueOf(sobj.get('Name')));
        }
        
        return uniqueNames;
    }
}
