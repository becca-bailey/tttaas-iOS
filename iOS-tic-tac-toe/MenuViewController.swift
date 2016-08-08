import UIKit

public class MenuViewController: UIViewController {

    @IBOutlet weak var gameTypeImage: UIImageView!
    @IBOutlet weak var gameTypeLink: UIButton!
    
    public override func viewDidLoad() {
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

