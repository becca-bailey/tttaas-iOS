import UIKit

public class ActivityIndicatorView: UIActivityIndicatorView, IndicatorView {
    
    public func moveInProgress() {
        self.startAnimating()
        self.alpha = 1.0
    }
    
    public func moveDone() {
        self.stopAnimating()
        self.alpha = 0.0
    }
    
}
