//
//  A2_iOS_Najnin_101336862App.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//

import SwiftUI
import CoreData
@main
struct A2_iOS_Najnin_101336862: App {
    // Create one shared Core Data persistence controller for the whole app
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject Core Data managed object context into the environment
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    // Insert default 10 products and only once when app launches first time
                    persistenceController.preloadProductsIfNeeded()
                }
        }
    }
}
