import Foundation

public protocol HTTPClient {
    func makePOSTRequest(url:String, body:String, onCompletion: (NSData?) -> ())
    func makeGETRequest(url: String, parameters: String, onCompletion: (NSData?) -> ())

}