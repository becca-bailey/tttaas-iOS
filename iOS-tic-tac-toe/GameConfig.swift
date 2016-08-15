import Foundation

public class GameConfig {
    public static let serverURL = "http://stormy-savannah-24890.herokuapp.com/game"
//    public static let serverURL = "http://localhost:5000/game"
    
    public static let humanVsHuman = "humanVsHuman"
    public static let humanVsComputer = "humanVsComputer"
    
    public static var gameType: String = ""
    public static var game: Game = PlayerVsPlayer()
    public static var response: NSData? = NSData()
}
