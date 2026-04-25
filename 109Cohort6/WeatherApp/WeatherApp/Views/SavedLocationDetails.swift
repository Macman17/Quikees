//
//  SavedLocationDetails.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/22/26.
//

import SwiftUI

struct SavedLocationDetails: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var weatherViewModel: WeatherViewModel = WeatherViewModel()
    @StateObject private var saveLocations: SavedLocationViewModel = SavedLocationViewModel()
    let savedLocation: SavedLocations
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading){
                Text("Saved Location Details")
                    .font(.largeTitle)
                    .padding()
                VStack{
                    Text("Name: \(saveLocations.name)")
                        .padding()
                    
                    Text("Latitude: \(saveLocations.latitude)")
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(weatherViewModel.cityName)
                            .font(.title2)
                            .bold()

                        Text(weatherViewModel.temperatureText)
                        Text(weatherViewModel.windText)
                        Text(weatherViewModel.timeText)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
            }
        } .padding()
            .navigationTitle("Saved Location Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}
