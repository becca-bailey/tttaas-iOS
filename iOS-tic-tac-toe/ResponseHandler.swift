import Foundation

public class ResponseHandler {
    var responseData: NSData?
    
    public init(responseData: NSData?) {
        self.responseData = responseData
    }
    
    public func getUpdatedGame(game: Game) -> Game {
        game.board = getBoard()
        game.status = getGameStatus()
        return game
    }
    
    public func getGameStatus() -> String {
        var stringData = ""
        if let response = responseData {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(response, options: .AllowFragments)
                stringData = (json["status"] as? String)!
            } catch {
                print("error serializing json: \(error)")
            }
        }
        return stringData
    }
    
    
    public func getBoard() -> Board {
        let board = Board()
        if let response = responseData {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(response, options: .AllowFragments)
                board.boardArray = (json["board"] as? [String])!
            } catch {
                print("error serializing json: \(error)")
            }
        }
        return board
    }
}
