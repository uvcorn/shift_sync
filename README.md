# 🔁 Shift Sync – Flutter Project

A simple and clean 2‑screen Flutter application demonstrating UI design, navigation, and basic state management.

<div align="center">
 

![Dart](https://img.shields.io/badge/Dart-Latest-blue?logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-3.35.0-blue?logo=flutter&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-StateNotifier-purple)
![GoRouter](https://img.shields.io/badge/GoRouter-Routing-teal)
![ScreenUtil](https://img.shields.io/badge/Flutter_ScreenUtil-Responsive-orange)

</div>

---

## 🚀 Getting Started

Follow these steps to run the project locally:

1. Clone the repository
2. flutter pub get
3. flutter run

---

## 📖 About Shift Sync

Shift Sync is a minimal, focused Flutter app that showcases a polished login experience and a responsive shifts overview screen. It's ideal as a starter template for apps that require authentication and a simple list overview.

Key highlights:
- Clean 2‑screen flow (Login → Shifts Overview)
- Modern UI with responsive sizing
- Lightweight state management and routing setup

---

## ✅ App Features

### 1️⃣ Login Screen
- Email input field
- Password input field (with show/hide toggle)
- Remember Me checkbox
- Validations for email and password
- Sign In button
- Navigates to Shifts Overview screen on success

### 2️⃣ Shifts Overview Screen
- Title: Shifts Overview
- Static list of 5 shift items (shift name + date)
- Modern card design with icons and subtle shadows
- Responsive layout using ScreenUtil

Navigation flow:
- Login → Shifts Overview (handled by GoRouter)

---

## 🧰 Technologies & Tools Used

### Framework / Language
- Flutter 3.35.0
- Dart (latest stable)

### State Management
- Riverpod (StateNotifier) — managing login state and shift overview data

### Navigation
- GoRouter — declarative routing between screens

### Responsive UI
- Flutter ScreenUtil — consistent sizing, spacing, and typography across devices

### Architecture & Pattern
- Feature-based MVVM folder structure
- Core layer for reusable utilities, constants, routes, and widgets
- Presentation layer for screens and view models
- Data layer (placeholder) for future API/database integration
- Model classes representing shift items

### Reusable Widgets
- CustomTextFormField
- CustomElevatedButton
- CustomCheckbox
- CustomText

### Styling
- AppColors — centralized color theme
- AppStrings — centralized text constants (no hardcoded strings)

Notes:
- Developed with Flutter 3.35.0 but compatible with newer stable releases.

---

## 📁 Project Structure
```
lib/
├── core/
│   ├── routes/
│   │   └── app_router.dart
│   ├── utils/
│   │   ├── app_colors/
│   │   │   └── app_colors.dart
│   │   ├── app_strings/
│   │   │   └── app_strings.dart
│   │   └── validators/
│   │       └── form_validators.dart
│   └── widgets/
│       ├── button_widgets/
│       │   └── custom_elevated_button.dart
│       ├── texts_widgets/
│       │   ├── custom_text.dart
│       │   └── custom_checkbox.dart
│       └── text_form_field/
│           └── custom_text_form_field.dart
│
├── features/
│   ├── auth/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   │   └── login_screen.dart
│   │   │   └── view_model/
│   │   │       └── login_view_model.dart
│   │   └── data/ (placeholder for future API integration)
│   │
│   └── home/
│       ├── presentation/
│       │   ├── screens/
│       │   │   └── shifts_overview_screen.dart
│       │   └── view_model/
│       │       └── shift_overview_view_model.dart
│       └── data/ (placeholder for future API integration)
│
└── main.dart
```
---

## 🧠 Why This Folder Structure?

- Feature-based separation: Each feature (auth, home) lives in its own module for scalability and clarity.
- Core layer: Centralized utilities, constants, and widgets to avoid duplication.
- MVVM presentation: Keeps UI (views) separate from logic (view models) for testability.
- Data placeholders: Easy to plug in APIs or local databases later without changing UI code.
- Consistency: Easier onboarding for multiple developers, better maintainability.

---

## 🧪 Testing Strategy (Recommended)
- Unit Tests: Validate ViewModel logic and validators.
- Widget Tests: Cover UI states for Login and Shifts Overview.
- Integration Tests: Full app flow from login to overview (optional).

---

## ▶️ How to Run

```bash
flutter pub get
flutter run
```

---

If you'd like, I can:
- Convert this into a README tailored to an existing repository (add repository-specific badges and links),
- Or scaffold example implementations for the Login and Shifts Overview screens following this structure.
