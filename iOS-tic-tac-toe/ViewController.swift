import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newPlayerVsPlayerGame(sender: UIButton) {
        GameConfig.gameType = GameConfig.humanVsHuman
    }
    
    @IBAction func newPlayerVsComputerGame(sender: UIButton) {
        if (sender.tag == 0) {
            GameConfig.gameType = GameConfig.humanVsComputer
        } else {
            GameConfig.gameType = GameConfig.computerVsHuman
        }
    }
    
    @IBOutlet weak var gameTypeImage: UIImageView!
    @IBOutlet weak var gameTypeLink: UIButton!

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

