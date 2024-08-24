# Chat App

A simple chat application built with Flutter and Firebase.

## Features

- User Authentication (Sign Up, Login)
- Real-time Chat Functionality
- Push Notifications
- User Profile with Image Upload

## Folder Structure

```plaintext
chat-app/
├── android/
├── ios/
├── lib/
│   ├── screens/
│   │   ├── auth.dart
│   │   ├── chat.dart
│   │   └── splash.dart
│   ├── widget/
│   │   ├── chat_messages.dart
│   │   ├── message_bubble.dart
│   │   ├── new_messages.dart
│   │   └── user_image_picker.dart
│   ├── main.dart
│   └── firebase_options.dart
├── assets/
│   └── images/
│       └── chat.png
├── pubspec.yaml
├── android/
├── ios/
└── test/
```

Getting Started

Prerequisites
- Flutter SDK
- Firebase account

Installation:

1. Clone the repository:
  git clone https://github.com/Jalo1982/chat-app.git cd chat-app

2. Install dependencies:
  flutter pub get

3. Set up Firebase:
* Follow the instructions to add your Firebase project configuration to the app.
* Replace the contents of lib/firebase_options.dart with your Firebase configuration.

4. Run the app: 
  flutter run

Contributing
  Contributions are welcome! Please fork the repository and submit a pull request.
