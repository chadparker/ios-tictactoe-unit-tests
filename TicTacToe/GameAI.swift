//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    let firstOptional = board[(0,0)]
    let secondOptional = board[(0,1)]
    let thirdOptional = board[(0,2)]
    
    guard
        let firstValue = firstOptional,
        let secondValue = secondOptional,
        let thirdValue = thirdOptional else { return false }
    
    guard firstValue == secondValue, secondValue == thirdValue else { return false }
    
    return true
}
