import 'package:flutter/material.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/features/pin/providers/pin_listener_provider.dart';
import 'package:provider/provider.dart';

class PinListener extends StatefulWidget {
  const PinListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<PinListener> createState() => _PinListenerState();
}

class _PinListenerState extends State<PinListener> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final shouldShowPin =
          await context.read<PinListenerProvider>().checkShouldShowPin();

      if (shouldShowPin) {
        _navigateToPin();
      }
    }

    super.didChangeAppLifecycleState(state);
  }

  void _navigateToPin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const PinScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
