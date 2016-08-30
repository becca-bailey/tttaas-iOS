import Foundation
public class DefaultGameInteractor: GameInteractor {
    
    public var game : Game!
    public var httpClient : HTTPClient
    public var boardView : BoardView
    public var statusView : StatusView
    public var indicatorView : IndicatorView
    var start = NSDate()
    var end = NSDate()
    
    
    required public init(boardView: BoardView, statusView: StatusView, indicatorView: IndicatorView, httpClient: HTTPClient) {
        self.boardView = boardView
        self.statusView = statusView
        self.indicatorView = indicatorView
        self.httpClient = httpClient
    }
    
    public func startGame(game: Game) {
        self.game = game
        if (game.isXTurn == false) {
            makeMove(nil)
            self.game.isXTurn = true
            statusView.displayTurn(message: UIConfig.computerTurnMessage)
        } else {
            statusView.displayTurn(message: game.getTurnMessage())
        }
    }
    
    public func makeMove(spotIndex: Int?) {
        start = NSDate()
        boardView.disableSpots()
        statusView.displayTurn(message: UIConfig.computerTurnMessage)
        indicatorView.moveInProgress()
        if let spotIndex = spotIndex {
            game.updateBoard(spotIndex)
            boardView.show(board: game.board.asArray())
        }
        if (game.getGameType() == GameConfig.humanVsHuman) {
            httpClient.makeGETRequest(GameConfig.serverStatusURL, parameters: game.board.asParams(), onCompletion: successfulRequest)
        } else {
            httpClient.makePOSTRequest(GameConfig.serverMoveURL, body: createJSONRequestBody(game), onCompletion: successfulRequest)
        }
    }
    
    public func successfulRequest(data: NSData?) {
        let responseHandler = ResponseHandler(responseData: data)
        self.game = responseHandler.getUpdatedGame(self.game)
        self.standadizedWaitTime()
        self.boardView.show(board: self.game.board.asArray())
        self.completeTurn()
    }
    
    public func standadizedWaitTime(){
        if (self.game.getGameType() == GameConfig.humanVsComputer) {
            end = NSDate()
            let difference = end.timeIntervalSinceDate(start)
            if (difference < 2) {
                sleep(UInt32(2 - difference))
            }
        }
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



