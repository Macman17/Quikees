//
//  SavedLocationService.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/17/26.
//
import Foundation
import CoreLocation
import Combine

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
 
    private let manager: CLLocationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    @Published var isLoading: Bool = true
    
    @Published var authStatus: CLAuthorizationStatus = .notDetermined
    
    override init(){
        
        super.init()
        
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        authStatus = manager.authorizationStatus
        
        
        
    }
    
    func requestLocation(){
        
        isLoading = true
        manager.requestLocation()
    }
    
    func requestLocationPermission(){
        
        authStatus = manager.authorizationStatus
        
        if authStatus == .notDetermined {
            manager.requestWhenInUseAuthorization( )
            return
        }
        
        if authStatus == .authorizedWhenInUse {
            requestLocation()
            return
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            
            authStatus = manager.authorizationStatus
            
            
            if authStatus == .authorizedWhenInUse || authStatus == .authorizedAlways {
                requestLocation()
            }else {
                isLoading = false
            }
        }
            func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]){
                
                if let lastLocation = location.last{
                    let location = lastLocation.coordinate
                }
                
                isLoading = false
            }
         func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            
            isLoading = false
        }
            
        
    }
}


