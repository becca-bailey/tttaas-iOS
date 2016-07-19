import Foundation

class NetworkManager {
    static var completedRequest: Bool = false
    
    static func makePOSTRequest(url:String, body:String) -> NSData?{
        var responseData: NSData? = NSData()
        var errorCounter = 5
        var errorResponse = true
        while (errorResponse && errorCounter > 0) {
            let request = NSMutableURLRequest(URL: NSURL(string: url)!)
            request.HTTPMethod = "POST"
            request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                print(error)
                errorResponse = (error != nil)
                print(data)
                responseData = data
                print(response)
                self.completedRequest = true
            })
            task.resume()
            while !self.completedRequest {
                
            }
            self.completedRequest = false
            errorCounter -= 1
        }
        return responseData
    }
}
