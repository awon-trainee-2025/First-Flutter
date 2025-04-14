import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String? selectedCountry;


  final List<Map<String, String>> countries = [
    {'name': 'United Arab Emirates', 'image': 'images/Emirates.png'},
    {'name': 'Australia', 'image': 'images/Australia.png'},
    {'name': 'Yemen', 'image': 'images/yemen-flag.png'},
    {'name': 'Saudi Arabia', 'image': 'images/Saudi.png'},
    {'name': 'Bahrain', 'image': 'images/Bahrain.png'},
    {'name': 'Kuwait', 'image': 'images/Kuwait.png'},
    {'name': 'Egypt', 'image': 'images/Egypt.png'},
    {'name': 'Poland', 'image': 'images/Poland.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBE4E9),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 184, 195),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Country Selection',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'Find Yours',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

           
            Expanded(
              child: ListView.separated(
                itemCount: countries.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final country = countries[index];
                  final isSelected = selectedCountry == country['name'];

                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: Colors.white,
                    leading: Image.asset(
                      country['image']!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      country['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: Colors.pink,
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

           
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print('Selected Country: $selectedCountry');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 188, 51, 102),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
