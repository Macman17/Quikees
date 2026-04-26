//
//  LocationViewModel.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import Foundation
import CoreLocation
import SwiftData
import Combine

enum LocationViewState {
    case needsPermission
    case loading
    case ready
    case denied
    case failed
    
}
class LocationViewModel: ObservableObject {
    @Published var viewState: LocationViewState = .needsPermission

  
    @Published var latText: String = "__"
    @Published var lonText: String = "__"
    @Published var errorMessage: String = ""
    @Published var currentLocations: CLLocationCoordinate2D? = nil
    @Published var destination: CLLocationCoordinate2D? = nil
    @Published var distance: String = CLLocationDistance().description

    
    @Published var checkIn: [LocationModel] = []
    
    private let service: LocationService = LocationService()
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(){
        self.service.objectWillChange.sink{
            [weak self] in
            DispatchQueue.main.async {
                if self != nil {
                    self!.updateUIFromManager()
                }
            }
            
        }
        .store(in: &self.cancellables)
    }
    
    func updateUIFromManager(){
        if self.service.isLoading == true {
            self.viewState = LocationViewState.loading
            return
        }
        
        let status = self.service.authStatus
        
        if status == CLAuthorizationStatus.notDetermined {
            self.viewState = LocationViewState.needsPermission
            return
        }
        
        if status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted {
            self.errorMessage = "Location is OFF, enabale it in settings"
            self.viewState = LocationViewState.denied
            
        }
        if self.service.location != nil {
            let coordinates = self.service.location!
            self.latText = String(format: "%.5f", coordinates.latitude)
            self.lonText = String(format: "%.5f", coordinates.latitude)

            self.viewState = LocationViewState.ready
        }
        
        self.errorMessage = "Could not read location"
        self.viewState = LocationViewState.failed
    }
    
    func saveCheckIn(){
        if self.service.location == nil {
            return
        }
        
        let coordinate = self.service.location!
        let newCoord = LocationModel(
            id: UUID(),
            longitude: coordinate.longitude,
            latitude: coordinate.latitude,
            timestamp: Date(),
            distane: CLLocationDistance())
        
        self.checkIn.insert(newCoord, at: 0)
    }
    
    func clearAll(){
        self.checkIn.removeAll()
    }
    
    func enableLocation(){
        self.errorMessage = ""
        self.viewState = .loading
        self.service.requestLocationPermission()
    }
    
    func refresh(){
        self.errorMessage = ""
        self.viewState = .loading
        self.service.requestLocationPermission()
    }
    
    
    func currentLocation() -> CLLocationCoordinate2D? {
       
        
        let coordinate = self.service.location!
        let newCoord = LocationModel(
            id: UUID(),
            longitude: coordinate.longitude,
            latitude: coordinate.latitude,
            timestamp: Date(), distane: CLLocationDistance())
        
        self.checkIn.insert(newCoord, at: 0)
        return coordinate
    }
    
    func destinationLocation(lat: String, lon: String) -> CLLocationCoordinate2D? {
        let latValue = Double(lat) ?? 0
        let lonValue = Double(lon) ?? 0
        return CLLocationCoordinate2D(latitude: latValue, longitude: lonValue)
    }
    
    func distanceBetweenLocations(lat1: String, lon1: String, lat2: String, lon2: String) -> String {
        
        let startCoordinate = self.currentLocation
        let endCoordinate = self.destinationLocation(lat: lat2, lon: lon2)
        let distanceBetween = CLLocation(latitude: startCoordinate()!.latitude, longitude: startCoordinate()!.longitude).distance(from: CLLocation(latitude: endCoordinate!.latitude, longitude: endCoordinate!.longitude))
        let result = Measurement(value: distanceBetween, unit: UnitLength.meters).converted(to: .miles)
        
        return "\(result) miles"

        
    }
}
