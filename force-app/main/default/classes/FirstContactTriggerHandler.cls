public class FirstContactTriggerHandler {
    public static void createMortyForRick(List<Contact> records) {
        List<Contact> morties = new List<Contact>();

        for (Contact recordItem : records) {
            Boolean isRick = recordItem.FirstName == 'Rick' && recordItem.LastName == 'Sanchez';
            if (isRick) {
                Contact newMorty = new Contact(
                    FirstName = 'Morty',
                    LastName = 'Smith'
                );
                morties.add(newMorty);
            }
        }

        insert morties;
    }
}
