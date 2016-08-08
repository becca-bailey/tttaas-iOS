
public class DefaultGameInteractor: GameInteractor {
    
    public var game : Game!
    let requestHandler = RequestHandler(client: HTTPClient())
    let boardView : BoardView
    let statusView : StatusView
    let indicatorView : IndicatorView
    
    required public init(boardView: BoardView, statusView: StatusView, indicatorView: IndicatorView) {
        self.boardView = boardView
        self.statusView = statusView
        self.indicatorView = indicatorView
    }
    
    public func startGame(game: Game) {
        statusView.displayTurn(message: game.getTurnMessage())
        self.game = game
        if (game.getGameType() == GameConfig.humanVsComputer && game.isXTurn == false) {
            makeMove(nil)
            self.game.isXTurn = true
        }
        statusView.displayTurn(message: game.getTurnMessage())
    }
    
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
    
    public func makeMove(spotIndex: Int?) {
        indicatorView.moveInProgress()
        if let spotIndex = spotIndex {
            game.updateBoard(spotIndex)
            boardView.show(board: game.board.asArray())
        }
        let responseHandler = ResponseHandler(responseData: requestHandler.getGameResponse(game))
        game = responseHandler.getUpdatedGame(game)
        boardView.show(board: game.board.asArray())
    }
    
    public func completeTurn() {
        indicatorView.moveDone()
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
    
}
    

    
