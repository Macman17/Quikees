//
//  LocationViewModel.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import Foundation
import CoreLocation
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
            timestamp: Date())
        
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
}
