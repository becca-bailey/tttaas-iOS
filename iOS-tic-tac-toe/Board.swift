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
    
    public func clear() {
        boardArray = emptyArray
    }
}
