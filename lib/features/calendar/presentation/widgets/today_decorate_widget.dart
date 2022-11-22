import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class TodayDecorate extends StatelessWidget {
  const TodayDecorate({
    Key? key,
    required this.context,
    required this.day,
  }) : super(key: key);

  final BuildContext context;
  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.watch<ThemeProvider>().currentTheme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: context
                .watch<ThemeProvider>()
                .currentTheme
                .primaryColor
                .withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${day.day}',
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const Image(
            height: 34,
            width: 33,
            image: AssetImage(
              'images/face1.png',
            ),
          ),
        ],
      ),
    );
  }
}
