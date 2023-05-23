import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/features/chart/charts_data/month_bar_data.dart';
import 'package:mood_tracker/features/chart/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/widgets/month_chart_widget.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MonthChartScreen extends StatelessWidget {
  const MonthChartScreen({Key? key, required this.monthSummary})
      : super(key: key);

  final List monthSummary;

  @override
  Widget build(BuildContext context) {
    MonthBarData myBarData = MonthBarData(
        oneDay: monthSummary[0],
        twoDay: monthSummary[1],
        threeDay: monthSummary[2],
        fourDay: monthSummary[3],
        fiveDay: monthSummary[4],
        sixDay: monthSummary[5],
        sevenDay: monthSummary[6],
        eightDay: monthSummary[7],
        nineDay: monthSummary[8],
        tenDay: monthSummary[9],
        elevenDay: monthSummary[10],
        twelveDay: monthSummary[11],
        thirteenDay: monthSummary[12],
        fourteenDay: monthSummary[13],
        fifteenDay: monthSummary[14],
        sixteenDay: monthSummary[15],
        seventeenDay: monthSummary[16],
        eighteenDay: monthSummary[17],
        nineteenDay: monthSummary[18],
        twentyDay: monthSummary[19],
        twentyOneDay: monthSummary[20],
        twentyTwoDay: monthSummary[21],
        twentyThreeDay: monthSummary[22],
        twentyFourDay: monthSummary[23],
        twentyFiveDay: monthSummary[24],
        twentySixDay: monthSummary[25],
        twentySevenDay: monthSummary[26],
        twentyEightDay: monthSummary[27],
        twentyNineDay: monthSummary[28],
        thirtyDay: monthSummary[29],
        thirtyOneDay: monthSummary[30]);
    myBarData.initializeMonthBarData();

    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    return Scaffold(
      body: Column(
        children: [
          MonthChartWidget(
              myBarData: myBarData,
              primaryColor: primaryColor,
              scaffoldBackgroundColor: scaffoldBackgroundColor),
          AverageMoodWidget(),
        ],
      ),
    );
  }
}

Widget getMonthChartBottomTitles(double value, TitleMeta meta) {
  late var text;
  switch (value.toInt()) {
    case 0:
      text = const Text('1', style: s12W600CGrey2);
      break;
    case 1:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 2:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 3:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 4:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 5:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 6:
      text = const Text('7', style: s12W600CGrey2);
      break;
    case 7:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 8:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 9:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 10:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 11:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 12:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 13:
      text = const Text('14', style: s12W600CGrey2);
      break;
    case 14:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 15:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 16:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 17:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 18:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 19:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 20:
      text = const Text('21', style: s12W600CGrey2);
      break;
    case 21:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 22:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 23:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 24:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 25:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 26:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 27:
      text = const Text('28', style: s12W600CGrey2);
      break;
    case 28:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 29:
      text = const Text('', style: s12W600CGrey2);
      break;
    case 30:
      text = const Text('', style: s12W600CGrey2);
      break;
    default:
      text = const Text('', style: s12W600CGrey2);
      break;
  }
  return SideTitleWidget(
    child: text,
    axisSide: meta.axisSide,
  );
}
