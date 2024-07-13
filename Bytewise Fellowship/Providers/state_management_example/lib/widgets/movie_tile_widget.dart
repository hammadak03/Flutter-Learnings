import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_example/providers/movie_provider.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, favorites, child) {
        final isFavorite = favorites.isFavorite(movie);
        return ListTile(
          title: Text(movie.title),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              if (isFavorite) {
                favorites.remove(movie);
              } else {
                favorites.add(movie);
              }
            },
          ),
        );
      },
    );
  }
}
