//
//  SavedLocationService.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/17/26.
//
import Foundation
import Combine
import SwiftData


class SavedLocationService: ObservableObject {
    enum CodingKeys: String, CodingKey {
        case id, name, latitude, longitude
        case invalidURL
        
    }
    
    @Published var savedLocations: [SavedLocations] = []
    
    
    func savedLocation(_ location: SavedLocations) {
        savedLocations.append(location)
        
    }
    
    func deleteSavedLocation(_ location: SavedLocations) {
        var savedLocationsCopy = savedLocations
        savedLocationsCopy.removeAll { $0.id == location.id }
        savedLocations = savedLocationsCopy
    }
    
    func updateSavedLocation(_ location: SavedLocations) {
        var savedLocationsCopy = savedLocations
        if let index = savedLocationsCopy.firstIndex(of: location) {
            savedLocationsCopy[index] = location
        }
        savedLocations = savedLocationsCopy
    }
}


