import 'package:drift/drift.dart';
import 'package:mood_tracker/services/database/tables.dart';

abstract class NoteView extends View {
  Note get note;

  @override
  Query as() => select([note.date]).from(note);
}
