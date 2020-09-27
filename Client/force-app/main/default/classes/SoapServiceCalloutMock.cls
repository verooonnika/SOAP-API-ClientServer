@isTest
global class SoapServiceCalloutMock implements WebServiceMock {
    
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {
            
            SoapServiceWSDL.getSensorEventInfoResponse_element response_x = 
                new SoapServiceWSDL.getSensorEventInfoResponse_element();
            
            response.put('response_x', response_x);
            CalloutException e = new CalloutException();
            e.setMessage('Failed to make SOAP callout');
            throw e;
        }
    
}