//
//  ViewController.swift
//  TicTacToe
//
//  Created by May Yang on 2/19/18.
//  Copyright © 2018 May Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0 , 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if gameState[sender.tag - 1] == 0 && gameIsActive {
            gameState[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        for combination in winningCombinations {
            // hitting below would mean a 3 in a row combo occured of 1, 1, 1 or 2, 2, 2
            print(gameState)
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                if gameState[combination[0]] == 1 {
                    winnerLabel.text = "Cross has won"
                    print("cross won")
                } else {
                    //Nought has won
                    winnerLabel.text = "Nought has won"
                    print("nought won")
                }
            }
        }
        winnerLabel.isHidden = false
        playAgainButton.isHidden = false
        //there's still an active spot
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            winnerLabel.text = "IT WAS A DRAW"
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        winnerLabel.isHidden = true
        winnerLabel.text = ""
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    

}

