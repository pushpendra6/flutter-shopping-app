# flutter_shopping_app

A Flutter shopping application that displays a list of shoes with basic filtering and product cards.

## Overview

This project demonstrates:
- Displaying products using `ListView.builder`
- Using dummy product data
- Reusable UI components (`ProductCard`)
- Horizontal filter chips
- Basic Flutter layout and theming

## Features

- Shoe product listing
- Filter chips (Nike, Addidas, Bata, etc.)
- Product cards showing:
  - Product title
  - Price
  - Product image
- Search input UI (UI only)
- Simple Material UI design

## Project Structure

- `main.dart` – App entry point and theme configuration  
- `home_page.dart` – Home screen with filters and product list  
- `product_card.dart` – Reusable product card widget  
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

## Resources

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For more help, visit the  
[Flutter documentation](https://docs.flutter.dev/).
