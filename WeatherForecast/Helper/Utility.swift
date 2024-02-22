//
//  Utility.swift
//  WeatherForecast
//
//  Created by Anand Yadav on 22-02-2024.
//

import Foundation

class Helper {
    static func getCelsius(valueInKelvin: Double?) -> String {
        if let kelvin = valueInKelvin {
            return String(format:"%.0f",(kelvin-273.15)) + "°C"
        } else {
            return ""
        }
    }

    static func getImageName(desc:String?) -> String {
        if let desc = desc {
            switch desc {
            case "few clouds":
                return "cloud.sun"
            case "scattered clouds":
                return "cloud.fill"
            case "broken clouds":
                return "cloud.sun.fill"
            case "haze":
                return "sun.haze.fill"
            case "clear":
                return "sun.max.fill"
            default:
                return "sun.max.fill"
            }
        } else {
            return "sun.max.fill"
        }
    }
    
    static func getTimeFromInt(sunrise:Int) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(sunrise)))
        //string(from: Date(timeIntervalSince1970: TimeInterval(sunrise))) // October 8, 2016 at 10:48:53 PM

        //return Date(timeIntervalSince1970: TimeInterval(sunrise))

    }
}

