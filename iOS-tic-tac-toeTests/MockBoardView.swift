import iOS_tic_tac_toe
import Foundation

class MockBoardView: NSObject, BoardView {
    var visibleBoard = [String]()
    var spotsEnabled = true
    
    func show(board board: [String]) {
        visibleBoard = board
    }
    
    func enableSpots() {
        spotsEnabled = true
    }
    
    func disableSpots() {
        spotsEnabled = false
    }
    
    func clearSpots() {
        visibleBoard = [String]()
    }
}
