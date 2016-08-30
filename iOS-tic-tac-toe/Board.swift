import Foundation

public class Board {
    
    public var boardArray = ["", "", "", "", "", "", "", "", ""]
    let emptyArray = ["", "", "", "", "", "", "", "", ""]
    
    public init() {
        
    }
    
    public func setSpot(spotIndex : Int, marker: Marker) {
        boardArray[spotIndex] = marker.rawValue
    }
    
    public func asArray() -> [String]{
        return boardArray
    }
    
    public func asParams() -> String {
        let allowedCharacterSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return "?board=\(boardArray.description.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacterSet)!)"
    }
    
    public func clear() {
        boardArray = emptyArray
    }
}
