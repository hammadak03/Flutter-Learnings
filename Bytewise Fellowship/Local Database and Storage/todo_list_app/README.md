# Todo List App

This is a simple Todo List application built with Flutter. The app allows users to sign up, log in, and manage their tasks. Each user can have their own list of tasks, which are stored locally using SQLite.

## Features

- User Sign Up and Login
- Add new tasks
- View tasks
- Update tasks
- Delete tasks
- Tasks are stored locally using SQLite

## Local Databases and Storage

### Why It Is Used?

Local databases and storage are used to store data on the device itself, which allows the app to function without a continuous internet connection. This is essential for maintaining data persistence and ensuring that user data is available even when offline.

### Benefits in Mobile App Development

- **Offline Access**: Users can access and manage their data even without an internet connection.
- **Performance**: Local storage provides faster data access compared to fetching data from a remote server.
- **Data Persistence**: Ensures that user data is preserved between app launches.
- **Reduced Server Load**: By storing frequently accessed data locally, it reduces the need to fetch data from a server repeatedly.

### Available SQL and NoSQL Options in Flutter

#### SQL-Based Options

1. **sqflite**: A Flutter plugin for SQLite, a self-contained, high-reliability, embedded, SQL database engine.
2. **Drift (formerly moor)**: A reactive persistence library for Flutter and Dart, built on top of SQLite.
3. **Floor**: Provides a lightweight SQLite abstraction for Flutter applications.

#### NoSQL-Based Options

1. **Hive**: A lightweight and fast key-value database written in pure Dart.
2. **ObjectBox**: A super-fast, scalable, and ACID-compliant object-oriented database.

### Exploring `sqflite`

`sqflite` is a Flutter plugin for SQLite, providing a robust solution for handling local storage with SQL. It is well-suited for apps that require complex queries and transactions, making it a popular choice among Flutter developers.

#### Key Features of `sqflite`

- **SQL Database**: Allows you to use raw SQL queries for data manipulation.
- **Transactions**: Supports transactions to ensure data integrity.
- **Batch Operations**: Allows executing multiple operations in a single batch.
- **Compatibility**: Works seamlessly across Android and iOS.

With `sqflite`, you can efficiently manage your local data storage needs in your Flutter applications.