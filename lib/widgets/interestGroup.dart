import 'package:awon_task_1/widgets/interestCard.dart';
import 'package:flutter/material.dart';

class InterestGroup extends StatelessWidget {
  final List<Interestcard> cards;
  const InterestGroup({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      child: Row(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: cards,
      ),
    );
  }
}
