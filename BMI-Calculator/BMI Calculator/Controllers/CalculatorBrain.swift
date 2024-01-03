//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jakub Jajonek on 03/01/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var bmi:BMI?
    
    mutating func calculateBmi(height:Float, weight:Float){
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "You can use some more cookies", color: .systemPink)
        } else if bmiValue > 24.9{
            bmi = BMI(value: bmiValue, advice: "You should slow a bit with your food intake", color: .systemPink)
        } else {
            bmi = BMI(value: bmiValue, advice: "You have a great weight", color: .cyan)
        }
        
    }
    
    func getBmiValue() -> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
}
