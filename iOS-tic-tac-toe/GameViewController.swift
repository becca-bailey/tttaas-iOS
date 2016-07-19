import UIKit

public class GameViewController: UIViewController {
    var xTurn = true;
    var hasWinner: Bool?
    var gameOver:Bool = false;
    public var boardArray: [String] = ["", "", "", "", "", "", "", "", ""]
    @IBOutlet public weak var boardStackView: UIStackView!
    @IBOutlet public weak var playerTurnLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func getPlayerLabel(xTurn: Bool) -> String {
        var currentPlayerNumber = 1
        if (xTurn) {
            currentPlayerNumber = 1
        } else {
            currentPlayerNumber = 2
        }
        return "Player \(currentPlayerNumber)'s Turn!"
    }
    
    public func setPlayerLabel(label: UILabel, xTurn: Bool) {
        label.text = getPlayerLabel(xTurn)
    }
    
    @IBAction func resetGame() {
        xTurn = true
        clearBoardArray()
        setPlayerLabel(playerTurnLabel,xTurn: xTurn)
        clearBoard(boardStackView)
    }
    
    public func clearBoardArray() {
        let emptyBoardArray: [String] = ["", "", "", "", "", "", "", "", ""]
        boardArray = emptyBoardArray
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
            playerMarker = UIImage(named: "letter-x")
        } else {
            playerMarker = UIImage(named: "letter-o")
        }
        return playerMarker!
    }
    
    public func getCurrentPlayerMarkerText(xTurn: Bool) -> String {
        if (xTurn) {
            return "X"
        } else {
            return "O"
        }
    }
    
    public func disableBoardSpot(spot: UIButton) {
        spot.enabled = false
    }
    
    func getUpdatedBoardArray(index: Int) -> [String] {
        boardArray[index] = getCurrentPlayerMarkerText(xTurn)
        return boardArray
    }
    
    public func createJSONBoard() -> [String: AnyObject] {
        let jsonObject: [String: AnyObject] = [
            "board": boardArray
        ]
        return jsonObject
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
        if (status == "Win" && xTurn) {
            gameLabel.text = "X Wins!!"
        } else if (status == "Win" && !xTurn){
            gameLabel.text = "O Wins!!"
        } else if (status == "Tie") {
            gameLabel.text = "It's a tie!!"
        }
        spotsEnabled(boardView, enabled: false)
    }
    
    public func nextTurn(boardView: UIStackView, gameLabel: UILabel) {
        xTurn = !xTurn
        setPlayerLabel(gameLabel, xTurn: xTurn)
    }
    
    
    public func makeRequest(currentBoard: [String]) -> NSData? {
        return NetworkManager.makePOSTRequest("http://localhost:5000/game", body: "[\"board\": \(currentBoard.description)]")
    }
    
    public func getGameStatus(responseData: NSData?) -> String {
        var stringData = ""
        if let validData = responseData {
            stringData = (NSString(data:validData, encoding: NSUTF8StringEncoding)?.capitalizedString)!
        }
        return stringData
    }
    
    public func gameIsOver(status: String) -> Bool {
        return (status == "Win") || (status == "Tie")
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
}