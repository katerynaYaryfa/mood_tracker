import 'package:flutter/material.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/helpers/convert_to_average_mood_ration.dart';

// TODO(KY): handle all errors
class WeekProvider extends ChangeNotifier {
  WeekProvider(this._repository) {
    _readNotes();
  }

  Map<int, Mood> moods = {
    DateTime.sunday: Mood.none,
    DateTime.monday: Mood.none,
    DateTime.tuesday: Mood.none,
    DateTime.wednesday: Mood.none,
    DateTime.thursday: Mood.none,
    DateTime.friday: Mood.none,
    DateTime.saturday: Mood.none,
  };
  Map<int, Mood> previousMods = {
    DateTime.sunday: Mood.none,
    DateTime.monday: Mood.none,
    DateTime.tuesday: Mood.none,
    DateTime.wednesday: Mood.none,
    DateTime.thursday: Mood.none,
    DateTime.friday: Mood.none,
    DateTime.saturday: Mood.none,
  };

  List<NoteModel> notes = [];
  List<NoteModel> previousPeriodNotes = [];

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
  int moodDifferencePercent = 0;

  final INotesRepository _repository;

  double get negativeRatio => moodDifferencePercent.isNegative
      ? convertToAverageMoodRatio(moodDifferencePercent.abs())
      : 0.0;

  double get positiveRatio => moodDifferencePercent.isNegative
      ? 0.0
      : convertToAverageMoodRatio(moodDifferencePercent);

  Future<void> _readNotes() async {
    final notesStream = await _repository.readNotes(
      date: _getCurrentDate(),
      notesDateFilter: NotesDateFilter.week,
    );
    final previousNotesStream = await _repository.readNotes(
      date: _getPreviousDate(),
      notesDateFilter: NotesDateFilter.week,
    );

    notesStream.listen((event) {
      notes = event;
      _mapNotesToMoods();
      notifyListeners();
    });

    previousNotesStream.listen((event) {
      previousPeriodNotes = event;
      _mapPreviousNotesToMoods();
      notifyListeners();
    });
  }

  void _mapNotesToMoods() {
    for (final note in notes) {
      moods[note.date.weekday] = note.mood;
    }

    _mapMoodsToChartMoodsData();
  }

  void _mapPreviousNotesToMoods() {
    for (final note in previousPeriodNotes) {
      previousMods[note.date.weekday] = note.mood;
    }

    _mapPreviousMoodsToChartMoodsData();
  }

  void _mapMoodsToChartMoodsData() {
    chartMoodData = moods.values.map((e) => (e.index * 16.6).round()).toList();

    _mapMoodsToMoodPercents();
  }

  void _mapPreviousMoodsToChartMoodsData() {
    previousChartMoodData =
        previousMods.values.map((e) => (e.index * 16.6).round()).toList();

    _mapPreviousMoodsToMoodPercents();
  }

  void _mapMoodsToMoodPercents() {
    final nonDefaultMoods =
        moods.values.where((element) => element != Mood.none);
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
        previousMods.values.where((element) => element != Mood.none);
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

    moodDifferencePercent = shouldSwap ? percentChange : -percentChange;
    notifyListeners();
  }

  DateTime _getCurrentDate() {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);

    return _findFirstDateOfTheWeek(
      dateTime: nowDate,
      isWeekFromSunday: true,
    );
  }

  DateTime _getPreviousDate() {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day).subtract(
      const Duration(days: 7),
    );

    return _findFirstDateOfTheWeek(
      dateTime: nowDate,
      isWeekFromSunday: true,
    );
  }

  DateTime _findFirstDateOfTheWeek({
    required DateTime dateTime,
    required bool isWeekFromSunday,
  }) {
    return dateTime.subtract(
      Duration(days: dateTime.weekday - (isWeekFromSunday ? 0 : 1)),
    );
  }
}
