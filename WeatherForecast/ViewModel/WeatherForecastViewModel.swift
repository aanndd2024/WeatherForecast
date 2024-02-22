//
//  WeatherForecastViewModel.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import Foundation

protocol WeatherForecastDelegate: AnyObject {
    func reloadData() // Data Binding - PROTOCOL (View and ViewModel Communication)
}

class WeatherForecastViewModel {
    var weatherData: WeatherData? {
        didSet {
            self.weatherDelegate?.reloadData()
        }
    }
    private var manager = APIManager()
    weak var weatherDelegate: WeatherForecastDelegate?
    
    // @MainActor -> DispatchQueue.Main.async
    @MainActor func fetchWeatherData() {
        Task { // @MainActor in
            do {
                let weatherData: WeatherData = try await manager.getWeatherData()
                print(weatherData)
                self.weatherData = weatherData
            }catch {
                debugPrint(error)
            }
        }
    }
    
//    func fetchProducts() async -> Result<WeatherData, Error> {
//        let result = try await manager.getWeatherData()
//
//    }
//
//    let result = try await fetchProducts()
//    switch result {
//        case .success(let products):
//            // Handle success
//        case .failure(let error):
//            // Handle error
//    }
}
