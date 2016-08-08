import UIKit
import Foundation
public class BoardStackView: UIStackView, BoardView {
    
    public func show(board board: [String]) {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                setSpotToMarker(btn, marker: board[btn.tag])
            }
        }
    }
    
    public func clearSpots() {
        for view in self.subviews{
           for button in view.subviews {
                let btn = button as! UIButton
                btn.setTitle("", forState: .Normal)
                btn.enabled = true
            }
        }
    }
    
    public func setSpotToMarker(button: UIButton, marker: String) {
        button.titleLabel?.font = UIFont(name: UIConfig.defaultfont, size: 50)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        if (marker == "X") {
            button.enabled = false
            button.setTitleColor(UIConfig.player1Color, forState: .Normal)
            button.setTitle(UIConfig.player1, forState: .Normal)
        } else if marker == "O"{
            button.enabled = false
            button.setTitleColor(UIConfig.player2Color, forState: .Normal)
            button.setTitle(UIConfig.player2, forState: .Normal)
        } else {
            
        }
    }
    
    public func getImageForMarker(marker: String) -> UIImage?{
        return UIImage(named: "letter-\(marker.lowercaseString)")
    }
    
    public func disableSpots() {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                btn.enabled = false
            }
        }

    }
    
    public func enableSpots() {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                if (btn.titleLabel?.text == nil || btn.titleLabel?.text == ""){
                    btn.enabled = true
                }
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