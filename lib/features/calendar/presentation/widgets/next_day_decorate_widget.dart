import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

class NextDayDecorate extends StatelessWidget {
  const NextDayDecorate({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          Text(
            '${day.day}',
            style: const TextStyle(
              color: AppColors.grey2,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
