import UIKit

public class ViewController: UIViewController {

    @IBOutlet weak var gameTypeImage: UIImageView!
    @IBOutlet weak var gameTypeLink: UIButton!
    
    public override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()
        UIConfig.player1 = String(defaults.stringForKey("SettingsPlayer1Marker")!.characters.first!)
        UIConfig.player2 = String(defaults.stringForKey("SettingsPlayer2Marker")!.characters.first!)
        print(defaults.stringForKey("SettingsPlayer1Marker"))
        print(defaults.stringForKey("SettingsPlayer2Marker"))
    
        
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
    
    func toggleGameTypeImage() {
        if (gameTypeImage.image == UIImage(named: UIConfig.computerVsHumanImage)) {
            gameTypeImage.image = UIImage(named: UIConfig.humanVsComputerImage)
        } else {
            gameTypeImage.image = UIImage(named: UIConfig.computerVsHumanImage)
        }
    }
    
    func toggleGameTypeLink() {
        if (gameTypeLink.tag == 0) {
            gameTypeLink.setTitle(UIConfig.computerVsPlayerLabel, forState: .Normal)
            gameTypeLink.tag = 1
        } else {
            gameTypeLink.setTitle(UIConfig.playerVsComputerLabel, forState: .Normal)
            gameTypeLink.tag = 0
        }
    }
}

