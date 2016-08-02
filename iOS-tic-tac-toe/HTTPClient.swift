import Foundation

class HTTPClient {
    var completedRequest: Bool = false
    
    func makePOSTRequest(url:String, body:String, onCompletion: (NSData?) -> ()){
        var errorCounter = 5
        var errorResponse = true
        while (errorResponse && errorCounter > 0) {
            let request = NSMutableURLRequest(URL: NSURL(string: url)!)
            request.HTTPMethod = "POST"
            request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                errorResponse = (error != nil)
                if (!errorResponse) {
                    onCompletion(data)
                }
                self.completedRequest = true
            })
            task.resume()
            while !self.completedRequest {
                // Stop running until request completes
            }
            self.completedRequest = false
            errorCounter -= 1
        }
    }
}