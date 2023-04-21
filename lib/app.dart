import 'package:flutter/material.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/loading_page.dart';
import 'package:mood_tracker/loading_page_provider.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PinProvider>(
          create: (_) => PinProvider(),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_) => NoteProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<CalendarProvider>(
          create: (_) => CalendarProvider(),
        ),
        ChangeNotifierProvider<LoadingPageProvider>(
          create: (_) => LoadingPageProvider(),
        )
      ],
      child: PreLoadingPage(),
    );
  }
}
