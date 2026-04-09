# A2_iOS_Najnin_101336862
Author

Najnin Sultana
Student ID: 101336862

## Project Description

This project is an iOS application developed using SwiftUI and Core Data.
The application allows users to manage product information including viewing, searching, navigating, and adding new products.

The app demonstrates data persistence using Core Data and dynamic UI updates using SwiftUI.

## Features
-- Store product data using Core Data
-- Automatically insert 10 default products on first launch
-- Display the first product when the app starts
## Navigate products using:
-- Previous button
-- Next button
## Search products by:
-- Product Name
-- Product Description
-- Add new product using a form
-- View full list of products (Name + Description)
## Technologies Used
Swift
SwiftUI
Core Data
Xcode
 Core Data Model
Entity: Product
Attribute	Type
productID	Integer 64
name	String
productDescription	String
price	Double
provider	String

## Important Notes:

productDescription is used instead of description to avoid conflicts with Swift.
No relationships are used in this project.
 Application Workflow
App Launch
Core Data is initialized
If database is empty → 10 products are inserted
First product is displayed automatically
User Actions

Users can:

Navigate products (Next / Previous)
Search products dynamically
View all products in a list
Add a new product
 Search Functionality
Case-insensitive search
Searches both:
Product Name
Product Description
Results update in real-time
 Add Product Feature

Users can:

Enter product details
Validate inputs
Save data into Core Data

Validation includes:

No empty fields
Valid numeric values
Unique Product ID
 Product List View

Displays:

Product Name
Product Description

Implemented using SwiftUI List.

 Core Data Implementation
PersistenceController manages Core Data stack
NSPersistentContainer initializes the database
@FetchRequest fetches data automatically
UI updates dynamically when data changes
 Assignment Requirements Checklist
Requirement	Status
Core Data used	✅
At least 10 products	✅
Show first product on launch	✅
Navigation (Next/Previous)	✅
Search functionality	✅
Add new product	✅
Full product list	✅
 How to Run
Open project in Xcode
Make sure Core Data model is correctly set:
Entity name: Product
Build the project (Cmd + B)
Run on iPhone Simulator
 Common Issues & Fixes
 Failed to load model

 Ensure model name matches:

NSPersistentContainer(name: "A2_iOS_Najnin_101336862")
 Duplicate Core Data errors

✔ Set Codegen to:

Manual / None
 Cannot find Product

 Ensure:

Entity name = Product
Core Data files exist
 Future Improvements
Edit product feature
Delete product feature
Better UI design
Sorting options
Filter by price/provider
