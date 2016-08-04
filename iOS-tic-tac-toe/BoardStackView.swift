import Foundation
import UIKit

public class BoardStackView: UIStackView, BoardView {
    
//    public func show(board board: [String]) {
//        for view in self.subviews{
//            for button in view.subviews {
//                let btn = button as! UIButton
//                if let image = getImageForMarker(board[btn.tag]) {
//                    btn.enabled = false
//                    btn.setBackgroundImage(scaleImage(image, button: btn), forState: .Normal)
//                }
//            }
//        }
//    }
    
    public func show(board board: [String]) {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                setSpotToMarker(btn, marker: board[btn.tag])
            }
        }
    }
    
    public func setSpotToMarker(button: UIButton, marker: String) {
        button.titleLabel?.font = UIFont(name: "PingFangTC-Regular", size: 50)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        if (marker == "X") {
            button.enabled = false
            button.setTitle(UIConfig.player1, forState: .Normal)
        } else if marker == "O"{
            button.enabled = false
            button.setTitle(UIConfig.player2, forState: .Normal)
        } else {
            
        }
    }
    
    public func getImageForMarker(marker: String) -> UIImage?{
        return UIImage(named: "letter-\(marker.lowercaseString)")
    }
    
    public func spotsEnabled(enabled: Bool) {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                btn.enabled = enabled
            }
        }
    }
    
    public func scaleImage(image: UIImage, button:UIButton) -> UIImage {
        let newSize = CGSizeMake(button.frame.width, button.frame.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    


}