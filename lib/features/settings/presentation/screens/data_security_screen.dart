import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/features/settings/presentation/widgets/data_security_button_widget.dart';
import 'package:mood_tracker/features/settings/presentation/widgets/settings_button_widget.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

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
        final storage = SecureStorageService();
        final pin = await storage.read(
          key: pinKey,
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
      appBar: const CustomAppBar(
        title: Text(
          'Data Security',
          style: s14W600CBlack2,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SettingsButtons(
              child: DataSecurityButton(
                title: 'PIN-code',
                color: AppColors.white,
                value: pinCodeEnabled,
                onChanged: (bool value) async {
                  if (pinCodeEnabled) {
                    final storage = SecureStorageService();
                    await storage.delete(
                      key: pinKey,
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
                            backButton: true,
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
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            const SpaceH16(),
            SettingsButtons(
              child: DataSecurityButton(
                title: 'Toch-ID',
                color: AppColors.white,
                value: false,
                onChanged: (bool value) async {},
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/touchID.svg',
                    color: AppColors.grey,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            const SpaceH16(),
            SettingsButtons(
              child: DataSecurityButton(
                title: 'Face-ID',
                color: AppColors.white,
                value: false,
                onChanged: (bool value) async {
                  if (pinCodeEnabled) {
                    final storage = SecureStorageService();
                    await storage.delete(
                      key: pinKey,
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
                            backButton: true,
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
                    color: AppColors.grey,
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
