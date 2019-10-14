@isTest
public class AccountProfitTest {
    @TestSetup
    static void makeData(){
        ProfitUtils.createAccountsAndContacts(2, 3);
    }

    @isTest
    static void testCalculate() {
        Account anAccount = [SELECT Id, (SELECT Id, Profit__c FROM Contacts) FROM Account LIMIT 1];

        AccountProfit anAccountProfit = new AccountProfit(anAccount);

        System.assertEquals(30, anAccountProfit.calculate(), 'Wrong calculation for account profit');
    }
}
