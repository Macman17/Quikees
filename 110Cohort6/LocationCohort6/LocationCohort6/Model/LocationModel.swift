//
//  LocationModel.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/17/26.
//

import Foundation


struct LocationModel: Identifiable {
    
    var id: UUID = UUID()
    let longitude: Double
    let latitude: Double
    let timestamp: Date
    
    init(id: UUID, longitude: Double, latitude: Double, timestamp: Date) {
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
        self.timestamp = timestamp
    }
}
