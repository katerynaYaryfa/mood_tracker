import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:mood_tracker/theme/themes.dart';
import 'package:provider/provider.dart';

class HeaderFaceButtonWidget extends StatelessWidget {
  const HeaderFaceButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeProvider>().currentTheme;

    return Center(
      child: Container(
        height: 40,
        width: 54,
        margin: const EdgeInsets.only(
          left: 16,
        ),
        decoration: BoxDecoration(
          color: currentTheme == mainTheme
              ? AppColors.greyWhite2
              : AppColors.orangeTheme,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Image(
            height: 24,
            width: 22,
            image: AssetImage(
              'images/face1.png',
            ),
          ),
        ),
      ),
    );
  }
}
