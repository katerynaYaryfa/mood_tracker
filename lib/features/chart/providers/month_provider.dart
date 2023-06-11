import 'package:flutter/material.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';

class MonthProvider extends ChangeNotifier {
  MonthProvider(this._repository) {
    _calculateDaysOfCurrentMonth();
    _calculateDaysOfPreviousMonth();
    _mapCurrentMonthList();
    _mapPreviousMonthList();
    _readNotes();
  }

  List<NoteModel> currentPeriodNotes = [];
  List<NoteModel> previousPeriodNotes = [];

  Map<int, Mood> currentMonthMood = {};
  Map<int, Mood> previousMonthMood = {};

  List<int> currentMonth = [];
  List<int> previousMonth = [];

  List<int> chartMoodData = [];
  List<int> previousChartMoodData = [];

  Map<Mood, int> moodPercents = {
    Mood.crying: 0,
    Mood.veryBad: 0,
    Mood.bad: 0,
    Mood.normal: 0,
    Mood.good: 0,
    Mood.veryGood: 0,
  };
  Map<Mood, int> previousMoodPercents = {
    Mood.crying: 0,
    Mood.veryBad: 0,
    Mood.bad: 0,
    Mood.normal: 0,
    Mood.good: 0,
    Mood.veryGood: 0,
  };
  double previousPeriodAverageMood = 0;
  double currentPeriodAverageMood = 0;
  int moodDifferenceInPercent = 0;

  final INotesRepository _repository;

  Future<void> _readNotes() async {
    final notesStream = await _repository.readNotes(
      notesDateFilter: NotesDateFilter.month,
      date: _getCurrentMonth(),
    );

    final previousPeriodNotesStream = await _repository.readNotes(
      notesDateFilter: NotesDateFilter.month,
      date: _getPreviousMonth(),
    );

    notesStream.listen((event) {
      currentPeriodNotes = event;
      _mapNotesToMoods();
      notifyListeners();
    });

    previousPeriodNotesStream.listen((event) {
      previousPeriodNotes = event;
      _mapPreviousNotesToMoods();
      notifyListeners();
    });
  }

  DateTime _getCurrentMonth() {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0);
  }

  DateTime _getPreviousMonth() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 0);
  }

  void _mapCurrentMonthList() {
    for (var i = 0; i < currentMonth.length; i++) {
      currentMonthMood[currentMonth[i]] = Mood.none;
    }
  }

  void _mapPreviousMonthList() {
    for (var i = 0; i < previousMonth.length; i++) {
      previousMonthMood[previousMonth[i]] = Mood.none;
    }
  }

  void _calculateDaysOfCurrentMonth() {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    for (var i = 1; i <= daysInMonth; i++) {
      currentMonth.add(i);
    }
  }

  void _calculateDaysOfPreviousMonth() {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month, 0).day;
    for (var i = 1; i <= daysInMonth; i++) {
      previousMonth.add(i);
    }
  }

  void _mapNotesToMoods() {
    for (var i = 0; i < currentPeriodNotes.length; i++) {
      currentMonthMood[currentPeriodNotes[i].date.day] =
          currentPeriodNotes[i].mood;
    }
    _mapMoodsToChartMoodsData();
  }

  void _mapPreviousNotesToMoods() {
    for (var i = 0; i < previousPeriodNotes.length; i++) {
      previousMonthMood[previousPeriodNotes[i].date.day] =
          previousPeriodNotes[i].mood;
    }
    _mapPreviousMoodsToChartMoodsData();
  }

  void _mapMoodsToChartMoodsData() {
    chartMoodData =
        currentMonthMood.values.map((e) => (e.index * 16.6).round()).toList();
    _mapMoodsToMoodPercents();
  }

  void _mapPreviousMoodsToChartMoodsData() {
    previousChartMoodData =
        previousMonthMood.values.map((e) => (e.index * 16.6).round()).toList();

    _mapPreviousMoodsToMoodPercents();
  }

  void _mapMoodsToMoodPercents() {
    final nonDefaultMoods =
        currentMonthMood.values.where((element) => element != Mood.none);
    final nonDefaultMoodsLength = nonDefaultMoods.length;
    final cryingMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.crying).length;
    final veryBadMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.veryBad).length;
    final badMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.bad).length;
    final normalMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.normal).length;
    final goodMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.good).length;
    final veryGoodMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.veryGood).length;

    moodPercents[Mood.crying] = cryingMoodAmount == 0
        ? 0
        : ((cryingMoodAmount / nonDefaultMoodsLength) * 100).round();
    moodPercents[Mood.veryBad] = veryBadMoodAmount == 0
        ? 0
        : ((veryBadMoodAmount / nonDefaultMoodsLength) * 100).round();
    moodPercents[Mood.bad] = badMoodAmount == 0
        ? 0
        : ((badMoodAmount / nonDefaultMoodsLength) * 100).round();
    moodPercents[Mood.normal] = normalMoodAmount == 0
        ? 0
        : ((normalMoodAmount / nonDefaultMoodsLength) * 100).round();
    moodPercents[Mood.good] = goodMoodAmount == 0
        ? 0
        : ((goodMoodAmount / nonDefaultMoodsLength) * 100).round();
    moodPercents[Mood.veryGood] = veryGoodMoodAmount == 0
        ? 0
        : ((veryGoodMoodAmount / nonDefaultMoodsLength) * 100).round();
    _calculateCurrentPeriodAverageMood();
  }

  void _mapPreviousMoodsToMoodPercents() {
    final nonDefaultMoods =
        previousMonthMood.values.where((element) => element != Mood.none);
    final nonDefaultMoodsLength = nonDefaultMoods.length;
    final cryingMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.crying).length;
    final veryBadMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.veryBad).length;
    final badMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.bad).length;
    final normalMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.normal).length;
    final goodMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.good).length;
    final veryGoodMoodAmount =
        nonDefaultMoods.where((element) => element == Mood.veryGood).length;

    previousMoodPercents[Mood.crying] = cryingMoodAmount == 0
        ? 0
        : ((cryingMoodAmount / nonDefaultMoodsLength) * 100).round();
    previousMoodPercents[Mood.veryBad] = veryBadMoodAmount == 0
        ? 0
        : ((veryBadMoodAmount / nonDefaultMoodsLength) * 100).round();
    previousMoodPercents[Mood.bad] = badMoodAmount == 0
        ? 0
        : ((badMoodAmount / nonDefaultMoodsLength) * 100).round();
    previousMoodPercents[Mood.normal] = normalMoodAmount == 0
        ? 0
        : ((normalMoodAmount / nonDefaultMoodsLength) * 100).round();
    previousMoodPercents[Mood.good] = goodMoodAmount == 0
        ? 0
        : ((goodMoodAmount / nonDefaultMoodsLength) * 100).round();
    previousMoodPercents[Mood.veryGood] = veryGoodMoodAmount == 0
        ? 0
        : ((veryGoodMoodAmount / nonDefaultMoodsLength) * 100).round();

    _calculatePreviousPeriodAverageMood();
  }

  void _calculateCurrentPeriodAverageMood() {
    final chartMoodData1 = chartMoodData.where((element) => element != 0);

    if (chartMoodData1.isEmpty) {
      return;
    }

    var avgMood = 0;
    for (final element in chartMoodData1) {
      avgMood += element;
    }

    currentPeriodAverageMood = avgMood / chartMoodData1.length;
  }

  void _calculatePreviousPeriodAverageMood() {
    final chartMoodData1 =
        previousChartMoodData.where((element) => element != 0);

    if (chartMoodData1.isEmpty) {
      return;
    }

    var avgMood = 0;
    for (final element in chartMoodData1) {
      avgMood += element;
    }

    previousPeriodAverageMood = avgMood / chartMoodData1.length;

    _calculatePercentChange();
  }

  void _calculatePercentChange() {
    if (previousPeriodAverageMood == 0 || currentPeriodAverageMood == 0) {
      return;
    }

    final shouldSwap = previousPeriodAverageMood < currentPeriodAverageMood;
    final oldValue =
        shouldSwap ? previousPeriodAverageMood : currentPeriodAverageMood;
    final newValue =
        shouldSwap ? currentPeriodAverageMood : previousPeriodAverageMood;
    final percentChange = (((newValue - oldValue) / oldValue) * 100).round();

    moodDifferenceInPercent = shouldSwap ? percentChange : -percentChange;
    notifyListeners();
  }
}
