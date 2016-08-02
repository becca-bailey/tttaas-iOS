import iOS_tic_tac_toe
import Quick
import Nimble

class GameInteractorTests: QuickSpec {
    override func spec() {
        var gameInteractor: DefaultGameInteractor!
        var mockBoardView: MockBoardView!
        var mockStatusView: MockStatusView!
        
        beforeEach() {
            mockBoardView = MockBoardView()
            mockStatusView = MockStatusView()
            gameInteractor = DefaultGameInteractor(boardView: mockBoardView, statusView: mockStatusView)
            gameInteractor.game = PlayerVsPlayer()
        }
        
        describe("DefaultGameInteractor") {
            
            it("can start a game") {
                let game = PlayerVsPlayer()
                gameInteractor.startGame(game)
                expect(mockStatusView.statusMessage).to(equal(game.getTurnMessage()))
                expect(gameInteractor.game).to(be(game))
            }
            
            it("changes the label at the end of the game if X wins") {
                gameInteractor.game.isXTurn = true
                gameInteractor.game.status = Status.win
                gameInteractor.endGame()
                
                expect(mockStatusView.statusMessage).to(equal("X wins!"))
            }
            
            it("changes the label at the end of the game if the game is over and X Wins") {
                gameInteractor.game.isXTurn = true
                gameInteractor.game.status = Status.win
                gameInteractor.completeTurn()
                
                expect(mockStatusView.statusMessage).to(equal("X wins!"))
            }
            
            it("changes the label to the next turn if the game is not over") {
                gameInteractor.game.isXTurn = true
                gameInteractor.game.status = Status.inProgress
                gameInteractor.completeTurn()
                
                expect(mockStatusView.statusMessage).to(equal("Player 2's Turn!"))
            }
            
            it("changes the label at the end of the game if O wins") {
                gameInteractor.game.isXTurn = false
                gameInteractor.game.status = Status.win
                gameInteractor.endGame()
                
                expect(mockStatusView.statusMessage).to(equal("O wins!"))
            }
            
            it("disables the buttons at the end of the game") {
                gameInteractor.game.status = Status.win
                gameInteractor.endGame()
                
                expect(mockBoardView.spotsEnabled).to(beFalse())
            }
            
            it("changes the label for the next player") {
                gameInteractor.game.isXTurn = true
                
                gameInteractor.nextTurn()
                expect(mockStatusView.statusMessage).to(contain("Player 2"))
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
    
}

