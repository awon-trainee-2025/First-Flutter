import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            
            // The grid layout from CustomContainer
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true, // Important for nested scroll views
                physics: const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildGridBox("Travel & Adventure", "images/travel.png", Colors.pink),
                  _buildGridBox("Music", "images/music.png", Colors.blue),
                  _buildGridBox("Art", "images/art.png", Colors.orange),
                  _buildGridBox("Food & Drink", "images/food.png", Colors.green),
                  _buildGridBox("Home & lifeStyle", "images/lifestyle.png", Colors.purple),
                  _buildGridBox("Others", "images/others.png", Colors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Your original row-building methods
  Widget _buildRow(String text1, String text2, Color color1, Color color2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBox(text1, color1),
        const SizedBox(width: 20),
        _buildBox(text2, color2),
      ],
    );
  }

  Widget _buildBox(String text, Color color) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12), // Added rounded corners
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // The grid box method from CustomContainer
  Widget _buildGridBox(String text, String imagePath, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fallback to icon if image fails to load
            Image.asset(
              imagePath,
              height: 60,
              width: 60,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.category,
                size: 60,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}