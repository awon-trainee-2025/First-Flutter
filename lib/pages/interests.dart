import 'package:awon_task_1/utils/colors.dart';
import 'package:awon_task_1/widgets/interestCard.dart';
import 'package:awon_task_1/widgets/interestGroup.dart';
import 'package:awon_task_1/widgets/primaryButton.dart';
import 'package:flutter/material.dart';

class Interests extends StatelessWidget {
  const Interests({super.key});

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
              "Select Your 3 Interest",
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
        padding: EdgeInsets.fromLTRB(12, 40, 12, 40),
        child: Column(
          spacing: 20,
          children: [
            InterestGroup(
              cards: [
                Interestcard(
                  title: "Travel",
                  imagePath: "images/interests/ticket_7796385.png",
                ),
                Interestcard(
                  title: "Art & Drawing",
                  imagePath: "images/interests/palette.png",
                ),
              ],
            ),
            InterestGroup(
              cards: [
                Interestcard(
                  title: "Programming",
                  imagePath: "images/interests/programming.png",
                ),
                Interestcard(
                  title: "Swimming",
                  imagePath: "images/interests/swimming.png",
                ),
              ],
            ),
            InterestGroup(
              cards: [
                Interestcard(
                  title: "Workout",
                  imagePath: "images/interests/dumbbell.png",
                ),
              ],
            ),
            PrimaryButton(text: "CONTINUE"),
          ],
        ),
      ),
    );
  }
}
