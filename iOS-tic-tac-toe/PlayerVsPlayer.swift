import Foundation
public class PlayerVsPlayer : Game {
    required public init() {
        
    }
    
    public func getGameType() -> String{
        return GameConfig.humanVsHuman
    }
    public func changeCurrentPlayer(isXTurn: Bool) -> Bool {
        return !isXTurn
    }
}