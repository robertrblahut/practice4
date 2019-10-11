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
        List<SObject> quiredSObjects = new List<SObject>();
        
        try {
            quiredSObjects = Database.query('SELECT Id, Name FROM ' + sObjectApiName);
        } catch (QueryException e) {
            System.debug('Query error: ' + e.getMessage());
            return null;
        }

        return quiredSObjects;
    }
    
    /**
    Returns set of names of given list of sObjects
     */
    private Set<String> getUniqueRecordNames(List<SObject> sObjects) {
        Set<String> uniqueNames = new Set<String>();
        
        for(SObject sobj: sObjects) {
            uniqueNames.add(String.valueOf(sobj.get('Name')));
        }
        
        return uniqueNames;
    }
}