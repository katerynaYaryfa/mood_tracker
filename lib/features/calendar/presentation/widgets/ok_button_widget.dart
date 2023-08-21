import 'package:flutter/material.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/features/notes_feed/providers/notes_feed_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:provider/provider.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<CalendarProvider>().submitSelectedDate();
          context.read<NotesFeedProvider>().submitSelectedDate();

          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          height: 50,
          child: const Center(
            child: Text(
              'OK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
