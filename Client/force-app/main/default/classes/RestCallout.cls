public class RestCallout {
    
    private static final String SEND_RECORD_ENDPOINT = 'callout:Soap_Service/services/data/v49.0/sobjects/Sensor_Event__c';
    
    public static HttpResponse sendRecord(SensorEventWrapper sensorEvent){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SEND_RECORD_ENDPOINT);
        request.setHeader('Content-Type', 'application/json');       
        request.setMethod('POST');
        request.setBody(Json.serialize(sensorEvent).replaceAll('_field', '__c'));
        HTTPResponse response = http.send(request);
        
        return response;
    }
    
}