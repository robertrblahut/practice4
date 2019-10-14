public class GitLab implements VCS {
    public void push() {
        System.debug('push to GitLab repository');
    }

    public void pull() {
        System.debug('pull from GitLab repository');
    }

    public void commitChanges() {
        System.debug('commit changes in GitLab repository');
    }
}
