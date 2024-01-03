//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSliderData: UISlider!
    @IBOutlet weak var heightSliderData: UISlider!
    var bmiValue:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        let height = round(sender.value * 100) / 100
        heightLabel.text =  "\(height)m"
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight)Kg"
        
    }
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightSliderData.value
        let weight = weightSliderData.value
        
        calculatorBrain.calculateBmi(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVS = segue.destination as! ResultViewController
            destinationVS.bmiValue = calculatorBrain.getBmiValue()
            destinationVS.color = calculatorBrain.getColor()
            destinationVS.advice = calculatorBrain.getAdvice()
        }
    }
}

