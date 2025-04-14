import 'package:flutter/material.dart';
import 'CountryPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> selectedInterests = [];

  final List<Map<String, dynamic>> interests = [
    {'label': 'Travel & Adventures', 'image': 'Images/travel.png'},
    {'label': 'Music', 'image': 'Images/music.png'},
    {'label': 'Art', 'image': 'Images/art.png'},
    {'label': 'Food & Drink', 'image': 'Images/food.png'},
    {'label': 'Home & Lifestyle', 'image': 'Images/home.png'},
    {'label': 'Others', 'image': null},
  ];

  void toggleSelection(String label) {
    setState(() {
      if (selectedInterests.contains(label)) {
        selectedInterests.remove(label);
      } else {
        if (selectedInterests.length < 3) {
          selectedInterests.add(label);
        }
      }
    });
  }

  bool isSelected(String label) => selectedInterests.contains(label);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF1F1),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Select Your 3 Interests',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Later you can add more in your account :)',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: interests.map((item) {
                  return GestureDetector(
                    onTap: () => toggleSelection(item['label']),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected(item['label'])
                            ? const Color(0xFF8368B3)
                            : const Color(0xFFEBD6FF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (item['image'] != null)
                            Image.asset(
                              item['image'],
                              width: 40,
                              height: 40,
                            ),
                          const SizedBox(height: 10),
                          Text(
                            item['label'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CountryPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7B61FF),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'CONTINUE',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
