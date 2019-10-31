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
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        
  }

    @IBAction func selectedButton(_ sender: UIButton) {
        
//        for (index, button) in xorOButton.enumerated() {
//        if sender.tag == index {
//          button.setBackgroundImage(UIImage(named: "x"), for: .normal)
//        }
        switch sender.tag {
        case 0:
            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
        default:
            xorOButton[1].setBackgroundImage(UIImage(named: "x"), for: .normal)
        }
        
        
    }
    
}

