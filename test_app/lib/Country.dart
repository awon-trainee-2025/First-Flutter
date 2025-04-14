import 'package:flutter/material.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  String? selectedCountry;
  String searchQuery = '';

  final Map<String, List<String>> allRegions = {
    'الشرق الأوسط': ['السعودية', 'الإمارات', 'قطر', 'مصر', 'الأردن'],
    'أوروبا': ['أوكرانيا', 'ألمانيا', 'فرنسا', 'هولندا', 'بولندا'],
    'آسيا': ['كازاخستان', 'الهند', 'الصين'],
    'أمريكا وأستراليا': ['الولايات المتحدة', 'كندا', 'أستراليا'],
  };

  @override
  Widget build(BuildContext context) {
    final filteredRegions = allRegions.map((region, countries) {
      final filteredCountries =
          countries.where((c) => c.contains(searchQuery)).toList();
      return MapEntry(region, filteredCountries);
    })..removeWhere((_, list) => list.isEmpty);

    return Scaffold(
      appBar: AppBar(
        title: Text("اختر الدولة"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color.fromARGB(255, 217, 209, 255)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "ابحث عن الدولة...",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children:
                      filteredRegions.entries.map((entry) {
                        return ExpansionTile(
                          title: Text(
                            entry.key,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF393646),
                            ),
                          ),
                          children:
                              entry.value.map((country) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: RadioListTile<String>(
                                      title: Text(
                                        country,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      value: country,
                                      groupValue: selectedCountry,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCountry = value!;
                                        });
                                      },
                                      activeColor: Color(0xFFD4B76E),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      tileColor: Colors.grey[100],
                                    ),
                                  ),
                                );
                              }).toList(),
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed:
                      selectedCountry != null
                          ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("شكرا لمشاركتك معنا💕"),
                                backgroundColor: Color(0xFF393646),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF393646),
                    minimumSize: Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "حفظ",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
