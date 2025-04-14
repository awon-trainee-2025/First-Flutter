import 'package:flutter/material.dart';
import 'package:renad/CountrySelectionPage.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  final Set<String> selectedInterests = {};

  void toggleInterest(String label) {
    setState(() {
      if (selectedInterests.contains(label)) {
        selectedInterests.remove(label);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(label);
      }
    });
  }

  Widget buildInterestCard(String label, String? imagePath) {
    final bool isSelected = selectedInterests.contains(label);

    return GestureDetector(
      onTap: () => toggleInterest(label),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromARGB(255, 217, 236, 255)
                  : Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color:
                isSelected
                    ? const Color.fromARGB(255, 141, 188, 242)
                    : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        alignment: (imagePath == null) ? Alignment.center : Alignment.topCenter,
        child: Column(
          mainAxisAlignment:
              imagePath == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
          children: [
            if (imagePath != null)
              Image.asset(imagePath, width: 155, height: 115),
            if (imagePath != null) const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 241, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Select Your 3 Interests",
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2.0),
              const Text(
                "Later you can add more in your account",
                style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: <Widget>[
                    buildInterestCard(
                      "Travel & Adventure",
                      "images/Travel_and_ Adventure.png",
                    ),
                    buildInterestCard("Music", "images/Music.png"),
                    buildInterestCard("Art", "images/Art.png"),
                    buildInterestCard(
                      "Food & Drinks",
                      "images/Food_and_Drinks.png",
                    ),
                    buildInterestCard(
                      "Home & Lifestyle",
                      "images/Home_and_Lifestyle.png",
                    ),
                    buildInterestCard("Others", null),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      selectedInterests.length == 3
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const CountrySelectionPage(),
                              ),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 115, 169, 251),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
