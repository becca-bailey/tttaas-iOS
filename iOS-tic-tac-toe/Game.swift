import Foundation
public protocol Game {
    
    func changeCurrentPlayer(isXTurn: Bool) -> Bool
    func getGameType() -> String
}