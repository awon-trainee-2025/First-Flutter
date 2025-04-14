import 'package:awon_task_1/utils/colors.dart';
import 'package:flutter/material.dart';

class CountryChoice extends StatelessWidget {
  final String flagImagePath;
  final String countryName;
  const CountryChoice({
    super.key,
    required this.countryName,
    required this.flagImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 12),
      decoration: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.black),
      ),
      child: Row(
        spacing: 12,

        children: [
          Image.asset(flagImagePath, width: 50),
          Text(countryName),
          Spacer(),
          Radio(
            activeColor: AppColors.mainColor,
            value: countryName,
            groupValue: "Saudi Arabia",
            onChanged: (context) {},
          ),
        ],
      ),
    );
  }
}
