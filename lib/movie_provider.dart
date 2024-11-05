import 'package:flutter/cupertino.dart';

import 'api_response.dart';
import 'app_service.dart';

class MovieProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<ApiResponse> _movies = [];
  List<ApiResponse> _movies2 = [];
  bool _isLoading = false;
  bool _isLoading2 = false;

  List<ApiResponse> get movies => _movies;
  bool get isLoading => _isLoading;
  List<ApiResponse> get movies2 => _movies2;
  bool get isLoading2 => _isLoading2;

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();

    if (query.isEmpty) {
      _movies = [];
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      List<ApiResponse>? fetchedMovies = await apiService.searchMovies(query);
      _movies = fetchedMovies ?? [];
    } catch (error) {
      print("Error occurred: $error");
      _movies = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getMovies() async {
    var query = "game";
    _isLoading2 = true;
    notifyListeners();

    if (query.isEmpty) {
      _movies2 = [];
      _isLoading2 = false;
      notifyListeners();
      return;
    }

    try {
      List<ApiResponse>? fetchedMovies = await apiService.searchMovies(query);
      _movies2 = fetchedMovies ?? [];
    } catch (error) {
      print("Error occurred: $error");
      _movies2 = [];
    }

    _isLoading2 = false;
    notifyListeners();
  }
}
