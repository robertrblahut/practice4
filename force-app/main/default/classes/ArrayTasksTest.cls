@IsTest
public with sharing class ArrayTasksTest {

    @IsTest public static void findElementTest() {
        List<String> arr = new List<String>{'Ace', 'Date', 'Number'};

        System.assertEquals(0, ArrayTasks.findElement(arr, 'Ace'));
        System.assertEquals(2, ArrayTasks.findElement(arr, 'Number'));
        System.assertEquals(-1, ArrayTasks.findElement(arr, 'Test'));
    }

    @IsTest public static void generateOddsTest() {
        System.assertEquals(true, ArrayTasks.generateOdds(1).equals(new List<Integer>{1}));
        System.assertEquals(true, ArrayTasks.generateOdds(2).equals(new List<Integer>{1, 3}));
        System.assertEquals(true, ArrayTasks.generateOdds(5).equals(new List<Integer>{1, 3, 5, 7, 9}));
        System.assertEquals(true, ArrayTasks.generateOdds(16).equals(new List<Integer>{1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31}));
    }

    @IsTest public static void doubleArrayTest() {
        System.assertEquals(4, ArrayTasks.doubleArray(new List<Integer>{1, 2}).size());
        System.assertEquals(2, ArrayTasks.doubleArray(new List<String>{'Ace'}).size());
        System.assertEquals(0, ArrayTasks.doubleArray(new List<Boolean>{}).size());
    }

    @IsTest public static void getArrayOfPositivesTest() {
        System.assertEquals(true, ArrayTasks.getArrayOfPositives(new List<Integer>{0, 1, 2, 3, 4, 5}).equals(new List<Integer>{1, 2, 3, 4, 5}));
        System.assertEquals(true, ArrayTasks.getArrayOfPositives(new List<Integer>{-1, 2, -5, -4, 0}).equals(new List<Integer>{2}));
        System.assertEquals(true, ArrayTasks.getArrayOfPositives(new List<Integer>{}).equals(new List<Integer>{}));
    }

    @IsTest public static void getUpperCaseStringsTest() {
        System.assertEquals(true, ArrayTasks.getUpperCaseStrings(new List<String>{'permanent-internship', 'glutinous-shriek', 'multiplicative-elevation'}).equals(new List<String>{'PERMANENT-INTERNSHIP', 'GLUTINOUS-SHRIEK', 'MULTIPLICATIVE-ELEVATION'}));
        System.assertEquals(true, ArrayTasks.getUpperCaseStrings(new List<String>{'a', 'b', 'c', 'd', 'e', 'f', 'g'}).equals(new List<String>{'A', 'B', 'C', 'D', 'E', 'F', 'G'}));
        System.assertEquals(true, ArrayTasks.getUpperCaseStrings(new List<String>{}).equals(new List<String>{}));
    }

    @IsTest public static void getStringsLengthTest() {
        System.assertEquals(true, ArrayTasks.getStringsLength(new List<String>{'', 'a', 'bc', 'def', 'ghij'}).equals(new List<Integer>{0, 1, 2, 3, 4}));
        System.assertEquals(true, ArrayTasks.getStringsLength(new List<String>{'angular', 'react', 'ember'}).equals(new List<Integer>{7, 5, 5}));
    }

    @IsTest public static void insertItemTest() {
        System.assertEquals(true, ArrayTasks.insertItem(new List<Integer>{0, 1, 3}, 2, 2).equals(new List<Integer>{0, 1, 2, 3}));
        System.assertEquals(true, ArrayTasks.insertItem(new List<Integer>{0, 0, 1, 3, 5}, 2, 3).equals(new List<Integer>{0, 0, 1, 2, 3, 5}));
    }

    @IsTest public static void getHeadTest() {
        System.assertEquals(true, ArrayTasks.getHead(new List<Integer> {1, 3, 4, 5}, 2).equals(new List<Integer>{1, 3}));
        System.assertEquals(true, ArrayTasks.getHead(new List<Integer> {1, 3, 3, 3, 5}, 4).equals(new List<Integer>{1, 3, 3, 3}));
    }

    @IsTest public static void getTailTest() {
        System.assertEquals(true, ArrayTasks.getTail(new List<Integer> {1, 3, 4, 5}, 2).equals(new List<Integer>{4, 5}));
        System.assertEquals(true, ArrayTasks.getTail(new List<Integer> {1, 3, 3, 3, 5}, 4).equals(new List<Integer>{3, 3, 3, 5}));
    }

    @IsTest public static void toCsvTextTest() {
        System.assertEquals('0,1,2,3,4\n'
                +'10,11,12,13,14\n'
                +'20,21,22,23,24\n'
                +'30,31,32,33,34', ArrayTasks.toCsvText(new List<List<Integer>>{
                    new List<Integer> {0, 1, 2, 3, 4},
                    new List<Integer> {10,11,12,13,14},
                    new List<Integer> {20,21,22,23,24},
                    new List<Integer> {30,31,32,33,34}
                }));
    }

    @IsTest public static void toArrayOfSquaresTest() {
        System.assertEquals(true, ArrayTasks.toArrayOfSquares(new List<Integer>{0, 1, 2, 3, 4, 5}).equals(new List<Integer>{0, 1, 4, 9, 16, 25}));
        System.assertEquals(true, ArrayTasks.toArrayOfSquares(new List<Integer>{10, 100, -1}).equals(new List<Integer>{100, 10000, 1}));
    }

    @IsTest public static void getMovingSumTest() {
        System.assertEquals(true, ArrayTasks.getMovingSum(new List<Integer>{1, 1, 1, 1, 1}).equals(new List<Integer>{1, 2, 3, 4, 5}));
        System.assertEquals(true, ArrayTasks.getMovingSum(new List<Integer>{10, -10, 10, -10, 10}).equals(new List<Integer>{10, 0, 10, 0, 10}));
        System.assertEquals(true, ArrayTasks.getMovingSum(new List<Integer>{0, 0, 0, 0, 0}).equals(new List<Integer>{0, 0, 0, 0, 0}));
        System.assertEquals(true, ArrayTasks.getMovingSum(new List<Integer>{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}).equals(new List<Integer>{1, 3, 6, 10, 15, 21, 28, 36, 45, 55}));
    }

    @IsTest public static void getSecondItemsTest() {
        System.assertEquals(true, ArrayTasks.getSecondItems(new List<Integer>{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}).equals(new List<Integer>{2, 4, 6, 8, 10}));
        System.assertEquals(true, ArrayTasks.getSecondItems(new List<Integer>{5, 4, 5, 4}).equals(new List<Integer>{4, 4}));
    }

    @IsTest public static void propagateItemsByPositionIndexTest() {
        System.assertEquals(true, ArrayTasks.propagateItemsByPositionIndex(new List<Integer>{}).equals(new List<Integer>{}));
        System.assertEquals(true, ArrayTasks.propagateItemsByPositionIndex(new List<Integer>{1}).equals(new List<Integer>{1}));
        System.assertEquals(true, ArrayTasks.propagateItemsByPositionIndex(new List<Integer>{1,2,3,4,5}).equals(new List<Integer>{1, 2,2, 3,3,3, 4,4,4,4, 5,5,5,5,5}));
        System.assertEquals(true, ArrayTasks.propagateItemsByPositionIndex(new List<Integer>{3, 4, 5}).equals(new List<Integer>{3, 4,4, 5,5,5}));
    }

    @IsTest public static void distinctTest() {
        System.assertEquals(true, ArrayTasks.distinct(new List<Integer>{1, 2, 3, 3, 2, 1}).equals(new List<Integer>{1, 2, 3}));
        System.assertEquals(true, ArrayTasks.distinct(new List<Integer>{1, 1, 2, 2, 3, 3, 4, 4}).equals(new List<Integer>{1, 2, 3, 4}));
    }
}