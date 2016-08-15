import Foundation
public class PlayerVsComputerInteractor: GameInteractor {
    
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
        httpClient.makePOSTRequest(GameConfig.serverURL, body: createJSONRequestBody(game), onCompletion: successfulRequest)
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
}



