import 'package:flutter/material.dart';
import 'package:mood_tracker/custom_navigation_bar.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/loading_page_provider.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late final LoadingPageProvider notifier;
  @override
  void initState() {
    super.initState();
    notifier = Provider.of<LoadingPageProvider>(context, listen: false)
      ..addListener(_onVariableChanged);
  }

  @override
  void dispose() {
    notifier.removeListener(_onVariableChanged);
    super.dispose();
  }

  void _onVariableChanged() {
    switch (notifier.state) {
      case LoadingState.loading:
        break;
      case LoadingState.pin:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 200),
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
        });
        break;
      case LoadingState.home:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
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
    // String rrr = readCode();
    return Scaffold();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PinScreen(
                      backButton: false,
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.grey,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomNavigationBar(),
                  ),
                );
              },
              child: Container(
                color: Colors.black12,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
