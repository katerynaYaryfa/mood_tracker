import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/pin/presentation/screens/pin_screen.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/features/settings/presentation/widgets/data_security_button_widget.dart';
import 'package:mood_tracker/features/settings/presentation/widgets/settings_button_widget.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:mood_tracker/svg_icons.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class DataSecurityScreen extends StatefulWidget {
  const DataSecurityScreen({Key? key}) : super(key: key);

  @override
  State<DataSecurityScreen> createState() => _DataSecurityScreenState();
}

class _DataSecurityScreenState extends State<DataSecurityScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PinProvider>().readPinCode();
  }

  @override
  Widget build(BuildContext context) {
    var pinCodeEnabled = context.watch<PinProvider>().pinCodeEnabled;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Data Security',
          style: TextStyles.s14W600CBlack2,
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
                onChanged: (bool value) {
                  // TODO move work with storage service to provider
                  if (pinCodeEnabled) {
                    final storage = StorageService();
                    storage.delete(
                      key: 'pin',
                    );
                    context.read<PinProvider>().disablePinCode();
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
                    SvgIcons.pinCode,
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
                title: 'Touch-ID',
                color: AppColors.white,
                value: false,
                onChanged: (bool value) async {},
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    SvgIcons.touchID,
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
                onChanged: (bool value) async {},
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    SvgIcons.faceID,
                    color: AppColors.grey,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            const SpaceH40(),
          ],
        ),
      ),
    );
  }
}
