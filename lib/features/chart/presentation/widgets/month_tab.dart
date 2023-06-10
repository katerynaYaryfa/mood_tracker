import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/helpers/convert_to_average_mood_ration.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/month_chart_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/mood_chart_widget.dart';
import 'package:mood_tracker/features/chart/providers/month_provider.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class MonthTab extends StatelessWidget {
  const MonthTab({super.key});

  @override
  Widget build(BuildContext context) {
    final moodDifferenceInPercent =
        context.watch<MonthProvider>().moodDifferenceInPercent;
    final negativeRatio = moodDifferenceInPercent.isNegative
        ? convertToAverageMoodRatio(moodDifferenceInPercent.abs())
        : 0.0;
    final positiveRatio = moodDifferenceInPercent.isNegative
        ? 0.0
        : convertToAverageMoodRatio(moodDifferenceInPercent);
    final moodPercents = context.watch<MonthProvider>().moodPercents;

    return Scaffold(
      body: ListView(
        children: [
          const SpaceH16(),
          const MonthChartWidget(),
          const SpaceH16(),
          AverageMoodWidget(
            positiveRatio: positiveRatio,
            negativeRatio: negativeRatio,
            headerPercent: moodDifferenceInPercent,
          ),
          const SpaceH16(),
          MoodChartWidget(
            barGroups: moodPercents,
          ),
          const SpaceH16(),
        ],
      ),
    );
  }
}

class MonthChartBottomTitles extends StatelessWidget {
  const MonthChartBottomTitles({
    Key? key,
    required this.value,
    required this.meta,
  }) : super(key: key);

  final double value;
  final TitleMeta meta;

  @override
  Widget build(BuildContext context) {
    late Text text;
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
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
