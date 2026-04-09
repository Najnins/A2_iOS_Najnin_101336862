//
//  Persistence.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//
import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "A2_iOS_Najnin_101336862")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved Core Data error: \(error), \(error.userInfo)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func preloadProductsIfNeeded() {
        let context = container.viewContext
        let request: NSFetchRequest<Product> = Product.fetchRequest()

        do {
            let count = try context.count(for: request)

            if count > 0 { return }
          // Insert products into database
            let products: [(Int64, String, String, Double, String)] = [
                (1, "iPhone 15", "Apple smartphone with advanced camera and fast performance", 1299.99, "Apple"),
                (2, "MacBook Air", "Lightweight laptop with M-series chip", 1599.99, "Apple"),
                (3, "iPad Air", "Powerful tablet for study and entertainment", 899.99, "Apple"),
                (4, "AirPods Pro", "Wireless earbuds with noise cancellation", 329.99, "Apple"),
                (5, "Apple Watch", "Smart watch for fitness and notifications", 599.99, "Apple"),
                (6, "Galaxy S24", "Samsung flagship smartphone with AMOLED display", 1199.99, "Samsung"),
                (7, "Galaxy Tab", "Android tablet for work and media", 749.99, "Samsung"),
                (8, "Dell XPS 13", "Premium ultrabook with sleek design", 1499.99, "Dell"),
                (9, "Sony Headphones", "Over-ear headphones with rich sound", 249.99, "Sony"),
                (10, "Logitech Mouse", "Wireless ergonomic mouse for daily use", 59.99, "Logitech")
            ]

            for item in products {
                let product = Product(context: context)
                product.productID = item.0
                product.name = item.1
                product.productDescription = item.2
                product.price = item.3
                product.provider = item.4
            }

            try context.save()
        } catch {
            print("Failed to preload products: \(error.localizedDescription)")
        }
    }
}
