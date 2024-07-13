import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, favorites, child) {
          return ListView.builder(
            itemCount: favorites.favorites.length,
            itemBuilder: (context, index) {
              final movie = favorites.favorites[index];
              return ListTile(
                title: Text(movie.title),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    favorites.remove(movie);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
