import 'package:flutter/material.dart';
import 'package:mood_tracker/common/extensions/iterable_extensions.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider(this._repository) {
    _readNotes(date: DateTime.now());
  }

  List<NoteModel> notesList = [];
  NoteModel? todayNote;

  final INotesRepository _repository;

  Future<void> _readNotes({
    required DateTime date,
  }) async {
    final notesStream = await _repository.readNotes(
      date: date,
      notesDateFilter: NotesDateFilter.month,
    );

    notesStream.listen((notes) {
      notesList = notes.map((note) => note).toList();
      notifyListeners();
      todayNote = notesList
          .firstWhereOrNull((note) => note.date.day == DateTime.now().day);
    });
  }
}
