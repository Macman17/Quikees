//
//  LoadingView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/19/26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView().padding()
            Text("Location Loading...")
                .font(.largeTitle)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    LoadingView()
}
