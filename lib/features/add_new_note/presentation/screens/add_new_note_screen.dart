import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/select_categories_screen.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/day_in_one_sentence_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/how_was_your_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/photo_of_the_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:mood_tracker/services/data_base_wrapper.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({
    required this.time,
    this.mood,
    this.text,
    Key? key,
    this.images,
  }) : super(key: key);

  final DateTime time;
  final Mood? mood;
  final String? text;
  final List<File>? images;

  @override
  Widget build(BuildContext context) {
    final pickedImages = context.watch<NoteProvider>().images;
    final backgroundColor =
        context.watch<ThemeProvider>().currentTheme.floatingActionButtonTheme.backgroundColor;

    final saveNote = context.watch<NoteProvider>().saveNote;

    // TODO give it more understandable name. Or just formattedDate
    String formattedANNSDate = DateFormat.MMMMEEEEd().format(time);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            // TODO it is better to do the logic and then call the Navigator
            Navigator.pop(context);
            saveNote(time);
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
                  offset: const Offset(0, 0),
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
            formattedANNSDate,
            style: s14W600CBlack2,
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
                  // TODO extract to general class SvgIcons. And use it like SvgIcons.settings.
                  // TODO instead of hardcoding paths.
                  'images/settings.svg',
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                HowWasYourDayWidget(
                  mood: mood,
                ),
                const SpaceH16(),
                DayInOneSentenceWidget(
                  title: text,
                ),
                const SpaceH16(),
                PhotoOfTheDayWidget(
                  images: images ?? pickedImages,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TODO it is better to add this wrapper inside AddNewNoteScreen.
// TODO so you'll navigate to AddNewNoteScreen instead of AddNewNoteScreenWrapper
// TODO and make it private then
class AddNewNoteScreenWrapper extends StatelessWidget {
  const AddNewNoteScreenWrapper({
    required this.time,
    this.mood,
    this.text,
    this.images,
    Key? key,
  }) : super(key: key);

  // TODO rename to date
  final DateTime time;
  final Mood? mood;
  final String? text;
  final List<File>? images;

  @override
  Widget build(BuildContext context) {
    final dataBaseWrapper = context.read<DataBaseWrapper>();

    return ChangeNotifierProvider<NoteProvider>(
      create: (_) => NoteProvider(
        repository: NoteRepository(dataBaseWrapper: dataBaseWrapper),
      ),
      child: AddNewNoteScreen(
        time: time,
        mood: mood,
        text: text,
        images: images,
      ),
    );
  }
}
