import 'package:flutter/material.dart';
import 'package:mood_tracker/common/consts/mood_images.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/mood_icon_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class HowWasYourDayWidget extends StatefulWidget {
  const HowWasYourDayWidget({
    required this.mood,
    Key? key,
  }) : super(key: key);

  final Mood? mood;

  @override
  State<HowWasYourDayWidget> createState() => _HowWasYourDayWidgetState();
}

class _HowWasYourDayWidgetState extends State<HowWasYourDayWidget> {
  @override
  Widget build(BuildContext context) {
    final mood = context.watch<NoteProvider>().mood;
    final moodComparing = widget.mood ?? mood;

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
          const Text(
            'How was your day?',
            style: TextStyles.s16W700CBlack,
          ),
          const SpaceH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MoodIcon(
                image: const AssetImage(
                  MoodImages.face6Crying,
                ),
                opacity: (moodComparing) == Mood.crying ||
                        (moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.crying);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  MoodImages.face5VeryBad,
                ),
                opacity: (moodComparing) == Mood.veryBad ||
                        (moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.veryBad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  MoodImages.face4Bad,
                ),
                opacity:
                    (moodComparing) == Mood.bad || (moodComparing) == Mood.none
                        ? 1.0
                        : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.bad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  MoodImages.face1Normal,
                ),
                opacity: (moodComparing) == Mood.normal ||
                        (moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.normal);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  MoodImages.face3Good,
                ),
                opacity:
                    (moodComparing) == Mood.good || (moodComparing) == Mood.none
                        ? 1.0
                        : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.good);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  MoodImages.face2VeryGood,
                ),
                opacity: (moodComparing) == Mood.veryGood ||
                        (moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
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
