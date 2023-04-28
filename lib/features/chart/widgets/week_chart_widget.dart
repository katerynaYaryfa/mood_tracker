import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/chart/charts_data/week_bar_data.dart';
import 'package:mood_tracker/features/chart/presentation/week_chart_screen.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class WeekChartWidget extends StatelessWidget {
  const WeekChartWidget({
    super.key,
    required this.myBarData,
    required this.primaryColor,
    required this.scaffoldBackgroundColor,
  });

  final WeekBarData myBarData;
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
      margin: const EdgeInsets.all(16),
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
                      getTitlesWidget: getWeekChartBottomTitles,
                    ),
                  ),
                ),
                maxY: 100,
                minY: 0,
                barGroups: myBarData.weekBarData
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
