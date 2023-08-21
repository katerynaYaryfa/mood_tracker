import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/notes_feed/presentation/possible_note_text.dart';

class NotesFeedProvider extends ChangeNotifier {
  NotesFeedProvider(this._repository) {
    _prepareDatesForSelection();
    _readNotes(date: _getMonthDate());
    selectDate();
  }

  final List<int> currentMonthList = [];
  List<NoteModel> notesList = [];
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
  String get formattedTodayDate => DateFormat.yMMMM().format(todayDate);
  String get formattedTodayYear => DateFormat.y().format(todayDate);
  String get formattedTodayMonth => DateFormat.MMMM().format(todayDate);
  String get formattedSelectedDate =>
      DateFormat.yMMMM().format(selectedDate ?? todayDate);

  String getMoodText(String mood) {
    if (moodTexts.containsKey(mood)) {
      final moodList = moodTexts[mood]!;
      final index = Random().nextInt(moodList.length);
      return 'Possible note: ${moodList[index]}';
    } else {
      return '';
    }
  }

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

    notesStream.listen((notes) {
      notesList = notes.map((note) => note).toList();
      _mapNotes(notes: notes);
      notifyListeners();
    });
  }

  void _mapNotes({
    required List<NoteModel> notes,
  }) {
    final moods = <int, Mood>{};

    for (final note in notes) {
      moods[note.date.day] = note.mood;
    }
  }

  DateTime _getMonthDate() {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month + 1, 0);
    _calculateDaysOfCurrentMonth();

    return currentMonth;
  }

  void _calculateDaysOfCurrentMonth() {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    for (var i = 1; i <= daysInMonth; i++) {
      currentMonthList.add(i);
    }
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
