//
//  GeofenceScreen.swift
//  GeoFenceDemo
//
//  Created by Naqui Darby on 4/27/26.
//



import SwiftUI

struct GeofenceScreen: View {
    @StateObject private var vm = GeofenceViewModel()

    var body: some View {
        VStack(spacing: 12) {
            
            Text("GeoFence Reminder")
                .font(.title2).bold()

            Text(vm.statusText)
            Text(vm.lastEventText)
                .font(.footnote)

            VStack {
                VStack{
                    Button("Request Permissions") { vm.requestPermissions() }
                }.buttonSizing(ButtonSizing.flexible)
                    .buttonStyle(.borderedProminent)
                HStack{
                    Button("Start") { vm.startGeofence() }
                    Button("Stop") { vm.stopGeofence() }
                    
                } .buttonSizing(ButtonSizing.flexible)
                    .buttonStyle(.borderedProminent)
            }
            Button("Clear Log") { vm.clearLog() }
                .buttonStyle(.bordered)
                .buttonSizing(ButtonSizing.flexible)
            
            List(vm.events) { event in
                VStack(alignment: .leading) {
                    Text(event.message)
                    Text(event.date.formatted(date: .abbreviated, time: .standard))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
    }
}


#Preview {
    GeofenceScreen()
}
