import UIKit

public class GameViewController: UIViewController {
    var xTurn = true
    var hasWinner: Bool?
    var gameOver:Bool = false
    let emptyBoard: [String] = ["", "", "", "", "", "", "", "", ""]
    var boardArray: [String] = ["", "", "", "", "", "", "", "", ""]
    let serverURL = "http://localhost:5000/game"

    @IBOutlet public weak var boardStackView: UIStackView!
    @IBOutlet public weak var playerTurnLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setPlayerLabel(playerTurnLabel, xTurn: true)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction public func markerButtonClicked(sender: UIButton) {
        let playerMarker = getCurrentPlayerMarker(xTurn)
        let resizedImage = scaleImage(playerMarker, button: sender)
        setSpotToMarker(resizedImage, button: sender)
        disableBoardSpot(sender)
        
        let currentBoard = getUpdatedBoardArray(sender.tag)
        let status = getGameStatus(makeRequest(currentBoard))
        self.gameOver = gameIsOver(status)
        
        completeTurn(status)
    }
    
    public func setPlayerLabel(label: UILabel, xTurn: Bool) {
        label.text = UIConfig.getPlayerLabel(xTurn, gameType: GameConfig.gameType)
    }
    
    @IBAction func resetGame() {
        xTurn = true
        clearBoardArray()
        setPlayerLabel(playerTurnLabel,xTurn: xTurn)
        clearBoard(boardStackView)
    }
    
    public func clearBoardArray() {
        boardArray = emptyBoard
    }
    
    public func clearBoard(boardStackView: UIStackView) {
        for view in boardStackView.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                btn.setBackgroundImage(nil, forState: .Normal)
                btn.enabled = true
            }
        }
    }
    
    public func scaleImage(image: UIImage, button:UIButton) -> UIImage {
        let newSize = CGSizeMake(button.frame.width, button.frame.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
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
    
    public func disableBoardSpot(spot: UIButton) {
        spot.enabled = false
    }
    
    func getUpdatedBoardArray(index: Int) -> [String] {
        boardArray[index] = getCurrentPlayerMarkerText(xTurn)
        return boardArray
    }

    public func createJSONRequestBody(currentBoard: [String]) -> String {
        return "{\"board\": \(currentBoard.description), \"gameType\": \(GameConfig.gameType)}"
    }
    
    public func spotsEnabled(boardStackView: UIStackView, enabled: Bool) {
        for view in boardStackView.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                btn.enabled = enabled
            }
        }
    }
    
    private func completeTurn(status:String) {
        if (self.gameOver){
            endGame(boardStackView, gameLabel: playerTurnLabel, status: status)
        } else {
            nextTurn(boardStackView, gameLabel: playerTurnLabel)
        }
    }
    
    public func endGame(boardView: UIStackView, gameLabel: UILabel, status: String) {
        if (status == Status.win && xTurn) {
            gameLabel.text = UIConfig.winnerMessage(UIConfig.player1)
        } else if (status == Status.win && !xTurn){
            gameLabel.text = UIConfig.winnerMessage(UIConfig.player2)
        } else if (status == Status.tie) {
            gameLabel.text = UIConfig.tieMessage
        }
        spotsEnabled(boardView, enabled: false)
    }
    
    
    public func nextTurn(boardView: UIStackView, gameLabel: UILabel) {
        xTurn = !xTurn
        setPlayerLabel(gameLabel, xTurn: xTurn)
    }
    
    
    public func makeRequest(currentBoard: [String]) -> NSData? {
        return NetworkManager.makePOSTRequest(serverURL, body: createJSONRequestBody(currentBoard))
    }
    
    public func getGameStatus(responseData: NSData?) -> String {
        var stringData = ""
        if let validData = responseData {
            stringData = (NSString(data:validData, encoding: NSUTF8StringEncoding)?.capitalizedString)!
        }
        return stringData
    }
    
    public func gameIsOver(status: String) -> Bool {
        return (status == Status.win) || (status == Status.tie)
    }
    
}