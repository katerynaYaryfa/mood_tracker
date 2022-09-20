import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/pin_screen/provider/pin_notifier.dart';
import 'package:provider/provider.dart';

class PasswordInputField extends StatefulWidget {
  final String pin;

  const PasswordInputField({
    required this.pin,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    bool wrongPin = context.watch<PinNotifier>().wrongPin;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color:
                  wrongPin ? const Color(0xFFFF7562) : const Color(0xFF434343),
            ),
            shape: BoxShape.circle,
            color: _pinColor(1, wrongPin),
          ),
        ),
        const SpaceH16(),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color:
                  wrongPin ? const Color(0xFFFF7562) : const Color(0xFF434343),
            ),
            shape: BoxShape.circle,
            color: _pinColor(2, wrongPin),
          ),
        ),
        const SpaceH16(),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color:
                  wrongPin ? const Color(0xFFFF7562) : const Color(0xFF434343),
            ),
            shape: BoxShape.circle,
            color: _pinColor(3, wrongPin),
          ),
        ),
        const SpaceH16(),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color:
                  wrongPin ? const Color(0xFFFF7562) : const Color(0xFF434343),
            ),
            shape: BoxShape.circle,
            color: _pinColor(4, wrongPin),
          ),
        ),
      ],
    );
  }

  Color _pinColor(int num, bool wrongPin) {
    if (wrongPin) {
      return const Color(0xFFFF7562);
    }

    if (widget.pin.length >= num) {
      return const Color(0xFF434343);
    } else {
      return Colors.white;
    }
  }
}
