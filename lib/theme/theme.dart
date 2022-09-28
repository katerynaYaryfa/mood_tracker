import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: const Color(0xFFFF7562),
  scaffoldBackgroundColor: const Color(0xFFF6FAFB),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF7562),
  ),
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    headline6: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: 'Quicksand',
    ),
  ),
);

ThemeData greenTheme = ThemeData(
  primaryColor: const Color(0xFF7FD6AB),
  scaffoldBackgroundColor: const Color(0xFFFFF3E0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF7FD6AB),
  ),
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    headline6: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: 'Quicksand',
    ),
  ),
);
