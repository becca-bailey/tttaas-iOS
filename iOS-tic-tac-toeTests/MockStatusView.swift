import iOS_tic_tac_toe
import Foundation

public class MockStatusView: NSObject, StatusView {
    public var statusMessage = ""
    
    public func displayTie() {
        statusMessage = "It's a Tie"
    }
    
    public func displayTurn(message message: String) {
        statusMessage = message
    }
    
    public func displayWinner(player player: String) {
        statusMessage = "\(player) wins!"
    }
}
