import iOS_tic_tac_toe
import Quick
import Nimble

class GameTests: QuickSpec {
    override func spec() {
        
        var game : Game! = PlayerVsPlayer()

        
        beforeEach() {
            game = PlayerVsPlayer()
        }
        
        describe("Game") {
            
            it("can get the correct marker if it's player 1's turn") {
                game.isXTurn = true
                let playerMarker = game.getCurrentPlayerMarkerText()
            
                expect(playerMarker).to(equal(Marker(rawValue: "X")!))
            }

            it("can get the correct marker if it's player 2's turn") {
                game.isXTurn = false
                let playerMarker = game.getCurrentPlayerMarkerText()
                
                expect(playerMarker).to(equal(Marker(rawValue: "O")!))
            }

            it ("can record moves made in the board array") {
                game.updateBoard(3)
                expect(game.board.asArray()).to(equal(["","","","X","","","","",""]))
            }

            it ("can check if the game is over") {
                game.status = Status.player1Wins
                expect(game.isOver()).to(beTrue())
                
                game.status = Status.tie
                expect(game.isOver()).to(beTrue())
                
                game.status = Status.inProgress
                expect(game.isOver()).to(beFalse())
            }

            it("returns text that includes the Player 1's name") {
                game.isXTurn = true
                let nextPlayerText = game.getTurnMessage()
                expect(nextPlayerText).to(contain(UIConfig.player1))
            }

            it("returns text that includes the Player 2's name") {
                game.isXTurn = false
                let nextPlayerText = game.getTurnMessage()
                expect(nextPlayerText).to(contain(UIConfig.player2))
            }

            
            it("returns 'Your turn!' if it is the human player's turn") {
                game = PlayerVsComputer()
                let nextPlayerText = game.getTurnMessage()
                expect(nextPlayerText).to(equal(UIConfig.playerTurnMessage))
                
            }

            it("returns 'Computer's turn!' if it is the computer player's turn" ) {
                game = PlayerVsComputer()
                game.isXTurn = false
                let nextPlayerText = game.getTurnMessage()
                expect(nextPlayerText).to(equal(UIConfig.computerTurnMessage))
            }
        }
    }
}
