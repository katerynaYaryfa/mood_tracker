import 'package:flutter/material.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/features/calendar/repositories/notes_repository.dart';
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

  // TODO think about better place to create class. I think app should be const
  final dataBaseWrapper = DataBaseService();
  final storageService = StorageService();
  final secureStorageService = SecureStorageService();

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
        Provider.value(
          value: secureStorageService,
        ),
        ChangeNotifierProvider<PinProvider>(
          create: (_) => PinProvider(secureStorageService),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_) => NoteProvider(
            repository: NoteRepository(
              dataBaseWrapper: dataBaseWrapper,
            ),
          ),
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
        ChangeNotifierProvider<SplashProvider>(
          create: (_) => SplashProvider(secureStorageService),
        ),
        ChangeNotifierProvider<PinListenerProvider>(
          create: (_) => PinListenerProvider(
            storageService,
            secureStorageService,
          ),
        )
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
