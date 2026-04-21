//
//  LocationReadyView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct LocationReadyView: View {
    
    let latitudeText: String
    let longitudeText: String
    let onRefresh: () -> Void
    let onSave: () -> Void
    
    var body: some View {
        VStack(spacing: 12){
            VStack{
                Text("Latitude \(latitudeText)")
                Text("Longitude \(longitudeText)")
                
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

#Preview {
    LocationReadyView(latitudeText: "100", longitudeText: "200", onRefresh: {}, onSave: {})
}
