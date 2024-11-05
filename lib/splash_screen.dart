import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pune_project/home_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            child: Text("Movie Search Dynamic",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white70),
            ),
          ),
        ),
        backgroundColor: Colors.blue,
    );

  }
}
