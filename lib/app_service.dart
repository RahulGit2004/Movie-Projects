import 'api_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '6318429f49mshf91c5f182d8170ep17d67ajsned75ad307007';
  final String apiHost = 'imdb8.p.rapidapi.com';

  List<ApiResponse> dataSearchMovies(Map<String, dynamic> jsonResponse) {
    List<ApiResponse> movies = [];
    var edges = jsonResponse['data']['mainSearch']['edges'] as List<dynamic>;

    for (var edge in edges) {
      var node = edge['node'];
      var entity = node['entity'];
      var knownForEdges = entity['knownFor']['edges'] as List<dynamic>;
      for (var knownForEdge in knownForEdges) {
        var movieNode = knownForEdge['node'];
        var title = movieNode['title']['titleText']['text'] ?? 'Unknown Title';

        if (movieNode['title'] != null) {
          var releaseYear = movieNode['title']['releaseYear']?['year']?.toString() ?? '';
          var releaseDate = movieNode['title']['releaseDate'];
          var month = releaseDate?['month']?.toString() ?? '';
          var day = releaseDate?['day']?.toString() ?? '';

          var imgUrl = entity['primaryImage']?['url'] ?? '';

          if (title.isNotEmpty && imgUrl.isNotEmpty) {
            movies.add(ApiResponse(
              imgUrl: imgUrl,
              title: title,
              releaseYear: releaseYear,
              releaseDate: day,
              releaseMonth: month,
            ));
          }
        }
      }
    }
    return movies;
  }


  Future<List<ApiResponse>?> searchMovies(String search) async {
    final String encodedSearch = Uri.encodeComponent(search);
    final String url =
        'https://imdb8.p.rapidapi.com/v2/search?searchTerm=$encodedSearch&type=NAME&first=20&country=US&language=en-US';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'x-rapidapi-key': apiKey,
          'x-rapidapi-host': apiHost,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return dataSearchMovies(jsonData);
      } else {
        print('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }

  List<ApiResponse> dataAutoMovies(Map<String, dynamic> jsonResponse) {
    List<ApiResponse> movies = [];
    var edges = jsonResponse['data']['mainSearch']['edges'] as List<dynamic>;

    for (var edge in edges) {
      var node = edge['node'];
      var entity = node['entity'];
      var knownForEdges = entity['knownFor']['edges'] as List<dynamic>;
      for (var knownForEdge in knownForEdges) {
        var movieNode = knownForEdge['node'];
        var title = movieNode['title']['titleText']['text'] ?? 'Unknown Title';

        if (movieNode['title'] != null) {
          var releaseYear = movieNode['title']['releaseYear']?['year']?.toString() ?? '';
          var releaseDate = movieNode['title']['releaseDate'];
          var month = releaseDate?['month']?.toString() ?? '';
          var day = releaseDate?['day']?.toString() ?? '';

          var imgUrl = entity['primaryImage']?['url'] ?? '';

          if (title.isNotEmpty && imgUrl.isNotEmpty) {
            movies.add(ApiResponse(
              imgUrl: imgUrl,
              title: title,
              releaseYear: releaseYear,
              releaseDate: day,
              releaseMonth: month,
            ));
          }
        }
      }
    }
    return movies;
  }

  Future<List<ApiResponse>?> getMovies() async {
    final String encodedSearch = Uri.encodeComponent("game");
    final String url =
        'https://imdb8.p.rapidapi.com/v2/search?searchTerm=$encodedSearch&type=NAME&first=20&country=US&language=en-US';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'x-rapidapi-key': apiKey,
          'x-rapidapi-host': apiHost,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return dataSearchMovies(jsonData);
      } else {
        print('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }
}
