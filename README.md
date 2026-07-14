# Shopify Storefront App

A cross-platform mobile storefront built with Flutter that connects to a headless
Shopify store through the Storefront API (GraphQL). It renders a product catalogue,
handles product details and variations, and manages a shopping cart, with the UI
kept separate from the API layer for maintainability.

![Flutter](https://img.shields.io/badge/Flutter-Dart-blue)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey)
![API](https://img.shields.io/badge/API-Shopify%20Storefront%20GraphQL-96bf48)
![License](https://img.shields.io/badge/License-MIT-green)

## Overview

This app turns a headless Shopify store into a native mobile shopping experience.
It consumes the Shopify Storefront API over GraphQL to fetch products, collections,
and pricing, and presents them through reusable Flutter components. The data layer
is decoupled from the UI, so screens map cleanly from API payloads without tying
presentation to the raw responses.

<!-- CONFIRM: is it built to point at ANY Shopify store via config (white-label),
     or one specific store? Keep the line below only if the config-driven part is real. -->
Store credentials (domain and Storefront access token) are supplied through
configuration, so the app can point at different Shopify stores without code changes.

## Features

- **Product catalogue** — browse products and collections pulled live from Shopify.
- **Product details** — view descriptions, images, pricing, and product variations.
- **Filtering** — [CONFIRM: category / attribute filtering — keep if real].
- **Cart** — add items, adjust quantities, and manage a shopping cart with running totals.
- **GraphQL data layer** — efficient queries against the Shopify Storefront API.
- **Decoupled architecture** — UI components separated from API models for maintainability.

## Tech stack

- **Framework:** Flutter (Dart)
- **State management:** [CONFIRM: GetX / BLoC / Provider]
- **API:** Shopify Storefront API (GraphQL)
- **Networking:** [CONFIRM: graphql_flutter / http / Dio]
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
