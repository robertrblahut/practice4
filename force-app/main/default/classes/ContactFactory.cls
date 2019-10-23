public class ContactFactory {
    public static List<Contact> createRicks(Integer howMany) {
        List<Contact> ricks = new List<Contact>();
        
        for (Integer i = 0; i < howMany; i++) {
            Contact newRick = new Contact(
                FirstName = 'Rick',
                LastName = 'Sanchez'
            );
            ricks.add(newRick);
        }

        insert ricks;
        
        return ricks;
    }

    public static List<Contact> createRandomContacts() {
        Integer HOW_MANY_CONTACTS_CREATE = 5;

        List<Contact> records = new List<Contact>();

        for (Integer i = 0; i < HOW_MANY_CONTACTS_CREATE; i++) {
            if (Math.mod(i, 7) < 2) {
                Contact contact = new Contact(FirstName = 'Rick', LastName = 'Sanchez');
                records.add(contact);
            } else {
                Contact contact = new Contact(FirstName = 'Morty', LastName = 'Smith');
                records.add(contact);
            }
        }

        insert records;

        return records;
    }
}

/*
-----SHOW DB-----

SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')


-----CLEAR DB-----
delete [SELECT Id FROM Contact WHERE FirstName IN ('Rick', 'Morty')];


-----CREATE RICK-----
Contact contact = new Contact(
    FirstName = 'Rick',
    LastName = 'Sanchez'
);

insert contact;


-----CREATE MORTY-----
Contact contact = new Contact(
    FirstName = 'Morty',
    LastName = 'Smith'
);

insert contact;


-----UPDATE MORTIES-----
List<Contact> contacts = [
    SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c 
    FROM Contact 
    WHERE FirstName = 'Morty'];

update contacts;


-----CREATE 200 RANDOM CONTACTS-----
SELECT Id, FirstName, LastName, SadMorty__c, MyRick__c FROM Contact WHERE FirstName IN ('Rick', 'Morty')
delete [SELECT Id FROM Contact WHERE FirstName IN ('Rick', 'Morty')];
ContactFactory.createRandomContacts();

List<Contact> contacts = new List<Contact> {
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Morty', LastName = 'Smith'),
    new Contact(FirstName = 'Rick', LastName = 'Sanchez')
};

insert contacts;
*/
