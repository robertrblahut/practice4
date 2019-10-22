trigger FourthContactTrigger on Contact (after insert) {
    FourthContactTriggerHandler.handleContactsAfterInsert(Trigger.new);
}

