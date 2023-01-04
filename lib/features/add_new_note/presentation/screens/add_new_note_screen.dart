import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/select_categories_screen.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/day_in_one_sentence_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/how_was_your_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/presentation/widgets/photo_of_the_day_widget.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = context.watch<NoteProvider>().images;
    final backgroundColor = context
        .watch<ThemeProvider>()
        .currentTheme
        .floatingActionButtonTheme
        .backgroundColor;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
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
        title: const Text(
          'Monday, July 11',
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
              const HowWasYourDayWidget(),
              const SpaceH16(),
              const DayInOneSentenceWidget(),
              const SpaceH16(),
              PhotoOfTheDayWidget(
                images: images,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
