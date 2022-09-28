import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: AppColors.red,
  scaffoldBackgroundColor: AppColors.darkWhite,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.red,
  ),
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
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
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontFamily: 'Quicksand',
    ),
  ),
);
