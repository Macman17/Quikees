//
//  MotionViewModel.swift
//  MotionClass2
//
//  Created by Naqui Darby on 4/20/26.
//


import Foundation
import CoreMotion
import Combine

// VIEWMODEL
// Stores the data the View needs.
// MVVM rule: ViewModel talks to Services, View talks to ViewModel.

class MotionViewModel : ObservableObject{
    
    // These values update the UI automatically when they change.
      @Published var accelX: Double = 0.0
      @Published var accelY: Double = 0.0
      @Published var accelZ: Double = 0.0

      @Published var gyroX: Double = 0.0
      @Published var gyroY: Double = 0.0
      @Published var gyroZ: Double = 0.0

      @Published var isRunning: Bool = false

    // Instance our service
    
        var motion:MotionService = MotionService()
    
        
    func start(){
        if isRunning == true {
            return
        }
        
    
        motion.startGettingValues(
                    onAccel: { (x: Double, y: Double, z: Double) in
                        self.accelX = x
                        self.accelY = y
                        self.accelZ = z
                    },
                    onGyro: { (x: Double, y: Double, z: Double) in
                        self.gyroX = x
                        self.gyroY = y
                        self.gyroZ = z
                    }
                )
    }
    
    
    func stop() {
         motion.stop()
         isRunning = false
     }
    
    func almostLeveled()-> String{
        let xAbs = abs(accelX)
        let yAbs = abs(accelY)
        
        if xAbs < 0.10 && yAbs < 0.10 {
            return "Phone is leveled"
        }else{
            return "Phone is tilted"
        }
        
    }
    
    func rest(){
        motion.stop()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.start()
        }
    }
    

    
}
