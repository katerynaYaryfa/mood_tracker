import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/features/chart/presentation/month_chart_screen.dart';
import 'package:mood_tracker/features/chart/presentation/week_chart_screen.dart';
import 'package:mood_tracker/features/chart/presentation/year_chart_screen.dart';
import 'package:mood_tracker/features/chart/widgets/charts_tab_bar_widget.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChartsTabBarScreen extends StatelessWidget {
  const ChartsTabBarScreen({Key? key}) : super(key: key);

  TabBar get _tabBar => const TabBar(
        tabs: [],
      );

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    List<double> yearSum = [
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
      59
    ];
    List<double> weekSum = [5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];
    List<double> moodSum = [5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];

    List<double> monthSum = [
      4.40,
      20.0,
      30.50,
      24.0,
      38.0,
      74.0,
      60.0,
      55.0,
      27.0,
      10.0,
      11.0,
      20.0,
      30.5,
      24.0,
      50.0,
      91.0,
      64.0,
      55.0,
      27.0,
      10.0,
      4.40,
      20.0,
      30.5,
      24.0,
      50.0,
      65.0,
      64.0,
      38.0,
      62.0,
      76.0,
      82.0
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Charts',
          style: s14W600CBlack2,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ChartsTabBarWidget(primaryColor: primaryColor),
          ),
          body: TabBarView(
            children: [
              WeekChartScreen(
                weeklySum: weekSum,
              ),
              MonthChartScreen(
                monthSummary: monthSum,
              ),
              YearChartScreen(
                yearMonthsSum: yearSum,
                moodSum: moodSum,
              ),
            ],
          ),
        ),
      ),
    );
    /**/
  }
}
