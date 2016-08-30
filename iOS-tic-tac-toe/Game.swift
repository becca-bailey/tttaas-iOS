public protocol Game: class{
    
    var isXTurn: Bool {get set}
    var board: Board {get set}
    var status: Status {get set}
    func changeCurrentPlayer()
    func getGameType() -> String
    func resetGame()
    func getTurnMessage() -> String
}

extension Game {
    public func updateBoard(index: Int) {
        board.setSpot(index, marker: getCurrentPlayerMarkerText())
    }
    
    public func getCurrentPlayerMarkerText() -> Marker {
        if (isXTurn) {
            return Marker.X
        } else {
            return Marker.O
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