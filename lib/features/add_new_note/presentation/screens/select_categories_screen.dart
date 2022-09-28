import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SelectCategoriesScreen extends StatefulWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.grey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Select categories',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        backgroundColor:
            context.watch<ThemeProvider>().currentTheme.backgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
    );
  }
}
