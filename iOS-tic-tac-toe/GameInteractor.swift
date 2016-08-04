import Foundation

public protocol GameInteractor {
    var game: Game! {get set}
    init(boardView: BoardView, statusView: StatusView, indicatorView: IndicatorView)
    func startGame(game: Game)
    func makeMove(spotIndex: Int?)
    func completeTurn()
    func resetGame(game: Game)
    func warnReset()
}