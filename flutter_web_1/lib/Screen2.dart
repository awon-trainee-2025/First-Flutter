import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key, required String title});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country selection"),
         flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFFFB6C1), Color(0xFFA5D8FF)], // pink to blue
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
   ),
   ),
   ),
      
      backgroundColor: Colors.white,
      body: Center
        (
          child:Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center ,         
   children:[
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey[500]),
      filled: true,
      fillColor: Color(0xFFFDEEF4), // soft pink background
      prefixIcon: Icon(Icons.search, color: Color(0xFFFFB6C1)), // pastel pink
      contentPadding: EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
    ),
  ),
),
  ),
  
    Expanded(child: ListView(
children: [
    SizedBox(height: 12), // 👈 Between France and Japan

  ListTile(
    leading: ClipRRect(
        borderRadius: BorderRadius.circular(1),
        child: Image.asset(
          "images/france.png",
          width: 50,
          height: 60,
          fit: BoxFit.cover,
        
      ),
    ),
    title: Text("France"),
    trailing: Radio(
      value: 1,
      groupValue: selectedValue,
      onChanged: (int? value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
  ),

  SizedBox(height: 12), // 👈 Between France and Japan

  ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        "images/japan.png",
        width: 50,
        height: 60,
        fit: BoxFit.cover,
      ),
    ),
    title: Text("Japan"),
    trailing: Radio(
      value: 2,
      groupValue: selectedValue,
      onChanged: (int? value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
  ),

  SizedBox(height: 12), // 👈 Between Japan and South Korea

  ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        "images/south-korea.png",
        width: 50,
        height: 60,
        fit: BoxFit.cover,
      ),
    ),
    title: Text("South Korea"),
    trailing: Radio(
      value: 3,
      groupValue: selectedValue,
      onChanged: (int? value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
  ),

  SizedBox(height: 12), // 👈 Between South Korea and UK

  ListTile(
    leading: Padding(
      padding: EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          "images/united-kingdom.png",
          width: 50,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Text("UK"),
    trailing: Radio(
      value: 4,
      groupValue: selectedValue,
      onChanged: (int? value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
  ),

],
            )
            
            ),
           ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Color(0xFFA5D8FF),
               padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
              ),
              child: Text(
                "save",
               style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
               ),
              ),
            ),
            const SizedBox(height: 20),

            ], 
            
          ),
          
        ),
      
    );
  }
}
