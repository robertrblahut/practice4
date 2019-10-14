public class BitBucket implements VCS {
    public void push() {
        System.debug('push to BitBucket repository');
    }

    public void pull() {
        System.debug('pull from BitBucket repository');
    }

    public void commitChanges() {
        System.debug('commit changes in BitBucket repository');
    }
}
