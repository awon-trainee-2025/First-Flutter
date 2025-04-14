import 'package:flutter/material.dart';
import 'country_screen.dart';

class InterestScreen extends StatefulWidget {
  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<Map<String, dynamic>> interests = [
    {'title': 'Travel', 'image': 'images/travel.png'},
    {'title': 'Home', 'image': 'images/home.png'},
    {'title': 'Art', 'image': 'images/art.png'},
    {'title': 'Food', 'image': 'images/food.png'},
    {'title': 'Music', 'image': 'images/music.png'},
    {'title': 'Others', 'image': null}, 
  ];

  List<String> selectedInterests = [];

  void toggleInterest(String title) {
    setState(() {
      if (selectedInterests.contains(title)) {
        selectedInterests.remove(title);
      } else {
        selectedInterests.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'Select Your 3 Interests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Later you can add more in your account :)',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        toolbarHeight: 80, // ارتفاع AppBar
        automaticallyImplyLeading: Navigator.of(context).canPop(), 
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: interests.map((interest) {
                bool isSelected = selectedInterests.contains(interest['title']);
                return GestureDetector(
                  onTap: () => toggleInterest(interest['title']),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isSelected ? Colors.deepPurple : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (interest['image'] != null)
                          Image.asset(interest['image'], height: 80),
                        if (interest['image'] == null)
                          Icon(Icons.more_horiz, size: 40, color: Colors.deepPurple),
                        const SizedBox(height: 10),
                        Text(
                          interest['title'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if (selectedInterests.length >= 3)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CountryScreen()),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
