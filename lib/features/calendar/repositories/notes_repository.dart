import 'package:mood_tracker/services/data_base_wrapper.dart';

// TODO check this file
abstract class INotesRepository {
  Future<Stream<List<NoteData>>> readNotes(DateTime date);
}

class NotesRepository extends INotesRepository {
  final DataBaseWrapper dataBaseWrapper;

  @override
  Future<Stream<List<NoteData>>> readNotes(DateTime date) {
    return dataBaseWrapper.selectData(date);
  }

  NotesRepository({
    required this.dataBaseWrapper,
  });
}
