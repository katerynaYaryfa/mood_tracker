import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ShareScreenshot extends StatelessWidget {
  const ShareScreenshot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text(
          'Share screenshot',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
