import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/mood_icon_widget.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class HowWasYourDayWidget extends StatelessWidget {
  const HowWasYourDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'How was your day?',
            style: TextStyles.s16W700CBlack,
          ),
          const SpaceH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final mood in Mood.values)
                if (mood == Mood.none)
                  const SizedBox()
                else
                  MoodIcon(
                    image: AssetImage(mood.toImage()),
                    mood: mood,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
