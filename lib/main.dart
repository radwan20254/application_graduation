import 'package:diagnosify_app/screens/Splash_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Diagnosify_app());
}

class Diagnosify_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diagnosify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
