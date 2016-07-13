//
//  podsTestTests.swift
//  podsTestTests
//
//  Created by Becca Nelson on 7/13/16.
//  Copyright © 2016 8th Light. All rights reserved.
//

@testable import iOS_tic_tac_toe
import Quick
import Nimble

class GameViewControllerSpec: QuickSpec {
    override func spec() {
        describe("GameViewController") {
            
            let gameController = GameViewController()
            
            let xMarker = UIImage(named: "letter-x")!
            let oMarker = UIImage(named: "letter-o")!
            let button = UIButton()
            
            it("can set the buttons background image") {
                button.frame = CGRectMake(0, 0, xMarker.size.width, xMarker.size.height)
                gameController.setSpotToMarker(xMarker, button: button)
                
                expect(button.currentBackgroundImage!).to(equal(xMarker))
            }
            
            it("can resize the image to the size of a button") {
                button.frame = CGRectMake(0, 0, 100, 100)
                let resizedImage = gameController.scaleImage(oMarker, button: button)
                
                expect(oMarker.size.height).toNot(equal(100))
                expect(oMarker.size.width).toNot(equal(100))
                expect(resizedImage.size.height).to(equal(100))
                expect(resizedImage.size.width).to(equal(100))
            }
            
            it("can get the correct marker if it's player 1's turn") {
                let xTurn = true
                let playerMarker = gameController.getCurrentPlayerMarker(xTurn)
                
                expect(playerMarker).to(equal(xMarker))
            }
            
            it("can get the correct marker if it's player 2's turn") {
                let xTurn = false
                let playerMarker = gameController.getCurrentPlayerMarker(xTurn)
                
                expect(playerMarker).to(equal(oMarker))
            }
            
            it("can prevent a player from playing again on the same spot") {
                expect(button.enabled).to(beTrue())
                gameController.disableBoardSpot(button)
                
                expect(button.enabled).to(beFalse())
                button.enabled = true
            }
            
            it ("can display the current player") {
                
            }
            
            it ("can clear a board") {
                let xButton = UIButton()
                xButton.setBackgroundImage(xMarker, forState: .Normal)
                let boardRowView = self.createBoardElement(button)
                let boardView = self.createBoardElement(boardRowView)
                
                gameController.clearBoard(boardView)
                
                for view in boardView.subviews{
                    for button in view.subviews {
                        let btn = button as! UIButton
                        expect(btn.currentBackgroundImage).to(beNil())
                    }
                }
            }
            
            it("returns text that includes the Player 1's name") {
                let xTurn = true
                let nextPlayerText = gameController.getPlayerLabel(xTurn)
                expect(nextPlayerText).to(contain("Player 1"))
            }
            
            it("returns text that includes the Player 2's name") {
                let xTurn = false
                let nextPlayerText = gameController.getPlayerLabel(xTurn)
                expect(nextPlayerText).to(contain("Player 2"))
            }
            
            it ("can set a label to include the current player's name") {
                let playerLabel = UILabel()
                playerLabel.text = ""
                
                gameController.setPlayerLabel(playerLabel, xTurn: true)
                
                expect(playerLabel.text).to(contain("Player 1"))
            }
            
            it("needs this at the bottom") {
                expect(true).to(equal(true))
            }
        }
    }
    
    func createBoardElement(boardObject: UIView) -> UIStackView {
        let boardView = UIStackView()
        for _ in 0..<3 {
            boardView.addSubview(boardObject)
        }
        return boardView
    }
    
}

