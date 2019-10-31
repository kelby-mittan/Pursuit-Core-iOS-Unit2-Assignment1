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
    
    var collectionOfXO = RowColumnArr()
    let xSet: Array = ["x","x","x"]
    let oSet: Array = ["o","o","o"]
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            pickXorO(sender)
            collectionOfXO.rowOne.append(insertXorO(sender))
            collectionOfXO.columnOne.append(insertXorO(sender))
            collectionOfXO.diagOne.append(insertXorO(sender))
        case 1:
            pickXorO(sender)
            collectionOfXO.rowOne.append(insertXorO(sender))
            collectionOfXO.columnTwo.append(insertXorO(sender))
        case 2:
            pickXorO(sender)
            collectionOfXO.rowOne.append(insertXorO(sender))
            collectionOfXO.columnThree.append(insertXorO(sender))
            collectionOfXO.diagTwo.append(insertXorO(sender))
        case 3:
            pickXorO(sender)
            collectionOfXO.rowTwo.append(insertXorO(sender))
            collectionOfXO.columnOne.append(insertXorO(sender))
        case 4:
            pickXorO(sender)
            collectionOfXO.rowTwo.append(insertXorO(sender))
            collectionOfXO.columnTwo.append(insertXorO(sender))
            collectionOfXO.diagOne.append(insertXorO(sender))
            collectionOfXO.diagTwo.append(insertXorO(sender))
        case 5:
            pickXorO(sender)
            collectionOfXO.rowTwo.append(insertXorO(sender))
            collectionOfXO.columnThree.append(insertXorO(sender))
        case 6:
            pickXorO(sender)
            collectionOfXO.rowThree.append(insertXorO(sender))
            collectionOfXO.columnOne.append(insertXorO(sender))
            collectionOfXO.diagTwo.append(insertXorO(sender))
        case 7:
            pickXorO(sender)
            collectionOfXO.rowThree.append(insertXorO(sender))
            collectionOfXO.columnTwo.append(insertXorO(sender))
        case 8:
            pickXorO(sender)
            collectionOfXO.rowThree.append(insertXorO(sender))
            collectionOfXO.columnThree.append(insertXorO(sender))
            collectionOfXO.diagOne.append(insertXorO(sender))
        default:
            pickXorO(sender)
        }
        print(collectionOfXO.rowOne)
//        print(collectionOfXO.rowTwo)
        
//        if xorOButton[0].isEnabled == false && xorOButton[1].isEnabled == false && xorOButton[2].isEnabled == false {
//            print("")
//            if collectionOfXO.rowOne == xSet {
//                print("all x")
//            } else if collectionOfXO.rowOne == oSet {
//                print("all o")
//            }
//        } else if xorOButton[3].isEnabled == false && xorOButton[4].isEnabled == false && xorOButton[5].isEnabled == false {
//            print("")
//            if collectionOfXO.rowTwo == xSet {
//                print("all x")
//            } else if collectionOfXO.rowTwo == oSet {
//                print("all o")
//            }
//        } else if xorOButton[6].isEnabled == false && xorOButton[7].isEnabled == false && xorOButton[8].isEnabled == false {
//            print("")
//            if collectionOfXO.rowThree == xSet {
//                print("all x")
//            } else if collectionOfXO.rowThree == oSet {
//                print("all o")
//            }
//        } else if xorOButton[0].isEnabled == false && xorOButton[3].isEnabled == false && xorOButton[6].isEnabled == false {
//            print("")
//            if collectionOfXO.columnOne == xSet {
//                print("all x")
//            } else if collectionOfXO.columnOne == oSet {
//                print("all o")
//            }
//        } else if xorOButton[1].isEnabled == false && xorOButton[4].isEnabled == false && xorOButton[7].isEnabled == false {
//            print("")
//            if collectionOfXO.columnTwo == xSet {
//                print("all x")
//            } else if collectionOfXO.columnTwo == oSet {
//                print("all o")
//            }
//        } else if xorOButton[2].isEnabled == false && xorOButton[5].isEnabled == false && xorOButton[8].isEnabled == false {
//            print("")
//            if collectionOfXO.columnTwo == xSet {
//                print("all x")
//            } else if collectionOfXO.columnTwo == oSet {
//                print("all o")
//            }
//        }
    }
    
    
}

