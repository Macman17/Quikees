//
//  Healthviewmodel.swift
//  HealthTracker
//
//  Created by Naqui Darby on 4/14/26.
//

import Foundation
import HealthKit
import Combine

class HealthViewModel: ObservableObject {
    
    @Published var steps: Int = 0
    @Published var distance: Double = 0.0
    @Published var activityStatus: String = "Not Active"
    @Published var authorizationStatus: String = "Not Requested"
    @Published var isAuthorized: Bool = false
    
    private let healthStore: HKHealthStore = HKHealthStore()
    
    init(){
        checkHealthDataAvailability()
    }
    
    private func checkHealthDataAvailability() {
        if HKHealthStore.isHealthDataAvailable(){
            print("Is available on this Device")
        
        } else {
            print("Not Available on this device")
                authorizationStatus = "Not Available"
        }
    }
    
    func requestAuth() {
        
        let typeToRead: Set<HKObjectType> = [
                HKObjectType.quantityType(forIdentifier: .stepCount)!,
                HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.categoryType(forIdentifier: .appleWalkingSteadinessEvent)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: typeToRead) { (success, error) in
            
            DispatchQueue.main.async {
                if success {
                    self.isAuthorized = true
                    self.authorizationStatus = "Authorized"
                    self.fetchTodayStep()
                    self.fetchTodayDistance()
                    
                }else {
                    self.isAuthorized = false
                    self.authorizationStatus = "Denied"
                    
                    if let error = error {
                        print("HealthKit Authorization denied with error: \(error.localizedDescription)")
                    }
                }
                
                func fetchTodayStep(){
                    guard let distanceType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
                        print("No Steps")
                        return
                        
                    }
                    
                    let now = Date()
                    
                    let startOfDay = Calendar.current.startOfDay(for: now)
                    
                    let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
                    
                    let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, result, error) in
                        
                        DispatchQueue.main.async {
                            if let error = error {
                                print("Error fetching steps")
                                self.distance = 0
                                
                                return
                            }
                            
                            if let result = result, let sum = result.sumQuantity(){
                                
                                let distanceInMeter = sum.doubleValue(for: .meter())
                                let distanceInKiloMeters = distanceInMeter / 1000.0
                                self.distance = distanceInKilometers
                                
                        
                            }else{
                                self.distance = 0.0
                                self.updateActivityStatus()
                        }
                    }
                        
                }
                    self.healthStore.execute(query)

                }
                
                func startObsevingSteps(){
                    guard let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
                    
                        print("No Steps")
                        return}
                }
  
                    
                let query = HKObserverQuery(sampleType: stepCountType, predicate: nil){
                    query, completetionHandler, error in
                    
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    self.fetchTodaySteps()
                    self.fetchTodayDistance()
                    
                    completetionHandler()
                    
                }
                healthStore.excute(query)
            }
        }
    }
    
    
    
    
    
    private func updateActivityStatus() {
        if  distance < 2000 {
            activityStatus = "Sedentary"
        }else if distance < 5000 {
            activityStatus = "Lightly Active"
        }else if distance < 7000 {
            activityStatus = "Moderately Active"
        }else if distance < 10000 {
            activityStatus = "Very Active"
        }else {
            activityStatus = "Super Active"
        }
    }
}
