import 'package:flutter/material.dart';
import 'country.dart';
void main() {
  runApp(const interest());
}

class interest extends StatelessWidget {
  const interest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InterestGrid(),
    );
  }
}

class InterestGrid extends StatefulWidget {
  @override
  _InterestGridState createState() => _InterestGridState();
}

class _InterestGridState extends State<InterestGrid> {
  
  // title list
  final List<String> titles = [
    'travel',
    'music',
    'art',
    'food',
    'home',
    'others',
  ];

  // icon list
  final List<IconData> icons = [
    Icons.flight,
    Icons.music_note,
    Icons.palette,
    Icons.restaurant,
    Icons.home,
    Icons.more_horiz,
  ];

  // state of choies: "selected -> true"
  List<bool> isSelected = [false, false, false, false, false, false];

  int get selectedCount => isSelected.where((v) => v).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,

      // ***** app bar ****
      appBar: AppBar(
        title: const Text('flutter task', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        
      ),
      
      // ***** body *****
      body: Column(
        
        children: [

        Text('only select 3 intersts', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Text('later you can add more un your account :)', style: TextStyle(color: Colors.grey),),
        
          Expanded(
            child: GridView.builder(

              padding: const EdgeInsets.all(16),
              itemCount: titles.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // num of column
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),

              itemBuilder: (context, index) {
                return GestureDetector(


                  onTap: () {
                    setState(() {
                      // true -> false
                      if (isSelected[index]) {
                        isSelected[index] = false;
                      }
                      else { // false -> true , if x < 3
                        if (selectedCount < 3) {
                          isSelected[index] = true;
                        } 
                      }
                    });
                  },

                  child: Container(

                    decoration: BoxDecoration(

                      color: isSelected[index] ? Colors.blue[100] : Colors.white,

                      border: Border.all(
                        color: isSelected[index] ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                      
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[index], size: 40, color: Colors.blue),
                        const SizedBox(height: 10),

                        Text(
                          titles[index],
                          style: const TextStyle(fontSize: 16),
                        ),

                      ],
                    ),

                  ),
                );
              },
            ),
          ),

          // continue button, note: if total choices (x < 3) button will disable 
          Padding(
            padding: const EdgeInsets.all(20),

            child: ElevatedButton(
              onPressed: selectedCount == 3
                  ? () {                   
                    Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const country())
                    );
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
