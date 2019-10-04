public with sharing class ExceptionsPractice {

    public class NumberOfEmployeesException extends Exception {}

    /**
    Creates account with funny names - reversed given name + ' ' + ha-ha
    */
    public static void createFunnyAccounts(String name, Integer howMany) {
        try {
            List<Account> accountsToInsert = createAccountsWithName(makeFunnyName(name), howMany);
            insert accountsToInsert;
        } catch (Exception e) {
            debugExceptionInfo(e);
        }
        
        /*catch (SObjectException e) {
            debugExceptionInfo(e);
        } catch (DmlException e) {
            debugExceptionInfo(e);
        } catch (ListException e) {
            debugExceptionInfo(e);
        } catch (NullPointerException e) {
            debugExceptionInfo(e);
        }*/
    }

    private static String makeFunnyName(String name) {
        if (name != '') {
            return name.reverse() + ' ha-ha';
        }
        
        return null;
    }

    private static List<Account> createAccountsWithName(String name, Integer howMany) {
        List<Account> accountsWithName = new List<Account>();
        
        for (Integer i = 1; i <= howMany; i++) {                
                
                Account newAccount = new Account(Name = name);
                
                accountsWithName.add(newAccount);
        }

        return accountsWithName;
    }

    private static void debugExceptionInfo(Exception e) {
        System.debug('Exception type caught: ' + e.getTypeName());
        System.debug('Message: ' + e.getMessage());
        System.debug('Cause: ' + e.getCause());
        System.debug('Line number: ' + e.getLineNumber());
        System.debug('Stack trace ' + e.getStackTraceString());
    }


    public static void tryToCreateAccountWithoutName() {
        try {
            insert new Account(Name='');
        } catch (DmlException e) {
            debugExceptionInfo(e);

            System.debug('Field that caused the error:');

            for (Integer indexOfFailedRow = 0; indexOfFailedRow < e.getNumDml(); indexOfFailedRow++) {
                System.debug('Failed row #' + indexOfFailedRow);
                System.debug('Message: ' + e.getDmlMessage(indexOfFailedRow));
                System.debug('Original position of failed row: ' + e.getDmlIndex(indexOfFailedRow));
                System.debug('The Id of the failed record: ' + e.getDmlId(indexOfFailedRow));
                
                System.debug('Tokens of fields:');
                for (Schema.SObjectField soField: e.getDmlFields(indexOfFailedRow)) {
                    System.debug('  ' + soField);
                }
                
                System.debug('Names of the fields that caused the error: ');
                for (String name : e.getDmlFieldNames(indexOfFailedRow)) {
                    System.debug('  ' + name);
                }
            }
        }
    }

    public static void tryToCreateEmptyCar() {
        try {
            insert new Car__c();
        } catch (DmlException e) {
            debugExceptionInfo(e);

            System.debug('Field that caused the error:');

            for (Integer indexOfFailedRow = 0; indexOfFailedRow < e.getNumDml(); indexOfFailedRow++) {
                System.debug('Failed row #' + indexOfFailedRow);
                System.debug('Message: ' + e.getDmlMessage(indexOfFailedRow));
                System.debug('Original position of failed row: ' + e.getDmlIndex(indexOfFailedRow));
                System.debug('The Id of the failed record: ' + e.getDmlId(indexOfFailedRow));
                
                System.debug('Tokens of fields:');
                for (Schema.SObjectField soField: e.getDmlFields(indexOfFailedRow)) {
                    System.debug('  ' + soField);
                }
                
                System.debug('Names of the fields that caused the error: ');
                for (String name : e.getDmlFieldNames(indexOfFailedRow)) {
                    System.debug('  ' + name);
                }
            }
        }
    }

    public static Map<String, Integer> numberOfEmployeesByAccountName(List<Account> accounts) {
        Map<String, Integer> numOfEmployeesByAccName = new Map<String, Integer>();

        for (Account acc : accounts) {
            try {
                if (acc.NumberOfEmployees == null) {
                    throw new NumberOfEmployeesException('Account ' + acc.Name + ' has empty field NumberOfEmployees');
                } else {
                    numOfEmployeesByAccName.put(acc.Name, acc.NumberOfEmployees);
                }
            } catch (NumberOfEmployeesException e) {
                System.debug('I catched this exception: ' + e.getMessage() + ' and exclude this account from processing');
            }
        }

        return numOfEmployeesByAccName;
    }
}

/*

ЗАДАНИЕ
Написать метод класса, в котором будут несколько блоков try, 
вкаждом из которых создаются и обрабатываются исключенияследующих типов: 
sObject exception, DML exception, List exception,NullPointer exeption.

ExceptionsPractice.createFunnyAccounts('Robert', 3);
ExceptionsPractice.createFunnyAccounts('', 3);

ЗАДАНИЕ
Написать метод класса. В нем будет блок try, в котором надосгенерировать 
DML exception и обработать его, в блоке catch нужноиспользовать все 
дополнительные методы исключения, уникальные дляDML exception

ExceptionsPractice.tryToCreateAccountWithoutName();
ExceptionsPractice.tryToCreateEmptyCar();

ЗАДАНИЕ
Написать метод класса, который принимает Аккаунты. 
Если у нихполе ​NumberOfEmployees не заполнено, то 
генерироватьпользовательское исключение и обработать его
ExceptionsPractice.numberOfEmployeesByAccountName();

List<Account> allAccounts = [SELECT Name, NumberOfEmployees FROM Account];

Map<String, Integer> numOfEmplByAccName = new Map<String, Integer>();
numOfEmplByAccName = ExceptionsPractice.numberOfEmployeesByAccountName(allAccounts);

for (String accName: numOfEmplByAccName.keySet()) {
    System.debug(accName + ' => ' + numOfEmplByAccName.get(accName));
}
*/