import Foundation
public class PlayerVsPlayerInteractor: GameInteractor {
    
    public var game : Game!
    public var httpClient : HTTPClient
    public var boardView : BoardView
    public var statusView : StatusView
    public var indicatorView : IndicatorView
    
    required public init(boardView: BoardView, statusView: StatusView, indicatorView: IndicatorView, httpClient: HTTPClient) {
        self.boardView = boardView
        self.statusView = statusView
        self.indicatorView = indicatorView
        self.httpClient = httpClient
    }
    
    public func startGame(game: Game) {
        self.game = game
        statusView.displayTurn(message: game.getTurnMessage())
    }
    
    public func makeMove(spotIndex: Int?) {
        boardView.disableSpots()
        indicatorView.moveInProgress()
        game.updateBoard(spotIndex!)
        boardView.show(board: game.board.asArray())
        httpClient.makeGETRequest(GameConfig.serverStatusURL, parameters: game.board.asParams(), onCompletion: successfulRequest)
    }
    
    public func successfulRequest(data: NSData?) {
        let responseHandler = ResponseHandler(responseData: data)
        self.game = responseHandler.getUpdatedGame(self.game)
        self.boardView.show(board: self.game.board.asArray())
        self.completeTurn()
    }
}



