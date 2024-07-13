import 'package:flutter/material.dart';
import '../providers/movie_provider.dart';
import '../screens/favorites_screen.dart';
import '../widgets/movie_tile_widget.dart';

class MovieListScreen extends StatelessWidget {
  final List<Movie> movies = [
    Movie('Inception'),
    Movie('The Dark Knight'),
    Movie('Interstellar'),
    Movie('Parasite'),
    Movie('Avengers: Endgame'),
    Movie('The Shawshank Redemption'),
    Movie('Pulp Fiction'),
    Movie('The Godfather'),
    Movie('The Matrix'),
    Movie('Fight Club'),
    Movie('Forrest Gump'),
    Movie('Gladiator'),
    Movie('The Lion King'),
    Movie('Titanic'),
    Movie('Jurassic Park'),
    Movie('Star Wars: A New Hope'),
    Movie('The Lord of the Rings: The Fellowship of the Ring'),
    Movie('Harry Potter and the Sorcerer\'s Stone'),
    Movie('Back to the Future'),
    Movie('The Silence of the Lambs'),
    Movie('Schindler\'s List'),
    Movie('Braveheart'),
    Movie('Saving Private Ryan'),
    Movie('Toy Story'),
    Movie('Finding Nemo'),
  ];

  MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieTile(movie: movies[index]);
        },
      ),
    );
  }
}
