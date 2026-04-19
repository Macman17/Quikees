//
//  SavedLocations.swift
//  WeatherWatchList
//
//  Created by Naqui Darby on 4/17/26.
//


import Foundation

struct SavedLocations: Codable, Identifiable {
    let id: UUID
    let name: String
    let latitude: Double
    let longitude: Double
    let baselineTemp: Double
    let notes: String?
    let createdAt: Date
    
    

}

struct GeocodingResponse: Codable{
    let results:[GeocodingResult]?
}


struct GeocodingResult: Codable{
    let name: String
    let latitude: Double
    let longitude: Double
}

// MARK: Weather -> (Latitude/Longitude) -> Current Weather

struct ForecastResponse: Codable {
    
    let current_weather: CurrentWeather
    
}


struct CurrentWeather: Codable {
    
    let temperature: Double
    let windspeed: Double
    let weathercode:Int
    let time: String
    
}

