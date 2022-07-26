import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/pin_screen/pin_buttons.dart';
import 'package:mood_tracker/pin_screen/pin_password_input_field.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:mood_tracker/pin_screen/secure_storage.dart';
import 'package:provider/provider.dart';

import '../settings_screen/settings_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({
    this.deletePin = false,
  });
  final deletePin;

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PinNotifier>().clearState();

    if (widget.deletePin == true) {
      var storage = StorageService();
      storage.deleteSecureData(
        key: 'pin',
      );
    }

    Future.delayed(Duration.zero, () async {
      // final savedPin = await context.read<PinNotifier>().readSavedPinCode();
      //
      // if (savedPin != null) {
      //   context.read<PinNotifier>().savedPinNotNullGoToConfirm(savedPin);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pin1 = context.watch<PinNotifier>().pin1;
    final pin2 = context.watch<PinNotifier>().pin2;
    var wrongPin = context.watch<PinNotifier>().wrongPin;

    print('_______pin 1 = ${pin1}');
    print('_______pin 2 = ${pin2}');

    if (pin2.length == 4 && pin1 == pin2) {
      var storage = StorageService();
      storage.writeSecureData(
        key: 'pin',
        value: pin1,
      );

      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 18.0,
            ),

            Container(
              width: 90,
              height: 90,
              padding: EdgeInsets.symmetric(vertical: 26, horizontal: 25),
              decoration: BoxDecoration(
                color: Color(0xFFB1D199),
                borderRadius: BorderRadius.circular(32.0),
                boxShadow: [],
              ),
              child: SvgPicture.asset(
                'images/lock.svg',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            if (pin1.length != 4)
              const Text(
                'Create your PIN-code',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (pin1.length == 4)
              const Text(
                'Enter your PIN-code',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            if (pin1.length != 4) PasswordInputField(pin: pin1),
            if (pin1.length == 4) PasswordInputField(pin: pin2),
            if (wrongPin)
              const PinsDontMatch()
            else
              Container(
                height: 80,
                child: const Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            //  SizedBox(
            //   height: 60.0,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 36.0,
                ),
                PinButtons(
                  title: '1',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '2',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '3',
                ),
                const SizedBox(
                  width: 36.0,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinButtons(
                  title: '4',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '5',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '6',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinButtons(
                  title: '7',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '8',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '9',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: Color(0xFFF1F1F1),
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Center(
                      child: SvgPicture.asset('images/arrowBack.svg'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                PinButtons(
                  title: '0',
                ),
                const SizedBox(
                  width: 24.0,
                ),
                InkWell(
                  onTap: () {
                    context.read<PinNotifier>().deleteLastIndex();
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: Color(0xFFF1F1F1),
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
            // SizedBox(
            //   height: 64,
            // ),
            Expanded(
              child: Container(),
            ),
            Text(
              'This keeps your data private',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFBAC0D0)),
            ),
          ],
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
    return Container(
      height: 80,
      child: const Center(
        child: Text(
          'Pin\'s don\'t match',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
