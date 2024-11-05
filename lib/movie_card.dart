import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_response.dart';

class MovieCard extends StatelessWidget {
  final ApiResponse movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 8, // Increased elevation for a more pronounced shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.grey.shade300, width: 1), // Added border
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    movie.imgUrl,
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
          // Movie Details
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 18, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  // Release Date
                  Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.grey[600], size: 16), // Added icon
                      SizedBox(width: 4.0),
                      Text(
                        'Release Date: ${movie.releaseDate}-${movie.releaseMonth}-${movie.releaseYear}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14, // Slightly increased font size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
