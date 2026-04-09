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

    // Form fields
    @State private var productID: String = ""
    @State private var name: String = ""
    @State private var productDescription: String = ""
    @State private var price: String = ""
    @State private var provider: String = ""

    // Error handling
    @State private var showError = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Product Information") {
                    TextField("Product ID", text: $productID)
                        .keyboardType(.numberPad)

                    TextField("Product Name", text: $name)

                    TextField("Product Description", text: $productDescription)

                    TextField("Product Price", text: $price)
                        .keyboardType(.decimalPad)

                    TextField("Product Provider", text: $provider)
                }

                Section {
                    Button("Save Product") {
                        saveProduct()
                    }
                }
            }
            .navigationTitle("Add Product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert("Error", isPresented: $showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }

     // Save new product
    private func saveProduct() {
        guard let idValue = Int64(productID),
              let priceValue = Double(price),
              !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !productDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !provider.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter valid product information in all fields."
            showError = true
            return
        }

        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.predicate = NSPredicate(format: "productID == %d", idValue)

        do {
            let existingProducts = try viewContext.fetch(request)

            if !existingProducts.isEmpty {
                errorMessage = "Product ID already exists. Please use a different ID."
                showError = true
                return
            }

            let newProduct = Product(context: viewContext)
            newProduct.productID = idValue
            newProduct.name = name
            newProduct.productDescription = productDescription
            newProduct.price = priceValue
            newProduct.provider = provider

            try viewContext.save()
            dismiss()
        } catch {
            errorMessage = "Failed to save product: \(error.localizedDescription)"
            showError = true
        }
    }
}

#Preview {
    AddProductView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
