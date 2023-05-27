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
}

enum Mood {
  none,
  crying,
  veryBad,
  bad,
  normal,
  good,
  veryGood,
}
