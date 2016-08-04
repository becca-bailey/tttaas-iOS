import Foundation

@objc public protocol BoardView {
    func show(board board: [String])
    func spotsEnabled(enabled: Bool)
    func clearSpots()
}