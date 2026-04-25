//
//  CheckInList.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct CheckInList: View {
    @StateObject private var checkIns: LocationViewModel =
    LocationViewModel()
    let onClearAll: () -> Void
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Check-ins")
                    .font(.headline)
                Button("Clear All"){
                    self.onClearAll()
                }
                
                List(checkIns.checkIn){ item in
                    NavigationLink(destination: CheckinDetailsView(viewModel: LocationViewModel())){
                            Text(item.timestamp,style: .time)
                            Text(item.timestamp,style: .date)
                            
                            Text("Lat: \(item.latitude)")
                            Text("Long: \(item.longitude)")
                        Text(verbatim: "Distance",\(item.distance ))
                            
                        }
                        
                    }
                }
            }
        }
    }



