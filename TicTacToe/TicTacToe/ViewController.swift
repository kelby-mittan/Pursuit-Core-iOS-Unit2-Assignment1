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
    
    @IBOutlet weak var letsPlay: UILabel!
    
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
    }
    
    var playerOneGo = true
    
    func pickXorO(_ button: UIButton) {
        if playerOneGo {
            button.setBackgroundImage(UIImage(named: "x"), for: .normal)
            button.isEnabled = false
            playerOneGo.toggle()
        } else {
            button.setBackgroundImage(UIImage(named: "o"), for: .normal)
            button.isEnabled = false
            playerOneGo.toggle()
        }
    }
    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        
        switch sender.tag {
        case 0:
            pickXorO(sender)
        case 1:
            pickXorO(sender)
        case 2:
            pickXorO(sender)
        case 3:
            pickXorO(sender)
        case 4:
            pickXorO(sender)
        case 5:
            pickXorO(sender)
        case 6:
            pickXorO(sender)
        case 7:
            pickXorO(sender)
        case 8:
            pickXorO(sender)
        default:
            pickXorO(sender)
        }
        
        
    }
    
}

