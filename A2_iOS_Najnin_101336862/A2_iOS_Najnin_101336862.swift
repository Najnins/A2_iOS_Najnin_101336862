//
//  A2_iOS_Najnin_101336862.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//

import SwiftUI
import CoreData

// Entry point of the app
@main
struct A2_iOS_Najnin_101336862: App {

    // Shared Core Data controller
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject Core Data context into all views
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext)
                .onAppear {
                    // Load default products only once
                    persistenceController.preloadProductsIfNeeded()
                }
        }
    }
}
