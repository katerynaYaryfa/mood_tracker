import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracker/common/consts/svg_icons.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class EmptyPhotoOfTheDayWidget extends StatelessWidget {
  const EmptyPhotoOfTheDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: () {
                context.read<NoteProvider>().pickImage();
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgIcons.addPhoto,
                      colorFilter: const ColorFilter.mode(
                        AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SpaceH11(),
                    const Text(
                      'Add up to 3 photo',
                      style: TextStyles.s16WBoldCGrey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
