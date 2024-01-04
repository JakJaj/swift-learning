//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    var percentage:Float = 0.1
    var peopleAmount = 2
    var amount:Float?
    var total:Float?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        if(sender.titleLabel?.text == "0%"){
            sender.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            percentage = 0.0
            
        } else if sender.titleLabel?.text == "10%"{
            zeroPctButton.isSelected = false
            sender.isSelected = true
            twentyPctButton.isSelected = false
            percentage = 0.1
            
        } else{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            sender.isSelected = true
            percentage = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peopleAmount = Int(sender.value)
        splitNumberLabel.text = String(peopleAmount)
        billTextField.endEditing(true)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(percentage)
        print(peopleAmount)
        
        amount = Float(billTextField.text!) ?? 0.0
        total = (amount! + (amount! * percentage)) / Float(peopleAmount)
        print(total!)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVS = segue.destination as! ResultsViewController
            destinationVS.percentage = percentage
            destinationVS.peopleAmount = peopleAmount
            destinationVS.total = total
        }
    }
    
}

