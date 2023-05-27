import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/calendar/repositories/notes_repository.dart';

class CalendarProvider extends ChangeNotifier {
  CalendarProvider(this._repository) {
    _init();
    _readNote(todayDate);
  }

  List<NoteModel> notes = [];
  String selectedMonth = '';
  String selectedYear = '';
  DateTime? selectedDate;
  int chosenMonth = 0;
  int chosenYear = 0;

  List<String> years = [];
  List<String> months = const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final INotesRepository _repository;

  DateTime get todayDate => DateTime.now();
  DateTime get firstDay => DateTime.utc(2000);
  String get formattedTodayDate => DateFormat.yMMMM().format(todayDate);
  String get formattedANNSDate => DateFormat.MMMMEEEEd().format(todayDate);
  String get formattedTodayYear => DateFormat.y().format(todayDate);
  String get formattedTodayMonth => DateFormat.MMMM().format(todayDate);
  String get formattedSelectedDate =>
      DateFormat.yMMMM().format(selectedDate ?? todayDate);

  void changeMonthDate(int index) {
    selectedMonth = months[index];
  }

  void changeYearDate(int index) {
    selectedYear = years[index];
  }

  void pickDate() {
    selectedDate = DateFormat.yMMMM().parse('$selectedMonth $selectedYear');
    _readNote(selectedDate ?? todayDate);

    notifyListeners();
  }

  Future<void> _readNote(DateTime date) async {
    final notesStream = await _repository.readNotes(date);

    notesStream.listen((event) {
      notes = event;
      notifyListeners();
    });
  }

  void _init() {
    final dateFormat = DateFormat('yyyy');
    final stringYear = dateFormat.format(todayDate);
    var firstYear = 2000;
    var indexY = 0;
    var indexM = 0;

    for (final intYear = int.parse(stringYear);
        intYear + 2 > firstYear;
        firstYear++) {
      years.add(firstYear.toString());
    }

    for (var i = 0; i < years.length; i++) {
      if (years[i] == formattedTodayYear) {
        indexY = i;
      }
    }

    for (var i = 0; i < months.length; i++) {
      if (months[i] == formattedTodayMonth) {
        indexM = i;
      }
    }

    selectedMonth = months[indexM];
    selectedYear = years[indexY];

    chosenMonth = indexM;
    chosenYear = indexY;

    notifyListeners();
  }
}
