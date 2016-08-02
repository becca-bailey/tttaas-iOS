import Foundation
public class PlayerVsPlayer : Game {
    
    public var isXTurn: Bool = true
    public var board = Board()
    public var status = ""
    
    required public init() {

    }
    
    public func getGameType() -> String{
        return GameConfig.humanVsHuman
    }
    public func changeCurrentPlayer() {
        isXTurn = !isXTurn
    }

}