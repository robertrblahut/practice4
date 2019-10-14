public class GitLab implements VCS {
    public String push() {
        return 'push to GitLab repository';
    }

    public String pull() {
        return 'pull from GitLab repository';
    }

    public String commitChanges() {
        return 'commit changes in GitLab repository';
    }
}
