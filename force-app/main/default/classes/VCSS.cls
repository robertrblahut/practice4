public class VCSS {

    private Map<String, VCS> strategies = new Map<String, VCS> {
        'GitLab' => (VCS) Type.forName('GitLab').newInstance(),
        'BitBucket' => (VCS) Type.forName('BitBucket').newInstance()
    };

    private VCS vcsStrategy;
    
    public VCSS(String vcsStrategyName) {
        vcs = strategies.get(vcsStrategyName);
    }

    public void push() {
        vcsStrategy.push();
    }

    public void pull() {
        vcsStrategy.pull();
    }

    public void commitChanges() {
        vcsStrategy.commitChanges();
    }
}
