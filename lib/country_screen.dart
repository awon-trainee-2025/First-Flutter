import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final List<String> countries = [
    '🇸🇦 Saudi Arabia',
    '🇪🇬 Egypt',
    '🇦🇪 UAE',
    '🇰🇼 Kuwait',
    '🇶🇦 Qatar',
    '🇴🇲 Oman',
  ];

  String selectedCountry = '🇸🇦 Saudi Arabia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Country Selection',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        automaticallyImplyLeading: true, 
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find yours',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          // Country List
          Expanded(
            child: ListView.separated(
              itemCount: countries.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                String country = countries[index];
                bool isSelected = selectedCountry == country;
                return ListTile(
                  title: Text(
                    country,
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                );
              },
            ),
          ),

          // Save Button
          if (selectedCountry.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Saved: $selectedCountry')),
                  );
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
