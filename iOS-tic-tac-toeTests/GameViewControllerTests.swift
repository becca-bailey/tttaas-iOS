import iOS_tic_tac_toe
import Quick
import Nimble

class GameViewControllerSpec: QuickSpec {
    override func spec() {
        var gameController: GameViewController!
        var mockBoardView: MockBoardView!
        var mockStatusView: MockStatusView!
        let xMarker = UIImage(named: "letter-x")!
        let oMarker = UIImage(named: "letter-o")!
        let button = UIButton()
        
        beforeEach() {
            mockBoardView = MockBoardView()
            mockStatusView = MockStatusView()
            gameController = GameViewController()
            gameController.boardView = mockBoardView
            gameController.statusView = mockStatusView
        }

        describe("GameViewController") {
            
            it("can set the buttons background image") {
                button.frame = CGRectMake(0, 0, xMarker.size.width, xMarker.size.height)
                gameController.setSpotToMarker(xMarker, button: button)
                
                expect(button.currentBackgroundImage!).to(equal(xMarker))
            }
            
            it("can get the correct marker if it's player 1's turn") {
                let xTurn = true
                let playerMarker = gameController.getCurrentPlayerMarker(xTurn)
                
                expect(playerMarker).to(equal(xMarker))
            }
            
            it("can get the correct marker if it's player 2's turn") {
                let xTurn = false
                let playerMarker = gameController.getCurrentPlayerMarker(xTurn)
                
                expect(playerMarker).to(equal(oMarker))
            }
            
            it ("can record moves made in the board array") {
                gameController.getUpdatedBoardArray(3)
                expect(gameController.boardArray).to(equal(["","","","X","","","","",""]))
            }
            
            it ("can check if the game is over") {
                let winStatus = Status.win
                let tieStatus = Status.tie
                let inProgressStatus = Status.inProgress
                expect(gameController.gameIsOver(winStatus)).to(beTrue())
                expect(gameController.gameIsOver(tieStatus)).to(beTrue())
                expect(gameController.gameIsOver(inProgressStatus)).to(beFalse())
            }
            
            it("changes the label at the end of the game if X wins") {
                gameController.xTurn = true
                gameController.endGame(Status.win)
                
                expect(mockStatusView.statusMessage).to(equal("X wins!"))
            }
            
            it("changes the label at the end of the game if O wins") {
                gameController.xTurn = false
                gameController.endGame(Status.win)
                
                expect(mockStatusView.statusMessage).to(equal("O wins!"))
            }
            
            it("disables the buttons at the end of the game") {
                gameController.endGame(Status.win)
                
                expect(mockBoardView.spotsEnabled).to(beFalse())
            }
            
            it("changes the label for the next player") {
                gameController.xTurn = true
                
                gameController.nextTurn()
                expect(mockStatusView.statusMessage).to(contain("Player 2"))
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
       
}

