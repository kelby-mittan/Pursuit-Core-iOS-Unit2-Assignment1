//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var collectionOfXO = RowColumnArr()
    var playerOneGo = true
    let xArray: Array = ["x","x","x"]
    let oArray: Array = ["o","o","o"]
    
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
    
//    func appendXorOForComp(_ button: UIButton) -> String {
//        var xOrO: String
//        if playerOneGo {
//            xOrO = "o"
//        }
//    }
    
}
