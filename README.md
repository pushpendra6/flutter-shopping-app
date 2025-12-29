# flutter_shopping_app

A Flutter shopping application that displays a list of shoes with filtering, product details, and cart functionality using **Provider** for state management.

## Overview

This project demonstrates:
- Displaying products using `ListView.builder`
- Using dummy product data
- Reusable UI components (`ProductCard`)
- Horizontal filter chips
- **State management using Provider**
- Adding and removing products from cart
- Basic Flutter layout and theming

## Features

- Shoe product listing
- Filter chips (Nike, Adidas, Bata, etc.)
- Product cards showing:
  - Product title
  - Price
  - Product image
- Product details screen with size selection
- Add to Cart functionality
- Cart screen with:
  - List of added products
  - Delete product with confirmation dialog
- SnackBar feedback for user actions
- Simple Material UI design

## State Management

This project uses the **Provider** package for state management.

### Why Provider?
- Lightweight and easy to use
- Efficient UI rebuilds
- Clean separation of UI and business logic

### Provider Usage
- `CartProvider` extends `ChangeNotifier`
- Manages cart items (add / remove)
- UI listens to changes using:
  - `context.watch<CartProvider>()`
  - `Consumer<CartProvider>`

## Project Structure

- `main.dart` – App entry point and Provider setup  
- `home_page.dart` – Home screen with filters and product list  
- `product_details_screen.dart` – Product details with size selection  
- `cart_page.dart` – Cart screen with delete functionality  
- `product_card.dart` – Reusable product card widget  
- `cart_provider.dart` – Cart state management using Provider  
- `dummy_products_data.dart` – Local dummy product data  

## Dummy Data

Products are loaded from a local list containing:
- id
- title
- price
- imageUrl
- company
- available sizes

## Getting Started

1. Clone the repository  
2. Run `flutter pub get`  
3. Run the app using `flutter run`  

Make sure image assets are properly added in `pubspec.yaml`.

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
