//
//  Healthviewmodel.swift
//  HealthTracker
//
//  Created by Naqui Darby on 4/14/26.
//

import Foundation
import HealthKit

class HealthViewModel: ObservableObject {
    
    @Published var steps: Int = 0
    @Published var distance: Double = 0.0
    @Published var activityStatus: String = "Not Active"
    @Published var authorizationStatus: String = "Not Requested"
    @Published var isAuthorized: Bool = false
    
    private let healthStore: HKHealthStore = HKHealthStore()
    
    private func updateActivityStatus() {
        if steps < 2000 {
            activityStatus = "Sedentary"
        }else if steps < 5000 {
            activityStatus = "Lightly Active"
        }else if steps < 7000 {
            activityStatus = "Moderately Active"
        }else if steps < 10000 {
            activityStatus = "Very Active"
        }else {
            activityStatus = "Super Active"
        }
    }
}
