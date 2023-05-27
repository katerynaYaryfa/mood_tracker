// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/features/chart/presentation/charts_tab_bar_screen.dart';
import 'package:mood_tracker/features/pin/presentation/widgets/pin_listener.dart';
import 'package:mood_tracker/features/settings/presentation/screens/settings_screen.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../calendar/presentation/screens/calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const CalendarScreen(),
    const Text(
      'Index 1: Server',
      style: optionStyle,
    ),
    const ChartsTabBarScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final backgroundColor = context
        .watch<ThemeProvider>()
        .currentTheme
        .floatingActionButtonTheme
        .backgroundColor;

    return PinListener(
      child: Scaffold(
        body: _widgetOptions[selectedIndex],
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: backgroundColor?.withOpacity(0.3) ?? AppColors.black,
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Builder(
            builder: (context) {
              return FloatingActionButton(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                elevation: 0.0,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewNoteScreen(
                        date: DateTime.now(),
                      ),
                    ),
                  );
                },
                child: SvgPicture.asset('images/Human.svg'),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 100,
          shape: const CircularNotchedRectangle(),
          notchMargin: 16,
          child: SizedBox(
            height: 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: SvgPicture.asset(
                    'images/calender.svg',
                    color: selectedIndex == 0 ? primaryColor : AppColors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onItemTapped(1);
                  },
                  child: SvgPicture.asset(
                    'images/server.svg',
                    color: selectedIndex == 1 ? primaryColor : AppColors.grey,
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                GestureDetector(
                  onTap: () {
                    _onItemTapped(2);
                  },
                  child: SvgPicture.asset(
                    'images/barGraph.svg',
                    color: selectedIndex == 2 ? primaryColor : AppColors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onItemTapped(3);
                  },
                  child: SvgPicture.asset(
                    'images/settings.svg',
                    color: selectedIndex == 3 ? primaryColor : AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
