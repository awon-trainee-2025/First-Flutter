import 'package:flutter/material.dart';
import 'country_page.dart';

class InterestsSelectionPage extends StatefulWidget {
  @override
  _InterestsSelectionPageState createState() => _InterestsSelectionPageState();
}

class _InterestsSelectionPageState extends State<InterestsSelectionPage> {
  List<String> selectedInterests = [];

  final List<Map<String, dynamic>> interests = [
    {"title": "Travel & Adventures", "image": "assets/images/travel.jpg"},
    {"title": "Music", "image": "assets/images/mu.png"},
    {"title": "Art", "image": "assets/images/art.png"},
    {"title": "Food & Drink", "image": "assets/images/food.jpg"},
    {"title": "Home & Lifestyle", "image": "assets/images/house.png"},
    {"title": "Others", "image": "assets/images/other.jpg"},
  ];

  void toggleInterest(String title) {
    setState(() {
      if (selectedInterests.contains(title)) {
        selectedInterests.remove(title);
      } else {
        if (selectedInterests.length < 3) {
          selectedInterests.add(title);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 226, 232),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:16),
          child: Center(
           child: Column(
            children: [
              Text(
                "Select Your 3 Interests",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Later you can add more in your account :)",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: interests.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    final interest = interests[index];
                    final isSelected = selectedInterests.contains(interest["title"]);

                    return GestureDetector(
                      onTap: () => toggleInterest(interest["title"]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? const Color.fromARGB(255, 250, 197, 237) : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? const Color.fromARGB(255, 255, 150, 243) : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              interest["image"],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              interest["title"],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: selectedInterests.length == 3 ? () {
                 Navigator.push(context, 

                 MaterialPageRoute(builder: (context) => CountrySelectionPage()));
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 116, 232),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text("CONTINUE"),
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}