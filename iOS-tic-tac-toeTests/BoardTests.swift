import iOS_tic_tac_toe
import Quick
import Nimble

class BoardSpec: QuickSpec {
    override func spec() {
        var board = Board()
        
        beforeEach() {
            board = Board()
        }
        
        describe("Board") {
            
            it("stores values as an array") {
                expect(board.asArray()).to(equal(["", "", "", "", "", "", "", "", ""]))
            }
            
            it("can set a spot to a marker") {
                board.setSpot(0, marker: Marker(rawValue: "X")!)
                expect(board.asArray()).to(equal(["X", "", "", "", "", "", "", "", ""]))
            }
            
            it("can reset its values") {
                board.setSpot(0, marker: Marker(rawValue: "X")!)
                expect(board.asArray()).to(equal(["X", "", "", "", "", "", "", "", ""]))

                board.clear()
                expect(board.asArray()).to(equal(["", "", "", "", "", "", "", "", ""]))
            }
            
            it("can get the board as params") {
                let expectedParams = "?board=%5B%22%22%2C%20%22%22%2C%20%22%22%2C%20%22%22%2C%20%22%22%2C%20%22%22%2C%20%22%22%2C%20%22%22%2C%20%22%22%5D"
                expect(board.asParams()).to(equal(expectedParams))
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
}