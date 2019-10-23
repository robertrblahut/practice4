trigger FirstContactTrigger on Contact (before insert) {
    FirstContactTriggerHandler.createMortyForRick(Trigger.new);
}

/*

------
delete [SELECT Id FROM Contact WHERE FirstName IN ('Rick', 'Morty')];


List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Rick', LastName = 'Sanchez'),
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};

insert contacts;


SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')

*/