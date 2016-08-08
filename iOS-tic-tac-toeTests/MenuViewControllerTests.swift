import iOS_tic_tac_toe
import Quick
import Nimble

class MenuViewControllerSpec: QuickSpec {
    override func spec() {
        let controller = MenuViewController()
        let button = UIButton()
    
        describe("Menu View Controller") {
            it("can set the game type to HumanVsHuman") {
                controller.newPlayerVsPlayerGame(button)
                expect(GameConfig.gameType).to(equal(GameConfig.humanVsHuman))
                expect(GameConfig.game.dynamicType).to(be(PlayerVsPlayer().dynamicType))
            }
            
            it("can set the game type to HumanVsComputer") {
                let clickedButton = self.buttonForGameType(button, gameType: GameConfig.humanVsComputer)
                controller.newPlayerVsComputerGame(clickedButton)
                expect(GameConfig.gameType).to(equal(GameConfig.humanVsComputer))
                expect(GameConfig.game.dynamicType).to(be(PlayerVsComputer().dynamicType))
            }
            
            it("can set the game type to ComputerVsHuman") {
                let clickedButton = self.buttonForGameType(button, gameType: GameConfig.humanVsComputer)
                button.tag = 1
                controller.newPlayerVsComputerGame(clickedButton)
                expect(GameConfig.gameType).to(equal(GameConfig.computerVsHuman))
                expect(GameConfig.game.dynamicType).to(be(PlayerVsComputer().dynamicType))
            }
            
            it("can change the player marker labels to the show their current markers") {
                let label1 = UILabel()
                let label2 = UILabel()
                controller.player1MarkerLabel = label1
                controller.player2MarkerLabel = label2
                
                UIConfig.player1 = "Y"
                UIConfig.player2 = "X"
                
                controller.displayPlayerMarkers()
                
                expect(label1.text!).to(contain("Y"))
                expect(label2.text!).to(contain("X"))
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
