import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/const_image.dart';
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
    final _moodComparing = widget.mood ?? mood;

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
                  ConstImage.face6Crying,
                ),
                opacity: (_moodComparing) == Mood.crying ||
                        (_moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.crying);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  ConstImage.face5VeryBad,
                ),
                opacity: (_moodComparing) == Mood.veryBad ||
                        (_moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.veryBad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  ConstImage.face4Bad,
                ),
                opacity: (_moodComparing) == Mood.bad ||
                        (_moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.bad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  ConstImage.face1Normal,
                ),
                opacity: (_moodComparing) == Mood.normal ||
                        (_moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.normal);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  ConstImage.face3Good,
                ),
                opacity: (_moodComparing) == Mood.good ||
                        (_moodComparing) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.good);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  ConstImage.face2VeryGood,
                ),
                opacity: (_moodComparing) == Mood.veryGood ||
                        (_moodComparing) == Mood.none
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
