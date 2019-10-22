trigger SecondContactTrigger on Contact (before insert, after insert, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        SecondContactTriggerHandler.handleContactsAfterInsert(Trigger.new);
    }

    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        SecondContactTriggerHandler.handleContactsBeforeInsertOrUpdate(Trigger.new);
    }
}
