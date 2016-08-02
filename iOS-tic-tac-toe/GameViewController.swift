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
        interactor.completeTurn()
    }
}