import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pune_project/movie_card.dart';
import 'movie_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch movies when the widget is first created
    getMovies();
  }

  void getMovies() async {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    await movieProvider.getMovies();
  }

  void _searchMovies() async {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    await movieProvider.searchMovies(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // search box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.black54),
                      onPressed: () {
                        _searchMovies();
                      },
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          // data show area from response
          Expanded(
            child: Consumer<MovieProvider>(
              builder: (context, movieProvider, child) {
                if (movieProvider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                // when stored response is empty
                if (movieProvider.movies.isEmpty) {
                  if (movieProvider.isLoading2) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: movieProvider.movies2.length,
                      itemBuilder: (context, index) {
                        final movie = movieProvider.movies2[index];
                        MovieCard card = MovieCard(movie: movie);
                        return card;
                      },
                    );
                  }
                }
                return ListView.builder(
                  itemCount: movieProvider.movies.length,
                  itemBuilder: (context, index) {
                    final movie = movieProvider.movies[index];
                    MovieCard card = MovieCard(movie: movie);
                    return card;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}