# Table of Contents
* [Features](#features)
* [Installation](#installation)
* [Folder Structure](#folder-structure)

---

## Features

This boilerplate includes pre-configured functionalities such as:

* **Authentication:**

  - Pre-Built Sign-in (Google, Facebook, LinkedIn, Email-Password) also with Firebase Authentication
  - OTP input fields are used using `pinput: ^5.0.0`
  - Feature screens are authenticated using `auto_route: ^9.2.2` AppGuard feature

* **Authorization:**
  - For securely storing API tokens, we are using `flutter_secure_storage: ^9.2.2`

* **Custom Components:**

  - Custom TextFields and Validators using `flutter_form_builder: ^9.5.0` and `form_builder_validators: ^11.0.0`
  - Custom Drawer can be created with ease by passing `backgroundColor`, `userName`, `List<Map<String, dynamic>>` of items
  - Custom TabBar can be created with ease by passing `indicatorColor`, `labelColor`, `Tabs`, `screens`
  - Custom Bottom Navigation can be created by passing `screens`, `activeColor`, `tabBackgroundColor`, `color`, `List<Map<String, dynamic>>` of items
  - Custom Button can be created by passing attributes such as:
    - `variant` ('text' | 'icon' | 'default')
    - `buttonTitle`
    - `iconName`
    - `isIconAtStart` (For Icon Position)
    - `iconPath` (If SVG icons are used)

* **Routing:**
  - For navigation, we have named routes and `auto_route: ^9.2.2`. Depending on requirements, we can choose between them. `auto_route` provides more features like AppGuard and pre-built animation transitions for page navigation.

* **Networking:**
  - `dio: ^5.7.0` implementation for POST and GET API calls, along with interceptors for authorization tokens.

* **State Management:**
  - `flutter_riverpod: ^2.6.1` used for state management

* **Data Storage:**
  - `flutter_secure_storage: ^9.2.2` for securely storing strings (e.g., tokens)
  - `shared_preferences: ^2.3.2` for managing data types (e.g., strings, booleans)

* **Localization:**
  - `intl: ^0.19.0` and `flutter_localizations` used for localization and internationalization.

---

## Installation

### **Prerequisites**

- Install Flutter `3.24.5`
- Install Dart `^3.5.4`
- Ensure you have IDEs like VS Code or Android Studio.

### **Steps**

1. Clone the repository:
   `git clone https://github.com/dashy2021/boilerplate-flutter.git`

2. Navigate to the project directory:
   `cd boilerplate-flutter`
3. Run the app
   `flutter run`

4. Rename App & BundleID

  - The Rename CLI Tool is a utility designed to modify your Flutter project's AppName and BundleId across various platforms (`rename: ^3.0.2`)

  - Use `rename setAppName --targets ios,android --value "Application_Name"` to set Application Name e.g. `rename setAppName --targets ios,android --value "Boiler Plate App"`
  
  - Use `rename setBundleId --targets android --value "com.example.package_name"` to set BundleId for Application e.g. `rename setBundleId --targets android --value "com.digitalsalts.boilter_plate"`


## Folder Structure
     

     assets:
        - images
        - svg
        - fonts
     test: For unit and widget tests.
     lib: Main app directory.
        core
          - Constants
          - Utils
        data
          - Datasources
          - Models
        controllers
        presentation (UI presentations)
          - Animation
          - Custom / common widgets
          - Riverpod
          - Routes
          - Views
            - Feature
               - Widgets
               - feature.dart
        main.dart
        







