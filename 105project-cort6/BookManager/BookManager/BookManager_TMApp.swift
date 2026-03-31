//
//  BookManager_TMApp.swift
//  BookManager
//
//  Created by Naqui Darby on 3/12/26.
//
import SwiftUI
import SwiftData

@main
struct BookManager_TM: App {
    let modelContainer: ModelContainer
     
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .modelContainer(modelContainer)
            }
        }
        
        init(){
            do {
                modelContainer = try ModelContainer(
                    for: PersistentBookTests.self
                )
            } catch {
                fatalError("Failed to load model container")
            }
        }

}
