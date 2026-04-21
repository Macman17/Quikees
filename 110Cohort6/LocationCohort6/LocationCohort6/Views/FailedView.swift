//
//  FailedView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct FailedView: View {
    let message: String
    let onTryAgain: () -> Void
    
    var body: some View {
        VStack{
            Text(message)
            Button("Try Again"){
                self.onTryAgain()
            }.buttonStyle(.bordered)
                
        }
    }
}

#Preview {
    FailedView(message: "Failed", onTryAgain: {})
}
