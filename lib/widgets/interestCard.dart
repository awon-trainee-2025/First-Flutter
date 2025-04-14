import 'package:flutter/material.dart';

class Interestcard extends StatelessWidget {
  final String title;
  final String imagePath;
  const Interestcard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 125,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(imagePath, width: 50), Text(title)],
      ),
    );
  }
}
