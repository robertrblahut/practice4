public with sharing class ArrayTasks {
    /**
 * Returns an index of the specified element in array or -1 if element is not found
 *
 * @param {array} arr
 * @param {any} value
 * @return {number}
 *
 * @example
 *    ['Ace', 10, true], 10    => 1
 *    ['Array', 'Number', 'string'], 'Date'    => -1
 *    [0, 1, 2, 3, 4, 5], 5    => 5
 */
    public static Integer findElement(List<String> arr, String value) {
        return arr.indexOf(value);
    }

    /**
 * Generates an array of odd numbers of the specified length
 *
 * @param {number} len
 * @return {array}
 *
 * @example
 *    1 => [ 1 ]
 *    2 => [ 1, 3 ]
 *    5 => [ 1, 3, 5, 7, 9 ]
 */
    public static List<Integer> generateOdds(Integer len) {
        List<Integer> result = new List<Integer>();
        for (Integer i = 0; i < len; i++) {
            result.add(2*i + 1);
        }

        return result;
    }

    /**
 * Returns the doubled array - elements of the specified array are repeated twice using original order
 *
 * @param {array} arr
 * @return {array}
 *
 * @example
 *    ['Ace', 10, true]  => ['Ace', 10, true,   'Ace', 10, true]
 *    [0, 1, 2, 3, 4, 5] => [0, 1, 2, 3, 4, 5,   0, 1, 2, 3, 4, 5]
 *    [] => []
 */
    public static List<Object> doubleArray(List<Object> arr) {
        arr.addAll(arr);
        return arr;
    }

    /**
 * Returns an array of positive numbers from the specified array in original order
 *
 * @param {array} arr
 * @return {array}
 *
 * @example
 *    [ 0, 1, 2, 3, 4, 5 ] => [ 1, 2, 3, 4, 5 ]
 *    [-1, 2, -5, -4, 0] => [ 2 ]
 *    [] => []
 */
    public static List<Integer> getArrayOfPositives(List<Integer> arr) {

        List<Integer> res = new List<Integer>();
        for(Integer i: arr) {
            if (i > 0) {
                res.add(i);
            }
        }

        return res;
    }

    /**
 * Returns the array of useprcase strings from the specified array
 *
 * @param {array} arr
 * @return {array}
 *
 * @example
 *    [ 'permanent-internship', 'glutinous-shriek', 'multiplicative-elevation' ] => [ 'PERMANENT-INTERNSHIP', 'GLUTINOUS-SHRIEK', 'MULTIPLICATIVE-ELEVATION' ]
 *    [ 'a', 'b', 'c', 'd', 'e', 'f', 'g' ]  => [ 'A', 'B', 'C', 'D', 'E', 'F', 'G' ]
 */
    public static List<String> getUpperCaseStrings(List<String> arr) {
        List<String> result = new List<String>();
        for(String s: arr) {
            result.add(s.toUpperCase());
        }

        return result;
    }

    /**
 * Returns the array of string lengths from the specified string array.
 *
 * @param {array} arr
 * @return {array}
 *
 * @example
 *    [ '', 'a', 'bc', 'def', 'ghij' ]  => [ 0, 1, 2, 3, 4 ]
 *    [ 'angular', 'react', 'ember' ] => [ 7, 5, 5 ]
 */
    public static List<Integer> getStringsLength(List<String> arr) {
        List<Integer> result = new List<Integer>();
        for(String s: arr) {
            result.add(s.length());
        }

        return result;
    }

    /**
 * Inserts the item into specified array at specified index
 *
 * @param {array} arr
 * @param {any} item
 * @param {number} index
 *
 * @example
 *    [ 0, 1, 3], 2, 2  => [ 0, 1, 2, 3 ]
 *    [ 0, 0, 1, 3, 5], 2, 3  => [ 0, 0, 1, 2, 3, 5 ]
 */
    public static List<Integer> insertItem(List<Integer> arr, Integer item, Integer index) {
        arr.add(index, item);
        return arr;
    }

    /**
 * Returns the n first items of the specified array
 *
 * @param {array} arr
 * @param {number} n
 *
 * @example
 *    [ 1, 3, 4, 5 ], 2  => [ 1, 3 ]
 *    [ 1, 3, 3, 3, 5 ], 4  => [ 1, 3, 3, 3 ]
 */
    public static List<Integer> getHead(List<Integer> arr, Integer n) {
        List<Integer> result = new List<Integer>();

        for (Integer i = 0; i < n; i++) {
            result.add(arr[i]);
        }

        return result;
    }

    /**
 * Returns the n last items of the specified array
 *
 * @param {array} arr
 * @param {number} n
 *
 * @example
 *    [ 1, 3, 4, 5 ], 2  => [ 4, 5 ]
 *    [ 1, 3, 3, 3, 5 ], 4  => [ 3, 3, 3, 5 ]
 */
    public static List<Integer> getTail(List<Integer> arr, Integer n) {
        List<Integer> result = new List<Integer>();
        Boolean isFirst = true;

        for (Integer i = 0; i < n; i++) {
            if (isFirst) {
                result.add(arr[arr.size()-1 - i]);
                isFirst = false;
            }
            else {
                result.add(0, arr[arr.size()-1 - i]);
            }
        }

        return result;
    }

// THIS THIS THIS

    /**
 * Returns CSV represebtation of two-dimentional numeric array.
 * https://en.wikipedia.org/wiki/Comma-separated_values
 *
 * @param {array} arr
 * @return {string}
 *
 * @example
 *    [
 *       [  0, 1, 2, 3, 4 ],
 *       [ 10,11,12,13,14 ],
 *       [ 20,21,22,23,24 ],
 *       [ 30,31,32,33,34 ]
 *    ]
 *           =>
 *     '0,1,2,3,4\n'
 *    +'10,11,12,13,14\n'
 *    +'20,21,22,23,24\n'
 *    +'30,31,32,33,34'
 */
    public static String toCsvText(List<List<Integer>> arr) {
        String result;

        result = String.valueOf(arr);
        result = result.deleteWhitespace();
        result = result.remove('((');
        result = result.remove('))');
        result = result.remove(',(');
        result = result.replace(')', '\n');
        return result;
    }

    /**
 * Transforms the numeric array into the according array of squares:
 *   f(x) = x * x
 *
 * @param {array} arr
 * @return {array}
 *
 * @example
 *   [ 0, 1, 2, 3, 4, 5 ] => [ 0, 1, 4, 9, 16, 25 ]
 *   [ 10, 100, -1 ]      => [ 100, 10000, 1 ]
 */
    public static List<Integer> toArrayOfSquares(List<Integer> arr) {
        List<Integer> result = new List<Integer>();

        for (Integer i: arr) {
            result.add(i*i);
        }

        return result;
    }

    /**
 * Transforms the numeric array to the according moving sum array:
 *     f[n] = x[0] + x[1] + x[2] +...+ x[n]
 *  or f[n] = f[n-1] + x[n]
 *
 * @param {array} arr
 * @return {array}
 *
 * Example :
 *   [ 1, 1, 1, 1, 1 ]        => [ 1, 2, 3, 4, 5 ]
 *   [ 10, -10, 10, -10, 10 ] => [ 10, 0, 10, 0, 10 ]
 *   [ 0, 0, 0, 0, 0]         => [ 0, 0, 0, 0, 0]
 *   [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] => [ 1, 3, 6, 10, 15, 21, 28, 36, 45, 55 ]
 */
    public static List<Integer> getMovingSum(List<Integer> arr) {

        for (Integer i = 1; i < arr.size(); i++) {
            arr[i] += arr[i-1];
        }

        return arr;
    }

    /**
 * Returns every second item from the specified array:
 *
 * @param {array} arr
 * @return {array}
 *
 * Example :
 * [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] => [ 2, 4, 6, 8, 10 ]
 * [ 5, 4, 5, 4 ] => [ 4, 4 ]
 */
    public static List<Integer> getSecondItems(List<Integer> arr) {
        List<Integer> result = new List<Integer>();

        for (Integer i = 0; i < arr.size(); i++) {
            if (Math.mod(i, 2) != 0) {
                result.add(arr[i]);
            }
        }

        return result;
    }

    /**
 * Propagates every item in sequence its position times
 * Returns an array that consists of: one first item, two second items, tree third items etc.
 *
 * @param {array} arr
 * @return {array}
 *
 * @example :
 *  [] => []
 *  [ 1 ] => [ 1 ]
 *  [ 1,2,3,4,5 ] => [ 1, 2,2, 3,3,3, 4,4,4,4, 5,5,5,5,5 ]
 *  [ 3, 4, 5 ] => [ 3, 4,4, 5,5,5 ]
 */
    public static List<Integer> propagateItemsByPositionIndex(List<Integer> arr) {
        List<Integer> result = new List<Integer>();

        for (Integer i = 0; i < arr.size(); i++) {
            result.add(arr[i]);
            for (Integer j = 0; j < i; j++) {
                result.add(arr[i]);
            }
        }

        return result;
    }

    /**
 * Returns array containing only unique values from the specified array.
 *
 * @param {array} arr
 * @return {array}
 *
 * @example
 *   [ 1, 2, 3, 3, 2, 1 ] => [ 1, 2, 3 ]
 *   [ 1, 1, 2, 2, 3, 3, 4, 4] => [ 1, 2, 3, 4]
 */
    public static List<Integer> distinct(List<Integer> arr) {

        Set<Integer> result = new Set<Integer>(arr);

        return new List<Integer>(result);
    }
}