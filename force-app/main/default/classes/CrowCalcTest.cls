@isTest
public class CrowCalcTest {

    private static final Integer COUNT_OF_INITIAL_CROWS = 10;

    @TestSetup
    static void makeData(){
        List<Crow__c> crowsToAdd = new List<Crow__c>();

        for (Integer i = 0; i < COUNT_OF_INITIAL_CROWS; i++) {
            Crow__c crow = new Crow__c();
            crowsToAdd.add(crow);
        }

        insert crowsToAdd;
    }

    @isTest
    public static void testAddCrows() {

        Integer initialCrows = 0;

        Boolean addCrowsResult = CrowCalc.addCrows(10);

        Integer crowsAfter = [SELECT COUNT() FROM Crow__c] - initialCrows;

        System.assert(crowsAfter == 10, 'Wrong answer!');

        System.assert(addCrowsResult, 'Success addition not "true"');

    }

    @isTest
    public static void testSubtractCrows() {
        Integer crowsBefore = [SELECT Count() FROM Crow__c]; // 10

        Boolean substractCrowsResult = CrowCalc.substractCrows(8);

        Integer crowsAfter = [SELECT Count() FROM Crow__c]; // must be 2

        System.assertEquals(2, crowsAfter, 'Wrong answer');
        System.assertEquals(true, substractCrowsResult, 'Success substraction not "true"');
    }

    @isTest
    public static void testGetTotal() {
        Integer crowsNow = [SELECT Count() FROM Crow__c]; // 10
        Integer whatReturnsGetTotalMethod = CrowsCalc.getTotal(); // must be 10

        System.assertEquals(COUNT_OF_INITIAL_CROWS, whatReturnsGetTotalMethod, 'Wrong Answer');

    }

    @isTest
    public static void testResetCalc() {
        Boolean resetCalcResult = CrowCalc.resetCalc();
        Integer howManyCrows = [SELECT Count() FROM Crow__c];

        System.assertEquals(0, howManyCrows, 'Wrong answer');
        System.assertEquals(true, resetCalcResult, 'Success reseting not "true"');
    }

}