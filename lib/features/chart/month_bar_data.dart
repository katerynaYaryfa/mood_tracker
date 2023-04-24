import 'package:mood_tracker/features/chart/indidvidual_bar.dart';

class MonthBarData {
  final double oneDay;
  final double twoDay;
  final double threeDay;
  final double fourDay;
  final double fiveDay;
  final double sixDay;
  final double sevenDay;
  final double eightDay;
  final double nineDay;
  final double tenDay;

  final double elevenDay;
  final double twelveDay;
  final double thirteenDay;
  final double fourteenDay;
  final double fifteenDay;
  final double sixteenDay;
  final double seventeenDay;
  final double eighteenDay;
  final double nineteenDay;
  final double twentyDay;

  final double twentyOneDay;
  final double twentyTwoDay;
  final double twentyThreeDay;
  final double twentyFourDay;
  final double twentyFiveDay;
  final double twentySixDay;
  final double twentySevenDay;
  final double twentyEightDay;
  final double twentyNineDay;
  final double thirtyDay;
  final double thirtyOneDay;

  MonthBarData({
    required this.oneDay,
    required this.twoDay,
    required this.threeDay,
    required this.fourDay,
    required this.fiveDay,
    required this.sixDay,
    required this.sevenDay,
    required this.eightDay,
    required this.nineDay,
    required this.tenDay,
    required this.elevenDay,
    required this.twelveDay,
    required this.thirteenDay,
    required this.fourteenDay,
    required this.fifteenDay,
    required this.sixteenDay,
    required this.seventeenDay,
    required this.eighteenDay,
    required this.nineteenDay,
    required this.twentyDay,
    required this.twentyOneDay,
    required this.twentyTwoDay,
    required this.twentyThreeDay,
    required this.twentyFourDay,
    required this.twentyFiveDay,
    required this.twentySixDay,
    required this.twentySevenDay,
    required this.twentyEightDay,
    required this.twentyNineDay,
    required this.thirtyDay,
    required this.thirtyOneDay,
  });

  List<IndividualBar> monthBarData = [];

  void initializeMonthBarData() {
    monthBarData = [
      IndividualBar(0, oneDay),
      IndividualBar(1, twoDay),
      IndividualBar(2, threeDay),
      IndividualBar(3, fourDay),
      IndividualBar(4, fiveDay),
      IndividualBar(5, sixDay),
      IndividualBar(6, sevenDay),
      IndividualBar(7, eightDay),
      IndividualBar(8, nineDay),
      IndividualBar(9, tenDay),
      IndividualBar(10, elevenDay),
      IndividualBar(11, twelveDay),
      IndividualBar(12, thirteenDay),
      IndividualBar(13, fourteenDay),
      IndividualBar(14, fifteenDay),
      IndividualBar(15, sixteenDay),
      IndividualBar(16, seventeenDay),
      IndividualBar(17, eighteenDay),
      IndividualBar(18, nineteenDay),
      IndividualBar(19, twentyDay),
      IndividualBar(20, twentyOneDay),
      IndividualBar(21, twentyTwoDay),
      IndividualBar(22, twentyThreeDay),
      IndividualBar(23, twentyFourDay),
      IndividualBar(24, twentyFiveDay),
      IndividualBar(25, twentySixDay),
      IndividualBar(26, twentySevenDay),
      IndividualBar(27, twentyEightDay),
      IndividualBar(28, twentyNineDay),
      IndividualBar(29, thirtyDay),
      IndividualBar(30, thirtyOneDay),
    ];
  }
}
