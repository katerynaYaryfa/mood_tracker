import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: AppColors.red,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.red,
  ),
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontFamily: 'Quicksand',
    ),
  ),
);

ThemeData greenTheme = ThemeData(
  primaryColor: AppColors.brightGreen,
  scaffoldBackgroundColor: AppColors.lightOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.brightGreen,
  ),
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      height: 17.5 / 14,
      color: AppColors.black,
      fontFamily: 'Quicksand',
    ),
  ),
);
