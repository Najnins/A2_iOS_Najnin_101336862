//
//  Persistence.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//
import Foundation
import CoreData

// Handles Core Data setup and database operations
struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {

        // Connect to Core Data model (MUST match model file name)
        container = NSPersistentContainer(name: "A2_iOS_Najnin_101336862")

        // Used for testing (optional)
        if inMemory {
            container.persistentStoreDescriptions.first?.url =
                URL(fileURLWithPath: "/dev/null")
        }

        // Load database
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Core Data failed: \(error)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    // Insert default 10 products if database is empty
    func preloadProductsIfNeeded() {

        let context = container.viewContext
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            let count = try context.count(for: request)

            // If already data exists → do nothing
            if count > 0 { return }

            let defaultProducts = [
                (1, "iPhone 15", "Apple smartphone", 1299.99, "Apple"),
                (2, "MacBook Air", "Lightweight laptop", 1599.99, "Apple"),
                (3, "iPad Air", "Tablet device", 899.99, "Apple"),
                (4, "AirPods Pro", "Wireless earbuds", 329.99, "Apple"),
                (5, "Apple Watch", "Smartwatch", 599.99, "Apple"),
                (6, "Galaxy S24", "Samsung phone", 1199.99, "Samsung"),
                (7, "Galaxy Tab", "Android tablet", 749.99, "Samsung"),
                (8, "Dell XPS 13", "Ultrabook", 1499.99, "Dell"),
                (9, "Sony Headphones", "Audio device", 249.99, "Sony"),
                (10, "Logitech Mouse", "Wireless mouse", 59.99, "Logitech")
            ]

            // Insert products into database
            for item in defaultProducts {
                let product = Product(context: context)
                product.productID = item.0
                product.name = item.1
                product.productDescription = item.2
                product.price = item.3
                product.provider = item.4
            }

            try context.save()

        } catch {
            print("Preload failed: \(error.localizedDescription)")
        }
    }
}
