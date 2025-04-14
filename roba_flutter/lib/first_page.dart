import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Select Your 3 Interests "),
            Text("Later you can add more in your account :) ")
          ],
        ),
      ),
    );
  }
}