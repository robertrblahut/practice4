@isTest
public class ProfitServiceTest {
    @TestSetup
    static void makeData(){
        ProfitUtils.createAccountsAndContacts(5, 3);
    }

    @isTest
    static void testCalculate() {

        List<Profit> profits = new List<Profit>();
        profits.addAll(ProfitService.getAllAccountProfits());
        profits.addAll(ProfitService.getAllAccountProfits());

        System.assertEquals(300, ProfitService.calculate(profits), 'Wrong answer for profit calculation');
    }

    @isTest
    static void testGetAllContactProfits() {
        System.assertEquals(15, ProfitService.getAllContactProfits().size(), 'Wrong size of contacts profits');
    }

    @isTest
    static void testGetAllAccountProfits() {
        System.assertEquals(5, ProfitService.getAllAccountProfits().size(), 'Wrong size of contacts profits');
    }
}
