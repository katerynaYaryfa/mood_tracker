import 'package:flutter/material.dart';
import 'package:mood_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/features/splash/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashProvider notifier;

  @override
  void initState() {
    super.initState();

    notifier = Provider.of<SplashProvider>(context, listen: false)
      ..addListener(_listenProvider)
      ..checkShouldShowPin();
  }

  @override
  void dispose() {
    notifier.removeListener(_listenProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  void _listenProvider() {
    switch (notifier.state) {
      case SplashState.loading:
        break;
      case SplashState.pin:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const PinScreen(),
          ),
        );
        break;
      case SplashState.home:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        break;
    }
  }
}
