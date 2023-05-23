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
