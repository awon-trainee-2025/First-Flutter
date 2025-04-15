import 'package:flutter/material.dart';
import 'interests_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // عشان يشيل الشريط الأحمر
      home: const InterestsScreen(), // أول صفحة تفتح
    );
  }
}
