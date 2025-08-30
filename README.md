# favex
📖 Overview

This guide explains how to set up, run, and debug your Flutter application. It covers environment setup, dependencies, building the app, and additional notes for development and testing.

Tip: Follow each step carefully to avoid common setup issues.

⚙️ Prerequisites

Ensure your system has the following installed:

Flutter SDK (stable channel recommended)

Dart SDK (included with Flutter)

Android Studio or VS Code (for IDE support)

Xcode (for iOS development on macOS)

Git (for cloning the repository)

Note: Make sure your Flutter installation is complete and added to your PATH. Run flutter doctor to check for missing dependencies.

🛠️ Setup Steps
1. Clone the Repository

Clone your Flutter project and navigate into the project folder:

Tip: Use a descriptive folder name to avoid confusion with other projects.

2. Install Dependencies

Fetch all required Flutter and Dart packages:

flutter pub get


Note: This installs packages listed in pubspec.yaml.

3. Configure Environment

If your application uses environment variables or .env files (via flutter_dotenv or similar):

Copy the example .env file if available

Update API keys, endpoints, or other environment-specific settings

Tip: Do not commit sensitive keys to version control. Use a .gitignore file for .env.

4. Run the Application

Run the application on your desired platform:

Android: Connect an Android device or start an emulator

iOS: Connect an iPhone or start a simulator

Web: Run in the browser

Command:

flutter run


Tip: Use flutter run -d <device_id> to specify a device if multiple are available.

5. Build the Application

Generate platform-specific builds for deployment:

Android APK:

flutter build apk


iOS App:

flutter build ios


Web Build:

flutter build web


Note: Make sure you have the required platform SDKs installed (Android Studio for Android, Xcode for iOS).

🐞 Debugging

Flutter comes with built-in debugging tools:

Hot Reload / Hot Restart: Quickly apply code changes

Flutter DevTools: Inspect UI, performance, and network requests

Logging: Use debugPrint for console logs

Tip: Use flutter run --verbose to see detailed logs for troubleshooting.