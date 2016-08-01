import UIKit

public class GameViewController: UIViewController {

    public var xTurn = true
    public var boardArray = ["", "", "", "", "", "", "", "", ""]

    var hasWinner: Bool?
    var isGameOver = false
    let emptyBoard = ["", "", "", "", "", "", "", "", ""]
    let serverURL = "http://localhost:5000/game"

    @IBOutlet public weak var statusView: StatusView!
    @IBOutlet public weak var boardView: BoardView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        statusView.displayTurn(message: UIConfig.getPlayerLabel(true, gameType: GameConfig.game.getGameType()))
    }

    @IBAction public func makeMove(sender: UIButton) {

        let currentBoard = getUpdatedBoardArray(sender.tag)
        let responseData = makeRequest(currentBoard)
        let status = getGameStatus(responseData)
        let board = getBoard(responseData)
        boardView.show(board: board)
        boardArray = board
        self.isGameOver = gameIsOver(status)
        
        completeTurn(status)
    }
    
    public func setSpotToMarker(playerMarker: UIImage, button: UIButton) {
        button.setBackgroundImage(playerMarker, forState: .Normal)
    }
    
    public func getCurrentPlayerMarker(xTurn: Bool) -> UIImage {
        var playerMarker: UIImage?
        if (xTurn) {
            playerMarker = UIImage(named: UIConfig.player1Image)
        } else {
            playerMarker = UIImage(named: UIConfig.player2Image)
        }
        return playerMarker!
    }
    
    public func getCurrentPlayerMarkerText(xTurn: Bool) -> String {
        if (xTurn) {
            return UIConfig.player1
        } else {
            return UIConfig.player2
        }
    }
    
    public func getUpdatedBoardArray(index: Int) -> [String] {
        boardArray[index] = getCurrentPlayerMarkerText(xTurn)
        return boardArray
    }

    public func createJSONRequestBody(currentBoard: [String]) -> String {
        return "{\"board\": \(currentBoard.description), \"gameType\": \(GameConfig.gameType)}"
    }
    
    private func completeTurn(status:String) {
        if (isGameOver){
            endGame(status)
        } else {
            nextTurn()
        }
    }
    
    public func endGame(status: String) {
        if (status == Status.win && xTurn) {
            statusView.displayWinner(player: UIConfig.player1)
        } else if (status == Status.win && !xTurn){
            statusView.displayWinner(player: UIConfig.player2)
        } else if (status == Status.tie) {
            statusView.displayTie()
        }
        boardView.spotsEnabled(false)
    }
    
    public func nextTurn() {
        xTurn = GameConfig.game.changeCurrentPlayer(xTurn)
        statusView.displayTurn(message: UIConfig.getPlayerLabel(xTurn, gameType: GameConfig.game.getGameType()))
    }
    
    public func makeRequest(currentBoard: [String]) -> NSData? {
        return NetworkManager.makePOSTRequest(serverURL, body: createJSONRequestBody(currentBoard))
    }
    
    public func getGameStatus(responseData: NSData?) -> String {
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
    
    
    public func getBoard(responseData: NSData?) -> [String] {
        var board = [String]()
        if let response = responseData {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(response, options: .AllowFragments)
                board = (json["board"] as? [String])!
            } catch {
                print("error serializing json: \(error)")
            }
        }
        print(board.description)
        return board
    }
    
    public func gameIsOver(status: String) -> Bool {
        return (status == Status.win) || (status == Status.tie)
    }
    
}