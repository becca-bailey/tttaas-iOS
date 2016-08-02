import Foundation
public protocol Game: class{
    
    var isXTurn: Bool {get set}
    var board: Board {get set}
    var status: String {get set}
    func changeCurrentPlayer()
    func getGameType() -> String
}

extension Game {
    public func updateBoard(index: Int) {
        board.setSpot(index, marker: getCurrentPlayerMarkerText())
    }
    
    public func getCurrentPlayerMarkerText() -> String {
        if (isXTurn) {
            return UIConfig.player1
        } else {
            return UIConfig.player2
        }
    }
    
    public func getTurnMessage() -> String {
        if getGameType() == GameConfig.humanVsComputer && isXTurn {
            return UIConfig.playerTurnMessage
        } else if getGameType() == GameConfig.humanVsComputer && !isXTurn {
            return UIConfig.computerTurnMessage
        } else {
            return UIConfig.getLabelForPlayerVsPlayerGame(isXTurn)
        }
    }
    
    public func isOver() -> Bool {
        return status != Status.inProgress;
    }
}