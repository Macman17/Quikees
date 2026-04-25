//
import Foundation
import SwiftData
import UIKit


struct SavedLocations: Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    var baselineTemp: Double
    var notes: String?
    var createdAt: Date
    var isFavorite: Bool = false
    
    init(id: UUID, name: String, latitude: Double, longitude: Double, baselineTemp: Double, notes: String?, createdAt: Date, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.baselineTemp = baselineTemp
        self.notes = notes
        self.createdAt = createdAt
        self.isFavorite = isFavorite
    }
    
    func loadSavedLocations() -> SavedLocations {
            SavedLocations(id: id, name: name, latitude: latitude, longitude: longitude, baselineTemp: baselineTemp, notes: notes, createdAt: createdAt, isFavorite: isFavorite)
        }

}