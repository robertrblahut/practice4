trigger FourthContactTrigger on Contact (after insert) {
    FourthContactTriggerHandler.handleContactsAfterInsert(Trigger.new);
}

/*
SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')

delete [SELECT Id FROM Contact WHERE FirstName IN ('Rick', 'Morty')];
List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Rick', LastName = 'Sanchez'),
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};
insert contacts;

List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};
insert contacts;

List<Contact> records = [SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')];
for (Contact record: records) {
    System.debug(record.FirstName + ' => ' + record.SadMorty__c);
}

*/