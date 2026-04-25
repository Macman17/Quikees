//
//  SavedLocationViewModel.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/17/26.
//

import Foundation
import Combine

class SavedLocationViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var baselineTemp: Double = 0.0
    @Published var notes: String = ""
    @Published var createdAt: Date = Date()
    
    private let savedLocation: LocationService = LocationService()
    
    func saveLocation() {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.baselineTemp = baselineTemp
        self.notes = notes
        self.createdAt = createdAt
        
        savedLocation.save(: name, latitude: latitude, longitude: longitude, baselineTemp: baselineTemp, notes: notes, createdAt: createdAt)
    }
    
    
    
    
    
}

    
  
