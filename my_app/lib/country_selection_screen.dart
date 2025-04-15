import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;

  final List<Map<String, String>> countries = [
    {"name": "Ukraine", "flag": "assets/icons/ukraine.png"},
    {"name": "Australia", "flag": "assets/icons/australia.png"},
    {"name": "Kazakhstan", "flag": "assets/icons/Kazakhstan.png"},
    {"name": "Europe", "flag": "assets/icons/european.png"},
    {"name": "Slovenia", "flag": "assets/icons/Slovenia.png"},
    {"name": "Czech", "flag": "assets/icons/czech.png"},
    {"name": "Netherlands", "flag": "assets/icons/netherlands.png"},
    {"name": "Poland", "flag": "assets/icons/poland.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.pink[50],
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                "Country Selection",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Find Yours",
                  hintStyle: const TextStyle(fontFamily: 'Cairo'),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: countries.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: Image.asset(
                      country['flag']!,
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      country['name']!,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      selectedCountry == country['name']
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: Colors.redAccent,
                    ),
                    onTap: () {
                      setState(() {
                        selectedCountry = country['name'];
                      });
                    },
                  );
                },
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
                  // نقدر نحفظ الاختيار هنا أو نرجع للخلف
                  Navigator.pop(context);
                },
                child: const Text(
                  "SAVE",
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
