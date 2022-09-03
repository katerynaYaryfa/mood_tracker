import 'package:flutter/material.dart';
import 'package:mood_tracker/new_screen.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:mood_tracker/provider/settings_notifier.dart';
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
        ChangeNotifierProvider<SettingsNotifier>(
          create: (_) => SettingsNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewScreen(),
      ),
    );
  }
}
