//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    var leftDice = 0
    var rightDice = 5


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let numbers = ["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix"]
        
        leftDice = Int.random(in: 0...5)
        rightDice = Int.random(in: 0...5)
        print("Lewa \(leftDice + 1)")
        print("Prawa \(rightDice + 1)")
        
        print("")
        diceImageViewOne.image = UIImage(named: numbers[leftDice])
        diceImageViewTwo.image = UIImage(named: numbers[rightDice])
        
    }
    
}

