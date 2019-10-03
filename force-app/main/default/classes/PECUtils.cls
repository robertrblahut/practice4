public with sharing class PECUtils {



    // how namy engines to generate
    private static Integer COUNT_OF_GENERATING_ENGINES = 101; 

    // max count of parts that have generated engine
    private static Integer MAX_COUNT_OF_PARTS = 5;
    // max count of cars that have generated engine
    private static Integer MAX_COUNT_OF_CARS = 5;

    // the length of name postfix of generated objects
    private static Integer LENGTH_OF_NAMEPOSTFIX = 3;



    private static String generateRandomString(Integer len) {
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        
        String randStr = '';
        
        while (randStr.length() < len) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        
        return randStr; 
    }

    private static Integer generateRandomInteger(Integer max) {
        return Integer.valueOf(Math.random() * (max-1)) + 1;
    }



    /**
    Returns list that have count of random generated engines
     */
    private static List<Engine__c> generateRandomEngines(Integer count) {
        List<Engine__c> engines = new List<Engine__c>();

        for (Integer i = 0; i < count; i++) {
            Engine__c engine = new Engine__c();
            engine.Name = 'Engine ' + generateRandomString(LENGTH_OF_NAMEPOSTFIX);

            engines.add(engine);
        }

        return engines;
    }

    /**
    Returns list of generated parts for engine
     */
    private static List<Part__c> generatePartsForEngine(Engine__c engine) {
        
        List<Part__c> parts = new List<Part__c>();

        Integer howManyParts = generateRandomInteger(MAX_COUNT_OF_PARTS);

        for (Integer i = 0; i < howManyParts; i++) {
            Part__c part = new Part__c();
            part.Name = 'Part ' + generateRandomString(LENGTH_OF_NAMEPOSTFIX);
            part.Engine__c = engine.Id;

            parts.add(part);
        }

        return parts;
    }

    /**
    Returns list of generated cars for engine
     */
    private static List<Car__c> generateCarsForEngine(Engine__c engine) {
        
        List<Car__c> cars = new List<Car__c>();

        Integer howManyCars = generateRandomInteger(MAX_COUNT_OF_PARTS);

        for (Integer i = 0; i < howManyCars; i++) {
            Car__c car = new Car__c();
            car.Name = 'Car ' + generateRandomString(LENGTH_OF_NAMEPOSTFIX);
            car.Engine__c = engine.Id;

            cars.add(car);
        }

        return cars;
    }

    /**
    Generates engines and relate to them parts and cars and then persists all data
     */
    public static void generateData() {

        List<Engine__c> generatedEngines = generateRandomEngines(COUNT_OF_GENERATING_ENGINES);
        insert generatedEngines;


        List<Part__c> allGeneratedPartsOfAllGeneratedEngines = new List<Part__c>();
        List<Car__c> allGeneratedCarsOfAllGeneratedEngines = new List<Car__c>();

        for (Engine__c engine : generatedEngines) {
            List<Part__c> generatedPartsForEngine = generatePartsForEngine(engine);
            List<Car__c> generatedCarsForEngine = generateCarsForEngine(engine);

            allGeneratedPartsOfAllGeneratedEngines.addAll(generatedPartsForEngine);
            allGeneratedCarsOfAllGeneratedEngines.addAll(generatedCarsForEngine);
        }

        insert allGeneratedPartsOfAllGeneratedEngines;
        insert allGeneratedCarsOfAllGeneratedEngines;
    }


    /**
    Returns list of all engines
     */
    public static List<Engine__c> AllEngines() {
        return [SELECT Name FROM Engine__c];
    }


    /**
    Returns list of all cars that have given engine
     */
    private static List<Car__c> CarsByEngine(List<Engine__c> engines, Id engineId) {
        List<Car__c> cars = new List<Car__c>();
        
        for(Engine__c engine: engines) {
            if (engine.Id == engineId) {
                cars.addAll(engine.Cars__r);
            }
        }

        return cars;
    }

    /**
    Returns list of all cars lists of all engines
     */
    public static List<List<Car__c>> CarsByEngines() {
        List<List<Car__c>> carsByEngines = new List<List<Car__c>>();
        List<Engine__c> engines = [SELECT Id, (SELECT Name FROM Cars__r) FROM Engine__c];

        for (Engine__c engine : engines) {
            carsByEngines.add(CarsByEngine(engines, engine.Id));
        }

        return carsByEngines;
    }




    /**
    Returns all parts of given engine
     */
    private static List<Part__c> partsOfCarEngine(List<Engine__c> engines, Id engineId) {

        List<Part__c> parts = new List<Part__c>();

        for (Engine__c engine : engines) {
            if (engine.Id == engineId) {
                parts.addAll(engine.Parts__r);
            }
        }

        return parts;
    }

    /**
    Returns all parts of all cars

    @return {Map<Id, List<Part__c>>} parts by car id
     */
    public static Map<Id, List<Part__c>> PartsByCarId() {

        Map<Id, List<Part__c>> partsById = new Map<Id, List<Part__c>>();

        List<Car__c> cars = [SELECT Id, Engine__r.Id FROM Car__c];
        List<Engine__c> engines = [SELECT Id, (SELECT Name FROM Parts__r) FROM Engine__c];

        for (Car__c car: cars) {
            partsById.put(car.Id, partsOfCarEngine(engines, car.Engine__r.Id));
        }

        return partsById;
    }

    
    

    /**
    Returns list of cars name for given engine
     */
    private static List<String> carsNamesOfEngine(List<Engine__c> engines, Id engineId) {
        List<String> carNames = new List<String>();

        for (Engine__c engine : engines) {
            if (engine.Id == engineId) {
                for (Car__c car : engine.Cars__r) {
                    carNames.add(car.Name);
                }
            }
        }

        return carNames;
    } 

    /**
    Returns all cars names of all engines names

    @return {Map<String, List<String>>} cars names by engine name 
     */
    public static Map<String, List<String>> carsNamesByEnginesNames() {
        Map<String, List<String>> carsNamesByENames = new Map<String, List<String>>();
        
        List<Engine__c> engines = [SELECT Name, (SELECT Name FROM Cars__r) FROM Engine__c];

        for (Engine__c engine : engines) {
            carsNamesByENames.put(engine.Name, carsNamesOfEngine(engines, engine.Id));
        }

        return carsNamesByENames;
    }

    /**
    Returns list of copied cars for engine

    @param {Engine__c} engine
    @return {List<Car__c>} list of copied cars for engine 
     */
    private static List<Car__c> makeCopyOfCars(Engine__c engine) {
        List<Car__c> copyCars = new List<Car__c>();

        for (Car__c car: [SELECT Name, Engine__r.Id FROM Car__c WHERE Engine__r.Id = :engine.getCloneSourceId()]) {
            
            Car__c copyCar = new Car__c();
            copyCar.Name = car.Name;
            copyCar.Engine__c = engine.Id;

            copyCars.add(copyCar);
        }

        return copyCars;
    }

    /**
    Returns list of copied parts for engine

    @param {Engine__c} engine
    @return {List<Part__c>} list of copied parts for engine 
     */
    private static List<Part__c> makeCopyOfParts(Engine__c engine) {
        List<Part__c> copyParts = new List<Part__c>();

        for (Part__c part: [SELECT Name, Engine__r.Id FROM Part__c WHERE Engine__r.Id = :engine.getCloneSourceId()]) {
            
            Part__c copyPart = new Part__c();
            copyPart.Name = part.Name;
            copyPart.Engine__c = engine.Id;

            copyParts.add(copyPart);
        }

        return copyParts;
    }

    /**
    Makes copies of all engines in org, persists them and returns list of persisted copies of original engines

    @return {List<Engine__c>} list of persisted copies of original engines   
     */
    private static List<Engine__c> makeCopyOfEngines() {
        List<Engine__c> copyEngines = new List<Engine__c>();

        for (Engine__c engine : [SELECT Id, Name, (SELECT Name FROM Cars__r), (SELECT Name FROM Parts__r) FROM Engine__c]) {
            
            Engine__c copyEngine = engine.clone(false, true, false, false);
            
            copyEngines.add(copyEngine);
        }

        insert copyEngines;

        return copyEngines;
    }

    /**
    Makes copies of all engines, their parts and cars and persists them 
     */
    public static void cloneData() {
        List<Car__c> copyCars = new List<Car__c>();
        List<Part__c> copyParts = new List<Part__c>();

        List<Engine__c> copyEngines = makeCopyOfEngines();

        for (Engine__c engine : copyEngines) {
            copyCars.addAll(makeCopyOfCars(engine));
            copyParts.addAll(makeCopyOfParts(engine));
        }

        insert copyCars;
        insert copyParts;
    }

    
    /**
    Delete all dublicate data
     */
    public static void deleteDublicateData() {

        Map<String, Engine__c> enginesByName = new Map<String, Engine__c>();

        for (Engine__c engine : [SELECT Name FROM Engine__c]) {
            if (!enginesByName.containsKey(engine.Name)) {
                enginesByName.put(engine.Name, engine);
            }
        }

        List<Engine__c> enginesToDelete = [SELECT Id FROM Engine__c WHERE Id NOT IN :enginesByName.values()];
        delete enginesToDelete;
        
    }
}