import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/database/data_base_service.dart';

abstract class INotesRepository {
  Future<Stream<List<NoteModel>>> readNotes(DateTime date);
}

class NotesRepository extends INotesRepository {
  NotesRepository({
    required this.dataBaseWrapper,
  });

  final DataBaseService dataBaseWrapper;

  @override
  Future<Stream<List<NoteModel>>> readNotes(DateTime date) {
    return dataBaseWrapper.selectNotes(date);
  }
}
