import 'package:flutter/material.dart';
import 'package:taskone/CountryPage.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  List<String> selectedInterests = [];

  final List<Map<String, String>> interests = [
    {'title': 'Travel & Adventures', 'image': 'images/travel.png'},
    {'title': 'Music', 'image': 'images/music.png'},
    {'title': 'Art', 'image': 'images/Art.png'},
    {'title': 'Food & Drink', 'image': 'images/FoodDrink.png'},
    {'title': 'Home & Lifestyle', 'image': 'images/HomeLifstyle.png'},
    {'title': 'Others', 'image': ''}, 
  ];

  final Color selectedColor = Color.fromARGB(255, 185, 77, 119);
  final Color unselectedColor = Color.fromARGB(255, 210, 157, 168);
  final Color borderColor = Color.fromARGB(255, 150, 60, 90);

  void toggleSelection(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        if (selectedInterests.length < 3) {
          selectedInterests.add(interest);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBE4E9),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 184, 195),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Choose Interests',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Select Your 3 Interests',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 128, 18, 65),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'You can add more later',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

             
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: interests.map((item) {
                  String title = item['title']!;
                  String imagePath = item['image']!;
                  bool isSelected = selectedInterests.contains(title);

                  return GestureDetector(
                    onTap: () => toggleSelection(title),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 55) / 2,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected ? selectedColor : unselectedColor,
                        border: Border.all(
                          color: borderColor.withOpacity(0.5),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (imagePath.isNotEmpty)
                            Image.asset(
                              imagePath,
                              height: 35,
                            ),
                          if (imagePath.isNotEmpty) SizedBox(height: 8),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Color.fromARGB(255, 128, 18, 65),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 30),

              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 188, 51, 102),
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CountryPage()),
                    );
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


