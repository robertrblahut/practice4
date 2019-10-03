@IsTest
public with sharing class NumberTasksTest {

    @IsTest
    public static void getRectangleAreaTest() {
        system.assertEquals(50, NumberTasks.getRectangleArea(5, 10));
        system.assertEquals(25, NumberTasks.getRectangleArea(5, 5));
    }
    @IsTest
    public static void getCicleCircumferenceTest() {
        system.assertEquals(31.41592653589793, NumberTasks.getCicleCircumference(5));
        system.assertEquals(19.72920186454390004, NumberTasks.getCicleCircumference(3.14));
        system.assertEquals(0, NumberTasks.getCicleCircumference(0));
    }
    @IsTest
    public static void getAverageTest() {
        system.assertEquals(5, NumberTasks.getAverage(5, 5));
        system.assertEquals(5, NumberTasks.getAverage(10, 0));
        system.assertEquals(0, NumberTasks.getAverage(-3, 3));
    }
    @IsTest
    public static void getDistanceBetweenPointsTest() {
        system.assertEquals(1, NumberTasks.getDistanceBetweenPoints(0, 0, 0, 1));
        system.assertEquals(1, NumberTasks.getDistanceBetweenPoints(0, 0, 1, 0));
        system.assertEquals(18.027756377319946, NumberTasks.getDistanceBetweenPoints(-5, 0, 10, -10));
    }
    @IsTest
    public static void getLinearEquationRootTest() {
        system.assertEquals(2, NumberTasks.getLinearEquationRoot(-5, 10));
        system.assertEquals(-8, NumberTasks.getLinearEquationRoot(1, 8));
        system.assertEquals(0, NumberTasks.getLinearEquationRoot(5, 0));
    }
    @IsTest
    public static void getAngleBetweenVectorsTest() {
        system.assertEquals(Math.PI/2, NumberTasks.getAngleBetweenVectors(1, 0, 0, 1));
        system.assertEquals(Math.PI, NumberTasks.getAngleBetweenVectors(0, 1, 0, -1));
        system.assertEquals(Math.PI/2, NumberTasks.getAngleBetweenVectors(0, -1, 1, 0));
        system.assertEquals(0, NumberTasks.getAngleBetweenVectors(0, 1, 0, 1));
    }
    @IsTest
    public static void parseNumberFromStringTest() {
        system.assertEquals(100, NumberTasks.parseNumberFromString('100'));
        system.assertEquals(37, NumberTasks.parseNumberFromString('37'));
        system.assertEquals(-525.5, NumberTasks.parseNumberFromString('-525.5'));
    }
    @IsTest
    public static void getParallelipidedDiagonalTest() {
        system.assertEquals(Math.sqrt(3), NumberTasks.getParallelipidedDiagonal(1, 1, 1));
        system.assertEquals(Math.sqrt(27), NumberTasks.getParallelipidedDiagonal(3, 3, 3));
        system.assertEquals(Math.sqrt(14), NumberTasks.getParallelipidedDiagonal(1, 2, 3));
    }
    @IsTest
    public static void roundToPowerOfTenTest() {
        system.assertEquals(1234, NumberTasks.roundToPowerOfTen(1234, 0));
        system.assertEquals(1230, NumberTasks.roundToPowerOfTen(1234, 1));
        system.assertEquals(1200, NumberTasks.roundToPowerOfTen(1234, 2));
        system.assertEquals(1000, NumberTasks.roundToPowerOfTen(1234, 3));

        system.assertEquals(9678, NumberTasks.roundToPowerOfTen(9678, 0));
        system.assertEquals(9680, NumberTasks.roundToPowerOfTen(9678, 1));
        system.assertEquals(9700, NumberTasks.roundToPowerOfTen(9678, 2));
        system.assertEquals(10000, NumberTasks.roundToPowerOfTen(9678, 3));
    }
}