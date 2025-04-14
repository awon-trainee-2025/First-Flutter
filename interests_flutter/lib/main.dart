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
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Color(0xFF303030),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF303030),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: InterestsScreen(),
    );
  }
}
