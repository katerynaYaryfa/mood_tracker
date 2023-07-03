import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/left_titles_chart_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/month_tab.dart';
import 'package:mood_tracker/features/chart/providers/month_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MonthChartWidget extends StatelessWidget {
  const MonthChartWidget({
    super.key,
  });

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
      height: 244,
      child: const Column(
        children: [
          SpaceH16(),
          Row(
            children: [
              SpaceW16(),
              Text(
                'Mood chart',
                style: s16W700CBlack2,
              ),
            ],
          ),
          SpaceH24(),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              LeftTitlesChartWidget(),
              MonthChart(),
            ],
          ),
        ],
      ),
    );
  }
}

class MonthChart extends StatelessWidget {
  const MonthChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chartMoodData = context.watch<MonthProvider>().formattedChartMoodData;
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    return SizedBox(
      height: 165,
      width: MediaQuery.of(context).size.width - 80,
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
                getTitlesWidget: (value, meta) => MonthChartBottomTitles(
                  value: value,
                  meta: meta,
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
                      width: 6,
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
