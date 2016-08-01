import Foundation
public class PlayerVsComputer : Game {
    required public init() {
        
    }
    
    public func getGameType() -> String {
        return GameConfig.humanVsComputer
    }
    
    public func changeCurrentPlayer(isXTurn: Bool) -> Bool {
        return isXTurn
    }
}