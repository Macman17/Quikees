//
//  GeoFenceModel.swift
//  GeoFenceDemo
//
//  Created by Naqui Darby on 4/27/26.


import Foundation

struct GeofenceModel : Identifiable{
    
    let id:UUID
    let name: String
    var latitude: Double
    var longitude: Double
    let date:Date
    let message:String
    
    init(id: UUID = UUID(), Name: String, date: Date = Date(), latitude: Double, longitude: Double, message: String) {
        self.id = id
        self.name = Name
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        self.message = message
    }
    
    
}

struct ZoneEvent: Identifiable {
     
    let id: UUID
    let zoneName: String
    let eventType: String
    let timeStamp: Date
    
    init(id: UUID, zoneName: String, eventType: String, timeStamp: Date) {
        self.id = id
        self.zoneName = zoneName
        self.eventType = eventType
        self.timeStamp = timeStamp
    }
}
