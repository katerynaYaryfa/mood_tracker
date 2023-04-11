import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/features/chart/presentation/month_chart_screen.dart';
import 'package:mood_tracker/features/chart/presentation/week_chart_screen.dart';
import 'package:mood_tracker/features/chart/presentation/year_chart_screen.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  TabBar get _tabBar => const TabBar(
        tabs: [],
      );

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    List<double> threeMonthsSum = [
      36.50,
      65.0,
      48.0,
      20.0,
      30.50,
      24.0,
      50.0,
      100.0,
      24.0,
      38.0,
      74.0,
      64.0
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
            child: TabBarWidget(primaryColor: primaryColor),
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
                yearMonthsSum: threeMonthsSum,
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

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.primaryColor,
  }) : super(key: key);

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(4),
        child: TabBar(
          // labelPadding: EdgeInsets.only(left: 10, right: 30),
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.grey2,
          indicator: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              color: primaryColor),
          tabs: const [
            Tab(
              child: Text(
                'Week',
                style: s14WNormalWithoutColor,
              ),
            ),
            Tab(
              child: Text(
                'Month',
                style: s14WNormalWithoutColor,
              ),
            ),
            Tab(
              child: Text(
                'Year',
                style: s14WNormalWithoutColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
