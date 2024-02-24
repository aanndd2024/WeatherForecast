//
//  WeatherForecastViewModel.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import Foundation

protocol WeatherForecastDelegate: AnyObject {
    func reloadData()
}

class WeatherForecastViewModel {
    weak var weatherDelegate: WeatherForecastDelegate?
    var weatherData: WeatherData? {
        didSet {
            self.weatherDelegate?.reloadData()
        }
    }
    private var manager = APIManager()
    
    func fetchWeatherData(cityName:String) async -> Result<WeatherData, DataError> {
        let result: Result = await manager.getWeatherData(type: WeatherData.self, cityName:cityName)
        return result
    }
}
