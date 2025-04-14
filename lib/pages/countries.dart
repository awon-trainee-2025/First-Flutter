import 'package:awon_task_1/utils/colors.dart';
import 'package:awon_task_1/widgets/countryChoice.dart';
import 'package:awon_task_1/widgets/primaryButton.dart';
import 'package:flutter/material.dart';

class Countries extends StatelessWidget {
  const Countries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Column(
          spacing: 8,
          children: [
            Text(
              "Country Selection",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find Yours",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              CountryChoice(
                countryName: "Saudi Arabia",
                flagImagePath: "images/countries/saudi_arabia_flag.png",
              ),
              CountryChoice(
                countryName: "Kuwait",
                flagImagePath: "images/countries/kuwait.png",
              ),
              CountryChoice(
                countryName: "Egypt",
                flagImagePath: "images/countries/egypt.png",
              ),
              CountryChoice(
                countryName: "China",
                flagImagePath: "images/countries/china.png",
              ),
              CountryChoice(
                countryName: "United States",
                flagImagePath: "images/countries/united-states.png",
              ),
              PrimaryButton(text: "SAVE"),
            ],
          ),
        ),
      ),
    );
  }
}
