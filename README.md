# Task

## Project Description
Task is a Flutter application developed to enhance your technical skills and efficiently manage daily tasks. The application uses Firebase for user authentication and session management, ensuring that the user stays logged in even after restarting the app. Additionally, it fetches data from a local JSON file to display in the user interface and allows editing of this data, which is then cached using Hive for offline access.

## Features
- **User Login and Registration**: Secure authentication using Firebase.
- **Session Management**: Maintain user session state across app restarts.
- **Task Management**: Fetch, display, and edit tasks from a local JSON file.
- **Local Storage**: Use Hive to store and manage data locally.
- **Offline Support**: Manage tasks without an internet connection.

## Technologies and Libraries Used
- **Flutter**: For building the application.
- **Firebase**: For authentication and data storage.
- **Provider**: For state management.
- **Hive**: For local storage.
- **Local JSON**: For fetching and displaying data.

## Firebase Setup
1. **Create a Firebase Project**:
    - Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.

2. **Enable Firebase Authentication**:
    - Navigate to the "Authentication" section in your Firebase project.
    - Enable the email/password sign-in method.

3. **Download Firebase Config Files**:
    - For Android: Download the `google-services.json` file and place it in the `android/app` directory.
    - For iOS: Download the `GoogleService-Info.plist` file and add it to your Xcode project.

4. **Add Firebase SDK to Your Flutter Project**:
    - Include Firebase and related dependencies in your `pubspec.yaml` file:
    ```yaml
    dependencies:
      firebase_core: latest_version
      firebase_auth: latest_version
      provider: latest_version
      hive: latest_version
      hive_flutter: latest_version
    ```

5. **Initialize Firebase in Your Flutter App**:
    - Initialize Firebase in your `main.dart` file:
    ```dart
    import 'package:firebase_core/firebase_core.dart';
    import 'package:flutter/material.dart';

    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(MyApp());
    }
    ```

## Flutter Setup
To develop this application, you'll need to have Flutter installed on your machine. Follow the official Flutter installation guide for your operating system:

- [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

## Installation and Running the App
1. **Clone the Repository**:
    ```bash
    git clone https://github.com/14cvd/Task.git
    cd task
    ```

2. **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3. **Complete Firebase Configuration**:
    - Create a Firebase project and download the `google-services.json` file, placing it in the `android/app` directory.
    - For iOS, download the `GoogleService-Info.plist` file and add it to your project in Xcode.

4. **Run the App**:
    ```bash
    flutter run
    ```

## Contributing
Contributions are welcome! If you have any ideas, suggestions, or issues, please open a pull request or an issue on GitHub. Your feedback and contributions are greatly appreciated.

## Contact
For any questions or suggestions, please contact me at:
- **LinkedIn**: [Cavid Abbasaliyev](https://www.linkedin.com/in/abbas3liyev/)
- **GitHub**: [Cavid Abbasaliyev](https://github.com/14cvd)

---

To learn more about the application, feel free to clone the repository and follow the installation instructions. Thank you for your interest and contributions!

