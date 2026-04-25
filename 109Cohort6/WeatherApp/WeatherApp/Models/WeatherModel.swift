//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/12/26.
//


import Foundation

// MARK: Geocoding (City -> Latitude/Longitude)

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


