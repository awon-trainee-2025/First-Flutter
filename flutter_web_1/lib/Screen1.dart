import 'package:flutter/material.dart';
import 'package:flutter_web_1/CustomContainer.dart';
import 'package:flutter_web_1/Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key, required String title});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: AppBar(title: Text("Select your interest"),
   flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFFFB6C1), Color(0xFFA5D8FF)], // pink to blue
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
   ),
   ),
   ),
    backgroundColor: Color(0xFFFFF8F8),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("later, you can add more in your account"),
        const SizedBox(height: 20),
        CustomContainer(),
        const SizedBox(height: 20),

         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(title: "Screen 2"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Color(0xFFA5D8FF),
               padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
              ),
              child: Text(
                "Continue",
               style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
               ),
              ),
            ),
        ],
      ),
    

    ),
    
   );
  }
}