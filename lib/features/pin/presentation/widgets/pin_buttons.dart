import 'package:flutter/material.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:provider/provider.dart';

class PinButtons extends StatefulWidget {
  const PinButtons({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<PinButtons> createState() => _PinButtonsState();
}

class _PinButtonsState extends State<PinButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PinProvider>().pinCode(widget.title);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFF1F1F1),
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 28.0,
            ),
          ),
        ),
      ),
    );
  }
}
