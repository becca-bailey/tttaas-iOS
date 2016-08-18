import Foundation

public class GameConfig {
    public static var root = ""
    public static let serverURL = "\(root)/game"
    public static let humanVsHuman = "humanVsHuman"
    public static let humanVsComputer = "humanVsComputer"
    
    public static var gameType: String = ""
    public static var game: Game = PlayerVsPlayer()
    public static var response: NSData? = NSData()
}
