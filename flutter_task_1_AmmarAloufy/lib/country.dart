import 'package:flutter/material.dart';

void main() {
  runApp(const country());
}

class country extends StatelessWidget {
  const country({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Picker',
      debugShowCheckedModeBanner: false,
      home: const CountrySelectorPage(), 
    );
  }
}

class CountrySelectorPage extends StatefulWidget {
  const CountrySelectorPage({super.key});

  @override
  State<CountrySelectorPage> createState() => _CountrySelectorPageState();
}

class _CountrySelectorPageState extends State<CountrySelectorPage> {
  
  final List<Map<String, String>> allCountries = [
    {'name': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'name': 'Egypt', 'flag': '🇪🇬'},
    {'name': 'Morocco', 'flag': '🇲🇦'},
    {'name': 'UAE', 'flag': '🇦🇪'},
    {'name': 'Iraq', 'flag': '🇮🇶'},
    {'name': 'Jordan', 'flag': '🇯🇴'},
  ];

  List<Map<String, String>> filteredCountries = [];
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    filteredCountries = allCountries;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('flutter task', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading : 
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,),
            ),
          
      ),

      body: Column(

        children: [
          // Search
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
              const Icon(Icons.search, size: 28, color: Colors.grey),

                Expanded(
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "Search country",
                      
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),

          Padding(
          padding: EdgeInsets.all(20),
          child: Text('Country Selection', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                final isSelected = selectedIndex == index;

                return ListTile(
                  leading: Text(
                    country['flag']!,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(
                    country['name']!,
                    style: const TextStyle(fontSize: 20),
                  ),

                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.blue)
                      : const Icon(Icons.circle_outlined),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        
        
        Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: selectedIndex != null
              ? () {
                  
                  
                }
              : null,
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(200, 50)
              ),
              child: const Text('continue', style: TextStyle(color : Colors.white, fontSize: 25 , fontWeight: FontWeight.bold),),

        ),
      ),
        ],
      ),
      
      
    );
  }
}
