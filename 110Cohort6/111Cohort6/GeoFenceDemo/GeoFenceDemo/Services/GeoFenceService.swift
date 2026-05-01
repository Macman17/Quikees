//
//  GeoFenceService.swift
//  GeoFenceDemo
//
//  Created by Naqui Darby on 4/27/26.
//

import Foundation
import CoreLocation
import Combine

class GeofenceService: NSObject,ObservableObject, CLLocationManagerDelegate {
    
    @Published var statusText: String = "Not started"
    @Published var lastEventText: String = "No events yet"
    
    private let manager = CLLocationManager()
    
    var onEventTriggered: ((String, String) -> Void)?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
        
    
    func requestPermissions(){
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        
    }
    
    
    func startGeofence(center: CLLocationCoordinate2D,radius:CLLocationDistance,id:String){
        guard CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) else {
            statusText = "Geofence not available on this device"
            return
        }
        
        // if available
        // 1.- Create the region to be observed
        let region = CLCircularRegion(center: center, radius: radius, identifier: id)
        
        // 2.- Set notifications when exit and entry
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        // 3.- Tell the manager to start watching changes
        manager.startMonitoring(for: region)
        statusText = "Monitoring : \(id)"
        
    }
    
    func stopGeofence(id:String){
        for region in manager.monitoredRegions{
            if region.identifier == id {
                manager.stopMonitoring(for:region)
            }
        }
    }
    
    // Delegate Callback
    
    // Do when start monitoring
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        lastEventText = "Did start monitoring: \(region.identifier)"
    }
    
    // Do when enter region
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        lastEventText = "🚪 Entered: \(region.identifier)"

    }
    
    // Do when exit region
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
           lastEventText = "🚪 Exited: \(region.identifier)"
       }

    // Do when something fails
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           lastEventText = "❌ Error: \(error.localizedDescription)"
       }

    // When permissions change run this depending on permissions
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
             case .notDetermined: statusText = "Permission: not determined"
             case .restricted: statusText = "Permission: restricted"
             case .denied: statusText = "Permission: denied"
             case .authorizedWhenInUse: statusText = "Permission: when in use"
             case .authorizedAlways: statusText = "Permission: always "
             @unknown default: statusText = "Permission: unknown"
            }
        }
    
    
    
    
    
}
