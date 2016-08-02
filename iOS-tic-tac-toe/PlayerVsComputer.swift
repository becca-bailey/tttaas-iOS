import Foundation
public class PlayerVsComputer : Game {
    
    public var isXTurn: Bool = true
    public var board = Board()
    public var status = ""
    
    required public init() {
        
    }
    
    public func getGameType() -> String {
        return GameConfig.humanVsComputer
    }
    
    public func changeCurrentPlayer() {
    }
}