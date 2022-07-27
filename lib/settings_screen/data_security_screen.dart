import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/pin_screen/secure_storage.dart';
import 'package:mood_tracker/settings_screen/settings_screen.dart';

import '../pin_screen/pin_screen.dart';

class DataSecurityScreen extends StatefulWidget {
  const DataSecurityScreen({Key? key}) : super(key: key);

  @override
  State<DataSecurityScreen> createState() => _DataSecurityScreenState();
}

class _DataSecurityScreenState extends State<DataSecurityScreen> {
  bool pinCodeEnabled = false;
  bool someValue = false;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        final storage = StorageService();
        final pin = await storage.readSecureData(
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
        title: const Text(
          'Data Security',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(
          0xFFF6FAFB,
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFF6FAFB),
      body: Stack(
        children: [
          Positioned(
            bottom: 400,
            left: 24,
            child: Column(
              children: [
                SettingsButtons(
                  child: DataSecurityButtons(
                    title: 'PIN-code',
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'images/pinCode.svg',
                      color: Color(0xFFD1D4DE),
                    ),
                    value: pinCodeEnabled,
                    onChanged: (bool value) async {
                      if (pinCodeEnabled) {
                        final storage = StorageService();
                        await storage.deleteSecureData(key: 'pin');
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
                              return PinScreen(
                                deletePin: true,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SettingsButtons(
                  child: DataSecurityButtons(
                    title: 'Toch-ID',
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'images/touchID.svg',
                      color: Color(0xFFD1D4DE),
                    ),
                    value: someValue,
                    onChanged: (bool value) async {},
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SettingsButtons(
                  child: DataSecurityButtons(
                    title: 'Face-ID',
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'images/faceID.svg',
                      color: Color(0xFFD1D4DE),
                    ),
                    value: someValue,
                    onChanged: (bool value) async {
                      if (pinCodeEnabled) {
                        final storage = StorageService();
                        await storage.deleteSecureData(key: 'pin');
                        setState(() {
                          pinCodeEnabled = false;
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PinScreen(
                                deletePin: true,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataSecurityButtons extends StatefulWidget {
  final void Function(bool) onChanged;
  final bool value;
  final Color color;
  final String title;
  final Widget child;

  const DataSecurityButtons(
      {required this.title,
      required this.color,
      required this.value,
      required this.onChanged,
      required this.child})
      : super();

  @override
  State<DataSecurityButtons> createState() => _DataSecurityButtonsState();
}

class _DataSecurityButtonsState extends State<DataSecurityButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: widget.child,
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
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(widget.title),
        Expanded(
          child: Container(),
        ),
        CupertinoSwitch(value: widget.value, onChanged: widget.onChanged),
      ],
    );
  }
}
