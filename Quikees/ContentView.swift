//
//  ContentView.swift
//  Quikees
//
//  Created by Naqui Darby on 1/6/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "iphone")
                .font(.system(size:50))
                .foregroundStyle(.green)
            Text("Welcome to IOS 10!!")
                .font(.title2)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
