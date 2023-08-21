import 'package:drift/drift.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/database/database.dart';

class DataBaseService {
  final _dataBase = Database();

  Future<void> insertNote(NoteModel noteModel) async {
    await _dataBase.into(_dataBase.note).insert(
          NoteCompanion.insert(
            title: noteModel.text,
            mood: noteModel.mood,
            date: noteModel.date,
            images: noteModel.images,
          ),
        );
  }

  Future<void> updateNote(NoteModel noteModel) async {
    await _dataBase.update(_dataBase.note).replace(
          NoteCompanion(
            title: Value(noteModel.text),
            mood: Value(noteModel.mood),
            date: Value(noteModel.date),
            images: Value(noteModel.images),
          ),
        );
  }

  Future<Stream<List<NoteModel>>> selectNotes({
    required DateTime date,
    required NotesDateFilter notesDateFilter,
  }) async {
    final notes = _dataBase.select(_dataBase.note)
      ..where(
        (notes) {
          switch (notesDateFilter) {
            case NotesDateFilter.week:
              return notes.date.isBetweenValues(
                date,
                date.add(
                  const Duration(days: 7),
                ),
              );
            case NotesDateFilter.month:
              return notes.date.month.equals(date.month);
            case NotesDateFilter.year:
              return notes.date.year.equals(date.year);
          }
        },
      );


    return notes.watch().map(
          (note) => note
              .map(
                (e) => NoteModel(
                  date: e.date,
                  mood: e.mood,
                  text: e.title,
                  images: e.images,
                ),
              )
              .toList(),
        );
  }
}
