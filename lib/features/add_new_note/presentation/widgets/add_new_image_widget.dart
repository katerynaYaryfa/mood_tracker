import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:provider/provider.dart';

class AddNewImage extends StatelessWidget {
  const AddNewImage({
    required this.image,
    Key? key,
  }) : super(key: key);
  final File image;

  @override
  Widget build(BuildContext context) {
    final images = context.watch<NoteNotifier>().images;

    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.file(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: images.length >= 2 ? 8 : 16,
          left: images.length >= 2 ? 8 : 16,
          child: InkWell(
            onTap: () {
              context.read<NoteNotifier>().deleteImage(image);
            },
            child: SvgPicture.asset(
              'images/trash.svg',
            ),
          ),
        ),
      ],
    );
  }
}
