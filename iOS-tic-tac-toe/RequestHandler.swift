
import Foundation

public class RequestHandler {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    public func getGameResponse(game: Game) -> NSData? {
        return HTTPClient().makePOSTRequest(GameConfig.serverURL, body: createJSONRequestBody(game))
    }
    
    public func createJSONRequestBody(game: Game) -> String {
        return "{\"board\": \(game.board.asArray().description), \"gameType\": \(game.getGameType())}"
    }
}
