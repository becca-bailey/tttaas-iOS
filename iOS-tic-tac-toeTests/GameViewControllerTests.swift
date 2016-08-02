import iOS_tic_tac_toe
import Quick
import Nimble

class GameViewControllerSpec: QuickSpec {
    override func spec() {
        var gameController: GameViewController!
        var mockInteractor: MockInteractor!
        
        beforeEach() {
            mockInteractor = MockInteractor(boardView: MockBoardView(), statusView: MockStatusView())
            gameController = GameViewController()
            gameController.interactor = mockInteractor
        }

        describe("GameViewController") {
            
            it ("can take a button and update the game") {
                let button = UIButton()
                button.tag = 3
                gameController.makeMove(button)
                expect(mockInteractor.moveMade).to(equal(3))
            }
            
            it ("can complete the turn") {
                let button = UIButton()
                button.tag = 3
                expect(mockInteractor.turnCompleted).to(beFalse())
                gameController.makeMove(button)
                expect(mockInteractor.turnCompleted).to(beTrue())
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
       
}

