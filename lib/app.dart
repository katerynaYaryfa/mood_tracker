import 'package:flutter/material.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:mood_tracker/provider/note_notifier.dart';
import 'package:provider/provider.dart';

import 'custom_navigation_bar.dart';

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
