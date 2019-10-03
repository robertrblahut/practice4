public class Just4Fun {
	public static Boolean isBracketsBalanced(String str) {
    	List<String> bracketsConstruction = str.split('');

    	List<String> arr = new List<String>(); // queue

    	for (String bracket : bracketsConstruction) {
      		if (arr.size() != 0) {
        		String lastBracket = arr.get(arr.size()-1);
        		if (bracket == ')' && lastBracket == '(') {
          			arr.remove(arr.size()-1); // remove last bracket
        		} else if (bracket == ']' && lastBracket == '['){
          			arr.remove(arr.size()-1);
        		} else if (bracket == '}' && lastBracket == '{') {
          			arr.remove(arr.size()-1);
        		} else if (bracket == '>' && lastBracket == '<') {
          			arr.remove(arr.size()-1);
        		} else {
          			arr.add(bracket);
        		}
      		} else {
        		arr.add(bracket);
      		}
    	}
        
        return arr.size() > 0 ? false : true;
	}
}