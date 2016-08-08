import UIKit

public class GameViewController: UIViewController {

    public var interactor : GameInteractor!
    
    @IBOutlet public weak var statusView: StatusView!
    @IBOutlet public weak var boardView: BoardView!
    @IBOutlet weak var indicatorView: IndicatorView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        interactor = DefaultGameInteractor(
            boardView: boardView,
            statusView: statusView,
            indicatorView: indicatorView)
        
        interactor.startGame(GameConfig.game)
        
    }

    @IBAction public func makeMove(sender: UIButton) {
        interactor.makeMove(sender.tag)
    }
    
    override public func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override public func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if (motion == .MotionShake) {
            interactor.warnReset()
        }
    }
    
    override public func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if (motion == .MotionShake) {
            interactor.resetGame(GameConfig.game)
        }
    }
}