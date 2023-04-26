import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/features/calendar/repositories/notes_repository.dart';
import 'package:mood_tracker/services/data_base_wrapper.dart';

class CalendarProvider extends ChangeNotifier {
  final INotesRepository _repository;
  DateTime get todayDate => DateTime.now();
  DateTime get firstDay => DateTime.utc(2000, 01, 01);
  String get formattedTodayDate => DateFormat.yMMMM().format(todayDate);
  String get formattedANNSDate => DateFormat.MMMMEEEEd().format(todayDate);
  String get formattedTodayYear => DateFormat.y().format(todayDate);
  String get formattedTodayMonth => DateFormat.MMMM().format(todayDate);
  String get formattedSelectedDate =>
      DateFormat.yMMMM().format(selectedDate ?? todayDate);

  String selectedMonth = '';
  String selectedYear = '';
  DateTime? selectedDate;
  int chosenMonth = 0;
  int chosenYear = 0;

  Stream<List<NoteData>> notes = Stream.value([]);
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
    'December'
  ];

  CalendarProvider(this._repository) {
    _init();
    _readNote(todayDate);
  }

  void _readNote(DateTime date) async {
    notes = await _repository.readNotes(date);
    notifyListeners();
  }

  void changeMonthDate(index) {
    selectedMonth = months[index];
  }

  void changeYearDate(index) {
    selectedYear = years[index];
  }

  void pickDate() {
    selectedDate = DateFormat.yMMMM().parse('$selectedMonth $selectedYear');
    _readNote(selectedDate ?? todayDate);

    notifyListeners();
  }

  // TODO method named init but has a lot of tricky logic.
  // TODO maybe try to refactor to separate small methods. Or give it more understandable name
  void _init() {
    DateFormat dateFormat = DateFormat("yyyy");
    String stringYear = dateFormat.format(todayDate);
    int intYear = int.parse(stringYear);
    int firstYear = 2000;
    int indexY = 0;
    int indexM = 0;

    for (intYear; intYear + 2 > firstYear; firstYear++) {
      years.add(firstYear.toString());
    }

    for (int i = 0; i < years.length; i++) {
      if (years[i] == formattedTodayYear) {
        indexY = i;
      }
    }

    for (int i = 0; i < months.length; i++) {
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
