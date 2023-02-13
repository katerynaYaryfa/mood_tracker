import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';

class NoteModel {
  DateTime date;
  Mood mood;
  String text;

  NoteModel({
    required this.date,
    required this.mood,
    required this.text,
  });
}
