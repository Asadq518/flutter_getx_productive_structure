# 📱 Flutter Project Architecture

A modular, production-ready Flutter application built using **GetX**, **Clean Architecture**, **Firebase**, and **Flutter Secure Storage**. This app serves as a base for scalable mobile projects with modern state management, networking, secure auth, localization, theming, and automated resource generation.

---

## 🚀 Features

- 🔧 **GetX for State Management and Dependency Injection**
- 🌐 **RESTful API Integration with HTTP + Token**
- 📦 **Modular Folder Structure with Clean Architecture**
- 🔐 **Secure Storage for Auth Tokens and User Info**
- 🔔 **Push Notifications (FCM) with Local Notifications**
- 🎨 **Centralized Theming with R.color and R.textStyle**
- 🌍 **Localization with JSON & Auto Key Generation**
- 📷 **Image Resource Auto Generator**
- 🔄 **API Response State Wrappers (loading, error, success)**
- 🔐 **Firebase Initialization & Notification Setup**

---

## 🧱 Architecture

```

lib/
├── app/
│   ├── core/              # Config, theming, localization, extensions, constants
│   ├── data/              # Models, repositories, network, services
│   ├── modules/           # Feature-based UI & logic
│   ├── routes/            # GetX named routes
│   └── binding/           # Global bindings (DI for services/repositories)
├── assets/
│   ├── images/            # Image & icon assets
│   └── locales/           # JSON translation files
├── tool/
│   └── generate\_app\_images.dart  # Auto-generate AppImages from assets/images

````

---

## ⚙️ Technologies Used

- **Flutter 3.x**
- **GetX** for state management & routing
- **HTTP + Secure Token Auth**
- **Flutter Secure Storage**
- **Firebase Core & Messaging**
- **flutter_local_notifications**
- **Dart Code Generators (Tool scripts)**

---

## 🛠 Setup Instructions

### 1. Clone and install dependencies

```bash
git clone https://github.com/your-username/pcom_app.git
cd pcom_app
flutter pub get

get create page:login

````

---

### 2. Configure Firebase

Ensure you’ve added `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) correctly.

---

### 3. Run resource generators

To auto-generate your `AppImages` and move your localized strings:

```bash
dart tool/build_resources.dart
```

This will:

* Generate `lib/app/core/resources/app_images.dart`
* Move `locales.g.dart` to `lib/app/core/localization/`
* Clean up `lib/generated/` folder

---

## 🔐 Authentication Flow

* Token and user data stored via `FlutterSecureStorage`
* Singleton access through `AuthService`
* Sample usage:

```dart
Future<void> fetchUserProfile() async {
  await fetchSingleWithState<UserModel>(
    state: userState,
    item: user,
    apiMethod: () => fetchItem<UserModel>(
      url: ApiRoutes.getUser,
      rootKey: 'user',
      fromJson: (json) => UserModel.fromJson(json),
    ),
  );
}
```

---

## 🔔 Notifications

Firebase Messaging is initialized in `NotificationService`:

```dart
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
NotificationService.initialize();
```

Handles:

* Foreground push with local popup
* Background and tap-to-navigate via `Get.toNamed(route)`

---

## 📸 Image Assets

Generate Dart class from your images folder:

```bash
dart tool/generate_app_images.dart
```

Access with:

```dart
Image.asset(R.image.img_logo);
SvgPicture.asset(R.image.ic_home);
```

---

## 📘 Localization

JSON-based:

```json
// assets/locales/en_US.json
{
  "welcome_back": "Welcome back!",
  "login": "Log in"
}
```

Use in UI:

```dart
Text(LocaleKeys.welcome_back.tr)
```

---

## 📋 Todo / Suggestions

* [ ] Add unit & widget tests
* [ ] Add CI/CD via GitHub Actions
* [ ] Extend auth logic with refresh token
* [ ] Add settings module

---

## 🧑‍💻 Contributors

* \[Your Name] – Flutter Lead Developer

---

## 📄 License

This project is licensed under the MIT License.

```

---

Would you like this `README.md` saved or zipped with your project structure?
```
