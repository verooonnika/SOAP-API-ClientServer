@isTest
public class SoapServiceCalloutTest {
    
    @isTest
    public static void calloutTest(){
        Test.setMock(WebServiceMock.class, new SoapServiceCalloutMock());
        String eventInfo = '{"sensorId":"a002w00000CneFOAAZ","line":[12,12,12,13,13,13],"accountId":"test"}';
        try{
             SoapServiceCallout.createRecord(eventInfo);
        }catch(Exception e){
            System.assertEquals('Failed to make SOAP callout', e.getMessage());
        }
       
       
       
        
    }

}