//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
   
   private var gameStruct = Game()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      gameStruct.delegate = self
      gameStruct.restart()
   }
   
   private var boardViewController: BoardViewController! {
       willSet {
           boardViewController?.delegate = nil
       }
       didSet {
         boardViewController?.board = gameStruct.board
         boardViewController?.delegate = self
       }
   }
   
   @IBOutlet weak var statusLabel: UILabel!
   
   @IBAction func restartGame(_ sender: Any) {
      gameStruct.restart()
   }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try gameStruct.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews(gameState: GameState) {
        guard isViewLoaded else { return }
        
        switch gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = (segue.destination as! BoardViewController)
        }
    }
}

extension GameViewController: GameDelegate {
   
   func boardWasSet(_ board: GameBoard) {
      boardViewController.board = board
   }
   
   func gameStateChanged(_ state: GameState) {
      updateViews(gameState: state)
   }
}
