public class FourthContactTriggerHandler {
    public static void handleContactsAfterInsert(List<Contact> records) {
        Set<Id> mortyIds = new Set<Id>();
        Set<Id> rickIds = new Set<Id>();

        for (Contact recordItem : records) {
            if (recordItem.FirstName == 'Morty' && recordItem.LastName == 'Smith') {
                mortyIds.add(recordItem.Id);
            } else if (recordItem.FirstName == 'Rick' && recordItem.LastName == 'Sanchez') {
                rickIds.add(recordItem.Id);
            }
        }

        Set<Id> allRicks = new Set<Id>(rickIds);
        Set<Id> busiedRicks = new Set<Id>();

        List<Contact> morties = [SELECT Id, SadMorty__c, MyRick__c FROM Contact WHERE Id IN :mortyIds];
        for (Contact recordItem : [SELECT Id FROM Contact WHERE FirstName = 'Rick' AND LastName = 'Sanchez']) {
            allRicks.add(recordItem.Id);
        }
        for (Contact recordItem : [SELECT Id, SadMorty__c, MyRick__c FROM Contact WHERE FirstName = 'Morty' AND LastName = 'Smith']) {
            busiedRicks.add(recordItem.MyRick__c);
        }

        System.debug('allRicks.size() = ' + allRicks.size());
        allRicks.removeAll(busiedRicks);
        System.debug('allRicks.size() after remove = ' + allRicks.size());
        List<Id> freeRickIds = new List<Id>(allRicks);

        System.debug('morties.size() = ' + morties.size());
        System.debug('freeRickIds.size() = ' + freeRickIds.size());
        Integer count = morties.size() <= freeRickIds.size() ? morties.size() : freeRickIds.size();
        System.debug('count = ' + count);

        for (Integer i = 0; i < count; i++) {
            morties.get(i).MyRick__c = freeRickIds.get(i);
        }

        update morties;
    }
}
