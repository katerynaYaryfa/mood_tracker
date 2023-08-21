import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:mood_tracker/features/pin/presentation/widgets/pin_buttons.dart';
import 'package:mood_tracker/features/pin/presentation/widgets/pin_password_input_field.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({
    this.deletePin = false,
    this.backButton = false,
    Key? key,
  }) : super(key: key);

  final bool deletePin;
  final bool backButton;

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  void initState() {
    super.initState();

    final pinProvider = context.read<PinProvider>()
      ..clearState()
      ..init();

    if (widget.deletePin) {
      pinProvider.deletePin();
    }

    Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    final pin1 = context.watch<PinProvider>().pin1;
    final pin2 = context.watch<PinProvider>().pin2;
    final wrongPin = context.watch<PinProvider>().wrongPin;

    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;

    if (pin2.length == 4 && pin1 == pin2) {
      context.watch<PinProvider>().savePin();

      Future.delayed(const Duration(milliseconds: 200), () {
        {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              pageBuilder: (_, __, ___) => const HomeScreen(),
            ),
          );
        }
      });
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
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
              if (pin1.length != 4)
                const Text(
                  'Create your PIN-code',
                  style: TextStyles.s16W700CBlack,
                ),
              if (pin1.length == 4)
                const Text(
                  'Enter your PIN-code',
                  style: TextStyles.s16W700CBlack,
                ),
              const SpaceH24(),
              if (pin1.length != 4) PasswordInputField(pin: pin1),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: widget.backButton
                        ? const PinBackButton()
                        : Container(
                            width: 80,
                          ),
                  ),
                  const SpaceW24(),
                  const PinButtons(
                    title: '0',
                  ),
                  const SpaceW24(),
                  if (widget.backButton) const DeleteLastIndexButton(),
                  if (pin2.isEmpty && !widget.backButton)
                    Container(
                      width: 80,
                    ),
                  if (pin2.isNotEmpty && !widget.backButton)
                    const DeleteLastIndexButton(),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              const Text(
                'This keeps your data private',
                style: TextStyles.s14WNormalCGrey2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          style: TextStyles.s16W600CRed,
        ),
      ),
    );
  }
}
