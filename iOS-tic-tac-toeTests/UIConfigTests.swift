@testable import iOS_tic_tac_toe
import Quick
import Nimble

class UIConfigSpec: QuickSpec {
    override func spec() {
        describe("UIConfig") {
            it("returns text that includes the Player 1's name") {
                let xTurn = true
                let nextPlayerText = UIConfig.getPlayerLabel(xTurn)
                expect(nextPlayerText).to(contain("Player 1"))
            }
            
            it("returns text that includes the Player 2's name") {
                let xTurn = false
                let nextPlayerText = UIConfig.getPlayerLabel(xTurn)
                expect(nextPlayerText).to(contain("Player 2"))
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
}
