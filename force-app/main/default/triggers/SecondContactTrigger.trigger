trigger SecondContactTrigger on Contact (before insert, after insert, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        SecondContactTriggerHandler.handleContactsAfterInsert(Trigger.new);
    }

    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        SecondContactTriggerHandler.handleContactsBeforeInsertOrUpdate(Trigger.new);
    }
}

/*

delete [SELECT Id FROM Contact WHERE FirstName IN ('Rick', 'Morty')];
List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Rick', LastName = 'Sanchez'),
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};
insert contacts;

List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Morty', LastName = 'Smith')
};
insert contacts;

SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')

*/