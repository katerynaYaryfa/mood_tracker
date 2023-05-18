import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracker/features/pin/providers/pin_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
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
    return GestureDetector(
      onTap: () {
        context.read<PinProvider>().checkPinCode(widget.title);
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

class DeleteLastIndexButton extends StatelessWidget {
  const DeleteLastIndexButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}

class PinBackButton extends StatelessWidget {
  const PinBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
