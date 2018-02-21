//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by N Manisha Reddy on 1/31/18.
//  Copyright © 2018 N Manisha Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            label.isHidden = true
            playAgainButton.isHidden = true
            
            label.center = CGPoint(x: label.center.x - 500, y: label.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
            
        }

    }
    var activeGame = true
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] 
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


    @IBAction func button(_ sender: Any) {
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
                
            } else {
                
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                
            }
       //     if var winningCombinations[] = winningCombination {
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    // We have a winner!
                    
                    activeGame = false
                    
                    label.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        label.text = "Noughts has won!"
                        
                    } else {
                        
                        label.text = "Crosses has won!"
                        
                    }
                   
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.label.center = CGPoint(x: self.label.center.x + 500, y: self.label.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                    })
                    
                }
            }
//            }else
//            {
//                label.text = "try again"
//                UIView.animate(withDuration: 1, animations: {
//                    
//                    self.label.center = CGPoint(x: self.label.center.x + 500, y: self.label.center.y)
//                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
//                    
//                })
//
//            }
                    }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        playAgainButton.isHidden = true
        
        label.center = CGPoint(x: label.center.x - 500, y: label.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


