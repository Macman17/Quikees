//
//  MotionView.swift
//  MotionClass2
//
//  Created by Naqui Darby on 4/20/26.
//


import SwiftUI

struct MotionView:View {
    @StateObject var viewModel:MotionViewModel = MotionViewModel()
    
    var body: some View {
        VStack(spacing: 30){
            
            Text("Motion Lab").font(.title)
            
            HStack(spacing: 12) {
                           Button(action: {
                               viewModel.start()
                           }, label: {
                               Text("Start")
                                   .frame(maxWidth: .infinity)
                           })
                           .buttonStyle(.borderedProminent)

                           Button(action: {
                               viewModel.stop()
                           }, label: {
                               Text("Stop")
                                   .frame(maxWidth: .infinity)
                           })
                           .buttonStyle(.bordered)
                       }
            
            Text(viewModel.almostLeveled())
                .font(.system(size: 28, weight: .bold))
            VStack(alignment: .leading, spacing: 10) {
                          Text("Accelerometer")
                              .font(.headline)
                
                

                          Text("X: " + String(format: "%.4f", viewModel.accelX))
                          Text("Y: " + String(format: "%.4f", viewModel.accelY))
                          Text("Z: " + String(format: "%.4f", viewModel.accelZ))
                      }
            
            VStack(alignment: .leading, spacing: 10) {
                            Text("Gyroscope")
                                .font(.headline)

                            Text("X: \(viewModel.gyroX)")
                            Text("Y: \(viewModel.gyroY)")
                            Text("Z: \(viewModel.gyroZ)")
                        }

           
            
            
            
        }
        .padding()
        .onDisappear {
                // Best practice: stop sensors when leaving the screen
                viewModel.stop()
            }
    }
}

#Preview {
    MotionView()
}
