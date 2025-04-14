import 'package:flutter/material.dart';

class CountrySelectionPage extends StatefulWidget {
  @override
  _CountrySelectionPageState createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  String selectedCountry = "Ukraine";

  final List<Map<String, String>> countries = [
    {"name": "Ukraine", "flag": "assets/images/ukr.png"},
    {"name": "Australia", "flag": "assets/images/aus.png"},
    {"name": "Kazakhstan", "flag": "assets/images/ka.png"},
    {"name": "Spain", "flag": "assets/images/sp.png"},
    {"name": "France", "flag": "assets/images/fr.png"},
    {"name": "Italy", "flag": "assets/images/it.png"},
    {"name": "Canada", "flag": "assets/images/ca.png"},
    {"name": "Argentina", "flag": "assets/images/ar.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 226, 232),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 255, 116, 232),
        elevation: 0,
        title: Text('Country Selection', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find Yours',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: /*Text(country['flag']!, style: TextStyle(fontSize: 24))*/
                  Image.asset(countries[index]['flag']!,
                  width: 30,
                  height: 30,),

                  title: Text(country['name']!),
                  trailing: Radio<String>(
                    value: country['name']!,
                    groupValue: selectedCountry,
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 255, 116, 232),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 116, 232),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text('SAVE'),
            ),
          )
        ],
      ),
    );
  }
}