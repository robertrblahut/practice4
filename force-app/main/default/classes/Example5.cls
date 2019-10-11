public class Example5 {

    /**
    Returns all records of sObject with given name
     */
    private static List<SObject> getRecords(String sObjectApiName) {
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
    private static List<sObject> getUniqueRecords(List<SObject> sObjects) {
        Set<String> uniqueNames = new Set<String>();
        List<sObject> uniqueRecords = new List<SObject>();


        for(SObject sObj: sObjects) {
            
            Integer uniqueNamesSizeBefore = uniqueNames.size();
            uniqueNames.add(String.valueOf(sObj.get('Name')));
            Integer uniqueNamesSizeAfter = uniqueNames.size();

            Boolean isChangedUniqueNamesSize = uniqueNamesSizeBefore != uniqueNamesSizeAfter;
            
            if (!isChangedUniqueNamesSize) {
                uniqueRecords.add(sObj);
            }
        }
        
        return uniqueRecords;
    }

    /**
    Deletes unique records from a given list of sObjects
     */
    private static void deleteUniqueRecords(List<SObject> sObjects) {
        delete getUniqueRecords(sObjects);
    }

    /**
    Deletes unique Contact records
     */
    private static void deleteUniqueContacts() { 
        deleteUniqueRecords(getRecords('Contacts'));
    }

    /**
    Deletes unique Lead records
     */
    private static void deleteUniqueLeads() {
        deleteUniqueRecords(getRecords('Leads'));
    }

    /**
    Deletes unique Contact and Lead records
     */
    public static void deleteUniqueContactsAndLeads() {
        deleteUniqueContacts();
        deleteUniqueLeads();
    }
}