import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  PasswordInputField({required this.pin});

  var pin;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color:
                widget.pin.length >= 1 ? Colors.blueGrey : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color:
                widget.pin.length >= 2 ? Colors.blueGrey : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color:
                widget.pin.length >= 3 ? Colors.blueGrey : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color:
                widget.pin.length >= 4 ? Colors.blueGrey : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ],
    );
  }
}
