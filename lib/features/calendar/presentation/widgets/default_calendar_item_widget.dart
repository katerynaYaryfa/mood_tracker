import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class DefaultCalendarItemWidget extends StatelessWidget {
  const DefaultCalendarItemWidget({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 40,
      child: Column(
        children: [
          Text(
            '${day.day}',
            style: s10W700CGrey2,
          ),
          const SpaceH4(),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyWhite2,
            ),
          ),
        ],
      ),
    );
  }
}
