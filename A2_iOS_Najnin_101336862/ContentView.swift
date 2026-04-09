//
//  ContentView.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//
import SwiftUI
import CoreData

struct ContentView: View {

    // Access Core Data context
    @Environment(\.managedObjectContext) private var viewContext

    // Fetch all products sorted by ID
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productID, ascending: true)]
    )
    private var products: FetchedResults<Product>

    // Track current product index
    @State private var currentIndex = 0

    // Search input
    @State private var searchText = ""

    // Show add product screen
    @State private var showAddSheet = false

    // Filter products based on search
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return Array(products)
        }

        return products.filter {
            $0.wrappedName.localizedCaseInsensitiveContains(searchText) ||
            $0.wrappedDescription.localizedCaseInsensitiveContains(searchText)
        }
    }

    // Get currently displayed product
    var currentProduct: Product? {
        guard !filteredProducts.isEmpty else { return nil }
        return filteredProducts[min(currentIndex, filteredProducts.count - 1)]
    }

    var body: some View {
        NavigationStack {

            VStack {

                // 🔍 Search Bar
                TextField("Search...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                if let product = currentProduct {

                    // Show product details
                    ProductDetailView(product: product)

                    // Navigation buttons
                    HStack {
                        Button("Previous") {
                            if currentIndex > 0 { currentIndex -= 1 }
                        }

                        Button("Next") {
                            if currentIndex < filteredProducts.count - 1 {
                                currentIndex += 1
                            }
                        }
                    }
                }

                Divider()

                // Navigation to list + add screen
                HStack {
                    NavigationLink("View List") {
                        ProductListView()
                    }

                    Button("Add Product") {
                        showAddSheet = true
                    }
                }
            }
            .navigationTitle("Products")
            .sheet(isPresented: $showAddSheet) {
                AddProductView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }
}
