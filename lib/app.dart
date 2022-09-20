import 'package:flutter/material.dart';
import 'package:mood_tracker/custom_navigation_bar.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/pin_screen/provider/pin_notifier.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PinNotifier>(
          create: (_) => PinNotifier(),
        ),
        ChangeNotifierProvider<NoteNotifier>(
          create: (_) => NoteNotifier(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CustomNavigationBar(),
      ),
    );
  }
}
