
import Foundation

public class UIConfig {
    public static let tieMessage = "It's a Tie!!"
    public static let player1 = "X"
    public static let player2 = "O"
    
    public static let player1Image = "letter-x"
    public static let player2Image = "letter-o"
    
    public static let humanVsComputerImage = "HumanVsComputer"
    public static let computerVsHumanImage = "ComputerVsHuman"
    
    public static func winnerMessage(marker: String) -> String {
        return marker + " Wins!!"
    }
    
    public static func getPlayerLabel(xTurn: Bool) -> String {
        var currentPlayerNumber = 1
        if (xTurn) {
            currentPlayerNumber = 1
        } else {
            currentPlayerNumber = 2
        }
        return "Player \(currentPlayerNumber)'s Turn!"
    }
    
}
