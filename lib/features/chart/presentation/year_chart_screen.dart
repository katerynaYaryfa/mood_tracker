import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/chart/year_bar_data.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class YearChartScreen extends StatelessWidget {
  const YearChartScreen(
      {Key? key, required this.yearMonthsSum, required this.moodSum})
      : super(key: key);
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

    return Scaffold(
      body: Column(
        children: [
          YearBarWidget(
            myBarData: myBarData,
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
          ),
          MoodBarWidget(
            moodBarData: moodBarData,
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}

class YearBarWidget extends StatelessWidget {
  const YearBarWidget({
    Key? key,
    required this.myBarData,
    required this.primaryColor,
    required this.scaffoldBackgroundColor,
  }) : super(key: key);

  final YearBarData myBarData;
  final Color primaryColor;
  final Color scaffoldBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 10,
            blurRadius: 15,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      height: 244,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceH16(),
          Row(
            children: const [
              SpaceW16(),
              Text(
                'Mood chart',
                style: s16W700CBlack2,
              ),
            ],
          ),
          const SpaceH24(),
          SizedBox(
            height: 165,
            child: BarChart(
              BarChartData(
                gridData: FlGridData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getBottomTitles,
                    ),
                  ),
                ),
                maxY: 100,
                minY: 0,
                barGroups: myBarData.yearBarData
                    .map(
                      (data) => BarChartGroupData(
                        x: data.x,
                        barRods: [
                          BarChartRodData(
                            toY: data.y,
                            color: primaryColor,
                            width: 12,
                            borderRadius: BorderRadius.circular(20),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: 100,
                              color: scaffoldBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoodBarWidget extends StatelessWidget {
  const MoodBarWidget({
    Key? key,
    required this.moodBarData,
    required this.primaryColor,
    required this.scaffoldBackgroundColor,
  }) : super(key: key);

  final MoodBarData moodBarData;
  final Color primaryColor;
  final Color scaffoldBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceH16(),
          Row(
            children: const [
              SpaceW16(),
              Text(
                'Mood chart',
                style: s16W700CBlack2,
              ),
            ],
          ),
          const SpaceH24(),
          SizedBox(
            height: 155,
            child: BarChart(
              BarChartData(
                gridData: FlGridData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 65,
                      getTitlesWidget: getMoodBottomTitles,
                    ),
                  ),
                ),
                maxY: 100,
                minY: 0,
                barGroups: moodBarData.moodBarData
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
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  late var text;
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
    child: text,
    axisSide: meta.axisSide,
  );
}

Widget getMoodBottomTitles(double value, TitleMeta meta) {
  late var text;
  late var icon;

  switch (value.toInt()) {
    case 0:
      text = const Text('0%', style: s12W600CGrey2);
      icon = Image(
        height: 34,
        width: 34,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 1:
      text = const Text('10%', style: s12W600CGrey2);
      icon = Image(
        height: 34,
        width: 34,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 2:
      text = const Text('10%', style: s12W600CGrey2);
      icon = Image(
        height: 34,
        width: 34,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 3:
      text = const Text('0%', style: s12W600CGrey2);
      icon = Image(
        height: 34,
        width: 34,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 4:
      text = const Text('30%', style: s12W600CGrey2);
      icon = Image(
        height: 34,
        width: 34,
        image: AssetImage(
          'images/face1.png',
        ),
      );
      break;
    case 5:
      text = const Text('30%', style: s12W600CGrey2);
      icon = Image(
        height: 34,
        width: 34,
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
