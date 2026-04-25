//
//  SavedLocationView.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/24/26.
//

import SwiftUI

struct SavedLocationView: View {
    
     
    
    @StateObject private var weatherViewModel: WeatherViewModel = WeatherViewModel()
    @StateObject private var viewModel: SavedLocationViewModel = SavedLocationViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.savedLocation.indices, id: \.self) { index in
                NavigationLink(destination: SavedLocationDetails(savedLocation: viewModel.savedLocation[index])){
                    
                    Text(viewModel.savedLocation[index].name)
                   
                }
            }
            .navigationBarTitle("Saved Locations")
        }
    }
}
