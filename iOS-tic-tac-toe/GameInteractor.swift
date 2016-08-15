public protocol GameInteractor {
    var game: Game! {get set}
    var boardView: BoardView {get set}
    var statusView: StatusView {get set}
    var indicatorView: IndicatorView {get set}
    var httpClient: HTTPClient {get set}
    
    init(boardView: BoardView, statusView: StatusView, indicatorView: IndicatorView, httpClient: HTTPClient)
    func startGame(game: Game)
    func makeMove(spotIndex: Int?)
    func completeTurn()
    func resetGame(game: Game)
    func warnReset()
}
extension GameInteractor {
    
    public func resetGame(game: Game) {
        boardView.clearSpots()
        boardView.enableSpots()
        statusView.displayTurn(message: game.getTurnMessage())
        game.resetGame()
        startGame(game)
    }
    
    public func warnReset() {
        statusView.displayTurn(message: "Resetting game...")
    }
    
    public func completeTurn() {
        indicatorView.moveDone()
        boardView.enableSpots()
        if (game.isOver()){
            endGame()
        } else {
            nextTurn()
        }
    }
    
    public func endGame() {
        if (game.status == Status.player1Wins) {
            statusView.displayWinner(player: UIConfig.player1)
        } else if (game.status == Status.player2Wins){
            statusView.displayWinner(player: UIConfig.player2)
        } else if (game.status == Status.tie) {
            statusView.displayTie()
        }
        boardView.disableSpots()
    }
    
    public func nextTurn() {
        game.changeCurrentPlayer()
        statusView.displayTurn(message: game.getTurnMessage())
    }
    
    public func createJSONRequestBody(game: Game) -> String {
        return "{\"board\": \(game.board.asArray().description), \"gameType\": \(game.getGameType())}"
    }
}