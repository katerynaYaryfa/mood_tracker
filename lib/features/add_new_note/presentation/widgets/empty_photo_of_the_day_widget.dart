import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
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
                context.read<NoteNotifier>().pickImage();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF6FAFB),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/addPhoto.svg',
                      color: const Color(0xFFD1D4DE),
                    ),
                    const SizedBox(
                      height: 11.0,
                    ),
                    const Text(
                      'Add up to 3 photo',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD1D4DE),
                      ),
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
