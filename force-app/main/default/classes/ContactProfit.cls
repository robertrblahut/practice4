public class ContactProfit implements Profit {

    private Decimal profit;

    public ContactProfit(Contact anContact) {
        this.profit = anContact.profit__c;
    }

    Decimal calculate() {
        return profit;
    }
}
