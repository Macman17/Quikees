//
//  GeofenceViewModel.swift
//  GeoFenceDemo
//
//  Created by Arturo Martinez on 2/6/26.
//

import Foundation
import CoreLocation
import Combine

class GeofenceViewModel: ObservableObject{
    
    @Published var statusText : String = "Not started"
    @Published var lastEventText :  String = "No events yet"
    @Published var events: [GeofenceModel] = []
    
    // Geofence instance
    private let service: GeofenceService
    
    // "Event Listener" -> Publisher
    private var cancellables = Set<AnyCancellable>()
    
    // Dependency injection
    // This means that im creating a Geofence service
    // but if you want you can pass another service
    
    init(service:GeofenceService = GeofenceService()){
        self.service = service
        bindService()
    }
    
    
    // .sink { ... } creates a subscription.
    //That subscription returns an AnyCancellable (your “unsubscribe handle”)
    func bindService(){
        // Attach "Event listener to variables"
        service.$statusText
            .receive(on: DispatchQueue.main)
            .assign(to: &$statusText)
        
        service.$lastEventText
            .receive(on: DispatchQueue.main)
            .sink{
                [weak self] text in
                guard let self else {return}
                
                self.lastEventText = text
                
                if text != "No events yet" {
                    self.events.insert(GeofenceModel(message:text),at: 0)
                }
                
                // store(in:) puts that AnyCancellable into your
                //Set<AnyCancellable> called cancellables.
            }.store(in: &cancellables)
    }
    
    
    
    func requestPermissions(){
        service.requestPermissions()
    }
    
    func startGeofence(){
        let center:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 32.708333, longitude: -117.154722) // Point in the map
        let radius: CLLocationDistance = 200 // Big of a radius
        
        service.startGeofence(center: center, radius: radius, id: "DemoRegion")
    }
    
    func stopGeofence(){
        service.stopGeofence(id: "DemoRegion")
    }
    
    func clearLog() {
         events.removeAll()
     }
    
    
}