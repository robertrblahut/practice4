public with sharing class Practice4 {

    public static final Integer MATH_RANDOM_LIMIT = 10;
    public static final Integer COUNT_OF_RECORDS = 101;

    public static Integer randomFromZeroToMRL() {
        return Integer.valueOf(Math.random() * MATH_RANDOM_LIMIT);
    }

    public static Integer randomIndexFromZeroToCOR() {
        return Integer.valueOf((Math.random() * COUNT_OF_RECORDS));
    }

    // заполнить все объекты (Part__c, Engine__c, Car__c) данными
    public static void generateData() {

        List<Part__c> parts = new List<Part__c>();
        List<Engine__c> engines = new List<Engine__c>();
        List<Car__c> cars = new List<Car__c>();

        for (Integer i = 0; i < COUNT_OF_RECORDS; i++) {
            
            Engine__c engine = new Engine__c();
            engine.Name = 'Engine' + randomFromZeroToMRL();

            engines.add(engine);
        }

        insert engines;

        for (Integer i = 0; i < COUNT_OF_RECORDS; i++) {

            Integer randomIndex = randomIndexFromZeroToCOR();
            Id engineId = engines.get(randomIndex).Id;

            Part__c part = new Part__c();
            part.Name = 'Part' + randomFromZeroToMRL();
            part.Engine__c = engineId;
            parts.add(part);

            Car__c car = new Car__c();
            car.Name = 'Car' + randomFromZeroToMRL();
            car.Engine__c = engineId;
            cars.add(car);
        }

        insert parts;
        insert cars;
    }

    // получить все двигатели
    public static List<Engine__c> getAllEngines() {
        return [SELECT Name FROM Engine__c];
    }

    // получить в листы все автомобили для каждого двигателя 
    public static List<Engine__c> getAllCarsForEveryEngine() {
        return [SELECT Id, (SELECT Name FROM Cars__r) FROM Engine__c];
    }

    // создать мапу, где ключ это Id автомобиля и значения это все детали автомобиля
    public static Map<Id, List<Part__c>> getMapFromCarIdToParts() {
        Map<Id, List<Part__c>> result = new Map<Id, List<Part__c>>();

        List<Car__c> cars = [SELECT Id, Engine__c FROM Car__c];
        List<Part__c> parts = [SELECT Name, Engine__c FROM Part__c];

        for (Car__c car : cars) {
            List<Part__c> carParts = new List<Part__c>();
            for (Part__c part : parts) {
                if (car.Engine__c == part.Engine__c) {
                    carParts.add(part);
                }
            }
            result.put(car.Id, carParts);
        } 

        return result;
    }

    // создать мапу, где ключ это название двигателя, а значения это названия всех автомобилей
    public static Map<String, List<String>> getMapFromEngineNameToCarsName() {
        Map<String, List<String>> result = new Map<String, List<String>>();

        List<Engine__c> engines = [SELECT Name, (SELECT Name FROM Cars__r) FROM Engine__c];

        for (Engine__c engine : engines) {

            List<String> carsNames = new List<String>();

            for(Car__c car: engine.cars__r) {
                carsNames.add(car.Name);
            }
            
            result.put(engine.Name, carsNames);
        }

        return result;
    }

    // склонировать все данные в БД так, чтобы каждая запись повторялась (т.к. будет по два одинаковых двигателя, автомобиля и т.п.)
    public static void cloneDBData() {
        List<Car__c> cars = [SELECT Name, Engine__c FROM Car__c];
        List<Part__c> parts = [SELECT Name, Engine__c FROM Part__c];
        List<Engine__c> engines = [SELECT Name FROM Engine__c];

        insert cars.deepClone(false, true, false);
        insert parts.deepClone(false, true, false);
        insert engines.deepClone(false, true, false);
    }

    // Удалить все дубликаты с помощью повторной выборки данных из объектов и путем их перебора. Используйте Мапу для сбора уникальных записей в БД.
    public static void deleteDBData() {
        List<Engine__c> engines = [SELECT Id, Name, (SELECT Name FROM Parts__r), (SELECT Id, Name FROM Cars__r) FROM Engines__c];

        List<Engines__c> enginesToDelete = new List<Engine__c>();

        for (Integer i = 0; i < engines.size(); i++) {
            for (Integer j = i + 1; j < engines.size(); j++) {
                String prevName = engines.get(i).Name;
                String nextName = engines.get(j).Name;

                String prevLastModifiedBy = engines.get(i).LastModifiedBy;
                String nextLastModifiedBy = engines.get(j).LastModifiedBy;


                if (prevName == nextName && prevLastModifiedBy == nextLastModifiedBy) {
                    enginesToDelete.add(engines[j]);
                }
            }
        }

        delete enginesToDelete;
    }
}
