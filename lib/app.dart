import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:mood_tracker/settings_screen/provider/settings_notifier.dart';
import 'package:mood_tracker/settings_screen/settings_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PinNotifier>(create: (_) => PinNotifier()),
        ChangeNotifierProvider<SettingsNotifier>(
            create: (_) => SettingsNotifier())
      ],
      child: MaterialApp(
        // theme: ThemeData(fontFamily: 'Quicksand'),
        home: SettingsScreen(),
      ),
    );
  }
}
