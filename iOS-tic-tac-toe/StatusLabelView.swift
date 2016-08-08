import UIKit

public class StatusLabelView: UILabel, StatusView {
    
    public func displayWinner(player player: String) {
        self.text = UIConfig.winnerMessage(player)
    }
    
    public func displayTie() {
        self.text = UIConfig.tieMessage
    }
    
    public func displayTurn(message message: String) {
        self.text = message
    }
}