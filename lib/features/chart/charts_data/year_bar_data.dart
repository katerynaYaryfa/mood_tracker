import 'package:mood_tracker/features/chart/indidvidual_bar.dart';

class YearBarData {
  YearBarData({
    required this.january,
    required this.february,
    required this.march,
    required this.april,
    required this.may,
    required this.june,
    required this.july,
    required this.august,
    required this.september,
    required this.october,
    required this.november,
    required this.december,
  });

  final double january;
  final double february;
  final double march;
  final double april;
  final double may;
  final double june;
  final double july;
  final double august;
  final double september;
  final double october;
  final double november;
  final double december;

  List<IndividualBar> yearBarData = [];

  void initializeYearBarData() {
    yearBarData = [
      IndividualBar(0, january),
      IndividualBar(1, february),
      IndividualBar(2, march),
      IndividualBar(3, april),
      IndividualBar(4, may),
      IndividualBar(5, june),
      IndividualBar(6, july),
      IndividualBar(7, august),
      IndividualBar(8, september),
      IndividualBar(9, october),
      IndividualBar(10, november),
      IndividualBar(11, december),
    ];
  }
}

class YearLeftBarData {
  YearLeftBarData({
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

  List<IndividualBar> yearLeftBarData = [];

  void initializeYearLeftBarData() {
    yearLeftBarData = [
      IndividualBar(0, cryingAmount),
      IndividualBar(1, veryBadAmount),
      IndividualBar(2, badAmount),
      IndividualBar(3, normalAmount),
      IndividualBar(4, goodAmount),
      IndividualBar(5, veryGoodAmount),
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

  List<IndividualBar> yearMoodBarData = [];

  void initializeMoodBarData() {
    yearMoodBarData = [
      IndividualBar(0, cryingAmount),
      IndividualBar(1, veryBadAmount),
      IndividualBar(2, badAmount),
      IndividualBar(3, normalAmount),
      IndividualBar(4, goodAmount),
      IndividualBar(5, veryGoodAmount),
    ];
  }
}
