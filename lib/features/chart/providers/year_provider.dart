import 'package:flutter/material.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/helpers/convert_to_average_mood_ration.dart';

class YearProvider extends ChangeNotifier {
  YearProvider(this._repository) {
    _readNotesFor(_currentYear());
    _readNotesFor(
      _previousYear(),
      isPrevious: true,
    );
  }

  static const double _chartsMoodDataMultiplier = 16.6;
  int moodDifferencePercent = 0;
  Map<Mood, int> moodPercents = {
    Mood.crying: 0,
    Mood.veryBad: 0,
    Mood.bad: 0,
    Mood.normal: 0,
    Mood.good: 0,
    Mood.veryGood: 0,
  };

  final INotesRepository _repository;
  final List<double> _chartMoodData = [];
  final List<double> _previousChartMoodData = [];

  List<int> get formattedChartMoodData => _chartMoodData
      .map((e) => (e * _chartsMoodDataMultiplier).round())
      .toList();
  double get currentYearAverageMood => _chartMoodData.isEmpty
      ? 0
      : _chartMoodData.fold(0.0, (a, b) => a + b) / _chartMoodData.length;
  double get previousYearAverageMood => _previousChartMoodData.isEmpty
      ? 0
      : _previousChartMoodData.fold(0.0, (a, b) => a + b) /
          _previousChartMoodData.length;

  double get negativeRatio => moodDifferencePercent.isNegative
      ? convertToAverageMoodRatio(moodDifferencePercent.abs())
      : 0.0;

  double get positiveRatio => moodDifferencePercent.isNegative
      ? 0.0
      : convertToAverageMoodRatio(moodDifferencePercent);

  Future<void> _readNotesFor(DateTime year, {bool isPrevious = false}) async {
    final notesStream = await _repository.readNotes(
      date: year,
      notesDateFilter: NotesDateFilter.year,
    );

    notesStream.listen((notes) {
      isPrevious ? _previousChartMoodData.clear() : _chartMoodData.clear();

      final veryGoodAmount =
          notes.where((note) => note.mood == Mood.veryGood).length;
      final goodAmount = notes.where((note) => note.mood == Mood.good).length;
      final normalAmount =
          notes.where((note) => note.mood == Mood.normal).length;
      final badAmount = notes.where((note) => note.mood == Mood.bad).length;
      final veryBadAmount =
          notes.where((note) => note.mood == Mood.veryBad).length;
      final cryingAmount =
          notes.where((note) => note.mood == Mood.crying).length;

      final nonDefaultAmount =
          notes.where((notes) => notes.mood != Mood.none).length;

      if (!isPrevious) {
        moodPercents[Mood.crying] =
            _getMoodPercent(cryingAmount, nonDefaultAmount);
        moodPercents[Mood.veryBad] =
            _getMoodPercent(veryBadAmount, nonDefaultAmount);
        moodPercents[Mood.bad] = _getMoodPercent(badAmount, nonDefaultAmount);
        moodPercents[Mood.normal] =
            _getMoodPercent(normalAmount, nonDefaultAmount);
        moodPercents[Mood.good] = _getMoodPercent(goodAmount, nonDefaultAmount);
        moodPercents[Mood.veryGood] =
            _getMoodPercent(veryGoodAmount, nonDefaultAmount);
      }

      for (var monthIndex = 1; monthIndex <= 12; monthIndex++) {
        final monthMoodValues = notes
            .where((note) => note.date.month == monthIndex)
            .map((note) => note.mood.index);
        _calculateAverageMonthMood(monthMoodValues, isPrevious: isPrevious);
      }

      _calculatePercentChange();

      notifyListeners();
    });
  }

  int _getMoodPercent(int moodAmount, int nonDefaultMoodAmount) {
    return moodAmount == 0
        ? 0
        : ((moodAmount / nonDefaultMoodAmount) * 100).round();
  }

  void _calculateAverageMonthMood(
    Iterable<int> monthMoodValues, {
    required bool isPrevious,
  }) {
    if (monthMoodValues.isEmpty) {
      isPrevious ? _previousChartMoodData.add(0) : _chartMoodData.add(0);
      return;
    }

    final average = double.parse(
      (monthMoodValues.fold(0, (a, b) => a + b) / monthMoodValues.length)
          .toStringAsFixed(1),
    );

    isPrevious
        ? _previousChartMoodData.add(average)
        : _chartMoodData.add(average);
  }

  void _calculatePercentChange() {
    if (previousYearAverageMood == 0 || currentYearAverageMood == 0) {
      return;
    }

    final shouldSwap = previousYearAverageMood < currentYearAverageMood;
    final oldValue =
        shouldSwap ? previousYearAverageMood : currentYearAverageMood;
    final newValue =
        (shouldSwap ? currentYearAverageMood : previousYearAverageMood);
    final percentChange = (((newValue - oldValue) / oldValue) * 100).round();

    moodDifferencePercent = shouldSwap ? percentChange : -percentChange;
  }

  DateTime _currentYear() {
    final now = DateTime.now();
    return DateTime(now.year);
  }

  DateTime _previousYear() {
    final now = DateTime.now();
    return DateTime(now.year - 1);
  }
}
