import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/providers/week_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class WeekChartWidget extends StatelessWidget {
  const WeekChartWidget({super.key});

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
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 240,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceH16(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Mood chart',
              style: s16W700CBlack2,
            ),
          ),
          SpaceH24(),
          _WeekChart(),
        ],
      ),
    );
  }
}

class _WeekChart extends StatelessWidget {
  const _WeekChart();

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;
    final chartMoodData = context.watch<WeekProvider>().formattedChartMoodData;

    return SizedBox(
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
                reservedSize: 61,
                getTitlesWidget: (value, _) => _WeekChartBottomTitles(
                  chartBarIndex: value,
                ),
              ),
            ),
          ),
          maxY: 100,
          minY: 0,
          barGroups: chartMoodData
              .mapIndexed(
                (index, moodValue) => BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: moodValue.toDouble(),
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
    );
  }
}

class _WeekChartBottomTitles extends StatelessWidget {
  const _WeekChartBottomTitles({
    Key? key,
    required this.chartBarIndex,
  }) : super(key: key);

  final double chartBarIndex;

  @override
  Widget build(BuildContext context) {
    late Text text;
    late Image icon;

    switch (chartBarIndex.toInt()) {
      case 0:
        text = const Text('Mon', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            // TODO(KY): extract to consts
            'images/face1.png',
          ),
        );
        break;
      case 1:
        text = const Text('Tue', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 2:
        text = const Text('Wed', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 3:
        text = const Text('Thu', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 4:
        text = const Text('Fri', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 5:
        text = const Text('Sat', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 6:
        text = const Text('Sun', style: s12W600CGrey2);
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
        const SizedBox(height: 8),
        icon,
        const SizedBox(height: 8),
        text,
      ],
    );
  }
}
