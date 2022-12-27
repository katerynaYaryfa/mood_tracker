import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarProvider with ChangeNotifier {
  CalendarProvider() {
    DateFormat dateFormat = DateFormat("yyyy");
    String stringYear = dateFormat.format(DateTime.now());
    int intYear = int.parse(stringYear);
    int firstYear = 2000;

    for (intYear; intYear + 1 > firstYear; firstYear++) {
      years.add(firstYear.toString());
    }

    formattedDate = DateFormat.yMMMM().format(dateNow);

    notifyListeners();
  }

  DateTime dateNow = DateTime.now();
  DateTime firstDay = DateTime.utc(2000, 01, 01);

  String formattedDate = '';
  String newMonth = '';
  String newYear = '';
  String monthYearDate = '';
  String numsMonthYearDate = '';
  String defaultMonth = 'January';
  String defaultYear = '2000';
  String numsDefaultMonth = '01';

  int yearIndex = 0;
  List<String> years = [];

  int monthIndex = 0;
  String selectedMonth = '';

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

  DateTime currentDay = DateTime.now();

  DateTime? selectedDay;

  void changeMonthDate(index) {
    newMonth = months[index];
    monthYearDate = '$newMonth $newYear';
    if (monthIndex > 9) {
      numsMonthYearDate = '$newYear-${monthIndex + 1}-01';
    } else {
      numsMonthYearDate = '$newYear-0${monthIndex + 1}-01';
    }
    monthIndex = index;
  }

  void changeYearDate(index) {
    newYear = years[index];
    monthYearDate = '$newMonth $newYear';
    if (monthIndex > 9) {
      numsMonthYearDate = '$newYear-${monthIndex + 1}-01';
    } else {
      numsMonthYearDate = '$newYear-0${monthIndex + 1}-01';
    }
    yearIndex = index;
  }

  void buttonPressed(context) {
    if (newYear.isEmpty) {
      monthYearDate = '$newMonth $defaultYear';
      if (monthIndex > 9) {
        numsMonthYearDate = '$defaultYear-${monthIndex + 1}-01';
      } else {
        numsMonthYearDate = '$defaultYear-0${monthIndex + 1}-01';
      }
    } else if (newMonth.isEmpty) {
      monthYearDate = '$defaultMonth $newYear';
      if (monthIndex > 9) {
        numsMonthYearDate = '$newYear-$numsDefaultMonth-01';
      }
    }
    Navigator.pop(context);
    notifyListeners();
  }
}
