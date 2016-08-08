import iOS_tic_tac_toe
import Quick
import Nimble

class StatusLabelViewSpec: QuickSpec {
    override func spec() {
        describe("StatusLabelView") {
            it ("can set a label to include the current player's name") {
                let playerLabel = StatusLabelView()
                let game = PlayerVsPlayer()
                playerLabel.text = ""
                playerLabel.displayTurn(message: game.getTurnMessage())
                expect(playerLabel.text).to(contain("Player 1"))
            }
            
            it ("can set the status label when there's a tie") {
                let playerLabel = StatusLabelView()
                playerLabel.text = ""
                playerLabel.displayTie()
                expect(playerLabel.text).to(equal(UIConfig.tieMessage))
            }
            
            it ("can set the status label when there's a winner") {
                let playerLabel = StatusLabelView()
                playerLabel.text = ""
                playerLabel.displayWinner(player: UIConfig.player1)
                expect(playerLabel.text).to(equal(UIConfig.winnerMessage(UIConfig.player1)))
            }
        }
    }
}

