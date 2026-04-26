//
//  CheckInList.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct CheckInList: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
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
                   
                    if checkIns.currentLocations == nil {
                        EmptyView()
                           .onAppear{
                               Text("No Check-ins yet")
                               Image(systemName: "location.fill")
                           }
                    } else{
                        NavigationLink(destination: CheckinDetailsView(viewModel: LocationViewModel())){
                            Text(item.timestamp,style: .time)
                            Text(item.timestamp,style: .date)
                            
                            Text("Lat: \(item.latitude)")
                            Text("Long: \(item.longitude)")
                            Text(verbatim: "\(item.distance)")
                            
                        }
                    }
                        
                    }
                }
            }
        }
    }




