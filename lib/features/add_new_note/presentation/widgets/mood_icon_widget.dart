import 'package:flutter/material.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:provider/provider.dart';

class MoodIcon extends StatelessWidget {
  const MoodIcon({
    Key? key,
    required this.image,
    required this.mood,
  }) : super(key: key);

  final Mood mood;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    final savedMood = context.watch<NoteProvider>().mood;

    return InkWell(
      onTap: () {
        context.read<NoteProvider>().changeMood(mood);
      },
      child: Opacity(
        opacity: mood == savedMood || savedMood == Mood.none ? 1.0 : 0.5,
        child: Image(
          width: 32,
          height: 34,
          image: image,
        ),
      ),
    );
  }
}
