//
//  MotionServices.swift
//  MotionClass2
//
//  Created by Naqui Darby on 4/19/26.
//

import Foundation
import CoreMotion

class MotionService{
    
    // Access the CoreMotion class
    private let motionManager: CMMotionManager = CMMotionManager()
    
    
    func startGettingValues(
        // call back functions -  take 3 doubles and return nothing
        // @escaping: means that this functions will be executed multiple times when the data gets to them
        // this "Clousure" will outlive the function
        onAccel:@escaping (Double,Double,Double) -> Void,
        onGyro:@escaping (Double,Double,Double) -> Void ){
            
            // Accelerometer updates
            if self.motionManager.isAccelerometerAvailable == true{
                self.motionManager.accelerometerUpdateInterval = 0.1 // 10 times per second
                
                
                // handler variable
                let accelerometerHandler: (CMAccelerometerData?, Error?) -> Void = { data, error in
                    if let safeData: CMAccelerometerData = data{
                        let x : Double = safeData.acceleration.x
                        let y : Double = safeData.acceleration.y
                        let z : Double = safeData.acceleration.z
                        onAccel(x,y,z)
                    }
                }
                
                
                
               // Passing the Handler
                self.motionManager.startAccelerometerUpdates(to: .main, withHandler:accelerometerHandler)
                
                // trailing closure
                // Usually we use the weak self to prevent memory leakeage

//                self.motionManager.startAccelerometerUpdates(to: OperationQueue.main){ (data, error) in
//                    if let safeData: CMAccelerometerData = data{
//                        let x : Double = safeData.acceleration.x
//                        let y : Double = safeData.acceleration.y
//                        let z : Double = safeData.acceleration.z
//                        onAccel(x,y,z)
//                    }
//                }
            }
            
            if self.motionManager.isGyroAvailable == true {
                self.motionManager.gyroUpdateInterval = 0.1 // 10 times per second
                
                
                self.motionManager.startGyroUpdates(to:OperationQueue.main){(data,error) in
                    if let safeData: CMGyroData = data{
                        let x : Double = safeData.rotationRate.x
                        let y : Double = safeData.rotationRate.y
                        let z : Double = safeData.rotationRate.z
                        onGyro(x,y,z)
                    }
                }
            }
        }
    
    
    func stop(){
        self.motionManager.stopGyroUpdates()
        self.motionManager.stopAccelerometerUpdates()
    }
    
    
   
}
