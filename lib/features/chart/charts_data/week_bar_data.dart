import 'package:mood_tracker/features/chart/indidvidual_bar.dart';

class WeekBarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  WeekBarData(
      {required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount});

  List<IndividualBar> weekBarData = [];

  void initializeWeekBarData() {
    weekBarData = [
      IndividualBar(0, sunAmount),
      IndividualBar(1, monAmount),
      IndividualBar(2, tueAmount),
      IndividualBar(3, wedAmount),
      IndividualBar(4, thurAmount),
      IndividualBar(5, friAmount),
      IndividualBar(6, satAmount),
    ];
  }
}

class MoodBarData {
  final double cryingAmount;
  final double veryBadAmount;
  final double badAmount;
  final double normalAmount;
  final double goodAmount;
  final double veryGoodAmount;

  MoodBarData({
    required this.cryingAmount,
    required this.veryBadAmount,
    required this.badAmount,
    required this.normalAmount,
    required this.goodAmount,
    required this.veryGoodAmount,
  });

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
