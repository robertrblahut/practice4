public class PublicContact extends ContactType {
    private Integer volunteerNumber;
    private Contact contactRecord;

    public PublicContact(Contact aContact, Integer volunteerNumber) {
        this.contactRecord = aContact;
        this.volunteerNumber = volunteerNumber;
        this.contactTypeName = 'Person';
    }

    public Integer getVolunteerNumber() {
        return this.volunteerNumber;
    }

    public Contact getContactRecord() {
        return this.contactRecord;
    }
}