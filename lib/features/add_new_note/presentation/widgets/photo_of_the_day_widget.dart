import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/app_text_styles.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/add_new_image_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/empty_photo_of_the_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PhotoOfTheDayWidget extends StatelessWidget {
  const PhotoOfTheDayWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<File> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Photo of the day', style: s16WBoldCBlack),
              if (images.length == 3)
                SvgPicture.asset(
                  'images/addNewImage.svg',
                  color: AppColors.redInactive,
                ),
              if (images.isNotEmpty && images.length < 3)
                InkWell(
                  onTap: () {
                    context.read<NoteProvider>().pickImage();
                  },
                  child: SvgPicture.asset(
                    'images/addNewImage.svg',
                    color: images.length == 3
                        ? AppColors.redInactive
                        : AppColors.red,
                  ),
                ),
            ],
          ),
          const SpaceH16(),
          if (images.length == 1)
            Row(
              children: [
                AddNewImage(
                  image: images[0],
                ),
              ],
            ),
          if (images.length == 2)
            Row(
              children: [
                AddNewImage(
                  image: images[0],
                ),
                const SpaceW16(),
                AddNewImage(
                  image: images[1],
                )
              ],
            ),
          if (images.length == 3)
            Row(
              children: [
                AddNewImage(
                  image: images[0],
                ),
                const SpaceW15(),
                AddNewImage(
                  image: images[1],
                ),
                const SpaceW15(),
                AddNewImage(
                  image: images[2],
                )
              ],
            ),
          if (images.isEmpty) const EmptyPhotoOfTheDayWidget()
        ],
      ),
    );
  }
}
