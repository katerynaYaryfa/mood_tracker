import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/settings_screen/presentation/screens/color_scheme_screen.dart';
import 'package:mood_tracker/features/settings_screen/presentation/screens/data_security_screen.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor:
            context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DataSecurityScreen();
                    },
                  ),
                );
              },
              child: SettingsButtons(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB1D199),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF738C93).withOpacity(0.03),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'images/securityUnlockKey.svg',
                          color: Colors.white,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Data security',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    CupertinoSwitch(
                      value: false,
                      onChanged: (bool value) {},
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SettingsButtons(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF63B4FF),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF738C93).withOpacity(0.03),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'images/language.svg',
                        color: Colors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text('Language'),
                  Expanded(
                    child: Container(),
                  ),
                  SvgPicture.asset(
                    'images/arrowRight.svg',
                    color: const Color(0xFFD1D4DE),
                  ),
                ],
              ),
            ),
            const SpaceH16(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ColorSchemeScreen();
                    },
                  ),
                );
              },
              child: SettingsButtons(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7562),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF738C93).withOpacity(0.03),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'images/scheme.svg',
                          color: Colors.white,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const Text(
                      'Color scheme',
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SvgPicture.asset(
                      'images/arrowRight.svg',
                      color: const Color(0xFFD1D4DE),
                    ),
                  ],
                ),
              ),
            ),
            const SpaceH16(),
            SettingsButtons(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8AA4C),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF738C93).withOpacity(0.03),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'images/calender.svg',
                        color: Colors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    'Start of the week',
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  SvgPicture.asset(
                    'images/arrowRight.svg',
                    color: const Color(0xFFD1D4DE),
                  ),
                ],
              ),
            ),
            const SpaceH16(),
            SettingsButtons(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB1D199),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF738C93).withOpacity(0.03),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'images/bell.svg',
                        color: Colors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    'Reminders',
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  CupertinoSwitch(
                    value: false,
                    onChanged: (bool value) {},
                  )
                ],
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFE),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF738C93).withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
