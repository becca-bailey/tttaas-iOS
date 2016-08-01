import iOS_tic_tac_toe
import Foundation
import Quick
import Nimble

class BoardStackViewTests: QuickSpec {
    override func spec() {
        var boardView: BoardStackView!
        beforeEach() {
            boardView = BoardStackView()
        }
        describe("BoardStackView") {
            
            it ("can disable all buttons on the board") {
                boardView.spotsEnabled(false)
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it("can prevent a player from playing again on the same spot") {
                expect(self.buttonsEnabled(boardView, enabled: true)).to(beTrue())
                
                boardView.show(board:["X","X","O","X","O","X","O","X","X"])
                
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it("can resize the image to the size of a button") {
                let button = UIButton()
                let oMarker = UIImage(named: "letter-o")!
                button.frame = CGRectMake(0, 0, 100, 100)
                let resizedImage = boardView.scaleImage(oMarker, button: button)

                expect(oMarker.size.height).toNot(equal(100))
                expect(oMarker.size.width).toNot(equal(100))
                expect(resizedImage.size.height).to(equal(100))
                expect(resizedImage.size.width).to(equal(100))
            }
        }
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
}