@isTest
public class CrowCalcTest {

    @isTest
    public static void testAddCrows() {

        Integer initialCrows = 0;

        Boolean addCrowsResult = CrowCalc.addCrows(10);

        Integer crowsAfter = [SELECT COUNT() FROM Crow__c] - initialCrows;

        System.assert(crowsAfter == 10, 'Wrong answer!');

        System.assert(addCrowsResult, 'Success addition not "true"');

    }

    @isTest
    public static void testSubtractCrows() {}

    @isTest
    public static void testGetTotal() {}

    @isTest
    public static void testResetCalc() {}

}