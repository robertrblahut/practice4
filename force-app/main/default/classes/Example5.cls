public class Example5 {

    /**
    Returns all records of sObject with given name
     */
    private static List<SObject> getRecords(String sObjectApiName) {        
        if (Schema.getGlobalDescribe().containsKey(sObjectApiName)) {
            return Database.query('SELECT Id, Name FROM ' + sObjectApiName + ' LIMIT 50000');
        } 
        return null;
    }

    /**
    Returns set of names of given list of sObjects
     */
    private static List<sObject> getUniqueRecords(List<SObject> records) {
        Map<String, sObject> uniqueRecordsByName = new Map<String, sObject>();
        for (SObject recordItem: records) {
            if (!uniqueRecordsByName.containsKey(String.valueOf(recordItem.get('Name')))) {
                uniqueRecordsByName.put(String.valueOf(recordItem.get('Name')), recordItem);
            }
        }
        return uniqueRecordsByName.values();
    }

    /**
    Deletes unique records from a given list of sObjects
     */
    private static void deleteUniqueRecords(List<SObject> records) {
        if (records.size() <= Limits.getLimitDmlRows()) {
            delete getUniqueRecords(records);   
        }
    }

    /**
    Deletes unique Contact records
     */
    private static void deleteUniqueContacts() { 
        deleteUniqueRecords(getRecords('Contact'));
    }

    /**
    Deletes unique Lead records
     */
    private static void deleteUniqueLeads() {
        deleteUniqueRecords(getRecords('Lead'));
    }

    /**
    Deletes unique Contact and Lead records
     */
    public static void deleteUniqueContactsAndLeads() {
        deleteUniqueContacts();
        deleteUniqueLeads();
    }
}