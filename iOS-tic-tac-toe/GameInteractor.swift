import Foundation

public protocol GameInteractor {
    var game: Game! {get set}
    init(boardView: BoardView, statusView: StatusView)
    func startGame(game: Game)
    func makeMove(spotIndex: Int)
    func completeTurn()
}