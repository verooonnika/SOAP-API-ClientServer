global with sharing class SensorSOAPWebService {
    
    private static final String NO_SENSOR_MESSAGE = 'No such Sensor';
    
    webservice static void getSensorEventInfo(String receivedData){
        
        JSON2Apex parser = JSON2Apex.parse(receivedData);
        List<Sensor__c> sensors = [SELECT Id FROM Sensor__c WHERE Id =: parser.sensorId];
        if(sensors.isEmpty()){
            throw new IllegalArgumentException(NO_SENSOR_MESSAGE);
            
        }else{
            createEvents(parser);
        }
        
    }
    
    public static void createEvents(JSON2Apex parser){
        
        List<Integer> vectors = parser.line;
        List<Integer> tempList = new List<Integer>();  // to split vectors line       
        List<Sensor_Event__c> eventsToInsert = new List<Sensor_Event__c>();
        
        for(Integer i = 0; i < vectors.size(); i++){
            tempList.add(vectors[i]);
            if(math.mod(i, 3) != 0 && math.mod(i+1, 3) == 0 ){
                
                Sensor_Event__c sensorEvent = new Sensor_Event__c(Sensor__c = parser.sensorId,
                                                                  X__c = tempList[0],
                                                                  Y__c = tempList[1],
                                                                  Z__c = tempList[2]);
                eventsToInsert.add(sensorEvent);
                tempList.clear(); 
            }
        }
        
        insert eventsToInsert;
        
        if(eventsToInsert.size() > 1){
            connectEvents(eventsToInsert);
            
        }
        
    }
    
    public static void connectEvents(List<Sensor_Event__c> eventsToInsert){
        
        for(Integer i = 1; i < eventsToInsert.size(); i++){
            eventsToInsert[i].Previous_Event__c = eventsToInsert[i-1].Id;
        }
        
        update eventsToInsert;
        
    }
}