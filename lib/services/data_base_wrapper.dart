import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'data_base_wrapper.g.dart';

// TODO check this file
class DataBaseWrapper {
  final db = Database();

  void insertData(NoteModel noteModel) async {
    await db.into(db.note).insert(
          NoteCompanion.insert(
              title: noteModel.text,
              mood: noteModel.mood,
              date: noteModel.date,
              // TODO ,
              images: noteModel.images),
        );
  }

  Future<Stream<List<NoteData>>> selectData(DateTime date) async {
    final list = (db.select(db.note)).watch();
    return list;
  }
}

class Note extends Table {
  TextColumn get title => text()();
  TextColumn get mood => textEnum<Mood>()();
  TextColumn get images => text()();
  DateTimeColumn get date => dateTime()();
}

abstract class NoteView extends View {
  Note get note;

  @override
  Query as() => select([note.date]).from(note);
}

@DriftDatabase(tables: [Note], views: [NoteView])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });

// class widget extends StatelessWidget {}
}
