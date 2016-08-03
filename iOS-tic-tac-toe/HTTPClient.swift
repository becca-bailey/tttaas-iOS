import Foundation

class HTTPClient {
    var completedRequest: Bool = false
    
    func makePOSTRequest(url:String, body:String, onCompletion: (NSData?) -> ()){
        print(body)
        var errorResponse = true
        while (errorResponse) {
            let request = NSMutableURLRequest(URL: NSURL(string: url)!)
            request.HTTPMethod = "POST"
            request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                errorResponse = ((error != nil) || (data?.length > 100))
                print(errorResponse)
                if (!errorResponse) {
                    print(data)
                    onCompletion(data)
                }
                sleep(1)
                self.completedRequest = true
            })
            task.resume()
            while !self.completedRequest {
                // Stop running until request completes
            }
            self.completedRequest = false
        }
    }
}