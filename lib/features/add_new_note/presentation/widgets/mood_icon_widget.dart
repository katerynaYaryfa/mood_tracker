import 'package:flutter/material.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';

class MoodIcon extends StatelessWidget {
  const MoodIcon({
    Key? key,
    required this.mood,
    required this.opacity,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final Mood mood;
  final double opacity;
  final void Function() onTap;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Image(width: 32, height: 34, image: image),
      ),
    );
  }
}
