public class AccountSwitcherImpl implements AccountSwitcher {
    static List<ContactType> allContacts;
    private DataResult aDataResult;

    public void getAndSort() {
        for (List<Contact> contacts : [SELECT Amount__c FROM Contact]) {
            for (Contact aContact : contacts) {
                if (aContact.amount__c > 10000) {
                    allContacts.add(new PrivateContact(aContact, generateNumber()));
                } else {
                    allContacts.add(new PublicContact(aContact, generateNumber()));
                }
            }
        }
    }

    private Integer generateNumber() {
        return Integer.valueOf(Math.random() * 1000000);
    }

    public DataResult switchAccount() {
        List<PrivateContact> privateContacts = getAllPrivateContacts();
        List<PublicContact> publicContacts = getAllPublicContacts();

        switchAccountBetweenContacts(publicContacts, privateContacts);

        updateDataOnOrg();

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

        Integer sizeOfSmaller;
        if (privateContactsCanBeChanged.size() <= publicContacts.size()) {
            sizeOfSmaller = privateContactsCanBeChanged.size();
        } else {
            sizeOfSmaller = publicContacts.size();
        }

        for (Integer i = 0; i < sizeOfSmaller; i++) {
            switchAccountBetweenContacts(publicContacts.get(i), privateContactsCanBeChanged.get(i));
            addContactsToDataResult(publicContacts.get(i), privateContactsCanBeChanged.get(i));
        }
    }

    private List<PrivateContact> getPrivateContactsCanBeChanged(List<PrivateContact> privateContacts) {
        List<PrivateContact> privateContactsCanBeChanged = new List<PrivateContact>();
        for (PrivateContact aPrivateContact : privateContacts) {
            if (aPrivateContact.getContactTypeName() != 'Premier') {
                privateContactsCanBeChanged.add(aPrivateContact);
            } else {
                this.aDataResult.nonChangedPrivateContacts.add(aPrivateContact);
            }
        }
        return privateContactsCanBeChanged;
    }

    private void switchAccountBetweenContacts(PublicContact aPublicContact, PrivateContact aPrivateContact) {
        Id accountOfFirstContact = aPublicContact.getContactRecord().AccountId;
        aPublicContact.getContactRecord().accountId = aPrivateContact.getContactRecord().accountId;
        aPrivateContact.getContactRecord().accountId = accountOfFirstContact;
    }

    private void addContactsToDataResult(PublicContact aPublicContact, PrivateContact aPrivateContact) {
        this.aDataResult.changedPublicContacts.add(aPublicContact);
        this.aDataResult.changedPrivateContacts.add(aPrivateContact);
    }

    private void updateDataOnOrg() {
        List<Contact> contactsToUpdate = new List<Contact>();
        for (PrivateContact aPrivateContact : this.aDataResult.changedPrivateContacts) {
            contactsToUpdate.add(aPrivateContact.getContactRecord());
        }
        for (PublicContact aPublicContact : this.aDataResult.changedPublicContacts) {
            contactsToUpdate.add(aPublicContact.getContactRecord());
        }

        update contactsToUpdate;
    }
}