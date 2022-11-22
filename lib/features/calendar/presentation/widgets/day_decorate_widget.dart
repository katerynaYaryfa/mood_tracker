import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/theme/app_colors.dart';

class DayDecorate extends StatelessWidget {
  const DayDecorate({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 40,
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
          const SpaceH4(),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyWhite2,
            ),
          ),
        ],
      ),
    );
  }
}
