import UIKit

public class ActivityIndicatorView: UIActivityIndicatorView, IndicatorView {
    public func moveInProgress() {
        self.startAnimating()
    }
    
    public func moveDone() {
        self.stopAnimating()
    }
    
}
