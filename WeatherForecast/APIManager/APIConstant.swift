//
//  APIConstant.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import Foundation

enum Country: String {
    case India = "IN"
    case America = "US"
}

let apiKey = ProcessInfo.processInfo.environment["APPID"] ?? ""

let baseURL = "https://api.openweathermap.org"
let weatherForecastURl = "/data/2.5/weather"


