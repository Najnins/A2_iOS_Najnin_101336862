# A2_iOS_Najnin_101336862
---
Author :Najnin Sultana
Student ID: 101336862
---
## Project Description

This project is an iOS application developed using SwiftUI and Core Data.
The application allows users to manage product information including viewing, searching, navigating, and adding new products.
The app demonstrates data persistence using Core Data and dynamic UI updates using SwiftUI.
---
## Features
* Store product data using Core Data
* Automatically insert 10 default products on first launch
* Display the first product when the app starts
---
## Navigate products using:
* Previous button
* Next button
---
## Search products by:
* Product Name
* Product Description
---
Add new product using a form
View full list of products (Name + Description)
---
## Technologies Used
* Swift
* SwiftUI
* Core Data
* Xcode
---
## Core Data Model
* Entity: Product
* productID	Integer 64
* name	String
* productDescription	String
* price	Double
* provider	String
---
## Important Notes:
productDescription is used instead of description to avoid conflicts with Swift.
No relationships are used in this project.
---
## Application Workflow
* App Launch
* Core Data is initialized
* If database is empty → 10 products are inserted
* First product is displayed automatically
---
## User Actions

**Users Can:**
* Navigate products (Next / Previous)
* Search products dynamically
* View all products in a list
* Add a new product

**Search Functionality**
* Case-insensitive search
* Searches both:
* Product Name
* Product Description
* Results update in real-time

**Add Product Feature**

**Users can:**
* Enter product details
* Validate inputs
* Save new product to Core Data

**  Validation ensures:**
* No empty fields
* Valid ID and price
* No duplicate Product ID
---
**How to Run**
Open project in Xcode
Make sure Core Data model is correctly set:
Entity name: Product
Build the project (Cmd + B)
Run on iPhone Simulator
---
**Summary**

This application demonstrates how to use Core Data in an iOS SwiftUI project. It allows users to manage product data efficiently with features like navigation, search, and data insertion. The UI updates automatically when data changes, ensuring a smooth user experience.
---
