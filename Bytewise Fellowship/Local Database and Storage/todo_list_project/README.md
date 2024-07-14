# Flutter To-Do List App with Sqflite

This Flutter app demonstrates a simple To-Do list application that utilizes Sqflite for local database storage.

## Why Local Database?

Local databases are crucial in mobile app development for storing data offline, ensuring app responsiveness, and maintaining data security.

## Benefits in Mobile App Development

- **Offline Functionality**: Users can access and modify data without an internet connection.
- **Improved Performance**: Local databases offer faster data retrieval compared to network requests.
- **Data Security**: Sensitive data can be stored locally, reducing exposure risks.

## Sqflite in Flutter

Sqflite is a SQLite plugin for Flutter, providing a way to persist data locally using a relational database.

## Implementation

- **Database Helper**: `database_helper.dart` manages SQLite operations (create, read, update, delete).
- **UI**: Basic UI implemented in `home_screen.dart` displays To-Do items and allows adding new tasks.

## Running the App

To run this app:

1. Ensure Flutter SDK is installed.
2. Clone this repository.
3. Open the project in an IDE or editor of your choice.
4. Run `flutter pub get` to install dependencies.
5. Connect a device or start an emulator.
6. Run the app using `flutter run`.

