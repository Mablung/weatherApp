//
//  ContentView.swift
//  weatherApp
//
//  Created by Nurettin Berke Demirel on 6.06.2025.
//

import SwiftUI
import CoreLocation

// Main view for the weather app
struct ContentView: View {
    
    // Manages background
    @State private var isNight = true
    
    // Manages the user's location
    @StateObject private var locationManager = LocationManager()
    
    // Holds the fetched weather data
    @State private var weatherData: WeatherData?
    
    var body: some View {
        ZStack {
            // Background gradient from blue to white or black to gray, depends on isNight
            LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray :.white],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            // Show weather data if available
            if let weatherData = weatherData {
                VStack {
                    
                    
                    // Display location name
                    Text("\(weatherData.locationName)")
                        .font(.system(size: 30, weight:.bold))
                        .foregroundColor(isNight ? .white : .black)
                    
                    let iconName = WeatherCondition(from: weatherData.condition).systemImageName

                    // Weather icon
                    Image(systemName: iconName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                  
                    
                    // Weather condition (e.g., clear sky)
                    Text("\(weatherData.condition)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(isNight ? .white : .black)
                    
                    // Temperature in Celsius
                    Text("\(Int(weatherData.temperature))°C")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(isNight ? .white : .black)
                   
                    Spacer() // Pushes content to the top
                    // Horizontal scroll view for daily forecast
                    ScrollView(.horizontal) {
                        HStack(spacing: 7) {
                            // Sample daily weather data views
                            ForEach(1..<10) { index in
                                dayView(dayName: "Mon", icon: "sun.max.fill", temp: "21°C")
                                dayView(dayName: "Tue", icon: "sun.rain.fill", temp: "20°C")
                                dayView(dayName: "Wed", icon: "cloud.rain.fill", temp: "18°C")
                                dayView(dayName: "Thr", icon: "cloud.rain.fill", temp: "18°C")
                                dayView(dayName: "Fri", icon: "cloud.rain.fill", temp: "23°C")
                                dayView(dayName: "Str", icon: "cloud.rain.fill", temp: "24°C")
                                dayView(dayName: "Sun", icon: "cloud.rain.fill", temp: "19°C")
                            }
                        }
                    }
                    .frame(height: 121)
                    .padding(.bottom, 20) // Bottom spacing
                }
                .padding()
            } else {
                // Show loading indicator while fetching data
                ProgressView()
            }
        }
        .onAppear {
            // Request location when view appears
            locationManager.requestLocation()
        }
        .onReceive(locationManager.$location) { location in
            // Fetch weather data when location is updated
            guard let location = location else { return }
            fetchWeatherData(for: location)
        }
    }
    
    // Fetch weather data from OpenWeatherMap API
    private func fetchWeatherData(for location: CLLocation) {
        let apiKey = "{YOUR_OPENWEATHERMAP_API_KEY}"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&units=metric&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        // Create a network task
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                // Decode the JSON response
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    // Update the UI with the fetched weather data
                    weatherData = WeatherData(
                        locationName: weatherResponse.name,
                        temperature: weatherResponse.main.temp,
                        condition: weatherResponse.weather.first?.description ?? ""
                    )
                }
                print("✅ JSON datas :\n\(String(data: data, encoding: .utf8) ?? "Data could not be parsed")")

            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

// Preview provider for SwiftUI preview
#Preview {
    ContentView()
}

// Simple class for daily weather info (not used directly in UI yet)
class days {
    var name: String
    var icon: String
    var temp: String
    
    init(name: String, icon: String, temp: String) {
        self.name = name
        self.icon = icon
        self.temp = temp
    }
}

// View for a single day’s weather display
struct dayView: View {
    var dayName: String
    var icon: String
    var temp: String
    
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .frame(width: 30, height: 30)
            Text(temp)
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
        }
    }
}
