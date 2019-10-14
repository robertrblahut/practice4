public class AccountSwitcherImpl implements AccountSwitcher {
    static List<ContactType> allContacts;

        private String chooseTypeOfContact(Integer cardNumber) {
        if (numHasThreeEqualDigits(cardNumber) == true) {
            return 'Premier';
        } else {
            return 'Person';
        }
    }

    private void createPrivateContact(Contact aContact) {
        PrivateContact aPrivateContact = new PrivateContact();
        aPrivateContact.contactRecord = aContact;
        aPrivateContact.cardNumber = generateNumber();
        aPrivateContact.contactTypeName = chooseTypeOfContact(aPrivateContact.cardNumber);
                    
        allContacts.add(aPrivateContact);
    }

    private void createPublicContact(Contact aContact) {
        PublicContact aPublicContact = new PublicContact();
        aPublicContact.contactRecord = aContact;
        aPublicContact.volunteerNumber = generateNumber();
        aPublicContact.contactTypeName = 'Person';

        allContacts.add(aPublicContact);
    }

    public void getAndSort() {
        for (List<Contact> contacts : [SELECT Amount__c FROM Contact]) {
            for (Contact aContact : contacts) {
                if (aContact.amount__c > 10000) {
                    createPrivateContact(aContact);
                } else {
                    createPublicContact(aContact);
                }
            }
        }
    }

    public DataResult switchAccount() {
        List<PrivateContact> privateContacts = new List<PrivateContact>();
        List<PublicContact> publicContacts = new List<PublicContact>();

        for (ContactType aContactType : allContacts) {
            if (aContactType instanceof PrivateContact) {
                privateContacts.add((PrivateContact)aContactType);        
            } else {
                publicContacts.add((PublicContact)aContactType);
            }
        }

        Integer sizeOfSmaller = privateContacts.size() <= publicContacts.size() ? privateContacts.size() : publicContacts.size();

        for (Integer i = 0; i < sizeOfSmaller; i++) {
            if (privateContacts.get(i).contactTypeName != 'Person') {
                switchAccountBetweenContacts(publicContacts.get(i), privateContacts.get(i));
            }
        }

        DataResult result = new DataResult();
        result.changedPrivateContacts.addAll(privateContacts);
        result.changedPublicContacts.addAll(publicContacts);
        result.nonChangedPrivateContacts.addAll(privateContacts);

        return result;
    }

    private void switchAccountBetweenContacts(PublicContact aPublicContact, PrivateContact aPrivateContact) {
        Id accountOfFirstContact = aPublicContact.contactRecord.AccountId;
        aPublicContact.contactRecord.accountId = aPrivateContact.contactRecord.accountId;
        aPrivateContact.contactRecord.accountId = accountOfFirstContact;
    }

    private Integer generateNumber() {
        return Integer.valueOf(Math.random() * 1000000);
    }

    private Boolean numHasThreeEqualDigits(Integer num) {
        Set<String> digitsOfNumber = new Set<String>(String.valueOf(num).split(''));

        return digitsOfNumber.size() <= 3 ? true : false;
    }
}
