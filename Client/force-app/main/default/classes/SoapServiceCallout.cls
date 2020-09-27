public class SoapServiceCallout {
    
    private static final String SOAP_SERVICE_ENDPOINT = 'callout:Soap_Service/services/Soap/class/SensorSOAPWebService';
    
    
    public static void createRecord(String eventInfo){  
        
        SoapServiceWSDL.SensorSOAPWebService soapService = new SoapServiceWSDL.SensorSOAPWebService();
        soapService.endpoint_x = SOAP_SERVICE_ENDPOINT;
        soapService.SessionHeader = new SoapServiceWSDL.SessionHeader_element();
        soapService.SessionHeader.sessionId = '{!$Credential.OAuthToken}';
        soapService.getSensorEventInfo(eventInfo);
    }
    
}