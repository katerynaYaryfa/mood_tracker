import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/database/data_base_service.dart';

abstract class INoteRepository {
  void saveNote(NoteModel model);
  void updateNote(NoteModel model);
}

class NoteRepository extends INoteRepository {
  NoteRepository(
    this._dataBaseService,
  );

  final DataBaseService _dataBaseService;

  @override
  void saveNote(NoteModel model) {
    _dataBaseService.insertNote(model);
  }

  @override
  void updateNote(NoteModel model) {
    print(model.text);
    print(model.mood);
    print(model.date);
    print(model.images);

    _dataBaseService.updateNote(model);
  }
}
