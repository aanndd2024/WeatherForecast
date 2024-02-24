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
    case invalidCityName
    case network(Error?)
}

extension DataError:LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidResponse: return "Something went wrong!"
        case .invalidURL: return "Invalid URL"
        case .invalidData: return "Something went wrong!"
        case .invalidCityName: return "Enter correct city name(India's Only)"
        case .network: return ""
        }
    }
}

class APIManager {
    
    func getWeatherData<T: Decodable>(type: T.Type, cityName:String) async ->  Result<T, DataError> {
        guard let url = URL(string: getURLString(cityName: cityName)) else {
            return .failure(DataError.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            guard response.statusCode == 200 else {
                return .failure(DataError.invalidResponse)
            }
            let decodedResponse = try JSONDecoder().decode(type, from: data)
            return .success(decodedResponse)
        } catch {
            return .failure(.invalidData)
        }
    }
    
    func getURLString(cityName:String) -> String {
        let urlPath = baseURL + weatherForecastURl + "?q=\(cityName),IN&APPID=\(apiKey)"
        return urlPath
    }
}
