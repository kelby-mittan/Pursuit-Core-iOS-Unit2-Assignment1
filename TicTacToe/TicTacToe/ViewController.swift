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
    
    func insertXorO(_ button: UIButton) -> String {
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
    
    var collectionOfXO = RowColumnSet()
    let xSet: Set = ["x"]
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            pickXorO(sender)
            collectionOfXO.rowOne.insert(insertXorO(sender))
            collectionOfXO.columnOne.insert(insertXorO(sender))
            collectionOfXO.diagOne.insert(insertXorO(sender))
        case 1:
            pickXorO(sender)
            collectionOfXO.rowOne.insert(insertXorO(sender))
            collectionOfXO.columnTwo.insert(insertXorO(sender))
        case 2:
            pickXorO(sender)
            collectionOfXO.rowOne.insert(insertXorO(sender))
            collectionOfXO.columnThree.insert(insertXorO(sender))
            collectionOfXO.diagTwo.insert(insertXorO(sender))
        case 3:
            pickXorO(sender)
            collectionOfXO.rowTwo.insert(insertXorO(sender))
            collectionOfXO.columnOne.insert(insertXorO(sender))
        case 4:
            pickXorO(sender)
            collectionOfXO.rowTwo.insert(insertXorO(sender))
            collectionOfXO.columnTwo.insert(insertXorO(sender))
            collectionOfXO.diagOne.insert(insertXorO(sender))
            collectionOfXO.diagTwo.insert(insertXorO(sender))
        case 5:
            pickXorO(sender)
            collectionOfXO.rowTwo.insert(insertXorO(sender))
            collectionOfXO.columnThree.insert(insertXorO(sender))
        case 6:
            pickXorO(sender)
            collectionOfXO.rowThree.insert(insertXorO(sender))
            collectionOfXO.columnOne.insert(insertXorO(sender))
            collectionOfXO.diagTwo.insert(insertXorO(sender))
        case 7:
            pickXorO(sender)
            collectionOfXO.rowThree.insert(insertXorO(sender))
            collectionOfXO.columnTwo.insert(insertXorO(sender))
        case 8:
            pickXorO(sender)
            collectionOfXO.rowThree.insert(insertXorO(sender))
            collectionOfXO.columnThree.insert(insertXorO(sender))
            collectionOfXO.diagOne.insert(insertXorO(sender))
        default:
            pickXorO(sender)
        }
        print(collectionOfXO.rowOne)
//        print(collectionOfXO.rowTwo)
        
        if xorOButton[0].isEnabled == false && xorOButton[1].isEnabled == false && xorOButton[2].isEnabled == false {
            print("")
            if collectionOfXO.rowOne == xSet {
                print("all x")
            }
        }
    }
    
    
}

