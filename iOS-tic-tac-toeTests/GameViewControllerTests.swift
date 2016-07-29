import iOS_tic_tac_toe
import Quick
import Nimble

class GameViewControllerSpec: QuickSpec {
    override func spec() {
        let gameController = GameViewController()
        
        let xMarker = UIImage(named: "letter-x")!
        let oMarker = UIImage(named: "letter-o")!
        let button = UIButton()

        describe("GameViewController") {
            
            it("can set the buttons background image") {
                button.frame = CGRectMake(0, 0, xMarker.size.width, xMarker.size.height)
                gameController.setSpotToMarker(xMarker, button: button)
                
                expect(button.currentBackgroundImage!).to(equal(xMarker))
            }
            
            it("can resize the image to the size of a button") {
                button.frame = CGRectMake(0, 0, 100, 100)
                let resizedImage = gameController.scaleImage(oMarker, button: button)
                
                expect(oMarker.size.height).toNot(equal(100))
                expect(oMarker.size.width).toNot(equal(100))
                expect(resizedImage.size.height).to(equal(100))
                expect(resizedImage.size.width).to(equal(100))
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
            
            it("can prevent a player from playing again on the same spot") {
                expect(button.enabled).to(beTrue())
                gameController.disableBoardSpot(button)
                
                expect(button.enabled).to(beFalse())
                button.enabled = true
            }
            
            it ("can set a label to include the current player's name") {
                let playerLabel = UILabel()
                playerLabel.text = ""
                
                gameController.setPlayerLabel(playerLabel, xTurn: true)
                
                expect(playerLabel.text).to(contain("Player 1"))
            }
            
            it ("can record moves made in the board array") {
                gameController.getUpdatedBoardArray(3)
                expect(gameController.boardArray).to(equal(["","","","X","","","","",""]))
            }
            
            it ("can disable all buttons on the board") {
                let boardView = self.getFullBoardView()
                gameController.spotsEnabled(boardView, enabled: false);
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it ("can check if the game is over") {
                let winStatus = Status.win
                let tieStatus = Status.tie
                let inProgressStatus = Status.inProgress
                expect(gameController.gameIsOver(winStatus)).to(beTrue())
                expect(gameController.gameIsOver(tieStatus)).to(beTrue())
                expect(gameController.gameIsOver(inProgressStatus)).to(beFalse())
            }
            
//            it ("returns empty string if checkGameStatus receives invalid input") {
//                let serverResponseData: NSData? = nil
//                expect(gameController.getGameStatus(serverResponseData)).to(equal(""))
//            }
        
            
            it("changes the label at the end of the game") {
                let label = UILabel()
                label.text = "test"
                let boardView = self.getFullBoardView()
                gameController.endGame(boardView, gameLabel: label, status: Status.win)
                
                expect(label.text).toNot(equal("test"))
            }
            
            it("disables the buttons at the end of the game") {
                let label = UILabel()
                let boardView = self.getFullBoardView()
                gameController.endGame(boardView, gameLabel: label, status: Status.win)
                
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it("changes the label for the next player") {
                gameController.xTurn = true
                let label = UILabel()
                label.text = "test"
                let boardView = self.getFullBoardView()
                gameController.nextTurn(boardView, gameLabel: label)
                
                expect(label.text).to(contain("Player 2"))
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
    
    func createBoardElement(boardObject: UIView) -> UIStackView {
        let boardView = UIStackView()
        for _ in 0..<3 {
            boardView.addSubview(boardObject)
        }
        return boardView
    }
    
    func buttonsEnabled(boardView: UIStackView, enabled: Bool) -> Bool {
        for view in boardView.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                if (btn.enabled != enabled) {
                    return false
                }
            }
        }
        return true
    }
    
    func getFullBoardView() -> UIStackView {
        let xMarker = UIImage(named: "letter-x")!
        let xButton = UIButton()
        xButton.setBackgroundImage(xMarker, forState: .Normal)
        let boardRowView = self.createBoardElement(xButton)
        let boardView = self.createBoardElement(boardRowView)
        return boardView
    }    
}

