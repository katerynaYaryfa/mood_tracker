import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/features/chart/presentation/month_chart_screen.dart';
import 'package:mood_tracker/features/chart/presentation/week_chart_screen.dart';
import 'package:mood_tracker/features/chart/presentation/year_chart_screen.dart';
import 'package:mood_tracker/features/chart/widgets/charts_tab_bar_widget.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChartsTabBarScreen extends StatelessWidget {
  const ChartsTabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    final yearSum = <double>[
      24.50,
      59,
      42,
      6,
      24.50,
      24.50,
      42,
      93,
      24.50,
      42,
      76,
      59,
    ];
    final weekSum = <double>[5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];
    final yearMoodSum = <double>[5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];
    final monthMoodSum = <double>[5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];
    final weekMoodSum = <double>[5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];

    final monthSum = <double>[
      31.50,
      65.50,
      48.50,
      14.0,
      31.50,
      31.50,
      48.50,
      100.0,
      31.50,
      48.50,
      83.0,
      65.50,
      31.50,
      65.50,
      48.50,
      14.0,
      31.50,
      31.50,
      48.50,
      100.0,
      31.50,
      48.50,
      83.0,
      65.50,
      31.50,
      65.50,
      48.50,
      14.0,
      31.50,
      31.50,
      48.50,
      100.0,
      31.50,
      48.50,
      83.0,
      65.50,
      31.50,
      65.50,
      48.50,
      14.0,
      31.50,
      31.50,
      48.50,
      100.0,
      31.50,
      48.50,
      83.0,
      65.50,
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Charts',
          style: s14W600CBlack2,
        ),
        leading: Container(),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const TabBar(
              tabs: [],
            ).preferredSize,
            child: ChartsTabBarWidget(primaryColor: primaryColor),
          ),
          body: TabBarView(
            children: [
              WeekChartScreen(
                weeklySum: weekSum,
                moodSum: weekMoodSum,
              ),
              MonthChartScreen(
                monthSummary: monthSum,
                moodSum: monthMoodSum,
              ),
              YearChartScreen(
                yearMonthsSum: yearSum,
                moodSum: yearMoodSum,
              ),
            ],
          ),
        ),
      ),
    );
    /**/
  }
}
