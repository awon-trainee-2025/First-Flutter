import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roba_flutter/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF5EFE9),
        appBar: AppBar(
          backgroundColor: Color(0xFFC8D9E6),
          title: Center(child: Text("Select Your 3 Interests")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Later you can add more in your account :) "),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildInterestButton("assets/travel_icon.jpg", "Travel"),
                  buildInterestButton("assets/music.png", "Music"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildInterestButton("assets/art.jpg", "Art"),
                  buildInterestButton("assets/food.jpg", "Food"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                    child: const Text('CONTINUE'),
                    style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC8D9E6),)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInterestButton(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            Text(label),
          ],
        ),
      ),
    );
  }
}
