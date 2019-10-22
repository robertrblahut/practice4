trigger ThirdContactTrigger on Contact (before insert, after insert, before update) {

    if (Trigger.isBefore && Trigger.isInsert) {
        ThirdContactTriggerHandler.handleContactsBeforeInsert(Trigger.new);
    }

    if (Trigger.isAfter && Trigger.isInsert) {
        ThirdContactTriggerHandler.handleContactsAfterInsert(Trigger.new);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        ThirdContactTriggerHandler.handleContactsBeforeUpdate(Trigger.new);
    }
}