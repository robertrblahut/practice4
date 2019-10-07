@isTest
public class CrowCalcTest {

    private static final Integer COUNT_OF_INITIAL_CROWS = 10;

    @TestSetup
    static void makeData(){
        createCrows(COUNT_OF_INITIAL_CROWS);
    }

    private static void createCrows(Integer howMany) {
        List<Crow__c> crowsToAdd = new List<Crow__c>();

        for (Integer i = 0; i < howMany; i++) {
            Crow__c crow = new Crow__c();
            crowsToAdd.add(crow);
        }

        insert crowsToAdd;
    }

    @isTest
    public static void testAddCrowsPositiveCase() {

        Integer initialCrows = COUNT_OF_INITIAL_CROWS;

        Boolean addCrowsResult = CrowCalc.addCrows(10);

        Integer crowsAfter = [SELECT COUNT() FROM Crow__c] - initialCrows;

        System.assert(crowsAfter == 10, 'Wrong answer!');

        System.assert(addCrowsResult, 'Success addition not "true"');

    }

    @isTest
    public static void testAddCrowsNegativeCaseNull() {
        Boolean addCrowsResult = CrowCalc.addCrows(null);

        System.assertEquals(false, addCrowsResult, 'Failed addition not "false"');
    }

    @isTest
    public static void testAddCrowsBulkCase() {
        Boolean addCrowsResult = CrowCalc.addCrows(5000);
        
        System.assertEquals(true, addCrowsResult, 'Succed addition not "true"');
    }

    @isTest
    public static void testSubtractCrowsPositiveCase() {
        Integer crowsBefore = [SELECT Count() FROM Crow__c]; // 10

        Boolean substractCrowsResult = CrowCalc.subtractCrows(8);

        Integer crowsAfter = [SELECT Count() FROM Crow__c]; // must be 2

        System.assertEquals(2, crowsAfter, 'Wrong answer');
        System.assertEquals(true, substractCrowsResult, 'Success substraction not "true"');
    }

    @isTest
    public static void testSubtractCrowsNegativeCaseNull() {
        Boolean substractCrowsResult = CrowCalc.subtractCrows(null);

        System.assertEquals(false, substractCrowsResult);
    }

    @isTest
    public static void testGetTotal() {
        Integer crowsNow = [SELECT Count() FROM Crow__c]; // 10
        Integer whatReturnsGetTotalMethod = CrowCalc.getTotal(); // must be 10

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