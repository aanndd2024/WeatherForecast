//
//  APIManager.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 21-02-2024.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

class APIManager {
    func getWeatherData<T: Decodable>() async throws ->  T {
        guard let url = URL(string: getURLString()) else {
            throw DataError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "get"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func getURLString() -> String {
        let urlPath = baseURL + weatherForecastURl + "?q=vadodara,IN&APPID=\(apiKey)"
        return urlPath
    }
}
