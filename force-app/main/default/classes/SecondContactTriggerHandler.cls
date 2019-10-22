public class SecondContactTriggerHandler {
    public static void handleContactsAfterInsert(List<Contact> records) {
        List<Contact> morties = new List<Contact>();
        for (Contact recordItem : records) {
            if (recordItem.FirstName == 'Rick' && recordItem.LastName == 'Sanchez') {
                Contact morty = new Contact (
                    FirstName = 'Morty',
                    LastName = 'Smith',
                    MyRick__c = recordItem.Id
                );
                morties.add(morty);
            }
        }
        insert morties;
    }

    public static void handleContactsBeforeInsertOrUpdate(List<Contact> records) {
        for (Contact recordItem : records) {
            if (recordItem.FirstName == 'Morty' && recordItem.LastName == 'Smith') {
                recordItem.SadMorty__c = recordItem.MyRick__c == null ? true : false;
            }
        }
    }
}
