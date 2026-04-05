//
//  Product+Helpers.swift
//  A2_iOS_Najnin_101336862
//
//  Created by Najnin on 2026-04-04.
//
import Foundation

extension Product {
    // Safe wrappers to avoid nil issues in UI
    var wrappedName: String {
        name ?? "Unknown Product"
    }

    var wrappedDescription: String {
        productDescription ?? "No description available"
    }

    var wrappedProvider: String {
        provider ?? "Unknown Provider"
    }
}
