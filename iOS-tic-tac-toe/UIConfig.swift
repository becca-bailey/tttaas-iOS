public class UIConfig {
    public static let tieMessage = "It's a Tie!!"
    public static var player1 = "X"
    public static var player2 = "O"
    
    public static let player1Image = "letter-x"
    public static let player2Image = "letter-o"
    
    public static let humanVsComputerImage = "HumanVsComputer"
    public static let computerVsHumanImage = "ComputerVsHuman"
    
    public static let computerVsPlayerLabel = "Computer vs. Player"
    public static let playerVsComputerLabel = "Player vs. Computer"
    
    public static let playerTurnMessage = "Your turn!"
    public static let computerTurnMessage = "Computer's turn!"
    
    public static let defaultfont = "PingFangTC-Regular"
        
    public static func winnerMessage(marker: String) -> String {
        return marker + " Wins!!"
    }
    
    public static func getLabelForPlayerVsPlayerGame(xTurn: Bool) -> String {
        var currentPlayerNumber = 1
        if (xTurn) {
            currentPlayerNumber = 1
        } else {
            currentPlayerNumber = 2
        }
        return "Player \(currentPlayerNumber)'s Turn!"
    }
}
