import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? selectedCountry;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC8D9E6),
        title: const Center(child: Text("Country Selection")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Search Country:"),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Type country name here",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Select a Country:"),
            ListTile(
              title: const Text("Ukraine"),
              leading: Radio<String>(
                value: "Ukraine",
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Australia"),
              leading: Radio<String>(
                value: "Australia",
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Kazakhstan"),
              leading: Radio<String>(
                value: "Kazakhstan",
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String searchQuery = _searchController.text;
                String? country = selectedCountry;
                print("Search query: $searchQuery, Selected country: $country");
              },
              child: const Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC8D9E6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
