public class PlayerVsPlayer : Game {
    
    public var isXTurn: Bool = true
    public var board = Board()
    public var status = Status.empty
    
    required public init() {

    }
    
    public func getGameType() -> String{
        return GameConfig.humanVsHuman
    }
    
    public func changeCurrentPlayer() {
        isXTurn = !isXTurn
    }

    public func getTurnMessage() -> String {
        if (isXTurn) {
            return "\(UIConfig.player1)'s Turn!!"
        } else {
            return "\(UIConfig.player2)'s Turn!!"
        }
    }
}