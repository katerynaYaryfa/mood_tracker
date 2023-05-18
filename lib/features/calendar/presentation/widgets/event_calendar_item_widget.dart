import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:path_provider/path_provider.dart';

class EventCalendarItemWidget extends StatefulWidget {
  const EventCalendarItemWidget({
    Key? key,
    required this.day,
    required this.note,
  }) : super(key: key);

  final DateTime day;
  final NoteModel? note;

  @override
  State<EventCalendarItemWidget> createState() =>
      _EventCalendarItemWidgetState();
}

class _EventCalendarItemWidgetState extends State<EventCalendarItemWidget> {
  List<File> images = [];

  // TODO let's refactor this method together
  Future<void> _parseList() async {
    final jsonPathList = jsonDecode(widget.note?.images ?? '');
    final castt = jsonPathList as List<dynamic>;
    final imageNames = castt.cast<String>();

    final appDirectory = (await getApplicationDocumentsDirectory());
    final appDirectoryFiles =
        appDirectory.listSync().map((event) => File(event.path));
    imageNames.forEach((imageName) {
      appDirectoryFiles.forEach((file) {
        if (file.path.contains(imageName)) {
          images.add(file);
        }
      });
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _parseList().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddNewNoteScreen(
                images: images,
                date: widget.day,
                mood: widget.note!.mood,
                text: widget.note!.text,
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
              '${widget.day.day}',
              style: TextStyles.s12WBoldCGrey2,
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
