import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/services/database/data_base_service.dart';

abstract class INotesRepository {
  Future<Stream<List<NoteModel>>> readNotes({
    required DateTime date,
    required NotesDateFilter notesDateFilter,
  });
}

class NotesRepository extends INotesRepository {
  NotesRepository(
    this._dataBaseService,
  );

  final DataBaseService _dataBaseService;

  @override
  Future<Stream<List<NoteModel>>> readNotes({
    required DateTime date,
    required NotesDateFilter notesDateFilter,
  }) async {
    return _dataBaseService.selectNotes(
      date: date,
      notesDateFilter: notesDateFilter,
    );
  }
}
