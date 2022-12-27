import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

class HeaderFaceButtonWidget extends StatelessWidget {
  const HeaderFaceButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 54,
      decoration: BoxDecoration(
        color: AppColors.greyWhite2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Image(
          height: 24,
          width: 22,
          image: AssetImage(
            'images/face1.png',
          ),
        ),
      ),
    );
  }
}
