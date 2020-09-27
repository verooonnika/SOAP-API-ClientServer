@isTest
global class RestCalloutMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"id":"a012w00000Rr9KrAAJ"}');
        response.setStatusCode(200);
        return response; 
    }

}