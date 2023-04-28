import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class ChartsTabBarWidget extends StatelessWidget {
  const ChartsTabBarWidget({
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
        padding: const EdgeInsets.all(4),
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
