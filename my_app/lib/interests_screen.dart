import 'package:flutter/material.dart';
import 'country_selection_screen.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            const Text(
              "Select Your 3 Interests",
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Later you can add more in your account :)",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Cairo',
                color: Color.fromARGB(255, 95, 95, 95),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  InterestTile(
                    title: "Music",
                    imagePath: "assets/images/music.png",
                  ),
                  InterestTile(
                    title: "Art",
                    imagePath: "assets/images/palette.png",
                  ),
                  InterestTile(
                    title: "Travel",
                    imagePath: "assets/images/destination.png",
                  ),
                  InterestTile(
                    title: "Food",
                    imagePath: "assets/images/diet.png",
                  ),
                  InterestTile(
                    title: "Home",
                    imagePath: "assets/images/needs.png",
                  ),
                  InterestTile(
                    title: "Others",
                    imagePath: "assets/images/other.png",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountrySelectionScreen(),
                    ),
                  );
                },
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 68),
          ],
        ),
      ),
    );
  }
}

class InterestTile extends StatefulWidget {
  final String title;
  final String imagePath;

  const InterestTile({super.key, required this.title, required this.imagePath});

  @override
  State<InterestTile> createState() => _InterestTileState();
}

class _InterestTileState extends State<InterestTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Card(
        color: isSelected ? Colors.deepPurple : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.imagePath, width: 60, height: 60),
            const SizedBox(height: 10),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'Cairo',
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
