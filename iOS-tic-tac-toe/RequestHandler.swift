import Foundation

public class RequestHandler {
    let client: HTTPClient
    var response: NSData?
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    public func getGameResponse(game: Game) -> NSData? {
        client.makePOSTRequest(GameConfig.serverURL, body: createJSONRequestBody(game), onCompletion: setData)
        return response
    }
    
    private func setData(data: NSData?) {
        response = data
    }
    
    public func createJSONRequestBody(game: Game) -> String {
        return "{\"board\": \(game.board.asArray().description), \"gameType\": \(game.getGameType())}"
    }
}
