import Foundation

@objc public protocol BoardView {
    func show(board board: [String])
    func enableSpots()
    func disableSpots()
    func clearSpots()
}