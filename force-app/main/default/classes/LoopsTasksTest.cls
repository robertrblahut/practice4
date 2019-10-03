@isTest
private class LoopsTasksTest {
  
  @isTest
  private static void testGetFizzBuzz() {
    List<Integer> actualNumbers = new List<Integer>{
      1, 2, 4, 7, 8, 11, 13, 14, 16, 17, 19, 22, 23, 26, 28, 29, 31, 32, 34,
      37, 38, 41, 43, 44, 47, 49, 52, 53, 56, 58, 59, 61, 62, 64, 67, 68, 71,
      73, 74, 76, 77, 79, 82, 83, 86, 88, 89, 91, 92, 94, 97, 98
    };
    for (Integer item : actualNumbers) {
      System.assertEquals(String.valueOf(item), LoopsTasks.getFizzBuzz(item));
    }
    List<Integer> fizzNumbers = new List<Integer>{
      3,  6,  9, 12, 18, 21, 24, 27,
      33, 36, 39, 42, 48, 51, 54, 57,
      63, 66, 69, 72, 78, 81, 84, 87,
      93, 96, 99
    };
    for (Integer item : fizzNumbers) {
      System.assertEquals('Fizz', LoopsTasks.getFizzBuzz(item));
    }
    List<Integer> buzzNumbers = new List<Integer>{
      5, 10, 20, 25, 35, 40, 50, 55, 65, 70, 80, 85, 95, 100
    };
    for (Integer item : buzzNumbers) {
      System.assertEquals('Buzz', LoopsTasks.getFizzBuzz(item));
    }
    List<Integer> fizzBuzzNumbers = new List<Integer>{
      15, 30, 45, 60, 75, 90
    };
    for (Integer item : fizzBuzzNumbers) {
      System.assertEquals('FizzBuzz', LoopsTasks.getFizzBuzz(item));
    }
  }

  @isTest
  private static void testGetFactorial() {
    System.assertEquals(1, LoopsTasks.getFactorial(1));
    System.assertEquals(120, LoopsTasks.getFactorial(5));
    System.assertEquals(3628800, LoopsTasks.getFactorial(10));
  }

  @isTest
  private static void testGetSumBetweenNumbers() {
    System.assertEquals(3, LoopsTasks.getSumBetweenNumbers(1, 2));
    System.assertEquals(45, LoopsTasks.getSumBetweenNumbers(5, 10));
    System.assertEquals(0, LoopsTasks.getSumBetweenNumbers(-1, 1));
  }

  @isTest
  private static void testIsTriangle() {
    System.assertEquals(false, LoopsTasks.isTriangle(1, 2, 3));
    System.assertEquals(true, LoopsTasks.isTriangle(3, 4, 5));
    System.assertEquals(false, LoopsTasks.isTriangle(10, 1, 1));
    System.assertEquals(true, LoopsTasks.isTriangle(10, 10, 10));
  }

  @isTest
  private static void testDoRectanglesOverlap() {
    Map<String, Integer> rect1 = new Map<String, Integer>{
      'top'    => 0,
      'left'   => 0,
      'width'  => 10,
      'height' => 10
    };
    Map<String, Integer> rect2 = new Map<String, Integer>{
      'top'    => 5,
      'left'   => 5,
      'width'  => 10,
      'height' => 10
    };
    System.assertEquals(true, LoopsTasks.doRectanglesOverlap(rect1, rect2));
    rect1 = new Map<String, Integer>{
      'top'    => 10,
      'left'   => 10,
      'width'  => 10,
      'height' => 10
    };
    rect2 = new Map<String, Integer>{
      'top'    => 5,
      'left'   => 5,
      'width'  => 15,
      'height' => 15
    };
    System.assertEquals(true, LoopsTasks.doRectanglesOverlap(rect1, rect2));
    rect1 = new Map<String, Integer>{
      'top'    => 10,
      'left'   => 10,
      'width'  => 50,
      'height' => 5
    };
    rect2 = new Map<String, Integer>{
      'top'    => 5,
      'left'   => 5,
      'width'  => 10,
      'height' => 50
    };
    System.assertEquals(true, LoopsTasks.doRectanglesOverlap(rect1, rect2));
    rect1 = new Map<String, Integer>{
      'top'    => 0,
      'left'   => 0,
      'width'  => 90,
      'height' => 90
    };
    rect2 = new Map<String, Integer>{
      'top'    => 25,
      'left'   => 25,
      'width'  => 10,
      'height' => 10
    };
    System.assertEquals(true, LoopsTasks.doRectanglesOverlap(rect1, rect2));
    rect1 = new Map<String, Integer>{
      'top'    => 5,
      'left'   => 5,
      'width'  => 20,
      'height' => 20
    };
    rect2 = new Map<String, Integer>{
      'top'    => 5,
      'left'   => 5,
      'width'  => 40,
      'height' => 10
    };
    System.assertEquals(true, LoopsTasks.doRectanglesOverlap(rect1, rect2));
    rect1 = new Map<String, Integer>{
      'top'    => 5,
      'left'   => 5,
      'width'  => 20,
      'height' => 20
    };
    rect2 = new Map<String, Integer>{
      'top'    => 30,
      'left'   => 5,
      'width'  => 40,
      'height' => 10
    };
    System.assertEquals(false, LoopsTasks.doRectanglesOverlap(rect1, rect2));
    rect1 = new Map<String, Integer>{
      'top'    => 0,
      'left'   => 0,
      'width'  => 90,
      'height' => 90
    };
    rect2 = new Map<String, Integer>{
      'top'    => 25,
      'left'   => 100,
      'width'  => 10,
      'height' => 10
    };
    System.assertEquals(false, LoopsTasks.doRectanglesOverlap(rect1, rect2));
  }

  @isTest
  private static void tesIsInsideCircle() {
    Map<String, Double> center = new Map<String, Double>{
      'x' => 0,
      'y' => 0
    };
    Integer radius = 10; 
    Map<String, Double> point = new Map<String, Double>{
      'x' => 0,
      'y' => 0
    };
    System.assertEquals(true, LoopsTasks.isInsideCircle(center, radius, point));
    center = new Map<String, Double>{
      'x' => 5,
      'y' => 5
    };
    radius = 6; 
    point = new Map<String, Double>{
      'x' => 5,
      'y' => 10.99
    };
    System.assertEquals(true, LoopsTasks.isInsideCircle(center, radius, point));
    center = new Map<String, Double>{
      'x' => 0,
      'y' => 0
    };
    radius = 10; 
    point = new Map<String, Double>{
      'x' => 0,
      'y' => 10
    };
    System.assertEquals(false, LoopsTasks.isInsideCircle(center, radius, point));
    center = new Map<String, Double>{
      'x' => 5,
      'y' => 5
    };
    radius = 6; 
    point = new Map<String, Double>{
      'x' => 0,
      'y' => 0
    };
    System.assertEquals(false, LoopsTasks.isInsideCircle(center, radius, point));
    center = new Map<String, Double>{
      'x' => 2,
      'y' => 2
    };
    radius = 1; 
    point = new Map<String, Double>{
      'x' => 2.8,
      'y' => 2.8
    };
    System.assertEquals(false, LoopsTasks.isInsideCircle(center, radius, point));
    center = new Map<String, Double>{
      'x' => 2,
      'y' => 2
    };
    radius = 4; 
    point = new Map<String, Double>{
      'x' => -1,
      'y' => -1
    };
    System.assertEquals(false, LoopsTasks.isInsideCircle(center, radius, point));
    center = new Map<String, Double>{
      'x' => 2,
      'y' => 2
    };
    radius = 4; 
    point = new Map<String, Double>{
      'x' => 2,
      'y' => 6.1
    };
    System.assertEquals(false, LoopsTasks.isInsideCircle(center, radius, point));
  }

  @isTest
  private static void testFindFirstSingleChar() {
    System.assertEquals('T', LoopsTasks.findFirstSingleChar('The quick brown fox jumps over the lazy dog'));
    System.assertEquals('c', LoopsTasks.findFirstSingleChar('abracadabra'));
    System.assertEquals(null, LoopsTasks.findFirstSingleChar('entente'));
  }

  @isTest
  private static void testGetIntervalString() {
    System.assertEquals('[0, 1]', LoopsTasks.getIntervalString(0, 1, true, true));
    System.assertEquals('[0, 1)', LoopsTasks.getIntervalString(0, 1, true, false));
    System.assertEquals('(0, 1]', LoopsTasks.getIntervalString(0, 1, false, true));
    System.assertEquals('(0, 1)', LoopsTasks.getIntervalString(0, 1, false, false));
    System.assertEquals('[0, 1]', LoopsTasks.getIntervalString(0, 1, true, true));
  }

  @isTest
  private static void testReverseString() {
    System.assertEquals('god yzal eht revo spmuj xof nworb kciuq ehT', LoopsTasks.reverseString('The quick brown fox jumps over the lazy dog'));
    System.assertEquals('arbadacarba', LoopsTasks.reverseString('abracadabra'));
    System.assertEquals('rotator', LoopsTasks.reverseString('rotator'));
    System.assertEquals('noon', LoopsTasks.reverseString('noon'));
  }

  @isTest
  private static void testReverseInteger() {
    System.assertEquals(54321, LoopsTasks.reverseInteger(12345));
    System.assertEquals(1111, LoopsTasks.reverseInteger(1111));
    System.assertEquals(45378, LoopsTasks.reverseInteger(87354));
    System.assertEquals(34143, LoopsTasks.reverseInteger(34143));
  }

  @isTest
  private static void testGetDigitalRoot() {
    System.assertEquals(6, LoopsTasks.getDigitalRoot(12345));
    System.assertEquals(2, LoopsTasks.getDigitalRoot(23456));
    System.assertEquals(1, LoopsTasks.getDigitalRoot(10000));
    System.assertEquals(8, LoopsTasks.getDigitalRoot(165536));
  }

  @isTest
  private static void testIsBracketsBalanced() {
    List<String> balancedBrackets = new List<String>{
      '[]', '[[][][[]]]', '[[][]]', '', '<>', '{}', '()', '<()>', '{<>}', '[{}]',
      '[{(<()[]{}<>>)}]', '{}<>()[]','{<>}{()}[[]](())'
    };
    for (String item : balancedBrackets) {
      System.assertEquals(true, LoopsTasks.isBracketsBalanced(item));
    }
    List<String> notBalancedBrackets = new List<String>{
      '[[]', '][', '[][][][][[]', '{)', '<]','(}', '[{]}','{<}>','{{[(])}}','{}()[]<',
      '{','(','[','({}[]<>(((())))','{{[]}}>'
    };
    for (String item : notBalancedBrackets) {
      System.assertEquals(false, LoopsTasks.isBracketsBalanced(item));
    }
  }

  @isTest
  private static void testTimespanToHumanString() {
    System.assertEquals('a few seconds ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 0, 30)));
    System.assertEquals('a few seconds ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 0, 45)));
    System.assertEquals('a minute ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 0, 46)));
    System.assertEquals('a minute ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 1, 30)));
    System.assertEquals('2 minutes ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 1, 31)));
    System.assertEquals('5 minutes ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 5, 30)));
    System.assertEquals('45 minutes ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 45, 00)));
    System.assertEquals('an hour ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 1, 45, 1)));
    System.assertEquals('an hour ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 2, 0, 0)));
    System.assertEquals('an hour ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 2, 30, 0)));
    System.assertEquals('2 hours ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 2, 30, 1)));
    System.assertEquals('4 hours ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 5, 30, 0)));
    System.assertEquals('5 hours ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 5, 30, 1)));
    System.assertEquals('22 hours ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 23, 0, 0)));
    System.assertEquals('a day ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 1, 23, 0, 1)));
    System.assertEquals('a day ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 2, 1, 0, 0)));
    System.assertEquals('a day ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 1, 2, 12, 0, 0)));
    System.assertEquals('2 days ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 1, 2, 12, 0, 1)));
    System.assertEquals('4 days ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 1, 0, 0), DateTime.newInstance(2000, 1, 5, 12, 0, 0)));
    System.assertEquals('25 days ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 1, 26, 0, 0, 0)));
    System.assertEquals('a month ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 1, 26, 0, 0, 1)));
    System.assertEquals('a month ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 2, 1, 0, 0, 0)));
    System.assertEquals('a month ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 2, 1, 0, 0, 0)));
    System.assertEquals('a month ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 2, 15, 0, 0, 0)));
    System.assertEquals('2 months ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 2, 16, 0, 0, 0)));
    System.assertEquals('5 months ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 5, 20, 0, 0, 0)));
    System.assertEquals('11 months ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 12, 10, 0, 0, 0)));
    System.assertEquals('a year ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2000, 12, 12, 0, 0, 0)));
    System.assertEquals('a year ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2001, 2, 15, 0, 0, 1)));
    System.assertEquals('a year ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2001, 6, 1, 0, 0, 1)));
    System.assertEquals('15 years ago', LoopsTasks.timespanToHumanString(DateTime.newInstance(2000, 1, 1, 0, 0, 0), DateTime.newInstance(2015, 2, 15, 0, 0, 1)));
  }

}