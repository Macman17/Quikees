//
//  GeofenceViewModel.swift
//  GeoFenceDemo
//
//  Created by Naqui Darby on 4/27/26.
//

import Foundation
import CoreLocation
import Combine
import UserNotifications

class GeofenceViewModel: ObservableObject{
    
    @Published var statusText : String = "Not started"
    @Published var lastEventText :  String = "No events yet"
    @Published var events: [GeofenceModel] = []
    @Published var zones: [ZoneEvent] = []
    
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
    
    private func setupCallback() {
           service.onEventTriggered = { [weak self] zoneId, eventType in
               guard let self = self else { return }
               if let zone = self.zones.first(where: { $0.id.uuidString == zoneId }) {
                   let newEvent = GeofenceService
                   
                   DispatchQueue.main.async {
                       self.events.insert(GeofenceModel(Name: "", date: Date(), latitude: 0.0, longitude: 0.0, message: ""), at: 0) // Newest first
                       self.sendLocalNotification(for: ZoneEvent)
                   }
               }
           }
       }
       
    func addZone(name: String, lat: Double, lon: Double, date: Date, message: String ) {
        let newZone = GeofenceModel(id: UUID(), Name: name, date: Date(), latitude: lon, longitude: lon, message: message )
        zones.append(ZoneEvent(id: UUID(), zoneName: name, eventType: "", timeStamp: Date()  ))
       }
    
       
       private func sendLocalNotification(for event: ZoneEvent) {
           let content = UNMutableNotificationContent()
           content.title = "Zone Alert: \(event.zoneName)"
           content.body = "You just \(event.eventType.lowercased()) this zone."
           content.sound = .default
           
           let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
           UNUserNotificationCenter.current().add(request)
       }
       
    
    
}
