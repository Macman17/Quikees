//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/12/26.
//

import SwiftUI


struct WeatherView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var weatherViewModel: WeatherViewModel = WeatherViewModel()
    @StateObject private var viewModel: SavedLocationViewModel = SavedLocationViewModel()
    @State private var isFavorite: Bool = false
    
    
    
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 16) {
                
                TextField("Enter a city ", text: $weatherViewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.words)
                TextField("Baseline Temp", value: $viewModel.baselineTemp, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.words)
                
                TextField("Note", text: $viewModel.notes)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.words)
                
                // IMPORTANT PART
                Button("Get Weather") {
                    Task {
                        await weatherViewModel.searchWeather()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                if weatherViewModel.isLoading {
                    ProgressView("Loading…")
                }
                
                if !weatherViewModel.errorMessage.isEmpty {
                    Text(weatherViewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                if !weatherViewModel.cityName.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(weatherViewModel.cityName)
                            .font(.title2)
                            .bold()
                        
                        Text(weatherViewModel.temperatureText)
                        Text(weatherViewModel.windText)
                        Text(weatherViewModel.timeText)
                        Text("Baseline Temp: \(viewModel.baselineTemp, specifier: "%.1f")°C")
                        Text(viewModel.notes)
                        
                        FavoriteToggle(isFavorite: $isFavorite)
                            .onChange(of:isFavorite) {
                                viewModel.isFavorite = isFavorite
                                
                                dismiss()
                            }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            
            Spacer()
            
            
            
                .padding()
                .navigationTitle("Weather")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Add Location"){
                            Image(systemName: "plus")
                           
                        }
                    }
                }
                    
                    TabView {
                        SavedLocationView()
                            .tabItem {
                                Label("Saved Locations", systemImage: "book")
                            }
                    }
                }
            
        }
    }






