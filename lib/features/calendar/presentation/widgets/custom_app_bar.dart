import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    Key? key,
  }) : super(key: key);

  Widget? leading;
  Widget? title;
  String? titleText;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    return AppBar(
      leading: leading ??
          GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.grey,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
      leadingWidth: 70,
      title: title ?? Text(titleText ?? ''),
      actions: actions,
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: scaffoldBackgroundColor,
    );
  }
}
