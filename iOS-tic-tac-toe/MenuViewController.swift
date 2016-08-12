import UIKit

public class MenuViewController: UIViewController {
    @IBOutlet weak public var player1MarkerLabel: UILabel!
    @IBOutlet weak public var player2MarkerLabel: UILabel!
    
    @IBOutlet weak var gameTypeImage: UIImageView!
    @IBOutlet weak var gameTypeLink: UIButton!
    
    public override func viewDidLoad() {
        appMovedToForeground()
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplicationWillEnterForegroundNotification, object: nil)
    }
    
    func appMovedToForeground() {
        setPlayerMarkers()
        displayPlayerMarkers()
    }

    @IBAction func navigateToSettings(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
    }
    
    public func displayPlayerMarkers() {
        player1MarkerLabel.text = "Player 1's Marker: \(UIConfig.player1)"
        player2MarkerLabel.text = "Player 2's Marker: \(UIConfig.player2)"
    }

    public func setPlayerMarkers() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let player1Marker = defaults.stringForKey("SettingsPlayer1Marker")
        if player1Marker != nil && player1Marker != ""{
            let userDefinedMarker = String(player1Marker!).characters.first
            UIConfig.player1 = String(userDefinedMarker!)
        } else {
            UIConfig.player1 = "X"
        }
        
        let player2Marker = defaults.stringForKey("SettingsPlayer2Marker")
        if player2Marker != nil && player2Marker != ""{
            let userDefinedMarker = String(player2Marker!).characters.first
            UIConfig.player2 = String(userDefinedMarker!)
        } else {
            UIConfig.player2 = "O"
        }
    }
    
    @IBAction public func newPlayerVsPlayerGame(sender: UIButton) {
        GameConfig.gameType = GameConfig.humanVsHuman
        GameConfig.game = PlayerVsPlayer()
    }
    
    @IBAction public func newPlayerVsComputerGame(sender: UIButton) {
        if (sender.tag == 0) {
            GameConfig.gameType = GameConfig.humanVsComputer
            GameConfig.game = PlayerVsComputer()
        } else {
            GameConfig.gameType = GameConfig.computerVsHuman
            GameConfig.game = PlayerVsComputer()
            GameConfig.game.isXTurn = false
        }
    }
    
    @IBAction func switchGameType(sender: UIButton) {
        toggleGameTypeImage()
        toggleGameTypeLink()
    }
    
    @IBAction func animateSwitch(sender: UIButton) {
        UIView.animateWithDuration(0.75,
            animations: {
            sender.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2 * 2))
            }, completion: nil)
    }
    
    private func toggleGameTypeImage() {
        if (gameTypeImage.image == UIImage(named: UIConfig.computerVsHumanImage)) {
            gameTypeImage.image = UIImage(named: UIConfig.humanVsComputerImage)
        } else {
            gameTypeImage.image = UIImage(named: UIConfig.computerVsHumanImage)
        }
    }
    
    private func toggleGameTypeLink() {
        if (gameTypeLink.tag == 0) {
            gameTypeLink.setTitle(UIConfig.computerVsPlayerLabel, forState: .Normal)
            gameTypeLink.tag = 1
        } else {
            gameTypeLink.setTitle(UIConfig.playerVsComputerLabel, forState: .Normal)
            gameTypeLink.tag = 0
        }
    }
}

