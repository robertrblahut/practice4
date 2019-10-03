public with sharing class DMLPractice {

    // Создать в апекс 5 контактов с любыми именами. Сохранить их в БД.
    public static void insertFiveContacts() {
        
        List<Contact> contacts = new List<Contact>();
        
        for (Integer i = 0; i < 5; i++) {
            Contact c = new Contact(LastName='LastName');
            contacts.add(c);
        }

        insert contacts;
    }

    /* Создать ещё 5 записей контактов с любыми именами и Title = “Developer”. 
    Сделать цикл который проходит по предыдущим контактам и так же сделать
     для них Title = “Developer”. Одной операцией обновить/сохранить их в БД. */
    public static void upsertTenContacts() {
        List<Contact> newContacts = new List<Contact>();
        List<Contact> existContacts = [SELECT Id, Title FROM Contact WHERE LastName='LastName'];
        
        for (Integer i = 0; i < 5; i++) {
            Contact c = new Contact(LastName='LastName', Title='Developer');
            newContacts.add(c);
            existContacts.get(i).Title = 'Developer';
        }

        List<Contact> allContacts = new List<Contact>();
        allContacts.addAll(newContacts);
        allContacts.addAll(existContacts);

        upsert allContacts;
    }

    // Удалить все 10 созданных контактов.
    public static void deleteTenContacts() {
        List<Contact> contacts = [SELECT Id, LastName FROM Contact WHERE LastName='LastName'];
        delete contacts;
    }

    // Вытащить из корзины удалённые контакты.
    public static void undeleteTenContacts() {
        List<Contact> contacts = [SELECT Id, LastName FROM Contact WHERE LastName='LastName' AND isDeleted = True ALL ROWS];
        undelete contacts;
    }

    /* 
    Сделать цикл, который создаёт 10 контактов с заполненным LastName и 
    10 контактов с пустым LastName. При помощи Database класса:
        а) сделать инсерт, который позволит частично сохранить 
        полученный лист контактов
        б) После инсерта проверит количество сохранённых контактов
        в) если количество контактов в списке будет больше чем количество 
        сохранённых контактов – сделает откат до момента инсерта.
    */
    public static void insertContactsWithRollingBack() {
        List<Contact> contactsWithLastName = new List<Contact>();
        List<Contact> contactsWithoutLastName = new List<Contact>();

        for (Integer i = 0; i < 20; i++) {
            if (i < 10) {
                Contact c = new Contact(LastName='LastName');
                contactsWithLastName.add(c);
            }
            else {
                Contact c = new Contact(LastName='');
                contactsWithoutLastName.add(c);
            }
        }

        List<Contact> allContacts = new List<Contact>();
        allContacts.addAll(contactsWithLastName);
        allContacts.addAll(contactsWithoutLastName);

        Savepoint sp = Database.setSavepoint();

        List<Database.SaveResult> results = Database.insert(allContacts, false);
        
        Integer countOfInsertedContacts = 0;

        for (Database.SaveResult result : results) {
            if (result.isSuccess()) countOfInsertedContacts++;
        }

        if (countOfInsertedContacts < allContacts.size()) {
            
            /*List<Id> contactsIdsToDelete = new List<Id>();
            
            for (Database.SaveResult result : results) {
                if (result.isSuccess()) {
                    contactsIdsToDelete.add(result.getId());
                }
            }

            Database.delete(contactsIdsToDelete);*/

            Database.rollback(sp);
        }
    }

}