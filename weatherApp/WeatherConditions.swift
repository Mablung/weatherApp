//
//  WeatherConditions.swift
//  weatherApp
//
//  Created by Nurettin Berke Demirel on 19.06.2025.
//


import Foundation

enum WeatherCondition: String {
    case clear = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
    case showerRain = "shower rain"
    case rain = "rain"
    case thunderstorm = "thunderstorm"
    case snow = "snow"
    case mist = "mist"
    case unknown

    init(from description: String) {
        self = WeatherCondition(rawValue: description.lowercased()) ?? .unknown
    }

    var systemImageName: String {
        switch self {
        case .clear:
            return "sun.max.fill"
        case .fewClouds, .scatteredClouds:
            return "cloud.sun.fill"
        case .brokenClouds:
            return "cloud.fill"
        case .showerRain:
            return "cloud.heavyrain.fill"
        case .rain:
            return "cloud.rain.fill"
        case .thunderstorm:
            return "cloud.bolt.fill"
        case .snow:
            return "snow"
        case .mist:
            return "cloud.fog.fill"
        case .unknown:
            return "questionmark.circle"
        }
    }
}

