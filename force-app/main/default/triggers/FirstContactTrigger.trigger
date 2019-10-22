trigger FirstContactTrigger on Contact (before insert) {
    FirstContactTriggerHandler.createMortyForRick(Trigger.new);
}