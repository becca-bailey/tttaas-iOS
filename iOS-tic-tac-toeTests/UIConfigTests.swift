import iOS_tic_tac_toe
import Quick
import Nimble

class UIConfigSpec: QuickSpec {
    override func spec() {
        describe("UIConfig") {
            
            describe ("#getPlayerLabel") {
                
                it("returns text that includes the Player 1's name") {
                    let xTurn = true
                    let nextPlayerText = UIConfig.getPlayerLabel(xTurn, gameType: GameConfig.humanVsHuman)
                    expect(nextPlayerText).to(contain("Player 1"))
                }
                
                it("returns text that includes the Player 2's name") {
                    let xTurn = false
                    let nextPlayerText = UIConfig.getPlayerLabel(xTurn, gameType: GameConfig.humanVsHuman)
                    expect(nextPlayerText).to(contain("Player 2"))
                }
                
                it("returns 'Your turn!' if it is the human player's turn") {
                    let xTurn = true
                    let nextPlayerText = UIConfig.getPlayerLabel(xTurn, gameType: GameConfig.humanVsComputer)
                    expect(nextPlayerText).to(equal(UIConfig.playerTurnMessage))
                
                }
                
                it("returns 'Computer's turn!' if it is the computer player's turn" ) {
                    let xTurn = false
                    let nextPlayerText = UIConfig.getPlayerLabel(xTurn, gameType: GameConfig.computerVsHuman)
                    expect(nextPlayerText).to(equal(UIConfig.computerTurnMessage))
                }
                
                it("needs this at the bottom") {
                    expect(true).to(equal(true))
                }
            }
        }
    }
}
