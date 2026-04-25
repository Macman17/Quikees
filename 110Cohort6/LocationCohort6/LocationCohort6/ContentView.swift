//
//  ContentView.swift
//  LocationCohort6
//
//  Created by Naqui Darby on 4/17/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LocationViewModel()
    var body: some View {
        VStack {
            Text("Nearby Log").font(.headline).bold()
            
            if viewModel.viewState == .needsPermission {
                PermissionView(onEnable: viewModel.enableLocation)
            }else if viewModel.viewState == .loading {
                LoadingView()
            }else if viewModel.viewState == .ready {
                LocationReadyView(
                    onRefresh: viewModel.refresh,
                    onSave: viewModel.saveCheckIn)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
