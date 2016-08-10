import Foundation

class AsyncHTTPClient: HTTPClient{
    //rename to async HTTPClient
    //should be a protocol
    
    func makePOSTRequest(url:String, body:String, onCompletion: (NSData?) -> ()){
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response, data, error) -> Void in
            if ((error != nil) || (data?.length > 100)) {
                self.makePOSTRequest(url, body: body, onCompletion: onCompletion)
            } else {
                onCompletion(data)
                //accept parsed data
            }
        });
    }
}