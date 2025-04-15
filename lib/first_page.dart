import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Select your 3 interests'),
        Text('lohgfdggh'),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              height: 120,
              width: 120,
              color: Colors.amber,
              child: Center(child: Text('kjahgfdhjadegv')),
            ),
            Container(
              margin: EdgeInsets.all(30),
              height: 120,
              width: 120,
              color: Colors.amber,
              child: Center(child: Text('kjahgfdhjadegv')),
            ),
          ],
        )
      ],
    ));
  }
}
