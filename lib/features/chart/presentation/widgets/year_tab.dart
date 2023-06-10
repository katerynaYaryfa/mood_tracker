import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/common/consts/mood_images.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/chart/models/year_bar_data.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/average_mood_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/mood_chart_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/year_chart_widget.dart';
import 'package:mood_tracker/features/chart/providers/week_provider.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class YearTab extends StatelessWidget {
  const YearTab({
    Key? key,
    required this.yearMonthsSum,
    required this.moodSum,
  }) : super(key: key);
  final List<double> yearMonthsSum;
  final List<double> moodSum;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    final myBarData = YearBarData(
      january: yearMonthsSum[0],
      february: yearMonthsSum[1],
      march: yearMonthsSum[2],
      april: yearMonthsSum[3],
      may: yearMonthsSum[4],
      june: yearMonthsSum[5],
      july: yearMonthsSum[6],
      august: yearMonthsSum[7],
      september: yearMonthsSum[8],
      october: yearMonthsSum[9],
      november: yearMonthsSum[10],
      december: yearMonthsSum[11],
    )..initializeYearBarData();

    final moodBarData = MoodBarData(
      cryingAmount: moodSum[0],
      veryBadAmount: moodSum[1],
      badAmount: moodSum[2],
      normalAmount: moodSum[3],
      goodAmount: moodSum[4],
      veryGoodAmount: moodSum[5],
    )..initializeMoodBarData();

    return Scaffold(
      body: ListView(
        children: [
          const SpaceH16(),
          YearChartWidget(
            myBarData: myBarData,
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
          ),
          const SpaceH16(),
          const AverageMoodWidget(
            positiveRatio: 0,
            negativeRatio: 0,
            titlePercent: 0,
          ),
          const SpaceH16(),
          const MoodChartWidget(
            barGroups: {},
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
    late Text text;
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
  });

  final double value;
  final TitleMeta meta;

  @override
  Widget build(BuildContext context) {
    final moodPercents = context.watch<WeekProvider>().moodPercents;
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
