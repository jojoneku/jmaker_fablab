# JMaker FabLab App

**JMaker FabLab** is an attendance and user management mobile application designed for **FabLab Bohol**. It streamlines the process of tracking students and makers using the facility through a secure QR code-based system.

## 🚀 Features

*   **Role-Based Access**: Specialized workflows for **Students** and **Makers**.
*   **Secure Authentication**: Email and password authentication via Firebase Auth with email verification.
*   **Digital ID System**: Generates a secure, encrypted QR code for each user containing their profile information.
*   **Offline Capability**: Uses **Hive** local database to cache user data, ensuring core features work even with intermittent internet.
*   **Cloud Sync**: Real-time data synchronization with **Cloud Firestore**.
*   **Attendance Tracking**: (Implied) Scannable QR codes facilitate quick check-ins and attendance logging.
*   **PDF Viewer**: Integrated PDF viewing capabilities for documents/manuals.

## 🛠️ Tech Stack

*   **Framework**: [Flutter](https://flutter.dev/)
*   **Language**: Dart
*   **Backend**: [Firebase](https://firebase.google.com/) (Auth, Firestore)
*   **Local Database**: [Hive](https://docs.hivedb.dev/)
*   **State Management**: MVC Pattern
*   **Navigation**: [AutoRoute](https://pub.dev/packages/auto_route)
*   **Data Modeling**: [Freezed](https://pub.dev/packages/freezed) & [JsonSerializable](https://pub.dev/packages/json_serializable)

## 📂 Project Structure

```
lib/
├── Controller/       # Business logic layer (Auth, Firestore, etc.)
├── Model/            # Data models (Student, Maker) generated with Freezed
├── Views/            # UI Screens (Login, Dashboard, QR Views)
├── routes/           # Navigation configuration (AutoRoute)
├── styles/           # App theming and common UI components
├── Utils/            # Utility classes (Encryption, Connectivity)
├── main.dart         # Entry point
└── firebase_options.dart # Firebase configuration
```

## ⚡ Getting Started

### Prerequisites
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version >=3.3.0 <4.0.0)
*   Firebase Project setup (Included files `google-services.json` and `firebase_options.dart` imply existing setup)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/jojoneku/jmaker_fablab.git
    cd jmaker_fablab
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Code Generation:**
    This project uses code generation for models and routes. Run the build runner:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

### Running the App

*   **Development:**
    ```bash
    flutter run
    ```
*   **Build APK:**
    ```bash
    flutter build apk
    ```

## 🔐 Security

*   User data embedded in QR codes is encrypted using AES encryption (`Utils/encryt_utils.dart`) to prevent tampering and ensure privacy.
*   Firebase Authentication manages secure user sessions.

## 🤝 Contributing

1.  Fork the project
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request
