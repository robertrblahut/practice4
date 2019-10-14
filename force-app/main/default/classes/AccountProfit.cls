public class AccountProfit implements Profit {
    
    private List<ContactProfit> profits;

    public AccountProfit(Account anAccount) {
        List<Contact> relatedContacts = [SELECT Id, Profit__c FROM Contact WHERE AccountId = :anAccount.Id];
        for (Contact anContact : relatedContacts) {
            profits.add(new ContactProfit(anContact));
        }
    }

    public Decimal calculate() {
        Decimal totalProfit = 0;
        for (ContactProfit anContactProfit : profits) {
            totalProfit += anContactProfit.calculate();
        }
        return totalProfit;
    }
}
