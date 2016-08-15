import iOS_tic_tac_toe
import Foundation

public class MockInteractor: NSObject, GameInteractor {
    public var game: Game!
    public var boardView: BoardView
    public var statusView: StatusView
    public var indicatorView: IndicatorView
    public var httpClient: HTTPClient
    public var moveMade: Int!
    public var turnCompleted: Bool! = false
    
    required public init(boardView: BoardView, statusView: StatusView, indicatorView: IndicatorView, httpClient: HTTPClient) {
        self.boardView = boardView
        self.statusView = statusView
        self.indicatorView = indicatorView
        self.httpClient = httpClient
    }
    
    
    public func startGame(game: Game) {
        
    }
    
    public func makeMove(spotIndex: Int?) {
        moveMade = spotIndex
    }
    
    public func completeTurn() {
        turnCompleted = true
    }
    
    public func resetGame(game: Game) {
        
    }
    
    public func warnReset() {
        
    }
    

}