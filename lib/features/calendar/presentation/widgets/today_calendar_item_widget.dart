import 'package:flutter/material.dart';
import 'package:mood_tracker/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class TodayCalendarItemWidget extends StatelessWidget {
  const TodayCalendarItemWidget({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    return Container(
      height: 80,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${day.day}', style: s12WBoldCWhite),
          const Image(
            height: 34,
            width: 34,
            image: AssetImage(
              'images/face1.png',
            ),
          ),
        ],
      ),
    );
  }
}
