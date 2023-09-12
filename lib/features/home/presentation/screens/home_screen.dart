import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:mood_tracker/features/chart/presentation/screens/charts_screen.dart';
import 'package:mood_tracker/features/home/providers/home_screen_provider.dart';
import 'package:mood_tracker/features/notes_feed/presentation/screens/notes_feed_screen.dart';
import 'package:mood_tracker/features/pin/presentation/widgets/pin_listener.dart';
import 'package:mood_tracker/features/settings/presentation/screens/settings_screen.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const CalendarScreen(),
    const NotesFeedScreen(),
    const ChartsScreen(),
    const SettingsScreen(),
  ];

  final List<File> images = [];

  Future<void> _parseList(NoteModel? note) async {
    images.clear();

    final jsonPathList = jsonDecode(note?.images ?? '[]');
    final listJson = jsonPathList as List<dynamic>;
    final imageNames = listJson.cast<String>();

    final appDirectory = await getApplicationDocumentsDirectory();
    final appDirectoryFiles =
        appDirectory.listSync().map((event) => File(event.path));
    for (final imageName in imageNames) {
      for (final file in appDirectoryFiles) {
        if (file.path.contains(imageName)) {
          images.add(file);
        }
      }
    }

    setState(() {});
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final todayNote = context.watch<HomeScreenProvider>().todayNote;

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
        floatingActionButton: DecoratedBox(
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
                  _parseList(todayNote);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewNoteScreen(
                        shouldUpdate: todayNote != null,
                        date: todayNote?.date ?? DateTime.now(),
                        mood: todayNote?.mood ?? Mood.none,
                        text: todayNote?.text ?? '',
                        images: images,
                      ),
                    ),
                  );
                },
                child: todayNote != null
                    ? const Icon(Icons.edit)
                    : SvgPicture.asset('images/Human.svg'),
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
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'images/calender.svg',
                      height: 24,
                      width: 24,
                      color: selectedIndex == 0 ? primaryColor : AppColors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _onItemTapped(1);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'images/server.svg',
                      height: 24,
                      width: 24,
                      color: selectedIndex == 1 ? primaryColor : AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _onItemTapped(2);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'images/barGraph.svg',
                      height: 24,
                      width: 24,
                      color: selectedIndex == 2 ? primaryColor : AppColors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _onItemTapped(3);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'images/settings.svg',
                      height: 24,
                      width: 24,
                      color: selectedIndex == 3 ? primaryColor : AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
