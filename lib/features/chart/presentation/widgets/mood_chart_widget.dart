import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/year_tab.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MoodChartWidget extends StatelessWidget {
  const MoodChartWidget({
    super.key,
    required this.barGroups,
    required this.moodPercents,
  });

  final Map<Mood, int> barGroups;
  final Map<Mood, int> moodPercents;

  @override
  Widget build(BuildContext context) {
    // TODO(KY): check if this container can be extracted.
    return Container(
      height: 240,
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceH16(),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Mood chart',
              style: s16W700CBlack2,
            ),
          ),
          const SpaceH24(),
          _MoodChart(
            barGroups: barGroups,
            moodPercents: moodPercents,
          ),
        ],
      ),
    );
  }
}

class _MoodChart extends StatelessWidget {
  const _MoodChart({
    required this.barGroups,
    required this.moodPercents,
  });

  final Map<Mood, int> barGroups;
  final Map<Mood, int> moodPercents;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    return SizedBox(
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
                getTitlesWidget: (value, meta) => MoodBottomTitles(
                  value: value,
                  meta: meta,
                  moodPercents: moodPercents,
                ),
              ),
            ),
          ),
          maxY: 100,
          minY: 0,
          barGroups: barGroups.values
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
