//
//  Game.swift
//  TicTacToe
//
//  Created by Chad Parker on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

enum GameState {
   case active(GameBoard.Mark) // Active player
   case cat
   case won(GameBoard.Mark) // Winning player
}

protocol GameDelegate: class {
   func gameStateChanged(_ state: GameState)
   func boardWasSet(_ board: GameBoard)
}

struct Game {
   
   weak var delegate: GameDelegate?
   
   var activePlayer: GameBoard.Mark? = .x // nil if game is over
   var winningPlayer: GameBoard.Mark? = nil // nil if game running or cat's game
   var gameIsOver: Bool = false
   
   
   
   private(set) var board = GameBoard() { // modified by self as game progresses
      didSet {
         delegate?.boardWasSet(board)
      }
   }
   private var gameState = GameState.active(.x) {
      didSet {
         delegate?.gameStateChanged(gameState)
      }
   }
   
   //MARK: - Public methods
   
   /// adds a mark for the currently active player at the given coordinate. Updates game state.
   mutating func makeMark(at coordinate: Coordinate) throws {
      guard case GameState.active(let player) = gameState else {
         gameIsOver = true
         return
      }
      
      try board.place(mark: player, on: coordinate)
      if game(board: board, isWonBy: player) {
         gameState = .won(player)
      } else if board.isFull {
         gameState = .cat
         gameIsOver = true
      } else {
         let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
         gameState = .active(newPlayer)
      }
   }
   
   mutating func restart() { // with .x starting
      board = GameBoard()
      gameState = .active(.x)
      activePlayer = .x
      gameIsOver = false
      winningPlayer = nil
   }
}
