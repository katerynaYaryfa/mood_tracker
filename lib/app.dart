import 'package:flutter/material.dart';
import 'package:mood_tracker/common/repositories/notes_repository.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/features/chart/providers/month_provider.dart';
import 'package:mood_tracker/features/chart/providers/week_provider.dart';
import 'package:mood_tracker/features/pin/providers/pin_listener_provider.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/features/splash/presentation/screens/splash_screen.dart';
import 'package:mood_tracker/features/splash/providers/splash_provider.dart';
import 'package:mood_tracker/services/database/data_base_service.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // TODO(KY): move it to ServiceLocator/RiverpodProvider when refactoring to Bloc/Riverpod
  final dataBaseService = DataBaseService();
  final storageService = StorageService();
  final secureStorageService = SecureStorageService();
  late final noteRepository = NoteRepository(dataBaseService);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<INoteRepository>.value(
          value: noteRepository,
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<SplashProvider>(
          create: (_) => SplashProvider(secureStorageService),
        ),
        ChangeNotifierProvider<PinProvider>(
          create: (_) => PinProvider(secureStorageService, storageService),
        ),
        ChangeNotifierProvider<PinListenerProvider>(
          create: (_) => PinListenerProvider(
            storageService,
            secureStorageService,
          ),
        ),
        ChangeNotifierProvider<CalendarProvider>(
          create: (_) => CalendarProvider(
            NotesRepository(dataBaseService),
          ),
        ),
        ChangeNotifierProvider<WeekProvider>(
          create: (_) => WeekProvider(
            NotesRepository(dataBaseService),
          ),
        ),
        ChangeNotifierProvider<MonthProvider>(
          create: (_) => MonthProvider(
            NotesRepository(dataBaseService),
          ),
        ),
      ],
      child: const MaterialAppWrapper(),
    );
  }
}

class MaterialAppWrapper extends StatelessWidget {
  const MaterialAppWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeProvider>().currentTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
