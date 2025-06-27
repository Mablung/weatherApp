//
//  ForecastResponse.swift
//  weatherApp
//
//  Created by Nurettin Berke Demirel on 19.06.2025.
//

import Foundation

struct ForecastResponse: Codable {
    let list: [ForecastItem]
}

struct ForecastItem: Codable {
    let dt: TimeInterval
    let main: MainWeather
    let weather: [Weather]
}

// Daily forecast data model
struct DailyForecast {
    let dayName: String
    let icon: String
    let temperature: String
    let date: Date
}  

