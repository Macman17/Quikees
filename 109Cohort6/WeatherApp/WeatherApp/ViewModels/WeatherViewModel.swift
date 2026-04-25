//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/12/26.
//


import Foundation
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {
    
    @Published var searchText:String = ""
    @Published var cityName: String = ""
    @Published var temperatureText: String = ""
    @Published var windText: String = ""
    @Published var timeText:String = ""
    @Published var temperature: Double = 0.0
    
    
    @Published var isLoading:Bool = false
    @Published var errorMessage: String = ""
    
    private let weatherNetworkService: WeatherService = WeatherService()
    
    
    func searchWeather() async {
        
        self.errorMessage = ""
        self.isLoading = true
        
        
        let trimmedText: String = self.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty {
            self.errorMessage = "Please type a city name."
            self.isLoading = false
        }
        
        
        do {
            
            let result = try await weatherNetworkService.fetchCurrentWeather(forCity: trimmedText)
            self.cityName = result.cityName
            self.temperatureText = "Temperature: \(result.weather.temperature) Celcius"
            self.windText = "Wind: \(result.weather.windspeed) km/h"
            self.timeText = "Time \(result.weather.time)"
            
            
            self.isLoading = false
            
        }catch{
            self.errorMessage = "Something went wrong"
            self.isLoading = false
        }
        
        
        // Ensures UI updates happen on the main thread
        func currentWeather(forCity city: String) async throws {
            isLoading = true
            
            // Defer ensures isLoading becomes false even if the network call fails
            defer { isLoading = false }
            
            let result = try await weatherNetworkService.fetchCurrentWeather(forCity: city)
            
            self.cityName = result.cityName
            self.temperatureText = "Temperature: \(result.weather.temperature) Celsius"
            self.windText = "Wind: \(result.weather.windspeed) km/h"
            self.timeText = "Time: \(result.weather.time)"
        }
        
        func currentTemperature(forCity city: String) async throws -> Double {
            let result = try await weatherNetworkService.fetchCurrentWeather(forCity: city)
            return result.weather.temperature
        }

        
        
    }
    
}
