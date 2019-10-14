public class VCSS {

    private Map<String, VCS> strategies = new Map<String, VCS> {
        'GitLab' => (VCS) Type.forName('GitLab').newInstance(),
        'BitBucket' => (VCS) Type.forName('BitBucket').newInstance()
    };

    private VCS vcsStrategy;
    
    public VCSS(String vcsStrategyName) {
        vcsStrategy = strategies.get(vcsStrategyName);
    }

    public String push() {
        return vcsStrategy.push();
    }

    public String pull() {
        return vcsStrategy.pull();
    }

    public String commitChanges() {
        return vcsStrategy.commitChanges();
    }
}
