//
//  CheckInList.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct CheckInList: View {
    let checkIns: [LocationModel]
    let onClearAll: () -> Void
    
    var body: some View {
        VStack{
            VStack{
                Text("Check-ins")
                    .font(.headline)
                Button("Clear All"){
                    self.onClearAll()
                }.disabled(checkIns.count == 0)
                
                if checkIns.count == 0 {
                    Text("No check-ins yet")
                }else {
                    List(checkIns){ item in
                        VStack{
                            Text(item.timestamp,style: .time)
                            Text(item.timestamp,style: .date)
                            
                            Text("Lat: \(item.latitude)")
                            Text("Long: \(item.longitude)")
                        }
                        
                    }
                }
            }
        }
    }
}
