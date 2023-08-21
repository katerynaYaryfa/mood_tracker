import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class TodayCalendarItemWidget extends StatefulWidget {
  const TodayCalendarItemWidget({
    Key? key,
    required this.day,
    this.note,
  }) : super(key: key);

  final DateTime day;
  final NoteModel? note;

  @override
  State<TodayCalendarItemWidget> createState() =>
      _TodayCalendarItemWidgetState();
}

class _TodayCalendarItemWidgetState extends State<TodayCalendarItemWidget> {
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    _parseList().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    return GestureDetector(
      onTap: () {
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return widget.note != null
                    ? AddNewNoteScreen(
                        shouldUpdate: true,
                        mood: widget.note!.mood,
                        text: widget.note!.text,
                        images: images,
                        date: widget.day,
                      )
                    : AddNewNoteScreen(
                        date: widget.day,
                      );
              },
            ),
          );
        }
      },
      child: Container(
        height: 80,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Text(
              '${widget.day.day}',
              style: TextStyles.s12WBoldCWhite,
            ),
            const Image(
              height: 34,
              width: 34,
              image: AssetImage(
                'images/face1.png',
              ),
            ),
            const SpaceH8(),
          ],
        ),
      ),
    );
  }

  Future<void> _parseList() async {
    if (widget.note == null || widget.note!.images.isEmpty) {
      return;
    }

    final jsonPathList = json.decode(widget.note!.images);

    final listJson = jsonPathList as List<dynamic>;
    final imageNames = listJson.cast<String>();

    final appDirectory = await getApplicationDocumentsDirectory();
    final appDirectoryFiles =
        appDirectory.listSync().map((event) => File(event.path));
    for (final imageName in imageNames) {
      for (final file in appDirectoryFiles) {
        if (file.path.contains(imageName)) {
          images.add(file);
        }
      }
    }

    setState(() {});
  }
}
