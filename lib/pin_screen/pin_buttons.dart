import 'package:flutter/material.dart';
import 'package:mood_tracker/pin_screen/provider/pin_notifier.dart';
import 'package:provider/provider.dart';

class PinButtons extends StatefulWidget {
  PinButtons({
    required this.title,
  });

  final String title;

  @override
  State<PinButtons> createState() => _PinButtonsState();
}

class _PinButtonsState extends State<PinButtons> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = context.watch<PinNotifier>().isPressed;

    return InkWell(
      onTap: () {
        isPressed = true;

        context.read<PinNotifier>().pinCode(widget.title);
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
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}
