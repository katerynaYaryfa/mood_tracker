import 'package:mood_tracker/common/consts/mood_images.dart';

class NoteModel {
  NoteModel({
    required this.date,
    required this.mood,
    required this.text,
    required this.images,
  });

  DateTime date;
  Mood mood;
  String text;
  String images;

  @override
  String toString() {
    return 'NoteModel{date: $date, mood: $mood, text: $text, images: $images}';
  }
}

enum Mood {
  none,
  crying,
  veryBad,
  bad,
  normal,
  good,
  veryGood;

  String toImage() {
    switch (this) {
      case none:
        return '';
      case crying:
        return MoodImages.face6Crying;
      case veryBad:
        return MoodImages.face5VeryBad;
      case bad:
        return MoodImages.face4Bad;
      case normal:
        return MoodImages.face1Normal;
      case good:
        return MoodImages.face3Good;
      case veryGood:
        return MoodImages.face2VeryGood;
    }
  }
}
