public class PrivateContact extends ContactType {
    private Integer cardNumber; 
    private Contact contactRecord;

    public PrivateContact(Contact aContact, Integer cardNumber) {
        this.contactRecord = aContact;
        this.cardNumber = cardNumber;
        this.contactTypeName = chooseTypeOfContact();
    }

    private String chooseTypeOfContact() {
        if (numHasThreeEqualDigits(this.cardNumber) == true) {
            return 'Premier';
        } else {
            return 'Person';
        }
    }

    private Boolean numHasThreeEqualDigits(Integer num) {
        Set<String> digitsOfNumber = new Set<String>(String.valueOf(num).split(''));

        return digitsOfNumber.size() <= 3 ? true : false;
    }

    public Integer getCardNumber() {
        return this.cardNumber;
    }

    public Contact getContactRecord() {
        return this.contactRecord;
    }
}