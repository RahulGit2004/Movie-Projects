import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pune_project/splash_screen.dart';

import 'movie_provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie With Search',
      home: SplashScreen(),
    );
  }
}




