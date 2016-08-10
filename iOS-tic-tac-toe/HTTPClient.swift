import Foundation

public protocol HTTPClient {
    func makePOSTRequest(url:String, body:String, onCompletion: (NSData?) -> ())

}