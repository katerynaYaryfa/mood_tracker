import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:mood_tracker/settings_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PinNotifier>(
      create: (context) => PinNotifier(),
      child: MaterialApp(
        // theme: ThemeData(fontFamily: 'Quicksand'),
        home: SettingsScreen(),
      ),
    );
  }
}
