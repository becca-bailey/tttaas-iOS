import Foundation

@objc public protocol StatusView {
    func displayWinner(player player: String)
    func displayTie()
    func displayTurn(message message: String)
}