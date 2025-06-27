# 🌤 WeatherApp

A simple SwiftUI weather application that fetches and displays the current weather based on the user's location. Weather data is retrieved using the OpenWeatherMap API.

---

## 🚀 Features

- 📍 Uses CoreLocation to access the user’s current location
- ☁️ Fetches real-time weather data (temperature & condition)
- 🌐 Displays data from OpenWeatherMap API
- 🎨 Clean SwiftUI-based UI with gradient background
- 📱 Horizontally scrollable section for daily weather placeholders
+ - 🌓 Dark mode support for seamless appearance on all devices
+ - 🌤 Dynamic weather icons based on condition codes

---

## 🛠 Technologies Used

- **Swift 5.9**
- **SwiftUI**
- **CoreLocation**
- **URLSession**
- **OpenWeatherMap API**

---

## 📦 Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-username/weather-app.git
   cd weather-app
   ```

2. **Open the project in Xcode**

   ```bash
   open WeatherApp.xcodeproj
   ```

3. **Insert your API key**

   Open `ContentView.swift` and replace:

   ```swift
   let apiKey = "YOUR_API_KEY"
   ```

   with your actual [OpenWeatherMap API key](https://openweathermap.org/api).

4. **Run the project**

   - Select a simulator or connect a real device.
   - Press `Cmd + R` or click the **Run** button.

---

## ⚠️ Permissions

Make sure your `Info.plist` contains:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We use your location to show the current weather.</string>
```

---

## 📌 To Do

- [ ] Add 5-day forecast support
- [ ] Integrate weather icons based on condition codes
- [ ] Improve error handling and offline support
- [ ] Support dark mode
+ - [x] Support dark mode
+ - [x] Integrate weather icons based on condition codes

---


