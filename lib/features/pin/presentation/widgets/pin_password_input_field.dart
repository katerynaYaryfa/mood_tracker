import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.pin,
    Key? key,
  }) : super(key: key);

  final String pin;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    final wrongPin = context.watch<PinProvider>().wrongPin;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: wrongPin ? AppColors.red : AppColors.darkGrey,
            ),
            shape: BoxShape.circle,
            color: _pinColor(1, wrongPin),
          ),
        ),
        const SpaceW16(),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: wrongPin ? AppColors.red : AppColors.darkGrey,
            ),
            shape: BoxShape.circle,
            color: _pinColor(2, wrongPin),
          ),
        ),
        const SpaceW16(),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: wrongPin ? AppColors.red : AppColors.darkGrey,
            ),
            shape: BoxShape.circle,
            color: _pinColor(3, wrongPin),
          ),
        ),
        const SpaceW16(),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: wrongPin ? AppColors.red : AppColors.darkGrey,
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
      return AppColors.red;
    }

    return widget.pin.length >= num ? AppColors.darkGrey : AppColors.white;
  }
}
