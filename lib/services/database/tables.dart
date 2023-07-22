import 'package:drift/drift.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';

class Note extends Table {
  TextColumn get title => text()();
  TextColumn get mood => textEnum<Mood>()();
  TextColumn get images => text()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {date};
}
