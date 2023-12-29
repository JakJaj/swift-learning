//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ballView: UIImageView!
    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]
    var losowanie = 0
    @IBAction func askButton(_ sender: UIButton) {
        losowanie = Int.random(in: 0...4)
        ballView.image = UIImage(named: ballArray[losowanie])
    }
    



}

