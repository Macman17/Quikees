//
//  CameraTestApp.swift
//  SwiftCamera
//
//  Created by Naqui Darby on 4/24/26.
//

import SwiftUI
import SwiftData

@main
struct CameraTestApp: App {
    var body: some Scene {
        
        WindowGroup {
            FeedView()
        }
        .modelContainer(for:ProgressEntry.self)
    }
}
