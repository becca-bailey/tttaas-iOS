
import Foundation

public class DefaultGameInteractor: GameInteractor {
    
    public var game : Game!
    let requestHandler = RequestHandler(client: HTTPClient())
    let boardView : BoardView
    let statusView : StatusView
    
    required public init(boardView: BoardView, statusView: StatusView) {
        self.boardView = boardView
        self.statusView = statusView
    }
    
    public func startGame(game: Game) {
        self.game = game
        statusView.displayTurn(message: game.getTurnMessage())
    }
    
    public func makeMove(spotIndex: Int) {
        game.updateBoard(spotIndex)
        boardView.show(board: game.board.asArray())
        let responseHandler = ResponseHandler(responseData: requestHandler.getGameResponse(game))
        game = responseHandler.getUpdatedGame(game)
        boardView.show(board: game.board.asArray())
    }
    
    public func completeTurn() {
        if (game.isOver()){
            endGame()
        } else {
            nextTurn()
        }
    }
    
    public func endGame() {
        if (game.status == Status.win && game.isXTurn) {
            statusView.displayWinner(player: UIConfig.player1)
        } else if (game.status == Status.win && !game.isXTurn){
            statusView.displayWinner(player: UIConfig.player2)
        } else if (game.status == Status.tie) {
            statusView.displayTie()
        }
        boardView.spotsEnabled(false)
    }
    
    public func nextTurn() {
        game.changeCurrentPlayer()
        statusView.displayTurn(message: game.getTurnMessage())
    }
    
}
    

    
