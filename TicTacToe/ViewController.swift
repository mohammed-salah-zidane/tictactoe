//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mohamed Salah Zidane on 7/9/18.
//  Copyright © 2018 Mohamed Salah Zidane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!
    
    var winningGame = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
    var activeGame = true
     var activePlayer = 1
    var nout = UIImage(named: "nought.png")!
    var gameState = [0,0,0,0,0,0,0,0,0]
    @IBOutlet var congratLbl: UILabel!
    @IBOutlet var plAg: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
     
         activePlayer = 1
         activeGame = true
         gameState = [0,0,0,0,0,0,0,0,0]
        
        congratLbl.text = ""
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        
        }
        UIView.animate(withDuration: 2, animations: {
            self.congratLbl.center = CGPoint(x: self.congratLbl.center.x - 300 , y:self.congratLbl.center.y )
            self.plAg.center = CGPoint(x: self.plAg.center.x - 300 , y:self.plAg.center.y )
        })
        
    }
    @IBAction func pressBtn(_ sender: UIButton) {
    
      let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 && activeGame{
            gameState[activePosition] = activePlayer
            if activePlayer == 1  {
            sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
        
            }else if activePlayer == 2
            {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            for combination in winningGame {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] &&
                    gameState[combination[1]] == gameState[combination[2]]{
                    activeGame = false
                    print(gameState[combination[0]])
                    if gameState[combination[0]] == 1 {
                        congratLbl.text = congratLbl.text! + "congrats 1 you win!"
                        
                    }else if gameState[combination[0]] == 2{
                        congratLbl.text = congratLbl.text! + "congrats 2 you win!"
                    }
                    UIView.animate(withDuration: 2, animations: {
                        self.congratLbl.center = CGPoint(x: self.congratLbl.center.x + 300 , y:self.congratLbl.center.y )
                        self.plAg.center = CGPoint(x: self.plAg.center.x + 300 , y:self.plAg.center.y )
                    })
                }
            }
    
        }
        
    }
    
    
    /*
    var activePlayer = 1
    
    @IBAction func pressBtn(_ sender: AnyObject) {
    
        if activePlayer == 1 {
            sender.setImage(UIImage(named: "nought.png"), for: [])
            activePlayer = 2
        }else
        {
            sender.setImage(UIImage(named: "cross.png"), for: [])
            activePlayer = 1
        }
        print(sender.tag)
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        congratLbl.center = CGPoint(x: congratLbl.center.x - 300 , y:congratLbl.center.y )
        plAg.center = CGPoint(x: plAg.center.x - 300 , y:plAg.center.y )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

