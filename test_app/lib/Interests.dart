import 'package:flutter/material.dart';
import 'country.dart';

class Interests extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<Interests> {
  List<String> selectedInterests = [];
  String searchQuery = '';

  final Map<String, List<Map<String, dynamic>>> allInterests = {
    'السفر والمغامرات': [
      {'title': 'السفر', 'icon': Icons.flight_takeoff},
      {'title': 'الطبيعة', 'icon': Icons.park},
    ],
    'الفنون': [
      {'title': 'الرسم', 'icon': Icons.brush},
      {'title': 'الموسيقى', 'icon': Icons.music_note},
    ],
    'نمط الحياة': [
      {'title': 'المنزل', 'icon': Icons.home},
      {'title': 'الطعام', 'icon': Icons.local_dining},
    ],
    'الترفيه': [
      {'title': 'ألعاب', 'icon': Icons.videogame_asset},
      {'title': 'أفلام', 'icon': Icons.movie},
    ],
  };

  void toggleSelection(String title) {
    setState(() {
      if (selectedInterests.contains(title)) {
        selectedInterests.remove(title);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredInterests = allInterests.map((category, list) {
      final filteredList =
          list
              .where((item) => item['title'].toString().contains(searchQuery))
              .toList();
      return MapEntry(category, filteredList);
    })..removeWhere((_, value) => value.isEmpty);

    return Scaffold(
      appBar: AppBar(
        title: Text("اختر اهتماماتك"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color.fromARGB(255, 231, 229, 243)],
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
                    hintText: "ابحث عن اهتمام...",
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
                      filteredInterests.entries.map((entry) {
                        return ExpansionTile(
                          title: Text(
                            entry.key,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF393646),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children:
                                    entry.value.map((item) {
                                      final isSelected = selectedInterests
                                          .contains(item['title']);
                                      return ChoiceChip(
                                        label: Text(
                                          item['title'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        avatar: Icon(
                                          item['icon'],
                                          size: 18,
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Color(0xFFD4B76E),
                                        ),
                                        selected: isSelected,
                                        onSelected:
                                            (_) =>
                                                toggleSelection(item['title']),
                                        selectedColor: Color(0xFFD4B76E),
                                        backgroundColor: Colors.grey[200],
                                        labelStyle: TextStyle(
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed:
                      selectedInterests.isNotEmpty
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Country()),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF393646),
                    minimumSize: Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "التالي",
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
