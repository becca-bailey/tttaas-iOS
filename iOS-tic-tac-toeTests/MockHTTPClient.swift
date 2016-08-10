import Foundation
import iOS_tic_tac_toe

public class MockHTTPClient: HTTPClient {
    var responseData: NSData?
    var requestMade: Bool
    init(board: [String], status: String) {
        self.responseData = "{\"board\": \(board.description), \"status\": \"\(status)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        self.requestMade = false
    }
    public func makePOSTRequest(url:String, body:String, onCompletion: (NSData?) -> ()){
        self.requestMade = true
        onCompletion(responseData)
    }

}