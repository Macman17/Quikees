//
//  CheckinDetailsView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/25/26.
//

import SwiftUI

struct CheckinDetailsView: View {
    
    @StateObject var viewModel: LocationViewModel = LocationViewModel()
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Check-in Details")
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading) {
                    Text("Latitude: \(viewModel.latText)")
                    Text("Longitude: \(viewModel.lonText)")
                    Text("Current Location: \(String(describing: viewModel.currentLocation))")
                    Text("Destination: \(String(describing: viewModel.destination))")
                    Text("Distance: \(viewModel.distance)")
                    
                    
                }
            }
                .frame(maxWidth: .infinity)
                .background(content: { Color.secondary })
                .border(Color.gray, width: 1)
                .padding()

            
            
        } .navigationTitle("Check-in Details")
            .navigationBarTitleDisplayMode(.inline)
    }
       
}

#Preview {
    CheckinDetailsView(viewModel: LocationViewModel())
}
