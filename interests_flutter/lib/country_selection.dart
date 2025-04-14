import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final List<String> countries = [
    'Saudi Arabia',
    'United Arab Emirates',
    'Kuwait',
    'Bahrain',
    'Oman',
    'Qatar',
    'Jordan',
    'Iraq',
    'Syria',
    'United States',
    'United Kingdom',
    'Canada',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'India',
    'China',
    'Japan',
    'South Korea',
    'Brazil',
    'Mexico',
    'Argentina',
    'Colombia',
    'Chile',
    'Ukraine',
    'Australia',
    'Kazakhstan',
    'Europe',
    'Slovenia',
    'Czech',
    'Netherlands',
    'Poland',
  ];

  List<String> filteredCountries = [];
  final TextEditingController searchController = TextEditingController();
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
    searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries =
          countries
              .where((country) => country.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      appBar: AppBar(
        backgroundColor: Color(0xFF303030),
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text('Country Selection', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Find Your country',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  filteredCountries.map((country) {
                    return ListTile(
                      title: Text(
                        country,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(Icons.flag, color: Colors.white),
                      trailing: Icon(
                        selectedCountry == country
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          selectedCountry = country;
                        });
                      },
                    );
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                if (selectedCountry != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected Country: $selectedCountry'),
                    ),
                  );
                }
              },
              child: Text('SAVE', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
