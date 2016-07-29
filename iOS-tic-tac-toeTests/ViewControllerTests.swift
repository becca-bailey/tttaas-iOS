import iOS_tic_tac_toe
import Quick
import Nimble

class ViewControllerSpec: QuickSpec {
    override func spec() {
        let controller = ViewController()
        let button = UIButton()
    
        describe("View Controller") {
            
            it("can set the game type to HumanVsHuman") {
                controller.newPlayerVsPlayerGame(button)
                expect(GameConfig.gameType).to(equal(GameConfig.humanVsHuman))
            }
            
            it("can set the game type to HumanVsComputer") {
                let clickedButton = self.buttonForGameType(button, gameType: GameConfig.humanVsComputer)
                controller.newPlayerVsComputerGame(clickedButton)
                expect(GameConfig.gameType).to(equal(GameConfig.humanVsComputer))
            }
            
            it("can set the game type to ComputerVsHuman") {
                let clickedButton = self.buttonForGameType(button, gameType: GameConfig.humanVsComputer)
                button.tag = 1
                controller.newPlayerVsComputerGame(clickedButton)
                expect(GameConfig.gameType).to(equal(GameConfig.computerVsHuman))
            }
        }
    }
    
    func buttonForGameType(button: UIButton, gameType: String) -> UIButton {
        if (gameType == GameConfig.computerVsHuman) {
            button.tag = 1
        } else {
            button.tag = 0
        }
        return button
    }
}
