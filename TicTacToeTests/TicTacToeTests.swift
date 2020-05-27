//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Chad Parker on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyBoard() {
        let newBoard = GameBoard()
        
        let topLeft = Coordinate(x: 0, y: 0)
        let markAtTopLeft = newBoard[topLeft]
        XCTAssert(markAtTopLeft == nil)
        // OR:
        XCTAssertNil(markAtTopLeft)
        
        for x in 0..<3 {
            for y in 0..<3 {
                let coordinate = Coordinate(x: x, y: y)
                let markAtCoordinate = newBoard[coordinate]
                XCTAssertNil(markAtCoordinate)
            }
        }
    }
    
    func testWinConditionThreeInARowInLeftColumn() {
        
        
        
//        let newBoard = GameBoard()
//        var areSame = false
//        let first = newBoard[(x:0, y:0)]
//        if first == newBoard[(x:0, y:1)], first == newBoard[(x:0, y:2)] {
//            areSame = true
//        }
//        XCTAssertTrue(areSame)
    }
}
