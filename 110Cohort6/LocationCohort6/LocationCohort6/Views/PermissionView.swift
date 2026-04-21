//
//  PermissionView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct PermissionView: View {
    
    let onEnable: () -> Void
    
    var body: some View {
       
        VStack(){
            Text("We need your location to work.")
            
            Button("Enable Location") {
                self.onEnable()
            }.padding()
        }
    }
}

#Preview {
    PermissionView(onEnable: {})
}
