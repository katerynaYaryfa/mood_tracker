import 'package:mood_tracker/features/chart/models/indidvidual_bar.dart';

class WeekBarData {
  WeekBarData({
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount,
  });

  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  List<IndividualBar> weekBarData = [];

  void initializeWeekBarData() {
    weekBarData = [
      IndividualBar(0, monAmount),
      IndividualBar(1, tueAmount),
      IndividualBar(2, wedAmount),
      IndividualBar(3, thurAmount),
      IndividualBar(4, friAmount),
      IndividualBar(5, satAmount),
      IndividualBar(6, sunAmount),
    ];
  }
}

class MoodBarData {
  MoodBarData({
    required this.cryingAmount,
    required this.veryBadAmount,
    required this.badAmount,
    required this.normalAmount,
    required this.goodAmount,
    required this.veryGoodAmount,
  });

  final double cryingAmount;
  final double veryBadAmount;
  final double badAmount;
  final double normalAmount;
  final double goodAmount;
  final double veryGoodAmount;

  List<IndividualBar> weekMoodBarData = [];

  void initializeMoodBarData() {
    weekMoodBarData = [
      IndividualBar(0, cryingAmount),
      IndividualBar(1, veryBadAmount),
      IndividualBar(2, badAmount),
      IndividualBar(3, normalAmount),
      IndividualBar(4, goodAmount),
      IndividualBar(5, veryGoodAmount),
    ];
  }
}
