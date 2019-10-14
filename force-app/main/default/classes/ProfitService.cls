public class ProfitService {

    public static Decimal calculate(List<Profit> profits) {

        Decimal totalProfit = 0;
        for (Profit aProfit: profits) {
            totalProfit += aProfit.calculate();
        }
        return totalProfit;
    }

    public static List<ContactProfit> getAllContactProfits() {
        List<Contact> allContacts = [SELECT Id, Profit__c FROM Contact];
        List<ContactProfit> allContactProfits = new List<ContactProfit>();
        for (Contact aContact : allContacts) {
            allContactProfits.add(new ContactProfit(aContact));
        }
        return allContactProfits;
    }

    public static List<AccountProfit> getAllAccountProfits() {
        List<Account> allAccounts = [SELECT Id FROM Account];
        List<AccountProfit> allAccountProfits = new List<AccountProfit>();
        for (Account anAccount : allAccounts) {
            allAccountProfits.add(new AccountProfit(anAccount));
        }
        return allAccountProfits;
    }
}