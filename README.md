# FabLab Attendance Management System (Mobile)

A Flutter application designed for managing attendance and tracking usage in a FabLab environment through QR code scanning.

## Description

**jmaker_qrscanner_mobile** is a mobile application that simplifies the process of logging attendance and tracking resource usage. Users can scan QR codes to register their presence and specify the purpose of their visit, the service they are using, and the machine they intend to operate. The data is securely stored and managed using Firebase.

## Features

-   **QR Code Scanning:** Fast and efficient QR code scanning to identify students and makers.
-   **Attendance Tracking:** comprehensive logging of visits, including timestamps.
-   **Purpose & Usage Tracking:** Capture details about visits, such as the selected purpose, service, and machine.
-   **Data Visualization:** View attendance lists using Syncfusion DataGrids.
-   **Data Export:** Capability to export data (supported by Syncfusion libraries).
-   **Encryption:** Secure handling of sensitive data.
-   **Firebase Integration:** Real-time data storage and authentication using Cloud Firestore and Firebase Auth.

## Tech Stack

-   **Framework:** [Flutter](https://flutter.dev/)
-   **Language:** [Dart](https://dart.dev/)
-   **Backend:** [Firebase](https://firebase.google.com/) (Core, Auth, Firestore)
-   **State Management/Architecture:** MVC Pattern (`mvc_pattern`)
-   **Navigation:** [AutoRoute](https://pub.dev/packages/auto_route)
-   **UI Components:** 
    -   [Syncfusion Flutter DataGrid](https://pub.dev/packages/syncfusion_flutter_datagrid)
    -   [QR Code Scanner](https://pub.dev/packages/qr_code_scanner)
-   **Code Generation:** `freezed`, `json_serializable`, `build_runner`

## Getting Started

### Prerequisites

Ensure you have the following installed:
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version >=3.3.0 <4.0.0)
*   Dart SDK
*   Android Studio or VS Code with Flutter extensions

### Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd jmakers_qrscanner_mobile
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Generate code files:**
    This project uses code generation for routes and models. Run the build runner to generate the necessary files:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Firebase Configuration:**
    *   This project relies on Firebase. Ensure you have the `google-services.json` file placed in `android/app/`.
    *   If you are setting up a new project, use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) to send configuration to `lib/firebase_options.dart`.

### Running the Application

Connect a device or start an emulator, then run:

```bash
flutter run
```

## Project Structure

```
lib/
├── controllers/       # Business logic controllers (Firestore, Snackbar)
├── models/            # Data models (Student, Maker) w/ Freezed & JSON support
├── routes/            # Navigation configuration (AutoRoute)
├── styles/            # App theming, colors, and text styles
├── utils/             # Utility classes (Encryption, etc.)
├── views/             # UI Screens (Home, QR Scanner, Attendance List, etc.)
├── firebase_options.dart # Firebase configuration
└── main.dart          # Application entry point
```

## Assets

*   **Images:** `assets/image/`
*   **Fonts:** `assets/fonts/Nunito/`
