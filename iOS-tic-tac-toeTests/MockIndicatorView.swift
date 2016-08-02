import iOS_tic_tac_toe
import Foundation

public class MockIndicatorView: NSObject, IndicatorView {
    public var spinnerStarted = false
    public var spinnerStopped = false
    
    public func moveInProgress() {
        spinnerStarted = true
    }
    
    public func moveDone() {
        spinnerStopped = true
    }
}
