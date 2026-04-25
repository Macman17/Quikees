//
//  LocationReadyView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

struct LocationReadyView: View {
    
    @StateObject private var location: LocationViewModel = LocationViewModel()
    @State private var locationString = "Unknown"
    @State private var destination = ""
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 30.3322, longitude: -81.6557), // Default: Jacksonville
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        @State private var directions: [String] = []

    let onRefresh: () -> Void
    let onSave: () -> Void
    
    var body: some View {
        VStack(spacing: 12){
            
            
            VStack{
                Form{
                    Section(header: Text("Location to Destination")){
                        LocationButton(.currentLocation) {
                            location.updateUIFromManager()
                        }
                        .labelStyle(.titleAndIcon)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                        
                        
                        TextField("Enter Destination", text: $destination)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        
                        HStack{
                            Button("Refresh"){
                                self.onRefresh()
                            }.buttonStyle(.borderedProminent)
                            Button("Save Check-in"){
                                self.onSave()
                                
                            }.buttonStyle(.borderedProminent)
                        }
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    LocationReadyView( onRefresh: {}, onSave: {})
}
