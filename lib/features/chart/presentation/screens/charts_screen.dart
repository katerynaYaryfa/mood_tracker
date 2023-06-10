import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/charts_tab_bar_widget.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/month_tab.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/week_tab.dart';
import 'package:mood_tracker/features/chart/presentation/widgets/year_tab.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    // TODO(KY): remove hardcoded data
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
    final yearMoodSum = <double>[5.50, 20.0, 30.50, 24.0, 50.0, 100.0, 64.0];

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Charts',
          style: s14W600CBlack2,
        ),
        leading: SizedBox(),
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
              const WeekTab(),
              const MonthTab(),
              YearTab(
                yearMonthsSum: yearSum,
                moodSum: yearMoodSum,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
