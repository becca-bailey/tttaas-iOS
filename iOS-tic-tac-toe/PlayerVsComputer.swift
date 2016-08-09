public class PlayerVsComputer : Game {
    
    public var isXTurn: Bool = true
    public var board = Board()
    public var status = Status.empty
    
    required public init() {
        
    }
    
    public func getGameType() -> String {
        return GameConfig.humanVsComputer
    }
    
    public func changeCurrentPlayer() {

        
    }
    
    public func getTurnMessage() -> String {
        if (isXTurn) {
            return UIConfig.playerTurnMessage
        } else {
            return UIConfig.computerTurnMessage
        }
    }
}