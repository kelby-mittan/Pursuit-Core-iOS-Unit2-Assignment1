//
//  TicTacToeBrain.swift
//  two-tic-tac-toe
//
//  Created by Kelby Mittan on 11/1/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    
    
    var buttonTracker = [UIButton]()
    var tagNumberTracker = [Int]()
    var keepGoing = true
    
  
    
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
    
    let beX = "x"
    let beO = "o"
    
    
    func assignO(_ button: UIButton) {
        button.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
        playerTurn = "x"
        button.isEnabled = false
        button.adjustsImageWhenDisabled = false
    }
    
    func assignXorOtoButtons(_ button: UIButton) {
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
    
    
     
    
    func randomComputerGame(_ button: UIButton,_ buttons: [UIButton], _ playerX: Bool) {
        if playerX {
            if gameStatus[button.tag] == "" {
            gameStatus[button.tag] = playerTurn
            button.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
            button.isEnabled = false
            button.adjustsImageWhenDisabled = false
            tagNumberTracker.append(button.tag)
            
            repeat {
                for randomButton in buttons.shuffled() {
                    if gameStatus[randomButton.tag] == "" {
                        randomButton.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
                        randomButton.isEnabled = false
                        randomButton.adjustsImageWhenDisabled = false
                        gameStatus[randomButton.tag] = "o"
                        tagNumberTracker.append(randomButton.tag)
                        keepGoing = false
                        break
                    }
                }
                print(gameStatus)
            } while keepGoing == true
            }
        } else {
                if gameStatus[button.tag] == "" {
                    gameStatus[button.tag] = playerTurn
                    button.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
                    button.isEnabled = false
                    button.adjustsImageWhenDisabled = false
                    tagNumberTracker.append(button.tag)
                    
                    repeat {
                        for randomButton in buttons.shuffled() {
                            if gameStatus[randomButton.tag] == "" {
                                randomButton.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
                                randomButton.isEnabled = false
                                randomButton.adjustsImageWhenDisabled = false
                                gameStatus[randomButton.tag] = "x"
                                tagNumberTracker.append(randomButton.tag)
                                keepGoing = false
                                break
                            }
                        }
                        print(gameStatus)
                    } while keepGoing == true
                }
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
                case 1:
                if gameStatus[0] == "x" {
                    assignO(gameButtons[2])
                } else if gameStatus[2] == "x" {
                    assignO(gameButtons[0])
                }
                case 2:
                    if gameStatus[1] == "x" {
                        assignO(gameButtons[0])
                    } else if gameStatus[0] == "x" {
                        assignO(gameButtons[1])
                    }
                case 3:
                    if gameStatus[0] == "x" {
                        assignO(gameButtons[2])
                    } else if gameStatus[2] == "x" {
                        assignO(gameButtons[0])
                    }
                default:
                    assignO(gameButtons[4])
                }
            }
        }
    }
    
    
    func checkForWinner() {
        for array in winningArr {
            if gameStatus[array[0]] != "" && gameStatus[array[0]] == gameStatus[array[1]] && gameStatus[array[1]] == gameStatus[array[2]] {
                gameOver = true
                if gameStatus[array[0]] == "x" {
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


