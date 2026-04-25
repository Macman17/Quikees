//
//  SavedLocationViewModel.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/17/26.
//

import Foundation
import Combine

@MainActor
class SavedLocationViewModel: ObservableObject {
   
    @Published var savedLocation: [SavedLocations] = []
    
    @Published var id: UUID = UUID()
    @Published var name: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var baselineTemp: Double = 0.0
    @Published var notes: String = ""
    @Published var createdAt: Date = Date()
    @Published var isFavorite: Bool = false
    
    
    private let savedLocations: SavedLocationService = SavedLocationService()
    
    func saveLocation() {
        let newLocation = SavedLocations(id: UUID(), name: name, latitude: latitude, longitude: longitude, baselineTemp: baselineTemp, notes: notes, createdAt: createdAt, isFavorite: isFavorite)
        
        savedLocations.savedLocations.append(newLocation)
       
        if let encoded = try? JSONEncoder().encode(newLocation) {
                UserDefaults.standard.set(encoded, forKey: "SavedUserLocation")
                print("Location Saved Successfully")
            }
        
        let _: Double = Double(baselineTemp)
        
        func loadSavedLocation() {
            if let savedLocationData = UserDefaults.standard.data(forKey: "SavedUserLocation") {
                let savedLocation = try? JSONDecoder().decode(SavedLocations.self, from: savedLocationData)
                
                if let savedLocation = savedLocation {
                    self.name = savedLocation.name
                    self.latitude = savedLocation.latitude
                }
            }
            
            func updateSavedLocation() {
                _ = SavedLocations(id: UUID(), name: name, latitude: latitude, longitude: longitude, baselineTemp: baselineTemp, notes: notes, createdAt: createdAt, isFavorite: isFavorite)
                
                savedLocations.savedLocations.append(newLocation)
                
                if let encoded = try? JSONEncoder().encode(newLocation) {
                    UserDefaults.standard.set(encoded, forKey: "SavedUserLocation")
                    
                }
            }
        }
        
        
        
        
    }
    
}

    
  
