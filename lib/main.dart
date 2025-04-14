import 'package:flutter/material.dart';
import 'package:task_2/interests_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const InterestsPage(title: 'Flutter Demo Home Page'),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFDEBE6)),
    );
  }
}
