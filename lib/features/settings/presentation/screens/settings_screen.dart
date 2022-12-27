import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/settings/presentation/screens/color_scheme_screen.dart';
import 'package:mood_tracker/features/settings/presentation/screens/data_security_screen.dart';
import 'package:mood_tracker/features/settings/presentation/widgets/settings_button_widget.dart';
import 'package:mood_tracker/theme/app_colors.dart';
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
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
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
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyOpacity.withOpacity(0.03),
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
                          color: AppColors.white,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    const SpaceW12(),
                    const Text(
                      'Data security',
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: false,
                      onChanged: (bool value) {},
                    )
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
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyOpacity.withOpacity(0.03),
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
                        color: AppColors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SpaceW12(),
                  const Text('Language'),
                  Expanded(
                    child: Container(),
                  ),
                  SvgPicture.asset(
                    'images/arrowRight.svg',
                    color: AppColors.grey,
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
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyOpacity.withOpacity(0.03),
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
                          color: AppColors.white,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    const SpaceW12(),
                    const Text(
                      'Color scheme',
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SvgPicture.asset(
                      'images/arrowRight.svg',
                      color: AppColors.grey,
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
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyOpacity.withOpacity(0.03),
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
                        color: AppColors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SpaceW12(),
                  const Text(
                    'Start of the week',
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  SvgPicture.asset(
                    'images/arrowRight.svg',
                    color: AppColors.grey,
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
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyOpacity.withOpacity(0.03),
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
                        color: AppColors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SpaceW12(),
                  const Text(
                    'Reminders',
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: false,
                    onChanged: (bool value) {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
