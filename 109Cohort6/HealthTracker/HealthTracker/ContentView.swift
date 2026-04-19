//
//  ContentView.swift
//  HealthTracker
//
//  Created by Naqui Darby on 4/14/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HealthViewModel()
    
    var body: some View {
        VStack {
           HealthViewModel()
            StepCardView(steps: viewModel.distance)
            
            DistanceCardView(distance: viewModel.distance)
            
            ActivityStatusCard(
                activityStatus: viewModel.requestAuth,
                viewModel.authorizationStatus,
                isAuthorized: viewModel.isAuthorized
            )
            Spacer()
        }
        .navigationTitle("Health Tracker")
        .padding()
        .onAppear{
            viewModel.requestAuth()
        }
    }
}

#Preview {
    ContentView()
}
