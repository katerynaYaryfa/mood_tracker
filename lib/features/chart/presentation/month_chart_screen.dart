import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/chart/month_bar_data.dart';
import 'package:mood_tracker/theme/app_colors.dart';
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
          Container(
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
                // Container(
                //   height: 15,
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 6,
                //       ),
                //       Text('1', style: s12W600CGrey2),
                //       SizedBox(
                //         width: 60,
                //       ),
                //       Text('7', style: s12W600CGrey2),
                //       SizedBox(
                //         width: 67,
                //       ),
                //       Text('14', style: s12W600CGrey2),
                //       SizedBox(
                //         width: 65,
                //       ),
                //       Text('21', style: s12W600CGrey2),
                //       SizedBox(
                //         width: 64,
                //       ),
                //       Text('28', style: s12W600CGrey2),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
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
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 107,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      height: 40,
                      width: 40,
                      image: AssetImage(
                        'images/face1.png',
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      children: [
                        Text(
                          'Average mood',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'vs. previous period',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Text(
                      '+23%',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 20,
                        width: 148,
                        color: Colors.white,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: ProgressBar(
                            gradientDefault: const [
                              Alignment.topCenter,
                              Alignment.bottomCenter
                            ],
                            colorsDefault: const [
                              AppColors.blue2,
                              AppColors.blue2,
                            ],
                            gradientCompleted: const [
                              Alignment.centerLeft,
                              Alignment.centerRight
                            ],
                            colorsCompleted: const [
                              AppColors.blue,
                              AppColors.blue,
                            ],
                            height: 24.0,
                            radius: 70.0,
                            ratio: 0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 20,
                        width: 148,
                        color: Colors.white,
                        child: ProgressBar(
                          gradientDefault: const [
                            Alignment.topCenter,
                            Alignment.bottomCenter
                          ],
                          colorsDefault: const [
                            AppColors.green3,
                            AppColors.green3
                          ],
                          gradientCompleted: const [
                            Alignment.centerLeft,
                            Alignment.centerRight
                          ],
                          colorsCompleted: const [
                            AppColors.green,
                            AppColors.green
                          ],
                          height: 24.0,
                          radius: 70.0,
                          ratio: 0.23, // 40%
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(16),
          //     color: AppColors.white,
          //     boxShadow: [
          //       BoxShadow(
          //         color: AppColors.greyOpacity.withOpacity(0.03),
          //         spreadRadius: 10,
          //         blurRadius: 15,
          //         offset: const Offset(0, 0),
          //       ),
          //     ],
          //   ),
          //   margin: const EdgeInsets.all(16),
          //   height: 107,
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Image(
          //             height: 40,
          //             width: 40,
          //             image: AssetImage(
          //               'images/face6.png',
          //             ),
          //           ),
          //           SizedBox(
          //             width: 13,
          //           ),
          //           Column(
          //             children: [
          //               Text(
          //                 'Average mood',
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.w700),
          //               ),
          //               Text(
          //                 'vs. previous period',
          //                 style: TextStyle(
          //                     fontSize: 12, color: Colors.grey.shade500),
          //               ),
          //             ],
          //           ),
          //           const Spacer(),
          //           Text(
          //             '-4%',
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w600,
          //                 color: AppColors.blue),
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: 15,
          //       ),
          //       Row(
          //         children: [
          //           Expanded(
          //             child: Container(
          //               height: 20,
          //               color: Colors.white,
          //               child: RotatedBox(
          //                 quarterTurns: 2,
          //                 child: ProgressBar(
          //                   gradientDefault: const [
          //                     Alignment.topCenter,
          //                     Alignment.bottomCenter
          //                   ],
          //                   colorsDefault: const [
          //                     AppColors.blue2,
          //                     AppColors.blue2,
          //                   ],
          //                   gradientCompleted: const [
          //                     Alignment.centerLeft,
          //                     Alignment.centerRight
          //                   ],
          //                   colorsCompleted: const [
          //                     AppColors.blue,
          //                     AppColors.blue,
          //                   ],
          //                   height: 24.0,
          //                   radius: 70.0,
          //                   ratio: 0.04, // 40%
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             child: Container(
          //               height: 20,
          //               color: Colors.white,
          //               child: ProgressBar(
          //                 gradientDefault: const [
          //                   Alignment.topCenter,
          //                   Alignment.bottomCenter
          //                 ],
          //                 colorsDefault: const [
          //                   AppColors.green3,
          //                   AppColors.green3
          //                 ],
          //                 gradientCompleted: const [
          //                   Alignment.centerLeft,
          //                   Alignment.centerRight
          //                 ],
          //                 colorsCompleted: const [
          //                   AppColors.green,
          //                   AppColors.green
          //                 ],
          //                 height: 24.0,
          //                 radius: 70.0,
          //                 ratio: 0.0, // 40%
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
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

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.gradientDefault,
    required this.gradientCompleted,
    required this.colorsDefault,
    required this.colorsCompleted,
    this.height = 20.0,
    this.radius = 10.0,
    required this.ratio,
  }) : super(key: key);

  final List<AlignmentGeometry> gradientDefault;
  final List<AlignmentGeometry> gradientCompleted;
  final List<Color> colorsDefault;
  final List<Color> colorsCompleted;
  final double height;
  final double radius;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (ratio < 1.0)
            ProgressBarElement(
              borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(20),
                // bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(9),
                topRight: Radius.circular(9),
              ),
              begin: gradientDefault[0],
              end: gradientDefault[1],
              colors: colorsDefault,
            ),
          if (ratio > 0.0)
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: ratio,
              child: ProgressBarElement(
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(20),
                  // bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
                begin: gradientCompleted[0],
                end: gradientCompleted[1],
                colors: colorsCompleted,
              ),
            ),
        ],
      ),
    );
  }
}

class ProgressBarElement extends StatelessWidget {
  const ProgressBarElement({
    Key? key,
    required this.borderRadius,
    required this.begin,
    required this.end,
    required this.colors,
  }) : super(key: key);

  final BorderRadius borderRadius;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          gradient: LinearGradient(begin: begin, end: end, colors: colors),
        ),
      );
}
