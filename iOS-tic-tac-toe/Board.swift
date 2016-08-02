
import Foundation

public class Board {
    
    public var boardArray = ["", "", "", "", "", "", "", "", ""]
    
    public func setSpot(spotIndex : Int, marker: String) {
        boardArray[spotIndex] = marker
    }
    
    public func asArray() -> [String]{
        return boardArray
    }
}
