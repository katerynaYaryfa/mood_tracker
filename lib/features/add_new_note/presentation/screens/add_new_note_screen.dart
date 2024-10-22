import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common/consts/svg_icons.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/select_categories_screen.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/describe_your_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/how_was_your_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/photo_of_the_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({
    required this.date,
    this.shouldUpdate = false,
    this.mood,
    this.text,
    this.images,
    Key? key,
  }) : super(key: key);

  final bool shouldUpdate;
  final DateTime date;
  final Mood? mood;
  final String? text;
  final List<File>? images;

  @override
  Widget build(BuildContext context) {
    final noteRepository = context.watch<INoteRepository>();

    return ChangeNotifierProvider<NoteProvider>(
      create: (_) => NoteProvider(
        repository: noteRepository,
        mood: mood ?? Mood.none,
        text: text ?? '',
        images: images ?? [],
        date: date,
      ),
      child: AddNewNoteScreenContainer(shouldUpdate: shouldUpdate),
    );
  }
}

class AddNewNoteScreenContainer extends StatelessWidget {
  const AddNewNoteScreenContainer({
    Key? key,
    this.shouldUpdate = false,
  }) : super(key: key);

  final bool shouldUpdate;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context
        .watch<ThemeProvider>()
        .currentTheme
        .floatingActionButtonTheme
        .backgroundColor;
    final date = context.select<NoteProvider, DateTime>(
      (provider) => provider.date,
    );
    final formattedDate = DateFormat.MMMMEEEEd().format(date);

    final writeNote = context.read<NoteProvider>().writeNote;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            writeNote(shouldUpdate: shouldUpdate);
            Navigator.pop(context);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: backgroundColor?.withOpacity(0.3) ?? AppColors.black,
                  spreadRadius: 7,
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.done,
              size: 24,
            ),
          ),
        ),
        appBar: CustomAppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.grey,
            ),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();

              Navigator.pop(context);
            },
          ),
          title: Text(
            formattedDate,
            style: TextStyles.s14W600CBlack2,
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SelectCategoriesScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(
                  right: 26,
                ),
                child: SvgPicture.asset(
                  SvgIcons.barGraph,
                ),
              ),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                HowWasYourDayWidget(),
                SpaceH16(),
                DescribeYourDayWidget(),
                SpaceH16(),
                PhotoOfTheDayWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
