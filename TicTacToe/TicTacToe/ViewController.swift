//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var xorOButton: [UIButton]!
    
    @IBOutlet weak var playerTurn: UILabel!
    @IBOutlet weak var playerTwoTurn: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        for button in xorOButton {
            button.isEnabled = false
        }
        
  }
    @IBAction func letsPlayGame(_ sender: UIButton) {
        for button in xorOButton {
            button.isEnabled = true
        }
        playerTurn.text = "Player One.... Go!!"
    }
    
    func disableButtons() {
        for button in xorOButton {
            button.isEnabled = false
        }
    }
    
    func oneWins() {
        winnerLabel.text = "Player One Wins"
        playerTurn.text = ""
        playerTwoTurn.text = ""
        disableButtons()
    }
    
    func twoWins() {
        winnerLabel.text = "Player Two Wins"
        playerTurn.text = ""
        playerTwoTurn.text = ""
        disableButtons()
    }
    
    func appendXorO(_ button: UIButton) -> String {
        var xOrO: String
        if playerOneGo {
            xOrO = "o"
        } else if playerOneGo == false {
            xOrO = "x"
        } else {
            xOrO = ""
        }
        return xOrO
    }
    
    var playerOneGo = true
    
    func pickXorO(_ button: UIButton) {
        if playerOneGo {
            button.setBackgroundImage(UIImage(named: "x"), for: .normal)
            button.isEnabled = false
            playerOneGo.toggle()
            playerTwoTurn.text = "Player Two.... Go!!"
            playerTurn.text = ""
        } else {
            button.setBackgroundImage(UIImage(named: "o"), for: .normal)
            button.isEnabled = false
            playerOneGo.toggle()
            playerTurn.text = "Player One.... Go!!"
            playerTwoTurn.text = ""
        }
    }
    
    var collectionOfXO = RowColumnArr()
    let xArray: Array = ["x","x","x"]
    let oArray: Array = ["o","o","o"]
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            pickXorO(sender)
            collectionOfXO.rowOne.append(appendXorO(sender))
            collectionOfXO.columnOne.append(appendXorO(sender))
            collectionOfXO.diagOne.append(appendXorO(sender))
        case 1:
            pickXorO(sender)
            collectionOfXO.rowOne.append(appendXorO(sender))
            collectionOfXO.columnTwo.append(appendXorO(sender))
        case 2:
            pickXorO(sender)
            collectionOfXO.rowOne.append(appendXorO(sender))
            collectionOfXO.columnThree.append(appendXorO(sender))
            collectionOfXO.diagTwo.append(appendXorO(sender))
        case 3:
            pickXorO(sender)
            collectionOfXO.rowTwo.append(appendXorO(sender))
            collectionOfXO.columnOne.append(appendXorO(sender))
        case 4:
            pickXorO(sender)
            collectionOfXO.rowTwo.append(appendXorO(sender))
            collectionOfXO.columnTwo.append(appendXorO(sender))
            collectionOfXO.diagOne.append(appendXorO(sender))
            collectionOfXO.diagTwo.append(appendXorO(sender))
        case 5:
            pickXorO(sender)
            collectionOfXO.rowTwo.append(appendXorO(sender))
            collectionOfXO.columnThree.append(appendXorO(sender))
        case 6:
            pickXorO(sender)
            collectionOfXO.rowThree.append(appendXorO(sender))
            collectionOfXO.columnOne.append(appendXorO(sender))
            collectionOfXO.diagTwo.append(appendXorO(sender))
        case 7:
            pickXorO(sender)
            collectionOfXO.rowThree.append(appendXorO(sender))
            collectionOfXO.columnTwo.append(appendXorO(sender))
        case 8:
            pickXorO(sender)
            collectionOfXO.rowThree.append(appendXorO(sender))
            collectionOfXO.columnThree.append(appendXorO(sender))
            collectionOfXO.diagOne.append(appendXorO(sender))
        default:
            pickXorO(sender)
        }
        
        if collectionOfXO.rowOne == xArray {
            oneWins()
        } else if collectionOfXO.rowOne == oArray {
            twoWins()
        } else if collectionOfXO.rowTwo == xArray {
            oneWins()
        } else if collectionOfXO.rowTwo == oArray {
            twoWins()
        } else if collectionOfXO.rowThree == xArray {
            oneWins()
        } else if collectionOfXO.rowThree == oArray {
            twoWins()
        } else if collectionOfXO.columnOne == xArray {
            oneWins()
        } else if collectionOfXO.columnOne == oArray {
            twoWins()
        } else if collectionOfXO.columnTwo == xArray {
            oneWins()
        } else if collectionOfXO.columnTwo == oArray {
            twoWins()
        } else if collectionOfXO.columnThree == xArray {
            oneWins()
        } else if collectionOfXO.columnThree == oArray {
            twoWins()
        } else if collectionOfXO.diagOne == xArray {
            oneWins()
        } else if collectionOfXO.diagOne == oArray {
            twoWins()
        } else if collectionOfXO.diagTwo == xArray {
            oneWins()
        } else if collectionOfXO.diagTwo == oArray {
            twoWins()
        }
        
        

        
        print("row1\(collectionOfXO.rowOne)")
        print(collectionOfXO.rowTwo)
        print(collectionOfXO.rowThree)
        print("col1 \(collectionOfXO.columnOne)")
        print(collectionOfXO.columnTwo)
        print(collectionOfXO.columnThree)
        print("diag1\(collectionOfXO.diagOne)")
        print(collectionOfXO.diagTwo)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        for button in xorOButton {
            button.setBackgroundImage(UIImage(named: "defaultGrey"), for: .normal)
            button.isEnabled = true
        }
        collectionOfXO.rowOne.removeAll()
        collectionOfXO.rowTwo.removeAll()
        collectionOfXO.rowThree.removeAll()
        collectionOfXO.columnOne.removeAll()
        collectionOfXO.columnTwo.removeAll()
        collectionOfXO.columnThree.removeAll()
        collectionOfXO.diagOne.removeAll()
        collectionOfXO.diagTwo.removeAll()
        winnerLabel.text = ""
        playerTwoTurn.text = ""
        playerTurn.text = "Player One... Go!!"
        playerOneGo = true
        
    }
    
}

