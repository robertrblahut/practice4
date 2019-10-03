public class LoopsTasks {

  /**
   * Returns the 'Fizz','Buzz' or an original number as String using the following rules:
   * 1) return original number as String
   * 2) but if number multiples of three return 'Fizz'
   * 3) for the multiples of five return 'Buzz'
   * 4) for numbers which are multiples of both three and five return 'FizzBuzz'
   *
   * @param {number} num
   * @return {any}
   *
   * @example
   *   2 =>  '2'
   *   3 => 'Fizz'
   *   5 => 'Buzz'
   *   4 => '4'
   *  15 => 'FizzBuzz'
   *  20 => 'Buzz'
   *  21 => 'Fizz'
   *
   */
  public static String getFizzBuzz(Integer num) {
    if (Math.mod(num, 15) == 0) {
      return 'FizzBuzz';
    } else if (Math.mod(num, 5) == 0) {
      return 'Buzz';
    } else if (Math.mod(num, 3) == 0) {
      return 'Fizz';
    } else {
      return String.valueOf(num);
    }
  }

  /**
   * Returns the factorial of the specified integer n.
   *
   * @param {number} n
   * @return {number}
   *
   * @example:
   *   1  => 1
   *   5  => 120
   *   10 => 3628800
   */
  public static Integer getFactorial(Integer num) {
    Integer res = 1;
    for (Integer i = 1; i <= num; i++) {
      res = res * i;
    }

    return res;
  }

  /**
   * Returns the sum of integer numbers between n1 and n2 (inclusive).
   *
   * @param {number} n1
   * @param {number} n2
   * @return {number}
   *
   * @example:
   *   1,2   =>  3  ( = 1+2 )
   *   5,10  =>  45 ( = 5+6+7+8+9+10 )
   *   -1,1  =>  0  ( = -1 + 0 + 1 )
   */
  public static Integer getSumBetweenNumbers(Integer num1, Integer num2) {
    Integer sum = 0;
    for (Integer i = num1; i <= num2; i++) {
      sum = sum + i;
    }

    return sum;
  }

  /**
   * Returns true, if a triangle can be built with the specified sides a,b,c and false in any other ways.
   *
   * @param {number} a
   * @param {number} b
   * @param {number} c
   * @return {bool}
   *
   * @example:
   *   1,2,3    =>  false
   *   3,4,5    =>  true
   *   10,1,1   =>  false
   *   10,10,10 =>  true
   */
  public static Boolean isTriangle(Integer a, Integer b, Integer c) {
    if ((a + b > c) && (a + c > b) && (b + c > a)) {
      return true;
    }

    return false;
  }

  /**
   * Returns true, if two specified axis-aligned rectangles overlap, otherwise false.
   * Each rectangle representing by Map<String, Integer> 
   *  {
   *     top: 5,
   *     left: 5,
   *     width: 20,
   *     height: 10
   *  }
   * 
   *  (5;5)
   *     -------------  
   *     |           | 
   *     |           |  height = 10
   *     ------------- 
   *        width=20    
   * 
   * NOTE: Please use canvas coordinate space (https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#The_grid),
   * it differs from Cartesian coordinate system.
   * 
   * @param {Map<String, Integer>} rect1
   * @param {Map<String, Integer>} rect2
   * @return {bool}
   *
   * @example:
   *   { top: 0, left: 0, width: 10, height: 10 },
   *   { top: 5, left: 5, width: 20, height: 20 }    =>  true
   * 
   *   { top: 0, left: 0, width: 10, height: 10 },
   *   { top:20, left:20, width: 20, height: 20 }    =>  false
   *  
   */
  public static Boolean doRectanglesOverlap(Map<String, Integer> rect1, Map<String, Integer> rect2) {
    Integer t1 = rect1.get('top'); Integer t2 = rect2.get('top');
    Integer l1 = rect1.get('left'); Integer l2 = rect2.get('left');
    Integer w1 = rect1.get('width'); Integer w2 = rect2.get('width');
    Integer h1 = rect1.get('height'); Integer h2 = rect2.get('height');

    if ((t1 <= t2 && t2 <= t1 + h1) && (l1 <= l2 && l2 <= l1 + w1)) {
      return true;
    }

    if ((t2 <= t1 && t1 <= t2 + h2) && (l2 <= l1 && l1 <= l2 + w2)) {
      return true;
    }

    return false;
  }

  /**
   * Returns true, if point lies inside the circle, otherwise false.
   * Circle is:
   *     Center Map<String, Double>: {
   *       x: 5,       
   *       y: 5
   *     },        
   *     Radius Integer: 20
   * Point is Map<String, Double> 
   *  {
   *     x: 5,
   *     y: 5
   *  }
   * 
   * @param {Map<String, Double>} center
   * @param {Integer} raduis
   * @param {Map<String, Double>} point
   * @return {bool}
   *
   * @example:
   *   center: { x:0, y:0 }, radius: 10, point: { x:0, y:0 }     => true
   *   center: { x:0, y:0 }, radius:10,  point: { x:10, y:10 }   => false
   *   
   */
  public static Boolean isInsideCircle(Map<String, Double> center, Integer radius, Map<String, Double> point) {
    if ( (Math.pow(center.get('x') - point.get('x'), 2) + Math.pow(center.get('y') - point.get('y'), 2)) < radius*radius ) {
      return true;
    }

    return false;
  }

  /**
   * Returns the first non repeated char in the specified strings otherwise returns null.
   *
   * @param {string} str
   * @return {string}
   *
   * @example:
   *   'The quick brown fox jumps over the lazy dog' => 'T'
   *   'abracadabra'  => 'c'
   *   'entente' => null
   */
  public static String findFirstSingleChar(String str) {

    str.deleteWhitespace();


    List<String> chars = str.split('');

    for (Integer i = 0; i < chars.size(); i++) {
      Integer count = 1;
      for (Integer j = i+1; j < chars.size(); j++) {
        if (chars[i].charAt(0) == chars[j].charAt(0)) {
          chars.remove(j);
          count++;
        }
      }
      if (count == 1) return chars[i];
    }

    return null;
  }

  /**
   * Returns the string representation of math interval, specified by two points and include / exclude flags.
   * See the details: https://en.wikipedia.org/wiki/Interval_(mathematics)
   *
   * Please take attention, that the smaller number should be the first in the notation
   *
   * @param {number} a
   * @param {number} b
   * @param {bool} isStartIncluded
   * @param {bool} isEndIncluded
   * @return {string}
   *
   * @example
   *   0, 1, true, true   => '[0, 1]'
   *   0, 1, true, false  => '[0, 1)'
   *   0, 1, false, true  => '(0, 1]'
   *   0, 1, false, false => '(0, 1)'
   * Smaller number has to be first :
   *   5, 3, true, true   => '[3, 5]'
   *
   */
  public static String getIntervalString(Integer a, Integer b, Boolean isStartIncluded, Boolean isEndIncluded) {
    String result = String.valueOf(a) + ', ' + String.valueOf(b);
    if (isStartIncluded) {
      result = '[' + result;
    } else {
      result = '(' + result;
    }

    if (isEndIncluded) {
      result = result + ']';
    } else {
      result = result + ')';
    }

    return result;
  }

  /**
   * Reverse the specified string (put all chars in reverse order)
   *
   * @param {string} str
   * @return {string}
   *
   * @example:
   * 'The quick brown fox jumps over the lazy dog' => 'god yzal eht revo spmuj xof nworb kciuq ehT'
   * 'abracadabra' => 'arbadacarba'
   * 'rotator' => 'rotator'
   * 'noon' => 'noon'
   */
  public static String reverseString(String str) {
    return str.reverse();
  }

  /**
   * Reverse the specified integer number (put all digits in reverse order)
   *
   * @param {number} num
   * @return {number}
   *
   * @example:
   *   12345 => 54321
   *   1111  => 1111
   *   87354 => 45378
   *   34143 => 34143
   */
  public static Integer reverseInteger(Integer num) {
    String res = String.valueOf(num);
    return Integer.valueOf(res.reverse());
  }

  /**
   * Returns the digital root of integer:
   *   step1 : find sum of all digits
   *   step2 : if sum > 9 then goto step1 otherwise return the sum
   *
   * @param {number} n
   * @return {number}
   *
   * @example:
   *   12345 ( 1+2+3+4+5 = 15, 1+5 = 6) => 6
   *   23456 ( 2+3+4+5+6 = 20, 2+0 = 2) => 2
   *   10000 ( 1+0+0+0+0 = 1 ) => 1
   *   165536 (1+6+5+5+3+6 = 26,  2+6 = 8) => 8
   */
  public static Integer getDigitalRoot(Integer num) {
    return num - 9 * Integer.valueOf(Math.floor((num-1)/9));
  }

  /**
   * Returns true if the specified string has the balanced brackets and false otherwise.
   * Balanced means that is, whether it consists entirely of pairs of opening/closing brackets
   * (in that order), none of which mis-nest.
   * Brackets include [],(),{},<>
   *
   * @param {string} str
   * @return {boolean}
   *
   * @example:
   *   '' => true
   *   '[]'  => true
   *   '{}'  => true
   *   '()   => true
   *   '[[]' => false
   *   ']['  => false
   *   '[[][][[]]]' => true
   *   '[[][]][' => false
   *   '{)' = false
   *   '{[(<{[]}>)]}' = true 
   */
  public static Boolean isBracketsBalanced(String str) {
    if (str == '') {
      return true;
    }

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

  /**
   * Returns the human readable string of time period specified by the start and end time.
   * The result string should be constrcuted using the folliwing rules:
   *
   * ---------------------------------------------------------------------
   *   Difference                 |  Result
   * ---------------------------------------------------------------------
   *    0 to 45 seconds           |  a few seconds ago
   *   45 to 90 seconds           |  a minute ago
   *   90 seconds to 45 minutes   |  2 minutes ago ... 45 minutes ago
   *   45 to 90 minutes           |  an hour ago
   *  90 minutes to 22 hours      |  2 hours ago ... 22 hours ago
   *  22 to 36 hours              |  a day ago
   *  36 hours to 25 days         |  2 days ago ... 25 days ago
   *  25 to 45 days               |  a month ago
   *  45 to 345 days              |  2 months ago ... 11 months ago
   *  345 to 545 days (1.5 years) |  a year ago
   *  546 days+                   |  2 years ago ... 20 years ago
   * ---------------------------------------------------------------------
   *
   * @param {DateTime} startDate
   * @param {DateTime} endDate
   * @return {string}
   *
   * @example
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:01')  => 'a few seconds ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:05')  => '5 minutes ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-02 03:00:05')  => 'a day ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2015-01-02 03:00:05')  => '15 years ago'
   *
   */
  public static String timespanToHumanString(DateTime startDate, DateTime endDate) {
    Decimal difference = endDate.getTime() - startDate.getTime(); // difference in dates in milliseconds

    Decimal seconds = 1000.0;
    Decimal minutes = 60.0 * seconds;
    Decimal hours = 60.0 * minutes;
    Decimal days = 24.0 * hours;
    Decimal months = 30.0 * days;
    Decimal years = 12.0 * months;

    if ((difference / seconds) <= 45) {
      return 'a few seconds ago';
    }
    if (difference / seconds > 45 && difference / seconds <= 90) {
      return 'a minute ago';
    }
    if (difference / seconds > 90 && difference / minutes <= 45) {
      return String.valueOf(Math.round(((difference-1) / minutes))) + ' minutes ago';
    }
    if (difference / minutes > 45 && difference / minutes <= 90) {
      return 'an hour ago';
    }
    if (difference / minutes > 90 && difference / hours <= 22) {
      return String.valueOf(Math.round((difference-1) / hours)) + ' hours ago';
    }
    if (difference / hours > 22 && difference / (hours) <= 36) {
      return 'a day ago';
    }
    if (difference / hours > 36 && difference / days <= 25) {
      return String.valueOf(Math.round((difference-1) / days)) + ' days ago';
    }
    if (difference / days > 25 && difference / days <= 45) {
      return 'a month ago';
    }
    if (difference / days > 45 && difference / days <= 345) {
      return String.valueOf(Math.round(difference / months)) + ' months ago';
    }
    if (difference / days > 345 && difference / days <= 545) {
      return 'a year ago';
    } else {
      return String.valueOf(Math.round(difference / years)) + ' years ago';
    }
  }
}