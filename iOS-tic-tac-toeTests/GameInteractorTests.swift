import iOS_tic_tac_toe
import Quick
import Nimble

class GameInteractorTests: QuickSpec {
    override func spec() {
        var gameInteractor: GameInteractor!
        var mockBoardView: MockBoardView!
        var mockStatusView: MockStatusView!
        var mockIndicatorView: MockIndicatorView!
        var mockHTTPClient: MockHTTPClient!
        
        beforeEach() {
            mockBoardView = MockBoardView()
            mockStatusView = MockStatusView()
            mockIndicatorView = MockIndicatorView()
            mockHTTPClient = MockHTTPClient(board: ["X", "O", "", "", "", "", "", "", ""], status: "in progress")
            gameInteractor = DefaultGameInteractor(boardView: mockBoardView, statusView: mockStatusView, indicatorView: mockIndicatorView, httpClient: mockHTTPClient)
            gameInteractor.game = PlayerVsPlayer()
        }
        
        describe("GameInteractor") {
            
            it("can start a game") {
                let game = PlayerVsPlayer()
                gameInteractor.startGame(game)
                expect(mockStatusView.statusMessage).to(equal(game.getTurnMessage()))
                expect(gameInteractor.game).to(be(game))
            }
            
            it("making a move sends a request") {
                gameInteractor.makeMove(0)
                expect(mockHTTPClient.requestMade).to(beTrue())
            }
            
            it("can make a move and update the game with the response") {
                gameInteractor.makeMove(1)
                expect(gameInteractor.game.board.asArray()).to(equal(["X", "O", "", "", "", "", "", "", ""]))
            }
            
            it("can make a move and update the game with the response and show it") {
                gameInteractor.makeMove(1)
                expect(mockBoardView.visibleBoard).to(equal(["X", "O", "", "", "", "", "", "", ""]))
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
                
                expect(mockStatusView.statusMessage).to(contain("'s Turn!"))
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
                expect(mockStatusView.statusMessage).to(contain(UIConfig.player2))
            }
            
            it("can create JSON for us") {
                let json = gameInteractor.createJSONRequestBody(gameInteractor.game)
                expect(json).to(equal("{\"board\": [\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"], \"gameType\": humanVsHuman}"))
            }
            
            it("stops the spinner when a turn is completed") {
                gameInteractor.completeTurn()
                
                expect(mockIndicatorView.spinnerStopped).to(beTrue())
            }
            
            it("can reset the game") {
                let game = PlayerVsPlayer()
                gameInteractor.resetGame(game)
                
                expect(mockStatusView.statusMessage).to(equal(game.getTurnMessage()))
                expect(game.board.asArray()).to(equal(["", "", "", "", "", "", "", "", ""]))

            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
}

