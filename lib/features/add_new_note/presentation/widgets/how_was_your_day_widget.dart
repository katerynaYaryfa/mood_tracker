import 'package:flutter/material.dart';
import 'package:mood_tracker/app_text_styles.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/mood_icon_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:provider/provider.dart';

class HowWasYourDayWidget extends StatefulWidget {
  const HowWasYourDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HowWasYourDayWidget> createState() => _HowWasYourDayWidgetState();
}

class _HowWasYourDayWidgetState extends State<HowWasYourDayWidget> {
  @override
  Widget build(BuildContext context) {
    final mood = context.watch<NoteProvider>().mood;

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
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text('How was your day?', style: s16WBoldCBlack),
          const SpaceH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MoodIcon(
                image: const AssetImage(
                  'images/face6.png',
                ),
                opacity: mood == Mood.crying || mood == Mood.none ? 1.0 : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.crying);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  'images/face5.png',
                ),
                opacity: mood == Mood.veryBad || mood == Mood.none ? 1.0 : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.veryBad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  'images/face1.png',
                ),
                opacity: mood == Mood.bad || mood == Mood.none ? 1.0 : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.bad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  'images/face4.png',
                ),
                opacity: mood == Mood.normal || mood == Mood.none ? 1.0 : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.normal);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  'images/face3.png',
                ),
                opacity: mood == Mood.good || mood == Mood.none ? 1.0 : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.good);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  'images/face2.png',
                ),
                opacity: mood == Mood.veryGood || mood == Mood.none ? 1.0 : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.veryGood);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
