import iOS_tic_tac_toe
import Quick
import Nimble

class GameInteractorTests: QuickSpec {
    override func spec() {
        var gameInteractor: DefaultGameInteractor!
        var mockBoardView: MockBoardView!
        var mockStatusView: MockStatusView!
        var mockIndicatorView: MockIndicatorView!
        
        beforeEach() {
            mockBoardView = MockBoardView()
            mockStatusView = MockStatusView()
            mockIndicatorView = MockIndicatorView()
            gameInteractor = DefaultGameInteractor(boardView: mockBoardView, statusView: mockStatusView, indicatorView: mockIndicatorView)
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
                gameInteractor.game.status = Status.player1Wins
                gameInteractor.endGame()
                
                expect(mockStatusView.statusMessage).to(contain("wins!"))
            }
            
            it("changes the label at the end of the game if the game is over and X Wins") {
                gameInteractor.game.isXTurn = true
                gameInteractor.game.status = Status.player1Wins
                gameInteractor.completeTurn()
                
                expect(mockStatusView.statusMessage).to(contain("wins!"))
            }
            
            it("changes the label to the next turn if the game is not over") {
                gameInteractor.game.isXTurn = true
                gameInteractor.game.status = Status.inProgress
                gameInteractor.completeTurn()
                
                expect(mockStatusView.statusMessage).to(equal("Player 2's Turn!"))
            }
            
            it("changes the label at the end of the game if O wins") {
                gameInteractor.game.isXTurn = false
                gameInteractor.game.status = Status.player2Wins
                gameInteractor.endGame()
                
                expect(mockStatusView.statusMessage).to(contain("wins!"))
            }
            
            it("disables the buttons at the end of the game") {
                gameInteractor.game.status = Status.player2Wins
                gameInteractor.endGame()
                
                expect(mockBoardView.spotsEnabled).to(beFalse())
            }
            
            it("changes the label for the next player") {
                gameInteractor.game.isXTurn = true
                
                gameInteractor.nextTurn()
                expect(mockStatusView.statusMessage).to(contain("Player 2"))
            }
            
            it("indicates that a move is in progress") {
                gameInteractor.makeMove(0)
                
                expect(mockIndicatorView.spinnerStarted).to(beTrue())
            }
            
            it("stops the spinner when a turn is completed") {
                gameInteractor.completeTurn()
                
                expect(mockIndicatorView.spinnerStopped).to(beTrue())
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
    
}

