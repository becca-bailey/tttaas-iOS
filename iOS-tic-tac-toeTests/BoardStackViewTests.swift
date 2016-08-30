import iOS_tic_tac_toe
import Quick
import Nimble

class BoardStackViewTests: QuickSpec {
    override func spec() {
        var boardView: BoardStackView!
        
        beforeEach() {
            boardView = BoardStackView()
            self.populateBoardView(boardView)
        }
        describe("BoardStackView") {
            
            it ("can disable all buttons on the board") {
                boardView.disableSpots()
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it("can enable all of the spots") {
                boardView.enableSpots()
                expect(self.buttonsEnabled(boardView, enabled: true)).to(beTrue())
            }
            
            it("can enable only the empty spots") {
                boardView.disableSpots()
                boardView.show(board: ["X","X","","","","O","","",""])
                boardView.enableSpots()
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it("can prevent a player from playing again on the same spot") {
                expect(self.buttonsEnabled(boardView, enabled: true)).to(beTrue())
                
                boardView.show(board:["X","X","O","X","O","X","O","X","X"])
                
                expect(self.buttonsEnabled(boardView, enabled: false)).to(beTrue())
            }
            
            it("can clear the board") {
                boardView.clearSpots()
                for view in boardView.subviews{
                    for button in view.subviews {
                        let btn = button as! UIButton
                        expect(btn.titleLabel?.text).to(beNil())
                    }
                }
            }
        }
    }
    
    func populateBoardView(boardView: UIStackView) {
        let buttonSubView = UIStackView()
        for _ in 0...2{
            buttonSubView.addSubview(UIButton())
        }
        
        for _ in 0...2{
            boardView.addSubview(buttonSubView)
        }
    }
    
    func buttonsEnabled(boardView: UIStackView, enabled: Bool) -> Bool {
        let boardView = boardView
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