import 'package:mood_tracker/services/data_base_wrapper.dart';

abstract class INotesRepository {
  Future<Stream<List<NoteData>>> readNotes(DateTime date);
}

class NotesRepository extends INotesRepository {
  NotesRepository({
    required this.dataBaseWrapper,
  });

  final DataBaseWrapper dataBaseWrapper;

  @override
  Future<Stream<List<NoteData>>> readNotes(DateTime date) {
    return dataBaseWrapper.selectData(date);
  }
}
