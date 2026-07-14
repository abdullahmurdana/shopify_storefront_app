# Shopify Storefront App

A cross-platform mobile storefront built with Flutter that connects to a headless
Shopify store through the Storefront API (GraphQL). It renders a product catalogue,
handles product details and variations, and manages a shopping cart, with the UI
kept separate from the API layer for maintainability.

![Flutter](https://img.shields.io/badge/Flutter-Dart-blue)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey)
![State](https://img.shields.io/badge/State-GetX-purple)
![API](https://img.shields.io/badge/API-Shopify%20Storefront%20GraphQL-96bf48)
![License](https://img.shields.io/badge/License-MIT-green)

## Overview

This app turns a headless Shopify store into a native mobile shopping experience.
It consumes the Shopify Storefront API over GraphQL to fetch products, collections,
and pricing, and presents them through reusable Flutter components. The data layer
is decoupled from the UI, so screens map cleanly from API payloads without tying
presentation to the raw responses.

The store domain and Storefront access token are supplied through configuration, so
the same app can point at any Shopify store without code changes, effectively a
white-label storefront driven entirely by config.

## Features

- **Any store via config** — point the app at any Shopify store by supplying its domain and Storefront token; no code changes needed.
- **Product catalogue** — browse products and collections pulled live from Shopify.
- **Product details** — descriptions, images, pricing, and product variations.
- **Filtering** — filter products by category and attributes.
- **Cart** — add items, adjust quantities, and manage a shopping cart with running totals.
- **GraphQL data layer** — efficient queries against the Shopify Storefront API.
- **Decoupled architecture** — UI components separated from API models for maintainability.

## Tech stack

- **Framework:** Flutter (Dart)
- **State management:** GetX
- **API:** Shopify Storefront API (GraphQL)
- **Networking:** graphql (GraphQL client for Dart)
- **Architecture:** Clean Architecture, decoupled UI and data layers

## Getting started

```bash
# Clone
git clone https://github.com/abdullahmurdana/shopify_storefront_app.git
cd shopify_storefront_app

# Install dependencies
flutter pub get

# Run
flutter run
```

**Configuration**

This app needs Shopify Storefront API credentials. Do not commit real credentials.

1. Copy the example env file:
```bash
   cp .env.example .env
```
2. Add your own values to `.env`:
SHOPIFY_STORE_DOMAIN=your-store.myshopify.com
SHOPIFY_STOREFRONT_TOKEN=your_storefront_access_token
3. `.env` is gitignored and will not be committed.

## Security

Store credentials are read from a local `.env` file and are never committed to the
repository. `.env` is listed in `.gitignore`, and only `.env.example` (with
placeholder values) is tracked.

## Roadmap

Core storefront functionality is complete. Planned future updates:

- Checkout and payment flow
- User accounts and order history
- Wishlist and saved items

## Author

**Mohammed Abdullah Khan** - Flutter Developer

Portfolio: https://abdullahmurdana.github.io ·
LinkedIn: https://www.linkedin.com/in/abdullahmurdana

## License

Released under the MIT License. See [LICENSE](LICENSE) for details.
