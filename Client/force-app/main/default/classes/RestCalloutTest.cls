@isTest
public class RestCalloutTest {
    
    @isTest
    public static void calloutTest(){
        
        Test.setMock(HttpCalloutMock.class, new RestCalloutMock()); 
        HttpResponse response = RestCallout.sendRecord(new SensorEventWrapper('a002w00000CneFOAAZ', new Integer[]{1,2,3} ));
        
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"id":"a012w00000Rr9KrAAJ"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
        
    }
    
}