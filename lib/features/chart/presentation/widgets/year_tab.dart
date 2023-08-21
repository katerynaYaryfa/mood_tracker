import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/consts/mood_images.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/mood_chart_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/year_chart_widget.dart';
import 'package:mood_tracker/features/chart/providers/year_provider.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class YearTab extends StatelessWidget {
  const YearTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moodPercents = context.watch<YearProvider>().moodPercents;
    final moodDifferencePercent =
        context.watch<YearProvider>().moodDifferencePercent;
    final negativeRatio = context.watch<YearProvider>().negativeRatio;
    final positiveRatio = context.watch<YearProvider>().positiveRatio;

    return Scaffold(
      body: ListView(
        children: [
          const SpaceH16(),
          const YearChartWidget(),
          const SpaceH16(),
          AverageMoodWidget(
            positiveRatio: positiveRatio,
            negativeRatio: negativeRatio,
            headerPercent: moodDifferencePercent,
          ),
          const SpaceH16(),
          MoodChartWidget(
            barGroups: moodPercents,
            moodPercents: moodPercents,
          ),
          const SpaceH16(),
        ],
      ),
    );
  }
}

class YearChartBottomTitles extends StatelessWidget {
  const YearChartBottomTitles({
    Key? key,
    required this.value,
    required this.meta,
  }) : super(key: key);

  final double value;
  final TitleMeta meta;

  @override
  Widget build(BuildContext context) {
    Text text = const Text('', style: s12W600CGrey2);
    switch (value.toInt()) {
      case 0:
        text = const Text('J', style: s12W600CGrey2);
        break;
      case 1:
        text = const Text('F', style: s12W600CGrey2);
        break;
      case 2:
        text = const Text('M', style: s12W600CGrey2);
        break;
      case 3:
        text = const Text('A', style: s12W600CGrey2);
        break;
      case 4:
        text = const Text('M', style: s12W600CGrey2);
        break;
      case 5:
        text = const Text('J', style: s12W600CGrey2);
        break;
      case 6:
        text = const Text('J', style: s12W600CGrey2);
        break;
      case 7:
        text = const Text('A', style: s12W600CGrey2);
        break;
      case 8:
        text = const Text('S', style: s12W600CGrey2);
        break;
      case 9:
        text = const Text('O', style: s12W600CGrey2);
        break;
      case 10:
        text = const Text('N', style: s12W600CGrey2);
        break;
      case 11:
        text = const Text('D', style: s12W600CGrey2);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}

class MoodBottomTitles extends StatelessWidget {
  const MoodBottomTitles({
    super.key,
    required this.value,
    required this.meta,
    required this.moodPercents,
  });

  final double value;
  final TitleMeta meta;
  final Map<Mood, int> moodPercents;

  @override
  Widget build(BuildContext context) {
    late Text text;
    late Image icon;

    switch (value.toInt()) {
      case 0:
        text = Text('${moodPercents[Mood.crying]}%', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(MoodImages.face6Crying),
        );
        break;
      case 1:
        text = Text('${moodPercents[Mood.veryBad]}%', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(MoodImages.face5VeryBad),
        );
        break;
      case 2:
        text = Text('${moodPercents[Mood.bad]}%', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            MoodImages.face4Bad,
          ),
        );
        break;
      case 3:
        text = Text('${moodPercents[Mood.normal]}%', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(MoodImages.face1Normal),
        );
        break;
      case 4:
        text = Text('${moodPercents[Mood.good]}%', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(MoodImages.face3Good),
        );
        break;
      case 5:
        text = Text('${moodPercents[Mood.veryGood]}%', style: s12W600CGrey2);
        icon = const Image(
          height: 30,
          width: 30,
          image: AssetImage(
            MoodImages.face2VeryGood,
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
