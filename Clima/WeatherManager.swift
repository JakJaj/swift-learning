//
//  WeatherManager.swift
//  Clima
//
//  Created by Jakub Jajonek on 05/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager:WeatherManager ,weather:WeatherModel)
    func didFailWithError(error:Error)
}
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c43cc288565db37d7a557cdbf0c0f134&units=metric"
    
    var delegate:WeatherManagerDelegate?
    func fetchCityName(cityName:String){
        let weatherCityUrl = "\(weatherURL)&q=\(cityName)"
        performRequest(with: weatherCityUrl)
    }
    func fetchLatLon(latitude:CLLocationDegrees, longitude:CLLocationDegrees){
        let weatherLatLonUrl = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: weatherLatLonUrl)
    }
    func performRequest(with cityUrl:String){
        if let url = URL(string: cityUrl){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather:weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temperature)
            
            return weather
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
