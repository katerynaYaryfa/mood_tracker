import 'package:flutter/material.dart';
import 'package:mood_tracker/custom_navigation_bar.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/features/calendar/repositories/notes_repository.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/services/data_base_wrapper.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final dataBaseWrapper = DataBaseWrapper();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PinProvider>(
          create: (_) => PinProvider(),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_) => NoteProvider(
              repository: NoteRepository(dataBaseWrapper: dataBaseWrapper)),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<CalendarProvider>(
          create: (_) => CalendarProvider(
              NotesRepository(dataBaseWrapper: dataBaseWrapper)),
        )
      ],
      child: const CustomNavigationBar(),
    );
  }
}
