@isTest
public class ContactProfitTest {

    @TestSetup
    static void makeData(){
        ProfitUtils.createContactWithProfit(10);
    }

    @isTest
    static void testCalculate() {
        Contact aContact = [SELECT Id, Profit__c FROM Contact LIMIT 1];
        ContactProfit aContactProfit = new ContactProfit(aContact);

        System.assertEquals(10, aContactProfit.calculate(), 'Wrong calculation of contact profit');
    }
}
