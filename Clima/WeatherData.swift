//
//  WeatherData.swift
//  Clima
//
//  Created by Jakub Jajonek on 05/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name:String
    let main:Main
    let weather:[Weather]
}

struct Main: Decodable{
    let temp:Float
}

struct Weather: Decodable {
    let id:Int
}
