public class FourthContactTriggerHandler {

    private static Set<Id> mortyIds = new Set<Id>();
    private static Set<Id> rickIds = new Set<Id>();
    private static List<Contact> morties = new List<Contact>();

    public static void handleContactsAfterInsert(List<Contact> records) {
        sortRecords(records);
        attachRicks(findFreeRicks());
        checkForSad();
    }

    private static void sortRecords(List<Contact> records) {
        for (Contact recordItem : records) {
            if (recordItem.FirstName == 'Morty' && recordItem.LastName == 'Smith') {
                mortyIds.add(recordItem.Id);
            } else if (recordItem.FirstName == 'Rick' && recordItem.LastName == 'Sanchez') {
                rickIds.add(recordItem.Id);
            }
        }

        morties = [SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE Id IN :mortyIds]; 
    }

    private static List<Id> findFreeRicks() {
        Set<Id> allRicks = new Set<Id>(rickIds);
        Set<Id> busiedRicks = new Set<Id>();
        
        // adds all rick ids
        for (Contact recordItem : [SELECT Id FROM Contact WHERE FirstName = 'Rick' AND LastName = 'Sanchez']) {
            allRicks.add(recordItem.Id);
        }
        // adds all busied ricsk ids
        for (Contact recordItem : [SELECT Id, SadMorty__c, MyRick__c FROM Contact WHERE FirstName = 'Morty' AND LastName = 'Smith']) {
            busiedRicks.add(recordItem.MyRick__c);
        }
        
        allRicks.removeAll(busiedRicks); // bring out only free rick Ids
        return new List<Id>(allRicks); 
    }

    private static void attachRicks(List<Id> freeRickIds) {
        Integer count = morties.size() <= freeRickIds.size() ? morties.size() : freeRickIds.size();
        for (Integer i = 0; i < count; i++) {
            morties.get(i).MyRick__c = freeRickIds.get(i);
        }
        update morties;
    } 

    private static void checkForSad() {
        for (Contact recordItem : morties) {
            if (recordItem.FirstName == 'Morty' && recordItem.LastName == 'Smith') {
                recordItem.SadMorty__c = recordItem.MyRick__c == null ? true : false;
            }
        }

        update morties;
    }
}
