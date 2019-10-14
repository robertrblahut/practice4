public class ProfitUtils {

    public static void createContactWithProfit(Decimal profit) {
        Contact aContact = new Contact(LastName='Johny Test');
        aContact.profit__c = profit;
        insert aContact;
    }

    public static void createAccountsAndContacts(Integer howManyAccounts, Integer howManyContacts) {
        List<Account> accountsToInsert = new List<Account>();
        for (Integer i = 0; i < howManyAccounts; i++) {
            Account anAccount = new Account(Name='Lowcase inc Test');
            accountsToInsert.add(anAccount);
        }

        insert accountsToInsert;


        List<Contact> contactsToInsert = new List<Contact>();
        for (Integer i = 0; i < howManyAccounts; i++) {
            for (Integer j = 0; j < howManyContacts; j++) {
                Contact aContact = new Contact(LastName='Johny Test');
                aContact.profit__c = 10;
                aContact.AccountId = accountsToInsert.get(i).Id;
                contactsToInsert.add(aContact);
            }
        }
        

        insert contactsToInsert;
        update accountsToInsert;
    }
}
