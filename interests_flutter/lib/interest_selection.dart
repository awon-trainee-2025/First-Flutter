import 'package:flutter/material.dart';
import 'country_selection.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> interests = [];
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.travel_explore, 'label': 'Travel & Adventures'},
    {'icon': Icons.music_note, 'label': 'Music'},
    {'icon': Icons.palette, 'label': 'Art'},
    {'icon': Icons.fastfood, 'label': 'Food & Drink'},
    {'icon': Icons.home, 'label': 'Home & Lifestyle'},
    {'icon': Icons.more_horiz, 'label': 'Others'},
  ];

  void toggleInterest(String interest) {
    setState(() {
      if (interests.contains(interest)) {
        interests.remove(interest);
      } else if (interests.length < 3) {
        interests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Select Your 3 Interests",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Later you can add more in your account :)",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                children:
                    options.map((item) {
                      bool isSelected = interests.contains(item['label']);
                      return GestureDetector(
                        onTap: () => toggleInterest(item['label']),
                        child: Card(
                          color:
                              isSelected
                                  ? Colors.orange[400]
                                  : Colors.grey[800],
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  item['icon'],
                                  size: 40,
                                  color:
                                      isSelected
                                          ? Colors.grey[800]
                                          : Colors.white,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item['label'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed:
                    interests.length == 3
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryScreen(),
                            ),
                          );
                        }
                        : null,
                child: Text('CONTINUE', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
