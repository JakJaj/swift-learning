//
//  WeatherModel.swift
//  Clima
//
//  Created by Jakub Jajonek on 06/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId:Int
    let cityName:String
    let temperature:Float
    
    var conditionName:String {
        switch conditionId {
        case 200...232:return "cloud.bolt.rain"
        case 300...321:return "cloud.drizzle"
        case 500...531:return "cloud.rain"
        case 600...622:return "cloud.snow"
        case 701...771:return "cloud.fog"
        case 781:return "tornado"
        case 800: return "sun.max"
        case 801...804: return "cloud"
        default: return "cloud"
        }
    }
    var temperatureString:String{
        return String(format: "%.1f", temperature)
    }
}
