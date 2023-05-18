import 'package:flutter/material.dart';
import 'package:mood_tracker/custom_navigation_bar.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/features/calendar/repositories/notes_repository.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/services/database/data_base_service.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:mood_tracker/loading_page.dart';
import 'package:mood_tracker/loading_page_provider.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // TODO think about better place to create class. I think app should be const
  final dataBaseWrapper = DataBaseService();
  final storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: dataBaseWrapper,
        ),
        Provider.value(
          value: storageService,
        ),
        ChangeNotifierProvider<PinProvider>(
          create: (_) => PinProvider(
            storage: storageService,
          ),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_) => NoteProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<CalendarProvider>(
          create: (_) => CalendarProvider(
            NotesRepository(
              dataBaseWrapper: dataBaseWrapper,
            ),
          ),
        ),
        ChangeNotifierProvider<LoadingPageProvider>(
          create: (_) => LoadingPageProvider(StorageService()),
        )
      ],
      child: PreLoadingPage(),
    );
  }
}
