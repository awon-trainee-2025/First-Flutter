import 'package:first_task/CountrySelectionPage.dart';
import 'package:flutter/material.dart';

class Interestspage extends StatefulWidget {
  const Interestspage({super.key});

  @override
  State<Interestspage> createState() => _InterestspageState();
}

class _InterestspageState extends State<Interestspage> {
  List<int> selectedIndexes = [];

  List<Map<String, String>> interests = [
    {"title": "Travel & Adventures", "image": "images/Travel & Adventures.png"},
    {"title": "Music", "image": "images/MUSIC.png"},
    {"title": "Art", "image": "images/Art.png"},
    {"title": "Food & Drink", "image": "images/Food & Drink.png"},
    {"title": "Home & Lifestyle", "image": "images/Home & Lifestyle.jpg"},
    {"title": "Others", "image": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 195, 220),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Select Your 3 Interests",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Later you can add more in your account :)",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: interests.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1, // حجم الكروت
                ),
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndexes.contains(index);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndexes.remove(index);
                        } else if (selectedIndexes.length < 3) {
                          selectedIndexes.add(index);
                        }
                      });
                    },
                    child: buildInterestCard(
                      interests[index]["title"]!,
                      interests[index]["image"]!,
                      isSelected,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CountrySelectionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "CONTINUE",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildInterestCard(String title, String imagePath, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Color.fromARGB(255, 138, 99, 246).withOpacity(0.7)
            : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? Colors.deepPurple : Colors.transparent,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title == "Others"
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )
              : Image.asset(
                  imagePath,
                  height: 150,
                  fit: BoxFit.cover,
                ),
          SizedBox(height: 10),
          if (title != "Others")
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
        ],
      ),
    );
  }
}
