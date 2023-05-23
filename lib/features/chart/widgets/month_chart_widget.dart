import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/chart/charts_data/month_bar_data.dart';
import 'package:mood_tracker/features/chart/presentation/month_chart_screen.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class MonthChartWidget extends StatelessWidget {
  const MonthChartWidget({
    super.key,
    required this.myBarData,
    required this.primaryColor,
    required this.scaffoldBackgroundColor,
  });

  final MonthBarData myBarData;
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
      height: 244,
      child: Column(
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
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Container(
                height: 160,
                child: Column(
                  children: [
                    Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(
                        'images/face2.png',
                      ),
                    ),
                    Expanded(child: Container()),
                    Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(
                        'images/face3.png',
                      ),
                    ),
                    Expanded(child: Container()),
                    Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(
                        'images/face1.png',
                      ),
                    ),
                    Expanded(child: Container()),
                    Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(
                        'images/face4.png',
                      ),
                    ),
                    Expanded(child: Container()),
                    Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(
                        'images/face5.png',
                      ),
                    ),
                    Expanded(child: Container()),
                    Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(
                        'images/face6.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 8,
              // ),
              SizedBox(
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
                          getTitlesWidget: getMonthChartBottomTitles,
                        ),
                      ),
                    ),
                    maxY: 100,
                    minY: 0,
                    barGroups: myBarData.monthBarData
                        .map(
                          (data) => BarChartGroupData(
                            x: data.x,
                            barRods: [
                              BarChartRodData(
                                toY: data.y,
                                color: primaryColor,
                                width: 6,
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
