import UIKit

public class GameViewController: UIViewController {
    var xTurn = true;
    
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
    
    @IBOutlet public weak var boardStackView: UIStackView!
    @IBOutlet public weak var playerTurnLabel: UILabel!
    @IBAction func resetGame() {
        xTurn = true
        setPlayerLabel(playerTurnLabel,xTurn: xTurn)
        clearBoard(boardStackView)
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
    
    public func disableBoardSpot(spot: UIButton) {
        spot.enabled = false
    }

    @IBAction public func markerButtonClicked(sender: UIButton) {
        let playerMarker = getCurrentPlayerMarker(xTurn)
        let resizedImage = scaleImage(playerMarker, button: sender)
        setSpotToMarker(resizedImage, button: sender)
        disableBoardSpot(sender)
        xTurn = !xTurn
        setPlayerLabel(playerTurnLabel, xTurn: xTurn)

    }
}
