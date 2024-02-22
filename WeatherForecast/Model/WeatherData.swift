//
//  Weather.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import Foundation

// MARK: - Weather
struct WeatherData: Codable {
    var coord: Coord?
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    var sys: Sys?
}

// MARK: - Coord
struct Coord: Codable {
    var lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int?
    var main, description, icon: String?
}

struct Wind: Codable {
    var speed: Double?
    var deg: Int?
}

// MARK: - Sys
struct Sys: Codable {
    var type, id: Int?
    var country: String?
    var sunrise, sunset: Int?
}
