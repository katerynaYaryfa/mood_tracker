import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/models/year_bar_data.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/year_tab.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class YearChartWidget extends StatelessWidget {
  const YearChartWidget({
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
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 244,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceH16(),
          const Row(
            children: [
              SpaceW16(),
              Text(
                'Mood chart',
                style: s16W700CBlack2,
              ),
            ],
          ),
          const SpaceH24(),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 165,
                    child: Column(
                      children: [
                        const Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(
                            'images/face2.png',
                          ),
                        ),
                        Expanded(child: Container()),
                        const Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(
                            'images/face3.png',
                          ),
                        ),
                        Expanded(child: Container()),
                        const Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(
                            'images/face1.png',
                          ),
                        ),
                        Expanded(child: Container()),
                        const Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(
                            'images/face4.png',
                          ),
                        ),
                        Expanded(child: Container()),
                        const Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(
                            'images/face5.png',
                          ),
                        ),
                        Expanded(child: Container()),
                        const Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(
                            'images/face6.png',
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 165,
                width: 300,
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
                          getTitlesWidget: (value, meta) =>
                              YearChartBottomTitles(
                            value: value,
                            meta: meta,
                          ),
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
        ],
      ),
    );
  }
}
