//
//  ProductListView.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//
import SwiftUI
import CoreData

struct ProductListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productID, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    var body: some View {
        List {
            ForEach(products) { product in
                VStack(alignment: .leading, spacing: 6) {
                    Text(product.wrappedName)
                        .font(.headline)

                    Text(product.wrappedDescription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("All Products")
    }
}

#Preview {
    NavigationStack {
        ProductListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
