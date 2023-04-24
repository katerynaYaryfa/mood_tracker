import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/pin/presentation/widgets/pin_buttons.dart';
import 'package:mood_tracker/features/pin/presentation/widgets/pin_password_input_field.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({
    this.deletePin = false,
    Key? key,
  }) : super(key: key);

  final bool deletePin;

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PinProvider>().clearState();

    // TODO move work with StorageService to provider
    if (widget.deletePin == true) {
      var storage = StorageService();
      storage.delete(
        key: 'pin',
      );
    }

    // TODO do you really need it?
    Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    final pin1 = context.watch<PinProvider>().pin1;
    final pin2 = context.watch<PinProvider>().pin2;
    // TODO final
    var wrongPin = context.watch<PinProvider>().wrongPin;
    final pinCodeEnabled = context.watch<PinProvider>().pinCodeEnabled;

    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    // TODO it is not good practice to call function in build method because it can be called
    // TODO multiple times. Let's refactor it together
    context.read<PinProvider>().writePin(context);
    // TODO same here
    if (pinCodeEnabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // TODO spaceh18 or sizedbox
              Container(
                height: 18.0,
              ),
              Container(
                width: 90,
                height: 90,
                padding: const EdgeInsets.symmetric(
                  vertical: 26,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: const [],
                ),
                child: SvgPicture.asset(
                  'images/lock.svg',
                ),
              ),
              const SpaceH32(),
              // TODO 4 is magic number, please refactor
              // TODO also refactor to variable like shouldCreatePin or createPin
              if (pin1.length != 4)
                const Text(
                  'Create your PIN-code',
                  style: s16W700CBlack,
                ),
              // TODO 4 is magic number, please refactor
              // TODO also refactor to variable like shouldEnterPin or enterPin
              if (pin1.length == 4)
                const Text(
                  'Enter your PIN-code',
                  style: s16W700CBlack,
                ),
              const SpaceH24(),
              // TODO 4 is magic number, please refactor
              if (pin1.length != 4) PasswordInputField(pin: pin1),
              // TODO 4 is magic number, please refactor
              if (pin1.length == 4) PasswordInputField(pin: pin2),
              if (wrongPin)
                const PinsDontMatch()
              else
                const SizedBox(
                  height: 80,
                  child: Center(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SpaceW36(),
                  PinButtons(
                    title: '1',
                  ),
                  SpaceW24(),
                  PinButtons(
                    title: '2',
                  ),
                  SpaceW24(),
                  PinButtons(
                    title: '3',
                  ),
                  SpaceW36(),
                ],
              ),
              const SpaceH30(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  PinButtons(
                    title: '4',
                  ),
                  SpaceW24(),
                  PinButtons(
                    title: '5',
                  ),
                  SpaceW24(),
                  PinButtons(
                    title: '6',
                  ),
                ],
              ),
              const SpaceH30(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  PinButtons(
                    title: '7',
                  ),
                  SpaceW24(),
                  PinButtons(
                    title: '8',
                  ),
                  SpaceW24(),
                  PinButtons(
                    title: '9',
                  ),
                ],
              ),
              const SpaceH30(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // TODO delete comment
                      // Navigator.pop(context);
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          width: 1.0,
                          color: AppColors.white2,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                        child: SvgPicture.asset('images/arrowBack.svg'),
                      ),
                    ),
                  ),
                  const SpaceW24(),
                  const PinButtons(
                    title: '0',
                  ),
                  const SpaceW24(),
                  InkWell(
                    onTap: () {
                      context.read<PinProvider>().deleteLastIndex();
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          width: 1.0,
                          color: AppColors.white2,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                        child: SvgPicture.asset('images/back.svg'),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'This keeps your data private',
                style: s14WNormalCGrey2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO rename to PinErrorLabel or something like that
class PinsDontMatch extends StatelessWidget {
  const PinsDontMatch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(
        child: Text(
          'You enter wrong PIN-code',
          style: s16W600CRed,
        ),
      ),
    );
  }
}
