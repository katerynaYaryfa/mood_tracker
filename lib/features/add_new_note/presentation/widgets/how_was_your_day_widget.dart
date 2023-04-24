import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
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
            style: s16W700CBlack,
          ),
          const SpaceH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MoodIcon(
                image: const AssetImage(
                  // TODO extract such hardcoded paths to classes, constants
                  'images/face6.png',
                ),
                // TODO "widget.mood ?? mood" can be extracted into variable so you don't need
                // TODO to write "widget.mood ?? mood" everywhere.
                // TODO also you can extract this check into private function in order to get rid of
                // TODO duplicated logic.
                // TODO Just pass Mood.crying, Mood.veryBad, etc to this function and it will
                // TODO return true or false for opacity check
                opacity: (widget.mood ?? mood) == Mood.crying || (widget.mood ?? mood) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.crying);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  // TODO extract such hardcoded paths to classes, constants
                  'images/face5.png',
                ),
                opacity: (widget.mood ?? mood) == Mood.veryBad || (widget.mood ?? mood) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.veryBad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  // TODO extract such hardcoded paths to classes, constants
                  'images/face1.png',
                ),
                opacity: (widget.mood ?? mood) == Mood.bad || (widget.mood ?? mood) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.bad);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  // TODO extract such hardcoded paths to classes, constants
                  'images/face4.png',
                ),
                opacity: (widget.mood ?? mood) == Mood.normal || (widget.mood ?? mood) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.normal);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  // TODO extract such hardcoded paths to classes, constants
                  'images/face3.png',
                ),
                opacity: (widget.mood ?? mood) == Mood.good || (widget.mood ?? mood) == Mood.none
                    ? 1.0
                    : 0.5,
                onTap: () {
                  context.read<NoteProvider>().changeMood(Mood.good);
                },
              ),
              MoodIcon(
                image: const AssetImage(
                  // TODO extract such hardcoded paths to classes, constants
                  'images/face2.png',
                ),
                opacity:
                    (widget.mood ?? mood) == Mood.veryGood || (widget.mood ?? mood) == Mood.none
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
