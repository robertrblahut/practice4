@IsTest
public with sharing class StringTasksTest {

    @IsTest
    public static void concatenateStringsTest(){
        System.assertEquals('aabb', StringTasks.concatenateStrings('aa', 'bb'));
        System.assertEquals('aa', StringTasks.concatenateStrings('aa', ''));
        System.assertEquals('bb', StringTasks.concatenateStrings('', 'bb'));
    }
    @IsTest
    public static void getStringLengthTest(){
        System.assertEquals(5, StringTasks.getStringLength('aaaaa'));
        System.assertEquals(0, StringTasks.getStringLength(''));
    }
    @IsTest
    public static void getStringFromTemplateTest(){
        System.assertEquals('Hello, John Doe!', StringTasks.getStringFromTemplate('John', 'Doe'));
        System.assertEquals('Hello, Chuck Norris!', StringTasks.getStringFromTemplate('Chuck', 'Norris'));
    }

    @IsTest
    public static void extractNameFromTemplateTest(){
        System.assertEquals('John Doe', StringTasks.extractNameFromTemplate('Hello, John Doe!'));
        System.assertEquals('Chuck Norris', StringTasks.extractNameFromTemplate('Hello, Chuck Norris!'));
    }
    @IsTest
    public static void getFirstCharTest(){
        System.assertEquals('J', StringTasks.getFirstChar('John Doe'));
        System.assertEquals('c', StringTasks.getFirstChar('cat'));
    }
    @IsTest
    public static void removeLeadingAndTrailingWhitespacesTest(){
        System.assertEquals('Abracadabra', StringTasks.removeLeadingAndTrailingWhitespaces('  Abracadabra'));
        System.assertEquals('cat', StringTasks.removeLeadingAndTrailingWhitespaces('cat'));
        System.assertEquals('Hello, World!', StringTasks.removeLeadingAndTrailingWhitespaces('\tHello, World! '));
    }
    @IsTest
    public static void repeatStringTest(){
        System.assertEquals('AAAAA', StringTasks.repeatString('A', 5));
        System.assertEquals('catcatcat', StringTasks.repeatString('cat', 3));
    }
    @IsTest
    public static void removeFirstOccurrencesTest(){
        System.assertEquals('To be or to be', StringTasks.removeFirstOccurrences('To be or not to be', ' not'));
        System.assertEquals('I like legs', StringTasks.removeFirstOccurrences('I like legends', 'end'));
        System.assertEquals('ABAB', StringTasks.removeFirstOccurrences('ABABAB','BA'));
    }
    @IsTest
    public static void unbracketTagTest(){
        System.assertEquals('div', StringTasks.unbracketTag('<div>'));
        System.assertEquals('span', StringTasks.unbracketTag('<span>'));
        System.assertEquals('a', StringTasks.unbracketTag('<a>'));
    }
    @IsTest
    public static void convertToUpperCaseTest(){
        System.assertEquals('THUNDERSTRUCK', StringTasks.convertToUpperCase('Thunderstruck'));
        System.assertEquals('ABCDEFGHIJKLMNOPQRSTUVWXYZ', StringTasks.convertToUpperCase('abcdefghijklmnopqrstuvwxyz'));
    }
    @IsTest
    public static void extractEmailsTest(){
        System.assertEquals(new List<String> {'angus.young@gmail.com', 'brian.johnson@hotmail.com', 'bon.scott@yahoo.com'},
                StringTasks.extractEmails('angus.young@gmail.com;brian.johnson@hotmail.com;bon.scott@yahoo.com'));
        System.assertEquals(new List<String>{'info@gmail.com'},
                StringTasks.extractEmails('info@gmail.com'));
    }
    @IsTest
    public static void getRectangleStringTest(){
        System.assertEquals(
                '┌────┐\n'+
                '│    │\n'+
                '│    │\n'+
                '└────┘\n',
                StringTasks.getRectangleString(6, 4));
        System.assertEquals(
                '┌┐\n'+
                '└┘\n',
                StringTasks.getRectangleString(2, 2));
        System.assertEquals(
                '┌──────────┐\n'+
                '│          │\n'+
                '└──────────┘\n',
                StringTasks.getRectangleString(12, 3));
    }
    @IsTest
    public static void getCardIdTest(){
        List<String> cards = new List<String>{
                'A♣','2♣','3♣','4♣','5♣','6♣','7♣','8♣','9♣','10♣','J♣','Q♣','K♣',
                'A♦','2♦','3♦','4♦','5♦','6♦','7♦','8♦','9♦','10♦','J♦','Q♦','K♦',
                'A♥','2♥','3♥','4♥','5♥','6♥','7♥','8♥','9♥','10♥','J♥','Q♥','K♥',
                'A♠','2♠','3♠','4♠','5♠','6♠','7♠','8♠','9♠','10♠','J♠','Q♠','K♠'
        };
        for(Integer i = 0; i < cards.size(); i++) {
            System.assertEquals(i, StringTasks.getCardId(cards[i]));
        }
    }
}