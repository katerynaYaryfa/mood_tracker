class NoteModel {
  DateTime date;
  Mood mood;
  String text;
  String images;

  NoteModel({
    required this.date,
    required this.mood,
    required this.text,
    required this.images,
  });
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
