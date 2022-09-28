import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/features/settings_screen/presentation/screens/settings_screen.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DataSecurityScreen extends StatefulWidget {
  const DataSecurityScreen({Key? key}) : super(key: key);

  @override
  State<DataSecurityScreen> createState() => _DataSecurityScreenState();
}

class _DataSecurityScreenState extends State<DataSecurityScreen> {
  bool pinCodeEnabled = false;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        final storage = StorageService();
        final pin = await storage.read(
          key: 'pin',
        );

        if (pin != null) {
          setState(
            () {
              pinCodeEnabled = true;
            },
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFFD1D4DE),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Data Security',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor:
            context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SettingsButtons(
              child: DataSecurityButtons(
                title: 'PIN-code',
                color: Colors.white,
                value: pinCodeEnabled,
                onChanged: (bool value) async {
                  if (pinCodeEnabled) {
                    final storage = StorageService();
                    await storage.delete(
                      key: 'pin',
                    );
                    setState(
                      () {
                        pinCodeEnabled = false;
                      },
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PinScreen(
                            deletePin: true,
                          );
                        },
                      ),
                    );
                  }
                },
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/pinCode.svg',
                    height: 24,
                    width: 24,
                    color: const Color(0xFFD1D4DE),
                  ),
                ),
              ),
            ),
            const SpaceH16(),
            SettingsButtons(
              child: DataSecurityButtons(
                title: 'Toch-ID',
                color: Colors.white,
                value: false,
                onChanged: (bool value) async {},
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/touchID.svg',
                    color: const Color(0xFFD1D4DE),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            const SpaceH16(),
            SettingsButtons(
              child: DataSecurityButtons(
                title: 'Face-ID',
                color: Colors.white,
                value: false,
                onChanged: (bool value) async {
                  if (pinCodeEnabled) {
                    final storage = StorageService();
                    await storage.delete(
                      key: 'pin',
                    );
                    setState(() {
                      pinCodeEnabled = false;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PinScreen(
                            deletePin: true,
                          );
                        },
                      ),
                    );
                  }
                },
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/faceID.svg',
                    color: const Color(0xFFD1D4DE),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class DataSecurityButtons extends StatefulWidget {
  const DataSecurityButtons(
      {required this.title,
      required this.color,
      required this.value,
      required this.onChanged,
      required this.child,
      Key? key})
      : super(key: key);

  final void Function(bool) onChanged;
  final bool value;
  final Color color;
  final String title;
  final Widget child;

  @override
  State<DataSecurityButtons> createState() => _DataSecurityButtonsState();
}

class _DataSecurityButtonsState extends State<DataSecurityButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF738C93).withOpacity(0.03),
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(
                  0,
                  0,
                ),
              ),
            ],
          ),
          child: widget.child,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(widget.title),
        Expanded(
          child: Container(),
        ),
        CupertinoSwitch(
          value: widget.value,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
