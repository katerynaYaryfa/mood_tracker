import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarProvider with ChangeNotifier {
  CalendarProvider() {
    _init();
  }

  DateTime get todayDate => DateTime.now();
  DateTime get firstDay => DateTime.utc(2000, 01, 01);
  String get formattedTodayDate => DateFormat.yMMMM().format(todayDate);
  String get formattedSelectedDate =>
      DateFormat.yMMMM().format(selectedDate ?? todayDate);

  String selectedMonth = '';
  String selectedYear = '';
  DateTime? selectedDate;

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

  changeMonthDate(index) {
    selectedMonth = months[index];
  }

  changeYearDate(index) {
    selectedYear = years[index];
  }

  void pickDate() {
    selectedDate = DateFormat.yMMMM().parse('$selectedMonth $selectedYear');

    notifyListeners();
  }

  void _init() {
    DateFormat dateFormat = DateFormat("yyyy");
    String stringYear = dateFormat.format(todayDate);
    int intYear = int.parse(stringYear);
    int firstYear = 2000;

    for (intYear; intYear + 1 > firstYear; firstYear++) {
      years.add(firstYear.toString());
    }

    selectedMonth = months[1];
    selectedYear = years[1];

    notifyListeners();
  }
}
