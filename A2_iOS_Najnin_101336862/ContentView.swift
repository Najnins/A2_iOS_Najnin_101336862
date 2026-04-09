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
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productID, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>
      // Track current product index, Search input, Show add product screen
    @State private var currentIndex: Int = 0
    @State private var searchText: String = ""
    @State private var showAddProductSheet = false

     // Get currently displayed product
    var filteredProducts: [Product] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return Array(products)
        }

        return products.filter { product in
            product.wrappedName.localizedCaseInsensitiveContains(searchText) ||
            product.wrappedDescription.localizedCaseInsensitiveContains(searchText)
        }
    }

    var currentProduct: Product? {
        guard !filteredProducts.isEmpty else { return nil }
        let safeIndex = min(currentIndex, filteredProducts.count - 1)
        return filteredProducts[safeIndex]
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Search by name or description", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .onChange(of: searchText) { _, _ in
                        currentIndex = 0
                    }

                if let product = currentProduct {
                    ProductDetailView(product: product)
                        .padding(.horizontal)

                    HStack(spacing: 20) {
                        Button("Previous") {
                            if currentIndex > 0 {
                                currentIndex -= 1
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(currentIndex == 0)

                        Button("Next") {
                            if currentIndex < filteredProducts.count - 1 {
                                currentIndex += 1
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(currentIndex >= filteredProducts.count - 1)
                    }

                    Text("Showing \(currentIndex + 1) of \(filteredProducts.count)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } else {
                    Spacer()
                    Text("No product found")
                        .font(.headline)
                        .foregroundColor(.red)
                    Spacer()
                }

                Divider()

                HStack(spacing: 20) {
                    NavigationLink("View Full Product List") {
                        ProductListView()
                    }
                    .buttonStyle(.bordered)

                    Button("Add New Product") {
                        showAddProductSheet = true
                    }
                    .buttonStyle(.borderedProminent)
                }

                Spacer()
            }
            .padding(.top)
            .navigationTitle("Products")
            .sheet(isPresented: $showAddProductSheet) {
                AddProductView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
        .onAppear {
            currentIndex = 0
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
