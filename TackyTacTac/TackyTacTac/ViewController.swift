//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Elizabeth Yeh on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var grid = [[0,0,0], [0,0,0], [0,0,0]]
//    2D array
    var isPlayer1Turn = true
    var player1Score = 0
    var player2Score = 0
    var stalemastScore = 0
    
    let gameStatusLabel = UILabel(frame:CGRect(x: 0, y: 80, width: 200, height: 50))

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        
        view.addSubview(gameStatusLabel)
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 100
        let buttonSpacing = 4
        
        let gridHW =  (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        for (r, row) in grid.enumerate()
        {
            for (c, _) in row.enumerate()
            {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
            }
        }
        
        
        
//  has to be added as a Subview to shown on the screen. r= indext, row=object itself in that array. "spacePressed:" with ":" function takes an argument.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
// MARK: - Action Handlers
    func spacePressed(button: TTTButton)
    {
        if button.player == 0
        {
//            if isPlayer1Turn
//            {
//                button.player = 1
//            }
//            else
//            {
//                button.player = 2
//            }
            button.player = isPlayer1Turn ? 1:2
            
            grid[button.row][button.col] = isPlayer1Turn ? 1:2
            
            isPlayer1Turn = !isPlayer1Turn
            
            checkForWinner()
        }
    }
    
//    MARK: - Misc.
    func checkForWinner()
    {
        let posibilities = [
        ((0,0), (0,1), (0,2)),
        ((1,0), (1,1), (1,2)),
        ((2,0), (2,1), (2,2)),
        ((0,0), (1,0), (2,0)),
        ((0,1), (1,1), (2,2)),
        ((0,2), (1,2), (2,2)),
        ((0,0), (1,1), (2,2)),
        ((2,0), (1,1), (0,2))
        ]
        
        for posibility in posibilities
        {
            let (p1,p2,p3) = posibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3
            {
                if value1 != 0
                {
                    print("Player \(value1) wins!")
                }
                else
                {
                    print("No winner: all zeros")
                }
            }
            else
            {
                print("Does not match")
            }
        }
    }

}
class TTTButton : UIButton
{
    var row = 0
    var col = 0
    
    var player = 0 {
        didSet{
            switch player{
            case 1: backgroundColor = UIColor.magentaColor()
            case 2: backgroundColor = UIColor.yellowColor()
            default: backgroundColor = UIColor.cyanColor()
            }
        }
        
    }
}

