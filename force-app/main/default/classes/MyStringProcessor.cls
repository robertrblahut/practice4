public class MyStringProcessor implements StringProcessor {
    public String addPrefix(String str) {
        return 'my' + str;
    }
    
    public String addPostfix(String str) {
        return str + 'my';
    }
    
    public String removeWhitespaces(String str) {
        return str.deleteWhitespace();
    }
    
    public void updateList(List<String> l1, List<String> l2) {
        for (String str : l1) {
            String strWithPrefix = this.addPrefix(str);
    		l2.add(strWithPrefix);
        }
    }
}