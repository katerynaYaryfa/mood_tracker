import 'package:flutter/material.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:provider/provider.dart';

class PasswordInputField extends StatefulWidget {
  var pin;

  PasswordInputField({required this.pin});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    bool wrongPin = context.watch<PinNotifier>().wrongPin;
    var color = context.watch<PinNotifier>().color;
    // var changeColor = context.watch()<PinNotifier>().colorButton();

    // bool pin = context.watch<PinNotifier>().pin;

    // var color;

    void colorButton() {
      if (widget.pin.length >= 1) {
        color = Color(0xFF434343);
      }
      if (wrongPin = true) {
        color = Colors.red;
      } else {
        Colors.grey.shade400;
      }
    }

    final bool1 = true;
    final bool2 = false;
    // w > 1
    //     ? bool2
    //         ? ''
    //         : ''
    //     : 'grey color';
    // Color color;

    final isUserLogin = false;
    if (true) {
    } else {}

    Color pinColor(int num) {
      if (wrongPin) {
        return Color(0xFFFF7562);
      }

      if (widget.pin.length >= num) {
        return Color(0xFF434343);
      } else {
        return Colors.white;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: wrongPin ? Color(0xFFFF7562) : Color(0xFF434343)),
            shape: BoxShape.circle,
            color: pinColor(1),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: wrongPin ? Color(0xFFFF7562) : Color(0xFF434343)),
            shape: BoxShape.circle,
            color: pinColor(2),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: wrongPin ? Color(0xFFFF7562) : Color(0xFF434343)),
            shape: BoxShape.circle,
            color: pinColor(3),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: wrongPin ? Color(0xFFFF7562) : Color(0xFF434343)),
            shape: BoxShape.circle,
            color: pinColor(4),
          ),
        ),
      ],
    );
  }
}
