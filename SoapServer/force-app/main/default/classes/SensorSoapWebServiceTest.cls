@isTest
public class SensorSoapWebServiceTest {
    
    @TestSetup
    static void testData() {
        Account account = new Account(Name = 'testName');
        insert account;
        Sensor__c sensor = new Sensor__c(Account_Id__c = account.Id, Name = 'testSensor');
        insert sensor;
        
    }
    
    @isTest
    public static void createEventsTest(){
        
        Sensor__c sensor = [SELECT Id, Name, Account_Id__c FROM Sensor__c WHERE Name = 'testSensor' LIMIT 1];
        
        
        String sensorEventInfo = '{"sensorId":"'+sensor.Id+'","line":[54,54,54,66,66,66],"accountId":"'+sensor.Account_Id__c+'"}';
        SensorSOAPWebService.getSensorEventInfo(sensorEventInfo);
        
        List<Sensor_Event__c> events = [SELECT Id, X__c, Previous_Event__c FROM Sensor_Event__c];
        System.assertEquals(2, events.size());
    }
    
    @isTest
    public static void noSensorTest(){
        
        String sensorEventInfo = '{"sensorId":"a002w00000CneFOAAZ","line":[54,54,54,66,66,66],"accountId":"a002w00000CneFOAAZ"}';
        try{
            SensorSOAPWebService.getSensorEventInfo(sensorEventInfo);
            
        }catch(Exception e){
            System.assertEquals('No such Sensor', e.getMessage());
            
        }
        
    }
    
}