
[![Figma Design](screenshots/figma_thumbnail.png)](https://www.figma.com/community/file/1216043752712853958/evira-e-commerce-online-shop-app-ui-kit)

---

## ✨ Badges

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android-blue.svg?style=for-the-badge)
![State Management: Bloc](https://img.shields.io/badge/State%20Management-Bloc-purple.svg?style=for-the-badge)
![Supabase](https://img.shields.io/badge/Backend-Supabase-green?style=for-the-badge&logo=supabase&logoColor=white)
![Sentry](https://img.shields.io/badge/Monitoring-Sentry-red?style=for-the-badge&logo=sentry&logoColor=white)


---


# 🛍️ Evira E-Commerce App

**Evira** is a premium **Flutter E-Commerce & Online Shopping app** built with **Bloc**, **Supabase**, and **Clean Architecture**.  
It delivers a complete and modern shopping experience — from product discovery and filtering to checkout, wallet payments, and order tracking — all with elegant light and dark themes.  

📱 Designed for performance, scalability, and beautiful UI across Android devices.  
⭐ Built with over **190+ responsive screens** and crafted for developers who want a ready-to-use, production-quality Flutter E-Commerce template.  


---

> ⚠️ **Project Status: In Development**  
>
> This project is still under active development.  
> Features, structure, and dependencies may change frequently until a stable release is published.  
> Contributions and feedback are always welcome!

---

## 📑 Table of Contents
- [✨ Badges](#-badges)
- [🛒 Evira E-Commerce & Online Shop App](#evira-e-commerce--online-shop-app)
- [🚀 Features](#-features)
- [📊 App Architecture](#-app-architecture)
- [🚀 Getting Started](#-getting-started)
- [📦 Dependencies Used](#-dependencies-used)
- [🎨 Figma Design](#-figma-design)
- [📸 Screenshots](#-screenshots)
- [🎥 Demo](#-demo)
- [🛠️ Contributions](#️-contributions)
- [📜 License](#-license)

---

## 🚀 Features

- 🎨 **Premium & Modern UI** with 190+ responsive screens  
- 🌗 **Light & Dark Theme** support  
- 🛒 **Complete Shopping Flow** – Wishlist, Cart, Checkout, and Order Tracking  
- 🔍 **Smart Product Search & Filters** with categories and reviews  
- 💳 **Secure Multiple Payment Methods** with promo & discount offers  
- 👛 **Integrated E-Wallet** – Top-Up, Transaction History & E-Receipts  
- 👤 **User Authentication** – Onboarding, Sign Up, Sign In, Forgot/Reset Password  
- 📦 **Shipping & Delivery Tracking** for orders  
- 🔔 **Notifications & Alerts** for updates and offers  
- ⚙️ **Profile & Settings Management** with account setup  
- 🛠️ **Fully Customizable Design System** with components, variants & auto layout  

---

## 📊 App Architecture

![App Architecture](screenshots/diagram.png)

```plaintext
lib
├───core
│   ├───constants
│   ├───di
│   ├───enums
│   ├───extensions
│   ├───gen
│   ├───l10n
│   ├───lang_generated
│   │   └───intl
│   ├───routes
│   │   └───args
│   ├───services
│   ├───theme
│   └───utils
├───features
│   ├───create_new_password
│   │   └───ui
│   │       ├───dialogs
│   │       ├───screen
│   │       └───widgets
│   ├───create_pin
│   │   ├───data
│   │   │   └───repos
│   │   ├───domain
│   │   │   ├───repos
│   │   │   └───usecases
│   │   └───ui
│   │       ├───cubit
│   │       └───screen
│   ├───error
│   │   └───ui
│   │       └───screen
│   ├───fill_profile
│   │   ├───data
│   │   │   ├───models
│   │   │   └───repos
│   │   ├───domain
│   │   │   ├───entities
│   │   │   ├───repos
│   │   │   └───usecases
│   │   └───ui
│   │       ├───cubit
│   │       ├───screen
│   │       └───widgets
│   ├───forget_password
│   │   └───ui
│   │       ├───screens
│   │       └───widgets
│   ├───home
│   │   └───ui
│   │       └───screen
│   ├───login
│   │   ├───data
│   │   │   ├───models
│   │   │   └───repos
│   │   ├───domain
│   │   │   ├───entities
│   │   │   ├───repos
│   │   │   └───usecases
│   │   └───ui
│   │       ├───cubit
│   │       ├───screen
│   │       └───widgets
│   ├───no_internet
│   │   └───ui
│   │       └───screen
│   ├───onboarding
│   │   ├───data
│   │   │   ├───models
│   │   │   └───repos
│   │   ├───domain
│   │   │   ├───entities
│   │   │   ├───repos
│   │   │   └───usecases
│   │   └───ui
│   │       ├───cubit
│   │       ├───screen
│   │       └───widgets
│   ├───set_fingerprint
│   │   ├───data
│   │   │   └───repos
│   │   ├───domain
│   │   │   ├───repos
│   │   │   └───usecases
│   │   └───ui
│   │       ├───cubit
│   │       ├───dialogs
│   │       └───screen
│   ├───signup
│   │   ├───data
│   │   │   ├───models
│   │   │   └───repos
│   │   ├───domain
│   │   │   ├───entities
│   │   │   ├───repos
│   │   │   └───usecases
│   │   └───ui
│   │       ├───cubit
│   │       ├───screen
│   │       └───widgets
│   └───social_auth
│       ├───data
│       │   └───repos
│       ├───domain
│       │   ├───repos
│       │   └───usecases
│       └───ui
│           ├───cubit
│           ├───screen
│           └───widgets
└───shared
    ├───cubits
    ├───data
    │   ├───models
    │   └───repos
    ├───domain
    │   ├───repos
    │   └───usecases
    ├───mixins
    └───widgets
```
---


## 🚀 Getting Started

To run this app locally:

```bash
git clone https://github.com/AmrSalahDev/Evira-E-Commerce.git
cd Evira-E-Commerce
flutter pub get
flutter run
```

---

## 📦 Dependencies Used  

Below is a list of packages used in this Flutter project along with their versions:  

## 🚀 Core
- `flutter` – Flutter SDK  
- `cupertino_icons: ^1.0.8` – iOS-style icons  
- `meta: ^1.16.0` – Provides annotations for better code clarity  

## 📦 State Management & DI
- `flutter_bloc: ^9.1.1` – Bloc/Cubit pattern for managing app state  
- `equatable: ^2.0.7` – Simplify equality comparisons  
- `get_it: ^8.2.0` – Simple service locator for dependency injection  
- `injectable: ^2.5.1` – Code generator for GetIt DI setup  
- `injectable_generator: ^2.8.1` – Generates boilerplate for Injectable  

## 🎨 UI & Animations
- `after_layout: ^1.2.0` – Execute code after the first layout  
- `animated_digit: ^3.3.1+2` – Animated number counter  
- `awesome_card: ^1.1.7` – Credit/Debit card UI widget  
- `bounce: ^1.0.2` – Bounce effect animations  
- `carousel_slider: ^5.1.1` – Image/content slider  
- `custom_refresh_indicator: ^4.0.1` – Custom pull-to-refresh indicator  
- `flutter_screenutil: ^5.9.3` – Responsive UI scaling across devices  
- `flutter_staggered_animations: ^1.1.1` – Staggered list/grid animations  
- `flutter_svg: ^2.2.0` – Render SVG images  
- `font_awesome_flutter: ^10.10.0` – Font Awesome icon pack  
- `google_fonts: ^6.3.0` – Use Google Fonts easily in Flutter  
- `group_button: ^5.3.4` – Grouped button widget  
- `lottie: ^3.3.1` – Play Lottie animations  
- `readmore: ^3.0.0` – Expandable/collapsible text widget  
- `shimmer: ^3.0.0` – Shimmer loading effect  
- `smooth_page_indicator: ^1.2.1` – PageView indicators with animations  
- `toastification: ^3.0.3` – Beautiful toast notifications  

## 🔄 Routing & Navigation
- `go_router: ^16.2.0` – Declarative navigation & routing  
- `go_transitions: ^0.8.2` – Smooth navigation transitions  

## 📱 Native Features
- `location: ^8.0.1` – Access device location services  
- `geocoding: ^4.0.0` – Convert coordinates ↔ addresses  
- `flutter_native_splash: ^2.4.6` – Configure a native splash screen  

## ☁️ Backend & Data
- `supabase_flutter: ^2.10.0` – Supabase client for Flutter  
- `flutter_dotenv: ^6.0.0` – Load environment variables from `.env`  
- `cached_network_image: ^3.4.1` – Caching & loading network images  
- `faker: ^2.2.0` – Generate fake data for testing  
- `uuid: ^4.5.1` – Generate unique IDs  

## 🔐 Auth & Verification
- `pinput: ^5.0.1` – PIN input widget  
- `otp_resend_timer: ^1.0.0` – OTP countdown timer  

## 🛠️ Development & Build Tools
- `build_runner: ^2.7.0` – Runs code generation  
- `flutter_gen_runner: ^5.11.0` – Asset & font generator  
- `rename: ^3.1.0` – Easily rename app package & bundle ID  
- `change_app_package_name: ^1.5.0` – Change Android package name  
- `sentry_flutter: ^9.6.0` – Error monitoring & crash reporting  
- `clarity_flutter: ^1.4.0` – Microsoft Clarity analytics integration  
- `extension: ^0.6.0` – Handy Dart/Flutter extensions  

## 🧰 Custom Toolkit
- `my_flutter_toolkit` – Custom utility package  
  - Source: [MyFlutterToolKit](https://github.com/AmrSalahDev/MyFlutterToolKit)


---


### 🎨 Figma Design

Here’s the app UI design created in Figma:

[![Figma Design](screenshots/figma_thumbnail.png)](https://www.figma.com/community/file/1216043752712853958/evira-e-commerce-online-shop-app-ui-kit)

📌 Click the image to view the live Figma prototype.



---

### 📸 Screenshots

<p float="left">
  <img src="screenshots/onboarding_screen.png" width="45%"/>
  <img src="screenshots/sign_up_screen.png" width="45%"/>
  <img src="screenshots/home_screen.png" width="45%"/>
  <img src="screenshots/details_screen.png" width="45%"/>
  <img src="screenshots/cart_screen.png" width="45%"/>
  <img src="screenshots/order_tracking_screen.png" width="45%"/>
  <img src="screenshots/my_orders_screen.png" width="45%"/>
  <img src="screenshots/wallet_screen.png" width="45%"/>
</p>


---

### 🛠️ Contributions

Feel free to fork the repo, open issues, or submit PRs to improve the app!
