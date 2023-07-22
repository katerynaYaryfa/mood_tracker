import 'package:flutter/material.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/helpers/convert_to_average_mood_ration.dart';

class MonthProvider extends ChangeNotifier {
  MonthProvider(this._repository) {
    _readNotes();
  }

  static const double _chartsMoodDataMultiplier = 16.6;

  List<int> chartMoodData = [];
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

  final List<int> _currentMonthList = [];
  final List<int> _previousMonthList = [];

  late List<int> _previousChartMoodData = [];
  double _currentPeriodAverageMood = 0;
  late double _previousPeriodAverageMood = 0;

  double get negativeRatio => moodDifferencePercent.isNegative
      ? convertToAverageMoodRatio(moodDifferencePercent.abs())
      : 0.0;

  double get positiveRatio => moodDifferencePercent.isNegative
      ? 0.0
      : convertToAverageMoodRatio(moodDifferencePercent);

  List<int> get formattedChartMoodData => chartMoodData
      .map((e) => (e * _chartsMoodDataMultiplier).round())
      .toList();

  Future<void> _readNotes() async {
    final notesStream = await _repository.readNotes(
      date: _getMonthDate(),
      notesDateFilter: NotesDateFilter.month,
    );
    final previousNotesStream = await _repository.readNotes(
      date: _getMonthDate(isPrevious: true),
      notesDateFilter: NotesDateFilter.month,
    );

    notesStream.listen((notes) {
      _mapNotesToMoods(notes: notes);
      notifyListeners();
    });

    previousNotesStream.listen((previousNotes) {
      _mapNotesToMoods(notes: previousNotes, isPrevious: true);
      notifyListeners();
    });
  }

  DateTime _getMonthDate({bool isPrevious = false}) {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month + 1, 0);
    final previousMonth = DateTime(now.year, now.month, 0);
    _calculateDaysOfCurrentMonth();
    _calculateDaysOfPreviousMonth();

    return isPrevious ? previousMonth : currentMonth;
  }

  void _calculateDaysOfCurrentMonth() {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    for (var i = 1; i <= daysInMonth; i++) {
      _currentMonthList.add(i);
    }
  }

  void _calculateDaysOfPreviousMonth() {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month, 0).day;
    for (var i = 1; i <= daysInMonth; i++) {
      _previousMonthList.add(i);
    }
  }

  void _mapNotesToMoods({
    required List<NoteModel> notes,
    bool isPrevious = false,
  }) {
    final moods = <int, Mood>{};

    if (isPrevious) {
      for (var i = 0; i < _previousMonthList.length; i++) {
        moods[_previousMonthList[i]] = Mood.none;
      }

      for (final note in notes) {
        moods[note.date.day] = note.mood;
      }
    } else {
      for (var i = 0; i < _currentMonthList.length; i++) {
        moods[_currentMonthList[i]] = Mood.none;
      }
      for (final note in notes) {
        moods[note.date.day] = note.mood;
      }
    }
    _mapMoodsToChartMoodsData(moods: moods, isPrevious: isPrevious);
    _mapMoodsToMoodPercents(moods: moods, isPrevious: isPrevious);
  }

  List<int> _toChartMoodData(Map<int, Mood> moods) {
    return moods.values.map((e) => e.index).toList();
  }

  void _mapMoodsToChartMoodsData({
    required Map<int, Mood> moods,
    bool isPrevious = false,
  }) {
    if (isPrevious) {
      _previousChartMoodData = _toChartMoodData(moods);
    } else {
      chartMoodData = _toChartMoodData(moods);
    }

    _calculateAverageMood(isPrevious: isPrevious);
  }

  void _calculateAverageMood({bool isPrevious = false}) {
    final chartMoods = isPrevious ? _previousChartMoodData : chartMoodData;
    final nonDefaultChartMoods = chartMoods.where((element) => element != 0);

    if (nonDefaultChartMoods.isEmpty) {
      return;
    }

    var avgMood = 0.0;
    for (final element in nonDefaultChartMoods) {
      avgMood += element;
    }

    if (isPrevious) {
      _previousPeriodAverageMood = avgMood / nonDefaultChartMoods.length;
    } else {
      _currentPeriodAverageMood = avgMood / nonDefaultChartMoods.length;
    }

    _calculatePercentChange();
  }

  void _calculatePercentChange() {
    if (_previousPeriodAverageMood == 0 || _currentPeriodAverageMood == 0) {
      return;
    }

    final shouldSwap = _previousPeriodAverageMood < _currentPeriodAverageMood;
    final oldValue =
        shouldSwap ? _previousPeriodAverageMood : _currentPeriodAverageMood;
    final newValue =
        (shouldSwap ? _currentPeriodAverageMood : _previousPeriodAverageMood);
    final percentChange = (((newValue - oldValue) / oldValue) * 100).round();

    moodDifferencePercent = shouldSwap ? percentChange : -percentChange;
  }

  Iterable<Mood> _getMoods(Map<int, Mood> moods, Mood mood) {
    return moods.values.where((m) => m == mood);
  }

  int _getMoodPercent(int moodAmount, int nonDefaultMoodAmount) {
    return moodAmount == 0
        ? 0
        : ((moodAmount / nonDefaultMoodAmount) * 100).round();
  }

  void _mapMoodsToMoodPercents({
    required Map<int, Mood> moods,
    bool isPrevious = false,
  }) {
    final nonDefaultMoodAmount =
        moods.values.where((mood) => mood != Mood.none).length;
    final cryingMoodAmount = _getMoods(moods, Mood.crying).length;
    final veryBadMoodAmount = _getMoods(moods, Mood.veryBad).length;
    final badMoodAmount = _getMoods(moods, Mood.bad).length;
    final normalMoodAmount = _getMoods(moods, Mood.normal).length;
    final goodMoodAmount = _getMoods(moods, Mood.good).length;
    final veryGoodMoodAmount = _getMoods(moods, Mood.veryGood).length;

    if (!isPrevious) {
      moodPercents[Mood.crying] =
          _getMoodPercent(cryingMoodAmount, nonDefaultMoodAmount);
      moodPercents[Mood.veryBad] =
          _getMoodPercent(veryBadMoodAmount, nonDefaultMoodAmount);
      moodPercents[Mood.bad] =
          _getMoodPercent(badMoodAmount, nonDefaultMoodAmount);
      moodPercents[Mood.normal] =
          _getMoodPercent(normalMoodAmount, nonDefaultMoodAmount);
      moodPercents[Mood.good] =
          _getMoodPercent(goodMoodAmount, nonDefaultMoodAmount);
      moodPercents[Mood.veryGood] =
          _getMoodPercent(veryGoodMoodAmount, nonDefaultMoodAmount);
    }
  }
}
