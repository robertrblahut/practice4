public class AccountSwitcherImpl implements AccountSwitcher {
    static List<ContactType> allContacts;
    private DataResult aDataResult;

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

    private Integer generateNumber() {
        return Integer.valueOf(Math.random() * 1000000);
    }

    private String chooseTypeOfContact(Integer cardNumber) {
        if (numHasThreeEqualDigits(cardNumber) == true) {
            return 'Premier';
        } else {
            return 'Person';
        }
    }

    private Boolean numHasThreeEqualDigits(Integer num) {
        Set<String> digitsOfNumber = new Set<String>(String.valueOf(num).split(''));

        return digitsOfNumber.size() <= 3 ? true : false;
    }

    // 

    public DataResult switchAccount() {
        List<PrivateContact> privateContacts = getAllPrivateContacts();
        List<PublicContact> publicContacts = getAllPublicContacts();

        switchAccountBetweenContacts(publicContacts, privateContacts);

        return aDataResult;
    }


    private List<PrivateContact> getAllPrivateContacts() {
        List<PrivateContact> privateContacts = new List<PrivateContact>();
        for (ContactType aContactType : allContacts) {
            if (aContactType instanceof PrivateContact) {
                privateContacts.add((PrivateContact)aContactType);        
            }
        }
        return privateContacts;
    }

    private List<PublicContact> getAllPublicContacts() {
        List<PublicContact> publicContacts = new List<PublicContact>();
        for (ContactType aContactType : allContacts) {
            if (aContactType instanceof PublicContact) {
                publicContacts.add((PublicContact)aContactType);        
            }
        }
        return publicContacts;
    }

    private void switchAccountBetweenContacts(List<PublicContact> publicContacts, List<PrivateContact> privateContacts) {
        List<PrivateContact> privateContactsCanBeChanged = getPrivateContactsCanBeChanged(privateContacts);

        Integer sizeOfSmaller = privateContactsCanBeChanged.size() <= publicContacts.size() ? privateContactsCanBeChanged.size() : publicContacts.size();

        for (Integer i = 0; i < sizeOfSmaller; i++) {
            switchAccountBetweenContacts(publicContacts.get(i), privateContacts.get(i));
            addContactsToDataResult(publicContacts.get(i), privateContacts.get(i));
        }
    }

    private List<PrivateContact> getPrivateContactsCanBeChanged(List<PrivateContact> privateContacts) {
        List<PrivateContact> privateContactsCanBeChanged = new List<PrivateContact>();
        for (PrivateContact aPrivateContact : privateContacts) {
            if (aPrivateContact.contactTypeName != 'Premier') {
                privateContactsCanBeChanged.add(aPrivateContact);
            } else {
                this.aDataResult.nonChangedPrivateContacts.add(aPrivateContact);
            }
        }
        return privateContactsCanBeChanged;
    }

    private void switchAccountBetweenContacts(PublicContact aPublicContact, PrivateContact aPrivateContact) {
        Id accountOfFirstContact = aPublicContact.contactRecord.AccountId;
        aPublicContact.contactRecord.accountId = aPrivateContact.contactRecord.accountId;
        aPrivateContact.contactRecord.accountId = accountOfFirstContact;
    }

    private void addContactsToDataResult(PublicContact aPublicContact, PrivateContact aPrivateContact) {
        this.aDataResult.changedPublicContacts.add(aPublicContact);
        this.aDataResult.changedPrivateContacts.add(aPrivateContact);
    }
}