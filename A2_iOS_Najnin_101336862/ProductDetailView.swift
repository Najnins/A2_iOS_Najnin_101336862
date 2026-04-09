//
//  ProductDetailView.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//

import SwiftUI

//Show Product Details
struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(product.wrappedName)
                .font(.largeTitle)
                .bold()

            HStack {
                Text("Product ID:")
                    .bold()
                Text("\(product.productID)")
            }

            HStack {
                Text("Price:")
                    .bold()
                Text(String(format: "$%.2f", product.price))
            }

            HStack {
                Text("Provider:")
                    .bold()
                Text(product.wrappedProvider)
            }

            Text("Description:")
                .bold()

            Text(product.wrappedDescription)
                .foregroundColor(.secondary)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
