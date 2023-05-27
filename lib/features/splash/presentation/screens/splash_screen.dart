import 'package:flutter/material.dart';
import 'package:mood_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/features/splash/providers/splash_screen_provider.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  late final LoadingPageProvider notifier;

  @override
  void initState() {
    super.initState();
    notifier = Provider.of<LoadingPageProvider>(context, listen: false)
      ..addListener(_onVariableChanged);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    notifier.removeListener(_onVariableChanged);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    notifier.checkPasswordRequired();
    if (state == AppLifecycleState.resumed &&
        notifier.isPasswordRequired == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (_, __, ___) => const PinScreen(
              backButton: false,
            ),
          ),
        );
        notifier.setIsPasswordRequiredFalse();
        // notifier.isPasswordRequired = false;
      });
    }
  }

  void _onVariableChanged() {
    switch (notifier.state) {
      case LoadingState.loading:
        break;
      case LoadingState.pin:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (notifier.isPasswordRequired) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 200),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                pageBuilder: (_, __, ___) => const PinScreen(
                  backButton: false,
                ),
              ),
            );
          }
        });
        break;
      case LoadingState.home:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomNavigationBar(),
            ),
          );
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
