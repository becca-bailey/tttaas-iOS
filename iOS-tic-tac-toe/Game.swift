public protocol Game: class{
    
    var isXTurn: Bool {get set}
    var board: Board {get set}
    var status: Status {get set}
    func changeCurrentPlayer()
    func getGameType() -> String
    func resetGame()
}

extension Game {
    public func updateBoard(index: Int) {
        board.setSpot(index, marker: getCurrentPlayerMarkerText())
    }
    
    public func getCurrentPlayerMarkerText() -> String {
        if (isXTurn) {
            return "X"
        } else {
            return "O"
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
    
    public func resetGame() {
        isXTurn = true
        board.clear()
    }
    
}