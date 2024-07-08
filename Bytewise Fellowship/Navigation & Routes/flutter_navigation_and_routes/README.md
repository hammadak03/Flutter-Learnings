# Flutter Navigation and Routes

This project demonstrates various navigation techniques in Flutter, including pushing routes, named routes, passing arguments, and managing the navigation stack.

## Concepts of Navigation and Routing

### Navigation
Navigation in Flutter refers to the process of moving between different screens (or pages) in an app. Flutter provides several ways to navigate between screens:

1. **Push**: Adds a new route to the navigation stack.
2. **Pop**: Removes the current route from the navigation stack.
3. **Push Replacement**: Replaces the current route with a new route.
4. **Push and Remove Until**: Pushes a new route and removes all previous routes until the predicate returns true.
5. **Pop and Push Named**: Pops the current route off the stack and pushes a new named route.

### Routing
Routing is the mechanism by which Flutter decides which screen to display based on the given route. There are two types of routing in Flutter:

1. **Basic Routing**: Uses methods like `Navigator.push` and `Navigator.pop` to navigate between screens.
2. **Named Routing**: Uses named routes defined in the `MaterialApp` to navigate between screens. This makes it easier to manage routes and pass data between them.

## Features

- Navigate between screens using different methods:
  - `push()`
  - `pushNamed()`
  - `pushAndRemoveUntil()` & `pushNamedAndRemoveUntil()`
  - `popAndPushNamed()`
  - `pushReplacement()` & `pushReplacementNamed()`
- Pass data between screens using constructor parameters and named route arguments.

## Project Structure

```plaintext
lib/
├── main.dart
├── home_screen.dart
├── screen_two.dart
└── screen_three.dart
