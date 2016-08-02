import iOS_tic_tac_toe
import Quick
import Nimble

class UIConfigSpec: QuickSpec {
    override func spec() {
        describe("UIConfig") {
            
            describe ("#getPlayerLabel") {
                
                it("returns text that includes the Player 1's name") {
                    let nextPlayerText = UIConfig.getLabelForPlayerVsPlayerGame(true)
                    expect(nextPlayerText).to(contain("Player 1"))
                }
                
                it("returns text that includes the Player 2's name") {
                    let nextPlayerText = UIConfig.getLabelForPlayerVsPlayerGame(false)
                    expect(nextPlayerText).to(contain("Player 2"))
                }
                
                it("needs this at the bottom") {
                    expect(true).to(equal(true))
                }
            }
        }
    }
}
