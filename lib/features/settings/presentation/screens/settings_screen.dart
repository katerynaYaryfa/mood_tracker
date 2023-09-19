// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common/consts/svg_icons.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/settings/presentation/screens/color_scheme_screen.dart';
import 'package:mood_tracker/features/settings/presentation/screens/data_security_screen.dart';
import 'package:mood_tracker/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:mood_tracker/features/settings/presentation/screens/terms_and_conditions_screen.dart';
import 'package:mood_tracker/features/settings/presentation/widgets/settings_button_widget.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leading: SizedBox(),
        title: Text(
          'Settings',
          style: TextStyles.s14W600CBlack2,
        ),
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
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          SvgIcons.securityUnlockKey,
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
                    SvgPicture.asset(
                      SvgIcons.arrowRight,
                      color: AppColors.grey,
                    ),
                  ],
                ),
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
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          SvgIcons.scheme,
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
                    const Spacer(),
                    SvgPicture.asset(
                      SvgIcons.arrowRight,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceH16(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TermsAndConditionsScreen();
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
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyOpacity.withOpacity(0.03),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.assignment_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SpaceW12(),
                    const Text(
                      'Terms and conditions',
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      SvgIcons.arrowRight,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceH16(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PrivacyPolicyScreen();
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
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyOpacity.withOpacity(0.03),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.privacy_tip_outlined,
                            color: AppColors.white),
                      ),
                    ),
                    const SpaceW12(),
                    const Text('Privacy policy'),
                    const Spacer(),
                    SvgPicture.asset(
                      SvgIcons.arrowRight,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceH16(),
          ],
        ),
      ),
    );
  }
}
