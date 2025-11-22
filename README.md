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

- **Flutter 3.35.0**
- **Dart** Latest stable version

### 💻 Notes

- This project was developed using Flutter 3.35.0.
- All code is compatible with the latest stable Flutter version, so it can be upgraded if needed.

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

- **Feature-based MVVM folder structure**
- **Core layer** for reusable utilities, constants, routes, and widgets
- **Presentation layer** for screens and view models
- **Data layer** (placeholder) for future API or database integration
- **Model classes** for representing shift items

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
├── features/
│   ├── auth/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   │   └── login_screen.dart
│   │   │   └── view_model/
│   │   │       └── login_view_model.dart
│   │   └── data/
│   │       └── .gitkeep
│   └── home/
│       ├── presentation/
│       │   ├── screens/
│       │   │   └── shifts_overview_screen.dart
│       │   └── view_model/
│       │       └── shift_overview_view_model.dart
│       └── data/
│           └── .gitkeep
└── main.dart


---

## 🧠 Why This Folder Structure?

- **Feature-based architecture** — separates each feature into its own module (`auth`, `home`) for scalability.
- **Core layer** — stores reusable widgets, constants, utilities, and routing logic, reducing code duplication.
- **Presentation layer** — handles UI and state (screens + view models) keeping logic separate from widgets.
- **Data layer** — ready for API or database integration in future without affecting UI.
- **Consistency & maintainability** — easy for multiple developers to understand and extend the project.

This structure ensures clean separation of concerns, reusability, and easier maintenance.

---

## ▶️ How to Run

```bash
flutter pub get
flutter run
```
