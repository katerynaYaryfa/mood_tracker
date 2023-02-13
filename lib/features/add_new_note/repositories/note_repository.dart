import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/data_base_wrapper.dart';

abstract class INoteRepository {
  void saveNote(NoteModel model);
}

class NoteRepository extends INoteRepository {
  final DataBaseWrapper dataBaseWrapper;

  @override
  void saveNote(NoteModel model) {
    dataBaseWrapper.insertData(model);
  }

  NoteRepository({
    required this.dataBaseWrapper,
  });
}
