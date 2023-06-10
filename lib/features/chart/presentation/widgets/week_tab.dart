import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/helpers/convert_to_ratio.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/mood_chart_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/week_chart_widget.dart';
import 'package:mood_tracker/features/chart/providers/week_provider.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class WeekTab extends StatelessWidget {
  const WeekTab({super.key});

  @override
  Widget build(BuildContext context) {
    final moodDifferenceInPercent =
        context.watch<WeekProvider>().moodDifferenceInPercent;

    final negativeRatio = moodDifferenceInPercent.isNegative
        ? convertToAverageMoodRatio(moodDifferenceInPercent.abs())
        : 0.0;
    final positiveRatio = moodDifferenceInPercent.isNegative
        ? 0.0
        : convertToAverageMoodRatio(moodDifferenceInPercent);
    final moodPercents = context.watch<WeekProvider>().moodPercents;

    return Scaffold(
      body: ListView(
        children: [
          const SpaceH16(),
          const WeekChartWidget(),
          const SpaceH16(),
          AverageMoodWidget(
            positiveRatio: positiveRatio,
            negativeRatio: negativeRatio,
            titlePercent: moodDifferenceInPercent,
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

class WeekChartBottomTitles extends StatelessWidget {
  const WeekChartBottomTitles({
    Key? key,
    required this.value,
    required this.meta,
  }) : super(key: key);

  final double value;
  final TitleMeta meta;

  @override
  Widget build(BuildContext context) {
    late Text text;
    late Image icon;

    switch (value.toInt()) {
      case 0:
        text = const Text('Sun', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 1:
        text = const Text('Mon', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 2:
        text = const Text('Tue', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 3:
        text = const Text('Wed', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 4:
        text = const Text('Thu', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 5:
        text = const Text('Fri', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            'images/face1.png',
          ),
        );
        break;
      case 6:
        text = const Text('Sat', style: s12W600CGrey2);
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
        const SizedBox(
          height: 8,
        ),
        icon,
        const SizedBox(
          height: 8,
        ),
        text,
      ],
    );
  }
}
