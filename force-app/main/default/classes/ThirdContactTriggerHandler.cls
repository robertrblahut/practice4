public class ThirdContactTriggerHandler {

    public static void handleContactsBeforeUpdate(List<Contact> records) {
        for (Contact recordItem : records) {
            if (recordItem.FirstName == 'Morty' && recordItem.LastName == 'Smith') {
                recordItem.SadMorty__c = recordItem.MyRick__c == null ? true : false;
            }
        }
    }

    public static void handleContactsBeforeInsert(List<Contact> records) {
        for (Contact recordItem : records) {
            if (recordItem.FirstName == 'Morty' && recordItem.LastName == 'Smith') {
                recordItem.MyRick__c = recordItem.Id;
                recordItem.SadMorty__c = recordItem.MyRick__c == null ? true : false;
            }
            
        }
    }

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

        List<Contact> morties = [SELECT Id, SadMorty__c, MyRick__c FROM Contact WHERE Id IN :mortyIds];
        List<Contact> ricks = [SELECT Id FROM Contact WHERE Id IN :rickIds];

        Integer count = morties.size() <= ricks.size() ? morties.size() : ricks.size();
        System.debug('count = ' + count);

        for (Integer i = 0; i < count; i++) {
            morties.get(i).MyRick__c = ricks.get(i).Id;
        }

        update morties;
    }
}
