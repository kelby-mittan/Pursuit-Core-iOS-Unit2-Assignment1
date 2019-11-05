//
//  ViewController.swift
//  two-tic-tac-toe
//
//  Created by Kelby Mittan on 11/1/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var xOButtons: [UIButton]!
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var winnersLabel: UILabel!
    @IBOutlet weak var twoPlayerButton: UIButton!
    @IBOutlet weak var playVsCompButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in xOButtons {
            button.isEnabled = false
        }
        twoPlayerButton.layer.cornerRadius = 10
        playVsCompButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 15
    }
    var brain = TicTacToeBrain()
    
    @IBAction func twoPlayerAction(_ sender: UIButton) {
        for button in xOButtons {
            button.isEnabled = true
        }
        brain.twoPlayerBool = true
        brain.playCompBool = false
        playerOneLabel.text = "Go Player \"X\""
    }
    @IBAction func playVsCompAction(_ sender: UIButton) {
        for button in xOButtons {
            button.isEnabled = true
        }
        brain.playCompBool = true
        brain.twoPlayerBool = false
        playerOneLabel.text = "Go Player \"X\""
    }
    
    func pickXCompO(_ button: UIButton) {
        brain.playerTurn = "x"
        let randomButton = xOButtons.randomElement()!
        button.setBackgroundImage(UIImage(named: "xImage"), for: .normal)
        button.isEnabled = false
//        playerTurn.text = ""
        randomButton.setBackgroundImage(UIImage(named: "oImage"), for: .normal)
        randomButton.isEnabled = false
        xOButtons.removeAll { (button) -> Bool in
            button.isEnabled == false
        }
    }
    
    @IBAction func gameButtons(_ sender: UIButton) {
        
        if brain.twoPlayerBool {
            brain.assignButtons(sender)
            brain.checkForWinner(sender)
            
            if brain.playerTurn == "x" {
                playerOneLabel.text = "Go Player \"X\""
                playerTwoLabel.text = ""
            } else {
                playerTwoLabel.text = "Go Player \"O\""
                playerOneLabel.text = ""
            }
            if brain.gameOver {
                winnersLabel.text = brain.gameIsOver(brain.gameOver, xOButtons)
                playerOneLabel.text = ""
                playerTwoLabel.text = ""
            } else if brain.allButtonsDisabled(xOButtons) {
                winnersLabel.text = "It's a Tie!!"
                playerOneLabel.text = ""
                playerTwoLabel.text = ""
            }
        } else if brain.playCompBool {
            brain.assignComp(sender, xOButtons)
//            brain.smartComp(sender, xOButtons)
            
        }
        
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        for button in xOButtons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
        }
        brain.gameStatus = ["","","","","","","","",""]
        brain.gameOver = false
        brain.playerTurn = "x"
        playerOneLabel.text = "Go Player \"X\""
        playerTwoLabel.text = ""
        winnersLabel.text = ""
        brain.twoPlayerBool = false
        brain.playCompBool = false
    }
}

