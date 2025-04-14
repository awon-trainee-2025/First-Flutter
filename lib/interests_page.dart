import 'package:flutter/material.dart';
import 'package:task_2/country_page.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Select Your three Interests',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text('Later you can add more in your account :)'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Screenshot 2025-04-14 203323.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(width: 15),
                Image.asset(
                  'images/Screenshot 2025-04-14 203331.png',
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Screenshot 2025-04-14 204739.png',
                  height: 155,
                  width: 155,
                ),
                const SizedBox(width: 15),
                Image.asset(
                  'images/Screenshot 2025-04-14 204747.png',
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Screenshot 2025-04-14 205135.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(width: 15),
                Image.asset(
                  'images/Screenshot 2025-04-14 205146.png',
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountryPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 230, 108, 68),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text('CONTINUE'),
            ),
          ],
        ),
      ),
    );
  }
}
