import 'package:flutter/material.dart';
import 'package:mood_tracker/common/models/notes_date_filter.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/helpers/convert_to_average_mood_ration.dart';

class WeekProvider extends ChangeNotifier {
  WeekProvider(this._repository) {
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

  late final Map<Mood, int> _previousMoodPercents = {
    Mood.crying: 0,
    Mood.veryBad: 0,
    Mood.bad: 0,
    Mood.normal: 0,
    Mood.good: 0,
    Mood.veryGood: 0,
  };
  late List<int> _previousChartMoodData = chartMoodData;
  double _currentPeriodAverageMood = 0;
  late double _previousPeriodAverageMood = _currentPeriodAverageMood;

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
      date: _getWeekDate(),
      notesDateFilter: NotesDateFilter.week,
    );
    final previousNotesStream = await _repository.readNotes(
      date: _getWeekDate(isPrevious: true),
      notesDateFilter: NotesDateFilter.week,
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

  void _mapNotesToMoods({
    required List<NoteModel> notes,
    bool isPrevious = false,
  }) {
    final moods = <int, Mood>{
      DateTime.monday: Mood.none,
      DateTime.tuesday: Mood.none,
      DateTime.wednesday: Mood.none,
      DateTime.thursday: Mood.none,
      DateTime.friday: Mood.none,
      DateTime.saturday: Mood.none,
      DateTime.sunday: Mood.none,
    };

    for (final note in notes) {
      moods[note.date.weekday] = note.mood;
    }

    _mapMoodsToChartMoodsData(moods: moods, isPrevious: isPrevious);
    _mapMoodsToMoodPercents(moods: moods, isPrevious: isPrevious);
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

    if (isPrevious) {
      _previousMoodPercents[Mood.crying] =
          _getMoodPercent(cryingMoodAmount, nonDefaultMoodAmount);
      _previousMoodPercents[Mood.veryBad] =
          _getMoodPercent(veryBadMoodAmount, nonDefaultMoodAmount);
      _previousMoodPercents[Mood.bad] =
          _getMoodPercent(badMoodAmount, nonDefaultMoodAmount);
      _previousMoodPercents[Mood.normal] =
          _getMoodPercent(normalMoodAmount, nonDefaultMoodAmount);
      _previousMoodPercents[Mood.good] =
          _getMoodPercent(goodMoodAmount, nonDefaultMoodAmount);
      _previousMoodPercents[Mood.veryGood] =
          _getMoodPercent(veryGoodMoodAmount, nonDefaultMoodAmount);
    } else {
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

  List<int> _toChartMoodData(Map<int, Mood> moods) {
    return moods.values.map((e) => e.index).toList();
  }

  Iterable<Mood> _getMoods(Map<int, Mood> moods, Mood mood) {
    return moods.values.where((m) => m == mood);
  }

  int _getMoodPercent(int moodAmount, int nonDefaultMoodAmount) {
    return moodAmount == 0
        ? 0
        : ((moodAmount / nonDefaultMoodAmount) * 100).round();
  }

  DateTime _getWeekDate({bool isPrevious = false}) {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);

    return _findFirstDayOfTheWeek(
      dateTime:
          isPrevious ? nowDate.subtract(const Duration(days: 7)) : nowDate,
      startsFromSunday: false,
    );
  }

  DateTime _findFirstDayOfTheWeek({
    required DateTime dateTime,
    required bool startsFromSunday,
  }) {
    return dateTime.subtract(
      Duration(
        days: dateTime.weekday - (startsFromSunday ? 0 : 1),
      ),
    );
  }
}
