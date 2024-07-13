# Movies Favorites App

Movies Favorites App is a simple Flutter application that allows users to manage their favorite movies. Users can browse a list of available movies, add them to their favorites, and view their curated list of favorite movies.

## Introduction

This Flutter app provides a straightforward user interface where users can interact with movies:

- **Movie List**: Displays a list of available movies.
- **Favorites**: Allows users to add movies to their favorites list and view them separately.

The app demonstrates basic state management using the Provider package, ensuring efficient and responsive updates to the UI based on user actions.

## Provider State Management

**Provider** is a state management package for Flutter applications that simplifies the sharing and management of application state across the widget tree. It utilizes the **Provider pattern** and `InheritedWidget` for efficient dependency injection and change notification.

### Key Benefits of Provider:

- **Dependency Injection**: Defines and provides data models or services at the top of the widget tree, making state accessible throughout the app.
  
- **Change Notification**: Updates UI components only when necessary, improving performance by rebuilding only widgets affected by state changes.

### Usage in This App

- **Movies Favorites App** uses Provider for:
  - Managing the list of movies and favorite movies.
  - Ensuring real-time updates to the UI based on changes in the list of favorite movies (`FavoritesModel`).

  Each screen (`MovieListScreen` and `FavoritesScreen`) leverages `Consumer` widgets to listen for changes and update their respective UI components efficiently.
