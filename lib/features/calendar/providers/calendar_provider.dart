import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class CalendarProvider with ChangeNotifier {
  String newMonth = '';
  String newYear = '';
  String monthYearDate = '';

  int yearIndex = 0;
  List<String> yearList = [];

  void year() {
    DateFormat dateFormat = DateFormat("yyyy");
    String stringYear = dateFormat.format(DateTime.now());
    int intYear = int.parse(stringYear);
    int firstYear = 1999;

    for (intYear; intYear + 1 > firstYear; firstYear++) {
      yearList.add(firstYear.toString());
    }

    notifyListeners();
  }

  int monthIndex = 0;
  String selectedMonth = '';

  List<String> monthList = const [
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

  DateTime currentDay = DateTime.now();

  DateTime? selectedDay;
  final controller = ScreenshotController();

  void changeMonthDate(index) {
    newMonth = monthList[index];
    monthYearDate = '$newMonth $newYear';
    monthIndex = index;
  }

  void changeYearDate(index) {
    newYear = yearList[index];
    monthYearDate = '$newMonth $newYear';
    yearIndex = index;
  }

  void buttonPressed(context) {
    Navigator.pop(context);
    notifyListeners();
  }
}
