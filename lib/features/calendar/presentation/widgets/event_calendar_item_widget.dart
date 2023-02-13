import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/services/data_base_wrapper.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class EventCalendarItemWidget extends StatelessWidget {
  const EventCalendarItemWidget({
    Key? key,
    required this.day,
    required this.note,
  }) : super(key: key);

  final DateTime day;
  final NoteData? note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddNewNoteScreen(
                time: day,
                mood: note!.mood,
                text: note!.title,
              );
            },
          ),
        );
      },
      child: SizedBox(
        height: 70,
        width: 40,
        child: Column(
          children: [
            Text(
              '${day.day}',
              style: s12WBoldCGrey2,
            ),
            const SpaceH4(),
            const Image(
              height: 34,
              width: 34,
              image: AssetImage(
                'images/face1.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
