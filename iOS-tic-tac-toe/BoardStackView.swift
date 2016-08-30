import UIKit
import Foundation
public class BoardStackView: UIStackView, BoardView {
    
    public func setSpotToMarker(button: UIButton, marker: Marker) {
        button.titleLabel?.font = UIFont(name: UIConfig.defaultfont, size: 50)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        if (marker != Marker.empty) {
            button.enabled = false
            self.placeMarker(button, marker: marker);
        }
    }
    
    public func placeMarker(button: UIButton, marker: Marker) {
        if (marker == Marker.X) {
            button.setTitleColor(UIConfig.player1Color, forState: .Normal)
            button.setTitle(UIConfig.player1, forState: .Normal)
        } else if (marker == Marker.O) {
            button.setTitleColor(UIConfig.player2Color, forState: .Normal)
            button.setTitle(UIConfig.player2, forState: .Normal)
        }
    }
    
    public func show(board board: [String]) {
        onEachButton({(btn: UIButton) -> () in
            self.setSpotToMarker(btn, marker: Marker(rawValue: board[btn.tag])!)
        })
    }
    
    public func clearSpots() {
        onEachButton({(btn: UIButton) -> () in
            btn.setTitle("", forState: .Normal)
            btn.enabled = true
        })
    }
    
    public func disableSpots() {
        onEachButton({(btn: UIButton) -> () in
            btn.enabled = false
        })
    }
    
    public func enableSpots() {
        onEachButton({(btn: UIButton) -> () in
            if (btn.titleLabel?.text == nil || btn.titleLabel?.text == ""){
                btn.enabled = true
            }
        })
    }
    
    
    public func onEachButton(function: UIButton -> ()) {
        for view in self.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                function(btn);
            }
        }
    }
}