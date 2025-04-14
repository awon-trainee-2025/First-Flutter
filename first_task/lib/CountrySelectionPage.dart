import 'package:first_task/InterestsPage.dart';
import 'package:flutter/material.dart';

class CountrySelectionPage extends StatefulWidget {
  const CountrySelectionPage({super.key});

  @override
  State<CountrySelectionPage> createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  String selectedCountry = "";
  String searchQuery = "";

  final List<Map<String, String>> countries = [
    {"name": "Saudi Arabia", "flag": "images/Saudi Arabia.png"},
    {"name": "United States", "flag": "images/United States.png"},
    {"name": "France", "flag": "images/France.png"},
    {"name": "Japan", "flag": "images/Japan.png"},
    {"name": "India", "flag": "images/India.png"},
    {"name": "Morocco", "flag": "images/Morocco.png"},
    {"name": "Brazil", "flag": "images/Brazil.png"},
    {"name": "China", "flag": "images/China.png"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredCountries = countries.where((country) {
      return country['name']!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 195, 220),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 195, 195, 220),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "COUNTRY SELECTION",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search for a country...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: filteredCountries.map((country) {
                  return buildCountryItem(country['name']!, country['flag']!);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCountryItem(String name, String flagPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            flagPath,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Radio(
            value: name,
            groupValue: selectedCountry,
            onChanged: (value) {
              setState(() {
                selectedCountry = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
