import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/mood_chart_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/week_chart_widget.dart';
import 'package:mood_tracker/features/chart/providers/week_provider.dart';
import 'package:provider/provider.dart';

class WeekTab extends StatelessWidget {
  const WeekTab({super.key});

  @override
  Widget build(BuildContext context) {
    final moodDifferencePercent =
        context.watch<WeekProvider>().moodDifferencePercent;
    final negativeRatio = context.watch<WeekProvider>().negativeRatio;
    final positiveRatio = context.watch<WeekProvider>().positiveRatio;
    final moodPercents = context.watch<WeekProvider>().moodPercents;

    return ListView(
      children: [
        const SpaceH16(),
        const WeekChartWidget(),
        const SpaceH16(),
        AverageMoodWidget(
          positiveRatio: positiveRatio,
          negativeRatio: negativeRatio,
          headerPercent: moodDifferencePercent,
        ),
        const SpaceH16(),
        MoodChartWidget(
          barGroups: moodPercents,
        ),
        const SpaceH16(),
      ],
    );
  }
}
