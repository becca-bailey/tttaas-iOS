public class Board {
    
    public var boardArray = ["", "", "", "", "", "", "", "", ""]
    let emptyArray = ["", "", "", "", "", "", "", "", ""]
    
    public init() {
        
    }
    
    public func setSpot(spotIndex : Int, marker: String) {
        boardArray[spotIndex] = marker
    }
    
    public func asArray() -> [String]{
        return boardArray
    }
    
    public func clear() {
        boardArray = emptyArray
    }
}
