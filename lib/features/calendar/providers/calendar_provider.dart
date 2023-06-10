import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';

class CalendarProvider extends ChangeNotifier {
  CalendarProvider(this._repository) {
    _prepareDatesForSelection();
    selectDate();
    _readNotes(
      date: DateTime.now(),
    );
  }

  static const Duration _maxSelectedDate = Duration(days: 700);

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
  int _monthIndex = 0;
  int _yearIndex = 0;

  DateTime get todayDate => DateTime.now();
  DateTime get lastDay => DateTime.now().add(_maxSelectedDate);
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

  void submitSelectedDate() {
    selectedDate = DateFormat.yMMMM().parse('$selectedMonth $selectedYear');

    _readNotes(
      date: selectedDate ?? todayDate,
    );

    notifyListeners();
  }

  void selectDate() {
    selectedMonth = months[_monthIndex];
    selectedYear = years[_yearIndex];

    chosenMonth = _monthIndex;
    chosenYear = _yearIndex;

    notifyListeners();
  }

  Future<void> _readNotes({
    required DateTime date,
  }) async {
    final notesStream = await _repository.readNotes(
      date: date,
      notesDateFilter: NotesDateFilter.month,
    );

    notesStream.listen((event) {
      notes = event;
      notifyListeners();
    });
  }

  void _prepareDatesForSelection() {
    final dateFormat = DateFormat('yyyy');
    final stringYear = dateFormat.format(todayDate);
    var firstYear = 2000;

    for (final intYear = int.parse(stringYear);
        intYear + 2 > firstYear;
        firstYear++) {
      years.add(firstYear.toString());
    }

    for (var i = 0; i < years.length; i++) {
      if (years[i] == formattedTodayYear) {
        _yearIndex = i;
      }
    }

    for (var i = 0; i < months.length; i++) {
      if (months[i] == formattedTodayMonth) {
        _monthIndex = i;
      }
    }
  }
}
