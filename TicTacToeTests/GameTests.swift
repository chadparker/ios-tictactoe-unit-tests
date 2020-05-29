//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Chad Parker on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
   
   func load() {
      XCTAssertTrue(false)
   }
   
   func initialStateCheck(_ game: Game) {
      XCTAssert(game.activePlayer == .x)
      XCTAssertFalse(game.gameIsOver)
      XCTAssertNil(game.winningPlayer)
      XCTAssertFalse(game.board.isFull)
   }
   
   func testInit() {
      let game = Game()
      initialStateCheck(game)
   }
   
   func testRestart() throws {
      var game = Game()
      
      try game.makeMark(at: (0,0))
      try game.makeMark(at: (1,1))
      try game.makeMark(at: (2,2))
      try game.makeMark(at: (0,2))
      
      game.restart()
      initialStateCheck(game)
   }
   
   func testSecondPlayer() throws {
      var game = Game()
      
      try game.makeMark(at: (0,0))
      try game.makeMark(at: (0,1))
      XCTAssert(game.activePlayer == GameBoard.Mark.x)
   }
   
   func testCatsGame() throws {
      var game = Game()

      try game.makeMark(at: (0,0))
      try game.makeMark(at: (1,1))
      try game.makeMark(at: (2,2))
      try game.makeMark(at: (0,2))
      try game.makeMark(at: (2,0))
      try game.makeMark(at: (1,0))
      try game.makeMark(at: (1,2))
      try game.makeMark(at: (2,1))
      try game.makeMark(at: (0,1))

      XCTAssertTrue(game.gameIsOver)
      XCTAssertNil(game.winningPlayer)
   }
}
