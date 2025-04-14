import 'package:flutter/material.dart';
import 'package:my_app/WelcomePage.dart';
import 'package:my_app/CountryPage.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WelcomePage(), // Start from Welcome Page

    );
  }
}
