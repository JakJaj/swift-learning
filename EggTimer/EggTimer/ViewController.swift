//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    let eggTimers =
    ["Soft":300,
     "Medium":420,
     "Hard":720
    ]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var timer: Timer?
    var time: Int?
    var percentage: Float?
    var hardness: String?
    var player: AVAudioPlayer?
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        hardness = sender.currentTitle
        timer?.invalidate()
        time = eggTimers[hardness!]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        if time! > 0 {
            print(time!)
            percentage = 1.0 - (Float(time!) / Float(eggTimers[hardness!]!))
            progressBar.progress = percentage!
            time! -= 1
            
        } else {
            timer?.invalidate()
            titleLabel.text = "Done!"
            progressBar.progress = 1.0
            playSound()
        }
    }
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
