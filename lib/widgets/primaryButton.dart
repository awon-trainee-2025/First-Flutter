import 'package:awon_task_1/pages/countries.dart';
import 'package:awon_task_1/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  const PrimaryButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Countries()),
        );
      },
      style: FilledButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: AppColors.mainColor,
      ),
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}
