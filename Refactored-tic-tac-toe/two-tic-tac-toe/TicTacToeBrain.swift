//
//  TicTacToeBrain.swift
//  two-tic-tac-toe
//
//  Created by Kelby Mittan on 11/1/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    
    var gameStatus = ["","","","","","","","",""]
    var playerTurn = "x"
    let winningArr = [[0,1,2], // row 1
                      [3,4,5], // row 2
                      [6,7,8], // row 3
                      [0,3,6], // col 1
                      [1,4,7], // col 2
                      [2,5,8], // col 3
                      [0,4,8], // diag 1
                      [2,4,6]] // diag 2
    var gameOver = false
    var whoWon = ""
    var twoPlayerBool = false
    var playCompBool = false
//    var buttons = [UIButton]()
    
    func assignO(_ button: UIButton) {
        button.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
        playerTurn = "x"
        button.isEnabled = false
        button.adjustsImageWhenDisabled = false
    }
    
    func assignButtons(_ button: UIButton) {
        if gameStatus[button.tag] == "" {
            gameStatus[button.tag] = playerTurn
            if playerTurn == "x" {
                button.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
                playerTurn = "o"
                button.isEnabled = false
                button.adjustsImageWhenDisabled = false
            } else {
                button.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
                playerTurn = "x"
                button.isEnabled = false
                button.adjustsImageWhenDisabled = false
            }
        }
    }
    
    func assignComp(_ button: UIButton,_ buttons: [UIButton]) {
//        var varButtons = buttons
        let randomButton = buttons.randomElement()!
        
        if gameStatus[button.tag] == "" {
            gameStatus[button.tag] = playerTurn
            if playerTurn == "x" {
                gameStatus[randomButton.tag] = "o"
                button.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
                button.isEnabled = false
                button.adjustsImageWhenDisabled = false
            
                randomButton.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
                randomButton.isEnabled = false
                randomButton.adjustsImageWhenDisabled = false
            
                
                print(gameStatus)
            }
//            varButtons.removeAll { (button) -> Bool in
//                button == randomButton
//            }
            
        }
    }
    
    func smartComp(_ button: UIButton, _ gameButtons: [UIButton]) {
        if gameStatus[button.tag] == "" {
        gameStatus[button.tag] = playerTurn
            if playerTurn == "x" {
                button.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
                playerTurn = "x"
                button.isEnabled = false
                button.adjustsImageWhenDisabled = false
                switch button.tag {
                case 0:
                    if gameStatus[1] == "x" {
                        assignO(gameButtons[2])
                    } else if gameStatus[2] == "x" {
                        assignO(gameButtons[1])
                    }
                default:
                    assignO(gameButtons[4])
                }
            }
        }
    }
    
//    func playComp(_ button: UIButton) {
//        let randomButton = buttons.randomElement()!
////        if gameStatus[button.tag] == "" {
////            gameStatus[button.tag] = playerTurn
////            if playerTurn == "x" {
//                button.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
//                button.isEnabled = false
//                button.adjustsImageWhenDisabled = false
//                randomButton.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
//                randomButton.isEnabled = false
//                buttons.removeAll { (button) -> Bool in
//                    button.isEnabled == false
////                }
//            }
////        }
//    }
    
    func checkForWinner(_ button: UIButton) {
        for arr in winningArr {
            if gameStatus[arr[0]] != "" && gameStatus[arr[0]] == gameStatus[arr[1]] && gameStatus[arr[1]] == gameStatus[arr[2]] {
                gameOver = true
                if gameStatus[arr[0]] == "x" {
                    whoWon = "Player X wins!!!"
                } else {
                    whoWon = "Player O wins!!!"
                }
            }
        }
    }
    
    func gameIsOver(_ gameOver: Bool, _ buttons: [UIButton]) -> String {
        var winnerLabel = ""
        if gameOver {
            winnerLabel = whoWon
            for button in buttons {
                button.isEnabled = false
            }
        }
        return winnerLabel
    }
    
    func allButtonsDisabled(_ buttons: [UIButton]) -> Bool {
        var disabledButtonArr = [Bool]()
        var itsATie = Bool()
        for button in buttons {
            if button.isEnabled == false {
                disabledButtonArr.append(true)
            }
        }
        if disabledButtonArr.count == 9 {
            itsATie = true
        }
        return itsATie
    }
    
    
}

