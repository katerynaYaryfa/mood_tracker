import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/add_new_image_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:mood_tracker/features/notes_feed/providers/notes_feed_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class NoteFeedWidget extends StatefulWidget {
  const NoteFeedWidget({
    required this.date,
    this.mood,
    this.text,
    this.images,
    Key? key,
  }) : super(key: key);

  final DateTime date;
  final Mood? mood;
  final String? text;
  final String? images;

  @override
  State<NoteFeedWidget> createState() => _NoteFeedWidgetState();
}

class _NoteFeedWidgetState extends State<NoteFeedWidget> {
  List<File> images = [];

  // TODO images parsing is called only once. It is needed to add parsing on month chaning
  @override
  void initState() {
    super.initState();
    _parseList().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final noteRepository = context.watch<INoteRepository>();

    return ChangeNotifierProvider<NoteProvider>(
      create: (_) => NoteProvider(
        repository: noteRepository,
        mood: widget.mood ?? Mood.none,
        text: widget.text ?? '',
        images: images,
        date: widget.date,
      ),
      child: NoteFeedWidgetContainer(
        text: widget.text ?? '',
        dateNumber: widget.date.day.toString(),
        dateDay: DateFormat('E').format(widget.date),
        mood: widget.mood?.toImage() ?? '',
        images: images,
      ),
    );
  }

  Future<void> _parseList() async {
    if (widget.images == null || widget.images!.isEmpty) {
      return;
    }

    final jsonPathList = json.decode(widget.images ?? '');

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

class NoteFeedWidgetContainer extends StatelessWidget {
  const NoteFeedWidgetContainer({
    super.key,
    required this.text,
    required this.dateNumber,
    required this.dateDay,
    required this.mood,
    required this.images,
    this.note,
  });
  final String text;
  final String dateNumber;
  final String dateDay;
  final String mood;
  final List<File> images;
  final NoteModel? note;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;

    final possibleNoteText =
        context.read<NotesFeedProvider>().getMoodText(mood);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 3),
              SizedBox(
                width: 35,
                height: 35,
                child: mood.isEmpty
                    ? Container()
                    : Image(
                        image: AssetImage(mood),
                      ),
              ),
              Expanded(child: Container()),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                ),
                padding: const EdgeInsets.all(4),
                width: 30,
                height: 45,
                child: Column(
                  children: [
                    Text(
                      dateNumber,
                      style: TextStyles.s14W600CWhite,
                    ),
                    Text(
                      dateDay,
                      style: TextStyles.s10W600CWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (text.isEmpty)
            Text(
              possibleNoteText,
              style: TextStyles.s12WNormalCBlack,
            )
          else
            Text(
              text,
              style: TextStyles.s12WNormalCBlack,
            ),
          const SizedBox(height: 16),
          if (images.isEmpty)
            Container()
          else if (images.length == 1)
            Row(
              children: [
                AddNewImage(
                  image: images[0],
                  showTrash: false,
                ),
              ],
            ),
          if (images.length == 2)
            Row(
              children: [
                AddNewImage(
                  image: images[0],
                  showTrash: false,
                ),
                const SpaceW16(),
                AddNewImage(
                  image: images[1],
                  showTrash: false,
                ),
              ],
            ),
          if (images.length == 3)
            Row(
              children: [
                AddNewImage(
                  image: images[0],
                  showTrash: false,
                ),
                const SpaceW15(),
                AddNewImage(
                  image: images[1],
                  showTrash: false,
                ),
                const SpaceW15(),
                AddNewImage(
                  image: images[2],
                  showTrash: false,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
