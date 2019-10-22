@isTest
public class FirstContactTriggerTest {

    @TestSetup
    static void makeData(){
        ContactFactory.createRicks(10);
    }

    @isTest
    static void testFirstContactTrigger() {
        Integer howManyRicks = [SELECT Id FROM Contact WHERE FirstName = 'Rick' AND LastName = 'Sanchez'].size();
        Integer howManyMorties = [SELECT Id FROM Contact WHERE FirstName = 'Morty' AND LastName = 'Smith'].size();
        System.assertEquals(10, howManyRicks, 'Wrong amount of Ricks');
        System.assertEquals(10, howManyMorties, 'Wrong amount of Morties');
    }
}
