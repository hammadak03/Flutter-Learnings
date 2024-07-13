import 'package:flutter/material.dart';

class Movie {
  final String title;

  Movie(this.title);
}

class MovieProvider with ChangeNotifier {
  final List<Movie> _favorites = [];

  List<Movie> get favorites => List.unmodifiable(_favorites);

  void add(Movie movie) {
    _favorites.add(movie);
    notifyListeners();
  }

  void remove(Movie movie) {
    _favorites.remove(movie);
    notifyListeners();
  }

  bool isFavorite(Movie movie) {
    return _favorites.contains(movie);
  }
}
