//
//  AddProductView.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//
import SwiftUI
import CoreData

struct AddProductView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    // Input fields
    @State private var id = ""
    @State private var name = ""
    @State private var desc = ""
    @State private var price = ""
    @State private var provider = ""

    var body: some View {

        NavigationStack {
            Form {

                TextField("Product ID", text: $id)
                TextField("Name", text: $name)
                TextField("Description", text: $desc)
                TextField("Price", text: $price)
                TextField("Provider", text: $provider)

                Button("Save") {
                    saveProduct()
                }
            }
            .navigationTitle("Add Product")
        }
    }

    // Save new product
    func saveProduct() {

        guard let idValue = Int64(id),
              let priceValue = Double(price) else { return }

        let product = Product(context: viewContext)
        product.productID = idValue
        product.name = name
        product.productDescription = desc
        product.price = priceValue
        product.provider = provider

        try? viewContext.save()
        dismiss()
    }
}
