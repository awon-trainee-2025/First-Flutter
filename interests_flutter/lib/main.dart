import 'package:flutter/material.dart';
import '/interest_selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interests & Countries',
      theme: ThemeData(
        primaryColor: Colors.orange, // Orange as primary color
        scaffoldBackgroundColor: Color(0xFF303030), // Dark grey background
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // White text color
          labelLarge: TextStyle(color: Colors.white), // White text color
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF303030), // Dark grey background
          titleTextStyle: TextStyle(
            color: Colors.white,
          ), // White text in the AppBar
        ),
      ),
      home: InterestsScreen(),
    );
  }
}
