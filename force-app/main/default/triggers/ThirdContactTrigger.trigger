trigger ThirdContactTrigger on Contact (before insert, after insert, before update) {

    if (Trigger.isBefore && Trigger.isInsert) {
        ThirdContactTriggerHandler.handleContactsBeforeInsert(Trigger.new);
    }

    if (Trigger.isAfter && Trigger.isInsert) {
        ThirdContactTriggerHandler.handleContactsAfterInsert(Trigger.new);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        ThirdContactTriggerHandler.handleContactsBeforeUpdate(Trigger.new);
    }
}

/*

delete [SELECT Id FROM Contact WHERE FirstName IN ('Rick', 'Morty')];
ContactFactory.createRandomContacts();

List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};
insert contacts;

update [SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')];

List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};
insert contacts;

SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')

*/