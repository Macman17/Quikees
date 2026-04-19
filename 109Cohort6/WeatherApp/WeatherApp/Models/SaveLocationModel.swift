//
//  SaveLocationModel.swift
//  WeatherApp
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

