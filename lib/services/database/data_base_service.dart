import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/database/database.dart';

class DataBaseService {
  final _dataBase = Database();

  void insertNote(NoteModel noteModel) async {
    await _dataBase.into(_dataBase.note).insert(
          NoteCompanion.insert(
            title: noteModel.text,
            mood: noteModel.mood,
            date: noteModel.date,
            images: noteModel.images,
          ),
        );
  }

  Future<Stream<List<NoteModel>>> selectNotes(DateTime date) async {
    final list = (_dataBase.select(_dataBase.note)).watch();

    return list.map(
      (event) => event
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
