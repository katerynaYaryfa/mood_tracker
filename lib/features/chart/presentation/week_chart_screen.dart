import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/features/chart/charts_data/week_bar_data.dart';
import 'package:mood_tracker/features/chart/widgets/week_chart_widget.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class WeekChartScreen extends StatelessWidget {
  const WeekChartScreen({Key? key, required this.weeklySum}) : super(key: key);
  final List weeklySum;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    WeekBarData myBarData = WeekBarData(
      sunAmount: weeklySum[0],
      monAmount: weeklySum[1],
      tueAmount: weeklySum[2],
      wedAmount: weeklySum[3],
      thurAmount: weeklySum[4],
      friAmount: weeklySum[5],
      satAmount: weeklySum[6],
    );
    myBarData.initializeWeekBarData();

    return Scaffold(
      body: WeekChartWidget(
          myBarData: myBarData,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor),
    );
  }
}

Widget getWeekChartBottomTitles(double value, TitleMeta meta) {
  late var text;
  late var icon;

  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: s12W600CGrey2);
      icon = Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 1:
      text = const Text('Mon', style: s12W600CGrey2);
      icon = Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 2:
      text = const Text('Tue', style: s12W600CGrey2);
      icon = Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 3:
      text = const Text('Wed', style: s12W600CGrey2);
      icon = Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 4:
      text = const Text('Thu', style: s12W600CGrey2);
      icon = Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 5:
      text = const Text('Fri', style: s12W600CGrey2);
      icon = Image(
        height: 30,
        width: 30,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 6:
      text = const Text('Sat', style: s12W600CGrey2);
      icon = Image(
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
      SizedBox(
        height: 8,
      ),
      icon,
      SizedBox(
        height: 8,
      ),
      text,
    ],
  );
}
