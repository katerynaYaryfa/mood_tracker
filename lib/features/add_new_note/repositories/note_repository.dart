import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/database/data_base_service.dart';

abstract class INoteRepository {
  void saveNote(NoteModel model);
}

class NoteRepository extends INoteRepository {
  final DataBaseService dataBaseWrapper;

  @override
  void saveNote(NoteModel model) {
    dataBaseWrapper.insertNote(model);
  }

  NoteRepository({
    required this.dataBaseWrapper,
  });
}
