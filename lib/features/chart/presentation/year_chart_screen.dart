import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/charts_data/year_bar_data.dart';
import 'package:mood_tracker/features/chart/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/widgets/mood_chart_widget.dart';
import 'package:mood_tracker/features/chart/widgets/year_chart_widget.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class YearChartScreen extends StatelessWidget {
  const YearChartScreen({
    Key? key,
    required this.yearMonthsSum,
    required this.moodSum,
  }) : super(key: key);
  final List yearMonthsSum;
  final List moodSum;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    YearBarData myBarData = YearBarData(
      january: yearMonthsSum[0],
      february: yearMonthsSum[1],
      march: yearMonthsSum[2],
      april: yearMonthsSum[3],
      may: yearMonthsSum[4],
      june: yearMonthsSum[5],
      july: yearMonthsSum[6],
      august: yearMonthsSum[7],
      september: yearMonthsSum[8],
      october: yearMonthsSum[9],
      november: yearMonthsSum[10],
      december: yearMonthsSum[11],
    );
    myBarData.initializeYearBarData();

    MoodBarData moodBarData = MoodBarData(
      cryingAmount: moodSum[0],
      veryBadAmount: moodSum[1],
      badAmount: moodSum[2],
      normalAmount: moodSum[3],
      goodAmount: moodSum[4],
      veryGoodAmount: moodSum[5],
    );
    moodBarData.initializeMoodBarData();

    List<BarChartGroupData> yearGroupData() {
      return moodBarData.yearMoodBarData
          .map(
            (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: primaryColor,
                  width: 20,
                  borderRadius: BorderRadius.circular(8),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 100,
                    color: scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
          )
          .toList();
    }

    List<BarChartGroupData> yearMoodGroupData = yearGroupData();

    return Scaffold(
      body: ListView(
        children: [
          const SpaceH16(),
          YearChartWidget(
            myBarData: myBarData,
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
          ),
          const SpaceH16(),
          const AverageMoodWidget(),
          const SpaceH16(),
          MoodChartWidget(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            groupData: yearMoodGroupData,
          ),
          const SpaceH16(),
        ],
      ),
    );
  }
}

Widget getYearChartBottomTitles(double value, TitleMeta meta) {
  late Text text;
  switch (value.toInt()) {
    case 0:
      text = const Text('J', style: s12W600CGrey2);
      break;
    case 1:
      text = const Text('F', style: s12W600CGrey2);
      break;
    case 2:
      text = const Text('M', style: s12W600CGrey2);
      break;
    case 3:
      text = const Text('A', style: s12W600CGrey2);
      break;
    case 4:
      text = const Text('M', style: s12W600CGrey2);
      break;
    case 5:
      text = const Text('J', style: s12W600CGrey2);
      break;
    case 6:
      text = const Text('J', style: s12W600CGrey2);
      break;
    case 7:
      text = const Text('A', style: s12W600CGrey2);
      break;
    case 8:
      text = const Text('S', style: s12W600CGrey2);
      break;
    case 9:
      text = const Text('O', style: s12W600CGrey2);
      break;
    case 10:
      text = const Text('N', style: s12W600CGrey2);
      break;
    case 11:
      text = const Text('D', style: s12W600CGrey2);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget getMoodBottomTitles(double value, TitleMeta meta) {
  late Text text;
  late Image icon;

  switch (value.toInt()) {
    case 0:
      text = const Text('0%', style: s12W600CGrey2);
      icon = const Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 1:
      text = const Text('10%', style: s12W600CGrey2);
      icon = const Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 2:
      text = const Text('10%', style: s12W600CGrey2);
      icon = const Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 3:
      text = const Text('0%', style: s12W600CGrey2);
      icon = const Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 4:
      text = const Text('30%', style: s12W600CGrey2);
      icon = const Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 5:
      text = const Text('30%', style: s12W600CGrey2);
      icon = const Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
  }
  return Column(
    children: [
      const SizedBox(
        height: 8,
      ),
      icon,
      const SizedBox(
        height: 8,
      ),
      text,
    ],
  );
}
