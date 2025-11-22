# Shift Sync – Flutter Project

A simple and clean 2–screen Flutter application demonstrating UI design, navigation, and basic state management.

---

## 🚀 Features

### **1️⃣ Login Screen**

- Email input field
- Password input field (with show/hide toggle)
- Remember Me checkbox
- Validations for both fields
- Sign In button
- Navigates to Shifts Overview screen

### **2️⃣ Shifts Overview Screen**

- Title: **Shifts Overview**
- Displays a static list of 5 items (Shift name + date)
- Modern card design with icons and shadows
- Responsive UI using ScreenUtil

Navigation:

- Login → Shifts Overview (via GoRouter)

---

## 🧰 Technologies & Tools Used

### **Framework / Language**

- **Flutter 3.x.x**
- **Dart**

### **State Management**

- **Riverpod (StateNotifier)**  
  Used for managing login state and shift overview data.

### **Navigation**

- **GoRouter**  
  Handles screen-to-screen navigation cleanly and declaratively.

### **Responsive UI**

- **Flutter ScreenUtil**  
  Ensures consistent spacing, sizing, and typography across all screen sizes.

### **Architecture & Structure**

- **Feature-based folder structure**
- **Core layer** for reusable utilities, routes, constants, and widgets
- **Presentation layer** for screens and view models
- **Model classes** used for representing shift items

### **Widgets**

- Custom reusable components:
  - `CustomTextFormField`
  - `CustomElevatedButton`
  - `CustomCheckbox`
  - `CustomText`

### **Styling**

- **AppColors** for centralized color theme
- **AppStrings** for all text (nothing hardcoded)

---

## 📁 Folder Structure

lib/
├── core/
│ ├── routes/
│ │ └── app_router.dart
│ ├── utils/
│ │ ├── app_colors/
│ │ │ └── app_colors.dart
│ │ ├── app_strings/
│ │ │ └── app_strings.dart
│ │ └── validators/
│ │ └── form_validators.dart
│ └── widgets/
│ ├── button_widgets/
│ │ └── custom_elevated_button.dart
│ ├── texts_widgets/
│ │ ├── custom_text.dart
│ │ └── custom_checkbox.dart
│ └── text_form_field/
│ └── custom_text_form_field.dart
│
├── features/
│ ├── auth/
│ │ ├── presentation/
│ │ │ ├── screens/
│ │ │ │ └── login_screen.dart
│ │ │ └── view_model/
│ │ │ └── login_view_model.dart
│ │ └── data/ (placeholder for future API integration)
│ │
│ └── home/
│ ├── presentation/
│ │ ├── screens/
│ │ │ └── shifts_overview_screen.dart
│ │ └── view_model/
│ │ └── shift_overview_view_model.dart
│ └── data/ (placeholder for future API integration)
│
└── main.dart

---

## 🧠 Why This Structure?

- **Scalable & Maintainable** — separates logic, UI, and configuration
- **Feature-based structure** — easy to expand as app grows
- **Reusable Core Widgets** — avoids code duplication
- **Constants extracted** — prevents hardcoding and improves consistency
- **Clean State Management** — using Riverpod’s StateNotifier

---

## ▶️ How to Run

```bash
flutter pub get
flutter run
```
